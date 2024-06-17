// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Event {
    event Log(address sender, string massage);
    event anotherLog(uint256 i, string massage);

    function test() public {
        emit Log(address(0), "Hello World");
        emit anotherLog(10, "Have a nice day");
    }
}
