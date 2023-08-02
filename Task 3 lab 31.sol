// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Circle {
    function getCircumference(uint256 r) public pure returns (uint256) {
       
     uint256 circumference = 2 * 314159 * r / 100000;
        return circumference;
    }
}
