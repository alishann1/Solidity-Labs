// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract StorageDLoc {
 uint[] arr = [1,2,3]; // state variable
 function fStorage() public {
 // Declare a local storage variable xStorage
 uint[] storage xStorage = arr;
 xStorage[0] = 100;
 xStorage[1] = 17;
  }
 function get() public view returns (uint[] memory){
 return arr;
 }
}
