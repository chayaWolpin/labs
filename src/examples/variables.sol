// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract variables {
    uint256 num = 456;
    string public text = "Hello";

    function doSomeThing() public {
        uint256 i = 123;
        uint256 stamp = block.timestamp;
        address sender = msg.sender;
    }
}
