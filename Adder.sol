// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BasicMath {
    // Adder function
    function adder(uint _a, uint _b) public pure returns (uint sum, bool error) {
        // Check for overflow
        unchecked {
            if (_a + _b < _a) {
                // Overflow occurred
                return (0, true);
            }
        }
        // No overflow
        return (_a + _b, false);
    }

    // Subtractor function
    function subtractor(uint _a, uint _b) public pure returns (uint difference, bool error) {
        if (_a < _b) {
            // Underflow occurred
            return (0, true);
        }
        // No underflow
        return (_a - _b, false);
    }
}