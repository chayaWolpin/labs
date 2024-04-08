// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

///@title
contract Wallet {
    address payable public owner;
    uint256 counter = 0;
    bool public isGabay;
    mapping(address => bool) public gabaim;

    constructor() {
        owner = payable(msg.sender); // 'msg.sender' is sender of current call
    }

    receive() external payable {}

    modifier isOwner() {
        require(msg.sender == owner, "caller is not owner");
        _;
    }

    modifier isAllowed() {
        require(msg.sender == owner || gabaim[msg.sender] == true, "caller is not allowed");
        _;
    }

    function addGabay(address gabay) public isOwner {
        require(counter < 3, "too many gabaies");
        gabaim[gabay] = true;
        counter++;
    }

    function deleteGabay(address gabay) external isAllowed {
        require(gabaim[gabay] == true, "this is not a gabay");
        gabaim[gabay] = false;
        counter--;
    }

    function withdraw(uint256 amount) external isAllowed {
        require(msg.sender.balance >= amount, "There-is-no-enough-Eth-to-withdraw");
        payable(msg.sender).transfer(amount);
    }

    function getBalance() external view returns (uint256) {
        return address(this).balance;
    }
}
