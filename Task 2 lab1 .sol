// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Bank {
   struct BankAccount{
       uint256 AccountID;
       uint256 Balance;
       address Owner;
   }
   //Method 2
   BankAccount private bankAccount;
   function Method2() public {
       bankAccount.AccountID = 99;
       bankAccount.Balance = 110;
       bankAccount.Owner = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
   }
   //Method 3
   function Method3() public {
       bankAccount = BankAccount(90, 100, 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4 );
   }
   //Method 4
function Method4() public {
    bankAccount = BankAccount ({AccountID: 20, Balance: 67,Owner: 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4});
}
function Get() public view  returns (uint, uint, address) {
    return (bankAccount.AccountID, bankAccount.Balance, bankAccount.Owner);
}

}