// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract IntegerChecker{
   function recommendDataType (int age)public pure returns (bool){
 return age >= 18 ? true: false;
   }
} 

   
   