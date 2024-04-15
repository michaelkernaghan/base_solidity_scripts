// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ErrorTriageExercise {
    /**
     * Correct calculation of absolute differences between consecutive elements.
     */
    function diffWithNeighbor(
        uint _a,
        uint _b,
        uint _c,
        uint _d
    ) public pure returns (uint[] memory) {
        uint[] memory results = new uint[](3);

        results[0] = _a > _b ? _a - _b : _b - _a;
        results[1] = _b > _c ? _b - _c : _c - _b;
        results[2] = _c > _d ? _c - _d : _d - _c;

        return results;
    }

    /**
     * Safely applying a modifier to a base ensuring no underflows or overflows.
     */
function applyModifier(
    uint _base,
    int _modifier
) public pure returns (uint) {
    if (_modifier < 0) {
        uint positiveModifier = uint(-_modifier); // Convert to positive uint
        if (positiveModifier > _base) {
            revert("Modifier would underflow base");
        }
        return _base - positiveModifier;
    } else {
        uint largeModifier = uint(_modifier); // Direct conversion to uint
        // Check for overflow
        uint maxUint = type(uint).max;
        if (maxUint - _base < largeModifier) {
            revert("Modifier would overflow base");
        }
        return _base + largeModifier;
    }
}


    /**
     * Properly pop and return the last element of an array.
     */
    uint[] arr;

    function popWithReturn() public returns (uint) {
        require(arr.length > 0, "Array is empty");
        uint lastIndex = arr.length - 1;
        uint lastElement = arr[lastIndex];
        arr.pop(); // This correctly removes the last element
        return lastElement;
    }

    // The utility functions below are working as expected
    function addToArr(uint _num) public {
        arr.push(_num);
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function resetArr() public {
        delete arr;
    }
}
