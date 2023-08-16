// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Loop{
//The value of cond that you will input will decide
//the number of times the loop is run
function iterate(uint cond) public pure returns(uint){
uint i;
uint iteration;
do {
 //Here we input 18 after deploying we get 18, 
 //but if we input 0 we get 1 it is because do while runs atleast one time even if ytthe condition is false.
    
iteration ++;
i++;
} while(i < cond);
//If you input the value of 'cond' as 0, the condition will be false
//on the first try, however you will notice that the loop still runs once
return iteration;
}
}
