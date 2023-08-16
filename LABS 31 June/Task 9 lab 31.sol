// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract DynamicIntArray {
    uint256[] private myarray;

    function addElement(uint256 _number) public  {
        myarray.push(_number);
    }

    function getElementAt(uint256 _index) public view returns (uint256) {
        return myarray[_index];
    }

    function deleteElementAt(uint256 _index) public {
        delete myarray[_index];


    }

    function popElement() public {
        myarray.pop();

       
    }

    }

