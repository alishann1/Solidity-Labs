// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

    //Task 1
contract Marketplace{

    //Task 2
    mapping(address => uint) public balance;

    //Task 3
    event Purchase (address Buyer, address Sender, uint ValueOfPurchase);

    //Task 4
    function Register(address) external {

        require(balance[msg.sender] == 0, "Not Enough Balance");
        balance[msg.sender] = 10000;
    }

    //Task 5
    function Buy(address Seller, uint Cash) virtual external {
        require(balance[msg.sender] > 0, "Buyer Not Registered");
        require(balance[Seller] > 0, "Seller Not Registered");
        require(Cash == 0, "Cash Must Be Greater Than Zero");
        balance[msg.sender] -= Cash;
        balance[Seller] += Cash;
        emit Purchase(msg.sender, Seller, Cash);
    }

    //Task 6
    function Sell(address Buyer, uint ItemPrice, address Seller) virtual external returns (string memory) {
        require(balance[msg.sender] > 0, "Buyer Not Registered");
        require(balance[Seller] > 0, "Seller Not Registered");
        require(ItemPrice > 0, "ItemPrice Must Be Greater Than Zero");
        require(Seller != Buyer, "Seller and Buyer Cannot Be Same");
        return ("Item Will Be Shipped To Buyers Location");
    }
}
    //Task 7
contract PremiumSeller is Marketplace{

    //Task 8
    uint Fee;
    constructor(uint temp) {
        Fee = temp;
    }
    function Sell(address Buyer, uint ItemPrice, address Seller) override  external  returns(string memory){
        require(balance[Seller] > 0, "Balance Of Seller Cannot Be Zero");
        uint FeeAmount = ItemPrice * Fee / 100;
        balance[Buyer] -= FeeAmount;
        balance[address(this)] += FeeAmount;
        require(balance[msg.sender] > 0, "Buyer Not Registered");
        require(balance[Seller] > 0, "Seller Not Registered");
        return "PremiumSeller";
    } 
}

    //Task 9
contract RegularBuyer is Marketplace{

}

    //Task 10
contract VIPBuyer is Marketplace{
    uint Discount;
    constructor(uint temp) {
        Discount = temp;
    }
     function Buy(address Seller, uint Cash) override external {
        require(balance[msg.sender] > 0, "Buyer Not Registered");
        require(balance[Seller] > 0, "Seller Not Registered");
        uint DiscountAmount = Cash * Discount / 100;
        uint FinalAmount = Cash - DiscountAmount;
        balance[msg.sender] -= Cash;
        balance[Seller] += Cash;
        emit Purchase(Seller, msg.sender, FinalAmount);
     }
}
