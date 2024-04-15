// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

library SillyStringUtils {
    struct Haiku {
        string line1;
        string line2;
        string line3;
    }

    function shruggie(string memory _input) internal pure returns (string memory) {
        return string.concat(_input, unicode" 🤷");
    }
}

contract ImportsExercise {
    using SillyStringUtils for string;

    SillyStringUtils.Haiku private haiku;

    function saveHaiku(string calldata line1, string calldata line2, string calldata line3) external {
        haiku.line1 = line1;
        haiku.line2 = line2;
        haiku.line3 = line3;
    }

    function getHaiku() external view returns (SillyStringUtils.Haiku memory) {
        return haiku;
    }

    function shruggieHaiku() external view returns (SillyStringUtils.Haiku memory) {
        SillyStringUtils.Haiku memory modifiedHaiku = haiku;
        modifiedHaiku.line3 = haiku.line3.shruggie();
        return modifiedHaiku;
    }
}
