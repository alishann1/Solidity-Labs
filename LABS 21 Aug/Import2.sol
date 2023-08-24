// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//Task 5
library Explibrary {
    function exponential(uint256 a, uint256 b) public pure returns (uint256) {
        return a**b;
    }
}

contract SumContract {
    function sum(uint256 a, uint256 b) public pure returns (uint256) {
        return a + b;
    }
}

contract LibraryClient {
    function GetExponential(uint256 firstVal, uint256 secondVal)
        public
        pure
        returns (uint256)
    {
        return Explibrary.exponential(firstVal, secondVal);
    }

    function Sum(uint256 firstVal, uint256 secondVal) public returns (uint256) {
        SumContract foo = new SumContract();
        return foo.sum(firstVal, secondVal);
    }
}