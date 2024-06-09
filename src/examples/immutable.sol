// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Immutable {
    uint256 immutable MY_UINT;
    address immutable MY_ADDRESS;

    constructor(uint256 _myUint) {
        MY_UINT = _myUint;
        MY_ADDRESS = msg.sender;
    }
}
