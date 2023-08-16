// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Enum{
enum Exam{
Checking,
Pass,
Fail,
Scholarship
}
// Fail Function
Exam public e1;
    function Fail() public {
    if(e1 == Exam.Checking) {
        e1 = Exam.Fail;
    }
}
// Scholarship Function
function Scholarshp() public {
    if(e1 == Exam.Pass) {
            e1 = Exam.Scholarship;
        }     
}
 //Delete Function for e1
 function idelete() public {
            delete e1;
        }

Exam public e3 = Exam.Fail;



}
//Part b
contract PizzaDeli{
    
    enum PizzaOrder{
        Pending, 
        Preparing,
        Delivering, 
        Received
    }
    PizzaOrder public P1;
function set(PizzaOrder _P) public{
P1 = _P;
}

    PizzaOrder public P2 = PizzaOrder.Preparing;
    PizzaOrder public P3 = PizzaOrder(3);

function GetAll() public view returns (PizzaOrder, PizzaOrder, PizzaOrder) {
      return (P1, P2, P3);
}
  
}


// Struct


 struct Voter {
 string Name;
 address addr;
 bool hasVoted;
 }
contract VotingSystem {
 // An array of 'Voter' structs
 Voter[] public voters;
 function create1(string memory _Name, address _addr)
public {
    // Method 1
 voters.push(Voter(_Name, _addr, false));
 }

function create2(string memory _Name, address _addr) public {
    //Method 2
 voters.push(Voter({Name: _Name, addr:_addr, hasVoted:
false}));
 }
 function create3(string memory _Name, address _addr)
public {
    //Method 3
 Voter memory voter;
 voter.Name = _Name;
 voter.addr = _addr;
 // Voter.hasVoted initialized to false
 voters.push(voter);
 }
 function get(uint _index) public view returns (string
memory Name, address addr, bool hasVoted) {
 Voter storage voter = voters[_index];
 return (voter.Name, voter.addr,voter.hasVoted);
 }
 // update hasVoted
 function togglehasVoted(uint _index) public {
 Voter storage voter = voters[_index];
 voter.hasVoted = !voter.hasVoted;
 }
}




