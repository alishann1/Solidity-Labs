// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract IntegerChecker{
   function recommendDataType (int)public pure returns (bool) {
       int age = 10;
      
    if (age >= 18) {
            return true;
        } else {
            return false;
        }
    }
}
   