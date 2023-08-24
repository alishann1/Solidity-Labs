// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//Task 1
interface Calculator {
    function getResult() external view returns (uint256);
}

contract Temp is Calculator {
    constructor() {}

    function getResult() external pure returns (uint256 result) {
        uint256 a = 2;
        uint256 b = 5;
        result = b / a;
    }
}

//Task 2

contract Counter {
    uint256 public count = 2;

    function square() external {
        count = count**2;
    }
}

interface ICounter {
    function count() external view returns (uint256);

    function square() external;
}

contract MyContract {
    function squareCounter(address _counter) external {
        ICounter(_counter).square();
    }

    function getCount(address _counter) external view returns (uint256) {
        return ICounter(_counter).count();
    }
}

//Task 3

interface Token {
    function transfer(address to, uint256 amount) external;
}

contract TokenContract is Token {
    mapping(address => uint256) public balances;

    function transfer(address to, uint256 amount) external override {
        require(to != address(0), "Invalid address");
        require(balances[msg.sender] >= amount, "Insufficient balance");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }
}

//Task 4

contract Payable {
    address payable public owner;

    constructor() payable {
        owner = payable(msg.sender);
    }

    function deposite() public payable returns (uint256 account, uint256 cont) {
        cont = address(this).balance;
        account = owner.balance;
    }

    function notPayable() public view returns (uint256 account, uint256 cont) {
        cont = address(this).balance;
        account = owner.balance;
    }
}

//Task 5

contract PaymentContract{
    address payable Sender;
    constructor() payable  {
        Sender = payable(address(this));
    }
    event Confirmation(address, uint);
    function recievePayment() public payable returns (uint sender, uint reciever) {
        sender = (msg.sender).balance;
        reciever = address(this).balance;
        emit Confirmation(address(this), (msg.sender).balance);
    }
}
