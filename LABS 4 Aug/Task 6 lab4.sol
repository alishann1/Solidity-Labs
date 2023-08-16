// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract ForLoop{
uint[] public numtable;
function table(uint num) public{
uint temp = num;
//For getting the table till 20 instead of 10 we will change the value of i<=10
//to i<=20
for(uint i = 1; i <= 20; num += temp){
numtable.push(num);
i++;
// There is no change if I swap i++ with num += temp
}
}
function get() public view returns(uint[] memory){
return numtable;
}
function resetarr() public{
delete numtable;
}
}