// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract GarageManager {
    struct Car {
        string make;
        string model;
        string color;
        uint numberOfDoors;
    }

    mapping(address => Car[]) public garage;

    function addCar(string memory make, string memory model, string memory color, uint numberOfDoors) public {
        Car memory newCar = Car({make: make, model: model, color: color, numberOfDoors: numberOfDoors});
        garage[msg.sender].push(newCar);
    }

    function getMyCars() public view returns (Car[] memory) {
        return garage[msg.sender];
    }

    function getUserCars(address user) public view returns (Car[] memory) {
        return garage[user];
    }

    error BadCarIndex(uint index);

    function updateCar(uint index, string memory make, string memory model, string memory color, uint numberOfDoors) public {
        if (index >= garage[msg.sender].length) revert BadCarIndex(index);
        garage[msg.sender][index] = Car(make, model, color, numberOfDoors);
    }

    function resetMyGarage() public {
        delete garage[msg.sender];
    }
}