// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


// For


 contract Control {
 function forTest() public pure returns(uint256){
 uint sum = 0;
 for(uint i = 0;i < 15;i++)
 { sum += i; }
 return(sum);
   }
  }