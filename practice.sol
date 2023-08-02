// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract PizzaDeli {
    enum PizzaOrder{
        Pending,
        Preparing,
        Delivering,
        Recieved
    }
    PizzaOrder public P1;
    function set(PizzaOrder _P) public {
        P1 = _P;
    }
    PizzaOrder public P2 = PizzaOrder.Preparing;
    PizzaOrder public P3 = PizzaOrder(3);
    function GetAll() public view returns (PizzaOrder, PizzaOrder, PizzaOrder) {
        return (P1, P2, P3);
    }
}