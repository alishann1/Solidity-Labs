// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract PersonalInfo{
   
    
    function getAll() public pure returns (string memory, string memory,address) { 
        return ("Male","AliShan", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }
    function getAll2() public pure returns (string memory x , string  memory y, address z) {
        return("Male", "Alishan", 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4);
    }
    function getAll3() public pure returns (string memory x, string memory y, address z) {
        x = "Male";
        y = "Alishan";
        z = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4; 
        }
   
}