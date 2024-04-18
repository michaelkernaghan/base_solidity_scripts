// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UnburnableToken {
    mapping(address => uint256) public balances;
    uint256 public totalSupply;
    uint256 public totalClaimed;
    mapping(address => bool) private claimed;

    error TokensClaimed();
    error AllTokensClaimed();
    error UnsafeTransfer(address caller);

    constructor() {
        totalSupply = 100000000;
    }

    function claim() public {
        if (claimed[msg.sender]) {
            revert TokensClaimed();
        }
        if (totalClaimed + 1000 > totalSupply) {
            revert AllTokensClaimed();
        }

        balances[msg.sender] += 1000;
        totalClaimed += 1000;
        claimed[msg.sender] = true;
    }

    function safeTransfer(address _to, uint256 _amount) public {
        if (_to == address(0) || _to.balance == 0) {
            revert UnsafeTransfer(_to);
        }
        require(balances[msg.sender] >= _amount, "UnsafeTransfer: insufficient balance");

        balances[msg.sender] -= _amount;
        balances[_to] += _amount;
    }
}

