// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Ownable {
    address public owner;
    event LogOwnershipTransfered(
        address indexed _currentOwner,
        address indexed _newOwner
    );
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }
    constructor(){
        owner = msg.sender;
    }
}
