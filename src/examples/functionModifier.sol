// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract modifierFunctions {
    address public owner;
    uint256 public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "this is not a owner");
        _;
    }

    modifier validAddress(address addr) {
        require(addr != address(0), "not valid address");
        _;
    }

    function changeOwner(address newOwner) public onlyOwner validAddress(newOwner) {
        owner = newOwner;
    }

    modifier changeBool() {
        require(!locked, "No reentrancy");
        locked = true;
        _;
        locked = false;
    }

    function dec(uint256 i) public changeBool {
        x -= i;
        if (i > 1) {
            dec(i - 1);
        }
    }
}
