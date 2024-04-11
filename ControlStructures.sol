// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Importing console.log for debugging purposes
import "hardhat/console.sol";

contract ControlStructures {
    
    // FizzBuzz function
    function fizzBuzz(uint _number) public pure returns (string memory) {
        // Check if divisible by both 3 and 5 (i.e., 15)
        if (_number % 15 == 0) {
            return "FizzBuzz";
        }
        // Check if divisible by 3
        else if (_number % 3 == 0) {
            return "Fizz";
        }
        // Check if divisible by 5
        else if (_number % 5 == 0) {
            return "Buzz";
        }
        // If none of the conditions are met
        else {
            return "Splat";
        }
    }

    // Custom error for after hours
    error AfterHours(uint time);

    // Function that checks the time and returns a greeting or reverts with an error
    function doNotDisturb(uint _time) public pure returns (string memory) {
        // Check if the time is invalid (greater than or equal to 2400)
        assert(_time < 2400);
        
        // Check if the time is after hours
        if (_time > 2200 || _time < 800) {
            revert AfterHours(_time);
        }
        
        // Check if it's lunch time
        if (_time >= 1200 && _time <= 1259) {
            revert("At lunch!");
        }
        
        // Return greetings based on the time of day
        if (_time >= 800 && _time <= 1199) {
            return "Morning!";
        } else if (_time >= 1300 && _time <= 1799) {
            return "Afternoon!";
        } else if (_time >= 1800 && _time <= 2200) {
            return "Evening!";
        }

        // Fallback in case of an unexpected input
        revert("Unexpected time provided.");
    }
}
