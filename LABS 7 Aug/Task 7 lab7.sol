// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract CarContract {
    struct Car {
        string make;
        uint model; 
        string variant;
    }

    Car public car;

    constructor() {
        car = Car("Toyota", 2000, "Prado"); 
    }

    function initCar1() public returns (Car memory State, Car memory Local) {
        Car storage _car = car; 
        _car.make = "Honda";
        _car.model = 2001;
        _car.variant = "Civic";
        return (car, _car);
      
    }

    function initCar2() public view returns (Car memory State, Car memory Local) {
        
       Car memory _car = car;
       _car.make = "Honda";
       _car.model = 2001;
       _car.variant = "Civic";
       return (car, _car);
    }
}
