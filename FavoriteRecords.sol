// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract FavoriteRecords {
    // Mapping to check if an album is approved
    mapping(string => bool) public approvedRecords;
    // Additional array to store and return all approved album names
    string[] private approvedAlbums;

    // Mapping from user address to their favorite records status
    mapping(address => mapping(string => bool)) private userFavorites;
    // Mapping from user address to array of their favorite album names
    mapping(address => string[]) private userFavoriteAlbums;

    // Custom error for unapproved records
    error NotApproved(string albumName);

    constructor() {
    // List of initial approved albums
    string[9] memory initialAlbums = [
        "Thriller",
        "Back in Black",
        "The Bodyguard",
        "The Dark Side of the Moon",
        "Their Greatest Hits (1971-1975)",
        "Hotel California",
        "Come On Over",
        "Rumours",
        "Saturday Night Fever"
    ];
    
    for (uint i = 0; i < initialAlbums.length; i++) {
        approvedRecords[initialAlbums[i]] = true;
        approvedAlbums.push(initialAlbums[i]); // Push each album into the storage array
    }
}

    // Function to get all approved records
    function getApprovedRecords() public view returns (string[] memory) {
        return approvedAlbums;
    }

function addRecord(string calldata albumName) public {
    if (!approvedRecords[albumName]) {
        revert NotApproved(albumName);
    }
    // This check ensures we only add albums that are not already marked as favorites.
    if (!userFavorites[msg.sender][albumName]) {
        userFavorites[msg.sender][albumName] = true;
        userFavoriteAlbums[msg.sender].push(albumName); // Ensure this line is present and correct
    }
}

    // Function to retrieve a user's favorite records
  function getUserFavorites(address user) public view returns (string[] memory) {
    return userFavoriteAlbums[user]; // Ensure this directly returns the array of favorites.
}

    // Function to reset user's favorite records
    function resetUserFavorites() public {
        delete userFavoriteAlbums[msg.sender];
    }
}
