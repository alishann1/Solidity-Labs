// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract DArray {
uint[] public arr;
function getlength() public view returns(uint){
return arr.length;
}
}
//The lenght of getlenght fuction is zero because the array is null.