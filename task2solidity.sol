// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Area {
    uint constant PI =uint(314159) / 10000;

    function calculateArea(uint radius) public pure  returns (uint) {
        uint area = PI * radius * radius;
        return area;
    }
}




