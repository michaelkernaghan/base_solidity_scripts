// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract EmployeeStorage {


    uint32 private salary; // Optimized for storage, salaries up to 1,000,000
    uint16 private shares; // Optimized for storage, shares up to 5,000
    string public name;
    uint256 public idNumber; // Employee ID can be any number up to 2^256-1

    constructor() {
        shares = 1000; // Initializing shares
        name = "Pat"; // Initializing name
        salary = 50000; // Initializing salary
        idNumber = 112358132134; // Initializing ID number
    }

    // View function for salary
    function viewSalary() public view returns (uint32) {
        return salary;
    }

    // View function for shares
    function viewShares() public view returns (uint16) {
        return shares;
    }

    // Custom error for grantShares function
    error TooManyShares(uint256 newTotal);
    
    // Function to grant shares to the employee
   function grantShares(uint16 _newShares) public {
        if (_newShares > 5000) {
            revert("Too many shares"); // If _newShares is more than 5000, revert
        }
        
        uint16 _newTotal = shares + _newShares; // Calculate new total of shares
        if (_newTotal > 5000) {
            revert TooManyShares(_newTotal); // Use custom error if total exceeds 5000
        }
        
        shares = _newTotal; // Assign new total to shares
    }

    // Function to check storage packing - DO NOT MODIFY
    function checkForPacking(uint _slot) public view returns (uint r) {
        assembly {
            r := sload(_slot)
        }
    }

    // Function to reset shares for debugging purposes
    function debugResetShares() public {
        shares = 1000;
    }
}
