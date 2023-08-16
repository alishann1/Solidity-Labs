// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Loop{
 uint[] public arr;
 function NaturalNum(uint max) public returns(uint[] memory){
 uint i = 4;
 while(i <= max){
 arr.push(i);
 i+=4;
 }
 return arr; }
 }
 