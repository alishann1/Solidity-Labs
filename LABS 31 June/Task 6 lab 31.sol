// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract FixedSizeArray {
    uint256[4] public arr1 = [9, 8, 7, 1];
    function udelete(uint _index) public{
delete arr1[_index];
}
function give(uint _i, uint value) public{
arr1[_i] = value;
}
function get1() public view returns(uint[4] memory){
return arr1;
}

}