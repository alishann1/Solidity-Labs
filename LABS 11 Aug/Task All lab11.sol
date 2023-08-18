// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


//Task 1
contract Eventse {
    event Transfer (address indexed from, address indexed to, uint amount);
    mapping(address => uint256) public _balances;
// define _transfer function，execute transfer logic
function _transfer(address from, address to, uint256 amount)
external {
 _balances[from] = 10000000; // give some initial tokens to transfer address
 _balances[from] -= amount; // "from" address minus the number of transfer
 _balances[to] += amount; // "to" address adds the number of transfer
 // emit event
 emit Transfer (from, to, amount); }
}


//Task 2
contract Events{
 enum Quality{
         Good,
         Moderate,
         Bad
 }
 struct specs{
        string microprocessor;
        uint RAM;
 }
 uint ROM;
 //A single event can have multiple parameters
 event multi(string laptop, uint price);
 //You can also emit enums and structs as well
 //An event can have upto 3 indexed parameters
 event multiple(string laptop, uint indexed price, Quality indexed q,
specs indexed s);
 //Naming the variable in an event is not necessary
 event mu(string, Quality);
 event m(Quality quality, specs spec, uint ROM);

 //You can also emit empty events
 event empty();
 function emits() public{
 emit multi("Hp", 150000);
 emit multiple("dell", 100000, Quality.Good, specs("intel", 16));
 emit mu("Lenovo", Quality.Moderate);
 emit m(Quality.Good, specs("hp", 8), 128);
 emit empty();

 }
}


//Task 3
contract Eventss{
    address public owner;
    event eventss(address preowner, address newowner);
    address preowner;
    address newowner;
    constructor(){
        owner = msg.sender;
    }
    function NewOwner(address Newowner) public {
        owner = Newowner;
        emit eventss(preowner, Newowner);
    }
    
} 


// Task 4
contract PersonContract {
struct PersonInfo {
    string name;
    uint age;
}
PersonInfo public P1;
event Update(PersonInfo oldValue, PersonInfo newValue, uint256 timestamp, uint256 blockNumber);
function setPersonInfo(string memory newName, uint newAge) public {
 PersonInfo memory oldValue = P1;
P1.name = newName;
P1.age = newAge;
 emit Update(oldValue, P1, block.timestamp, block.number); }
}


//Task 5
contract Task5{
    address public owner;

   event ZeroAddressInputted(string ZeroAddress);


    constructor(address _initialOwner){
        owner = _initialOwner;
        if (_initialOwner == address(0)) {
            emit ZeroAddressInputted("Zero Address inputted on deployment of contract");
        }

    }
}


//Task 6

contract Task6 {
    event localVar(string message);

    function numgive(int inputValue) public returns (int) {
        int neg;
        int positiveEven;
        int positiveOdd;
        if (inputValue < 0) {
            inputValue = neg;
            emit localVar("Returning");
            return neg;
        }
        else if (inputValue % 2 == 0) {
            inputValue = positiveEven;
            emit localVar("Returning");
            return positiveEven;
        }
        else {inputValue = positiveOdd;
        emit localVar("Returning");
        return positiveOdd;
        }
    }
} 




