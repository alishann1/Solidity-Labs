// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import "./SafeMath.sol";
import "./Ownable.sol";

contract Credit is Ownable {
    using SafeMath for uint256;
    address borrower;
    uint256 requestedAmount;
    uint256 returnAmount;
    uint256 repaidAmount;
    uint256 interest;
    uint256 requestedRepayments;
    uint256 remainingRepayments;
    uint256 repaymentInstallment;
    uint256 requestedDate;
    uint256 lastRepaymentDate;
    bytes description;
    bool active = true;
    uint256 lendersCount = 0;
    uint256 revokeVotes = 0;
    uint256 revokeTimeNeeded = block.timestamp + 1 seconds;
    uint256 fraudVotes = 0;
    mapping(address => bool) public lenders;
    mapping(address => uint256) lendersInvestedAmount;
    mapping(address => bool) revokeVoters;
    mapping(address => bool) fraudVoters;

    enum State {
        investment,
        repayment,
        interestReturns,
        expired,
        revoked,
        fraud
    }

    State state;

    event LogCreditInitialized(
        address indexed state,
        uint256 indexed timestamp
    );
    event LogCreditStateChanged(State indexed state, uint256 indexed timestamp);
    event LogCreditStateActiveChanged(
        bool indexed active,
        uint256 indexed timestamp
    );
    event LogBorrowerWithdrawal(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );
    event LogBorrowerRepaymentInstallment(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );
    event LogBorrowerRepaymentFinished(
        address indexed _address,
        uint256 indexed timestamp
    );
    event LogBorrowerChangeReturned(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );
    event LogLenderInvestment(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );
    event LogLenderWithdrawal(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );
    event LogLenderChangeReturned(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );
    event LogLenderVoteForRevoking(
        address indexed _address,
        uint256 indexed timestamp
    );
    event LogLenderVoteForFraud(
        address indexed _address,
        uint256 indexed timestamp
    );
    event LogLenderRefunded(
        address indexed _address,
        uint256 indexed _amount,
        uint256 indexed timestamp
    );

    modifier isActive() {
        require(active == true);
        _;
    }
    modifier onlyBorrower() {
        require(msg.sender == borrower);
        _;
    }
    modifier onlyLender() {
        require(lenders[msg.sender] == true);
        _;
    }
    modifier canAskForInterest() {
        require(state == State.interestReturns);
        require(lendersInvestedAmount[msg.sender] > 0);
        _;
    }
    modifier canInvest() {
        require(state == State.investment);
        _;
    }
    modifier canRepay() {
        require(state == State.repayment);
        _;
    }
    modifier canWithdraw() {
        require(address(this).balance >= requestedAmount);
        _;
    }
    modifier isNotFraud() {
        require(state != State.fraud);
        _;
    }
    modifier isRevokable() {
        require(block.timestamp >= revokeTimeNeeded);
        require(state == State.investment);
        _;
    }
    modifier isRevoked() {
        require(state == State.revoked);
        _;
    }

    constructor(
        uint256 _requestedAmount,
        uint256 _requestedRepayments,
        uint256 _interest,
        bytes memory _description
    ) {
        borrower = tx.origin;
        interest = _interest;
        requestedAmount = _requestedAmount;
        requestedRepayments = _requestedRepayments;
        remainingRepayments = _requestedRepayments;
        returnAmount = requestedAmount.add(interest);
        repaymentInstallment = returnAmount.div(requestedRepayments);
        description = _description;
        requestedDate = block.timestamp;
        emit LogCreditInitialized(borrower, block.timestamp);
    }

    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function changeState(State _state) external onlyOwner {
        state = _state;
        emit LogCreditStateChanged(state, block.timestamp);
    }

    function toggleActive() external onlyOwner returns (bool) {
        active = !active;
        emit LogCreditStateActiveChanged(active, block.timestamp);
        return active;
    }

    function invest() public payable canInvest {
        uint256 extraMoney = 0;
        if (address(this).balance >= requestedAmount) {
            extraMoney = address(this).balance.sub(requestedAmount);
            address(this).balance.sub(extraMoney);
            assert(extraMoney <= msg.value);
            if (extraMoney > 0) {
                payable(msg.sender).transfer(extraMoney);
                emit LogLenderChangeReturned(
                    msg.sender,
                    extraMoney,
                    block.timestamp
                );
                state = State.repayment;
                emit LogCreditStateChanged(state, block.timestamp);
            }
            lenders[msg.sender] = true;
            lendersCount++;
            lendersInvestedAmount[msg.sender] = lendersInvestedAmount
            [msg.sender].add(msg.value.sub(extraMoney));
            emit LogLenderInvestment(
                msg.sender,
                msg.value.sub(extraMoney),
                block.timestamp
            );
        }
        
    }
}
