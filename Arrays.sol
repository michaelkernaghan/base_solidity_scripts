// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ArraysExercise {
    uint[] public numbers = [1,2,3,4,5,6,7,8,9,10];
    address[] public senders;
    uint[] public timestamps;

    // Return the complete 'numbers' array.
    function getNumbers() public view returns (uint[] memory) {
        return numbers;
    }

    // Reset 'numbers' to its initial state.
    function resetNumbers() public {
        delete numbers; // Efficiently clears the array
        numbers = [1,2,3,4,5,6,7,8,9,10];
    }

    // Append an array to 'numbers'.
    function appendToNumbers(uint[] calldata _toAppend) public {
        for (uint i = 0; i < _toAppend.length; i++) {
            numbers.push(_toAppend[i]);
        }
    }

    // Save caller's address and a timestamp.
    function saveTimestamp(uint _unixTimestamp) public {
        senders.push(msg.sender);
        timestamps.push(_unixTimestamp);
    }

    // Return timestamps after Y2K and corresponding addresses.
    function afterY2K() public view returns (uint[] memory, address[] memory) {
        uint count = 0;
        // First, count how many timestamps are after Y2K.
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                count++;
            }
        }

        // Allocate memory arrays.
        uint[] memory filteredTimestamps = new uint[](count);
        address[] memory filteredSenders = new address[](count);
        uint j = 0;

        // Populate the memory arrays.
        for (uint i = 0; i < timestamps.length; i++) {
            if (timestamps[i] > 946702800) {
                filteredTimestamps[j] = timestamps[i];
                filteredSenders[j] = senders[i];
                j++;
            }
        }

        return (filteredTimestamps, filteredSenders);
    }

    // Reset 'senders'.
    function resetSenders() public {
        delete senders;
    }

    // Reset 'timestamps'.
    function resetTimestamps() public {
        delete timestamps;
    }
}