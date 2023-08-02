// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Admin {
    address public immutable ADMIN_Address = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

 function getAdminAdress() public view returns (address) {
        return ADMIN_Address;
 }
}
