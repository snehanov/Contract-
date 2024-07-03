// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract ShareholderContract {
    address public owner;
    mapping(address => uint256) public shares;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can perform this action");
        _;
    }

    function issueShares(address shareholder, uint256 amount) external onlyOwner {
        shares[shareholder] += amount;
    }

    function transferShares(address to, uint256 amount) external {
        require(shares[msg.sender] >= amount, "Insufficient shares");
        shares[msg.sender] -= amount;
        shares[to] += amount;
    }

    // Add more functions as needed (voting, dividends, etc.)
}