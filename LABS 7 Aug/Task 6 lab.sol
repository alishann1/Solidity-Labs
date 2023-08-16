// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract calldataDloc {
 function fCalldata(uint[] memory _x) public pure
returns(uint[] memory){
 _x[0] = 0;
 return(_x);
 }
}