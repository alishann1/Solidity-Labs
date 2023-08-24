// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract DynamicArray {
    string[] public arr2;
    
function upush(string memory _x) public{
  arr2.push(_x);
}
string[] public arr3;
function get2() public view returns(string[] memory){
return arr3;
}
function upop() public{
arr2.pop();
}

}