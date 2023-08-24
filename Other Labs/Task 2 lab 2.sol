// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

  // Exercise B

   
   contract Loop {
   uint[] data;
   function loop() public returns (uint[] memory) {

   for (uint8 i = 1; i < 20; i=i+2) {
   data.push(i);
  }
    return data;
  }
}

   

 
 