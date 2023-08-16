// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// Do While
contract ControlFlow {
 function dowhile() public pure returns(uint256){
 uint sum = 0;
 uint i = 0;
do {sum += i; i++; }
 while (i < 5);
  return(sum);
 }
}