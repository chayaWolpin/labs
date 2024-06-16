// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract DataLocation {
    uint256[] public arr;
    mapping(uint256 => address) map;

    struct MyStruct {
        uint256 foo;
    }

    mapping(uint256 => MyStruct) myStructs;

    function _f() public {
        f(arr, map, myStructs[1]);
        MyStruct storage myStruct = myStructs[1];
        MyStruct memory myMemStruct = MyStruct(0);
    }

    function f(uint256[] storage arr, mapping(uint256 => address) storage _map, MyStruct storage _myStract) internal {}
    function g(uint256[] memory arr) public returns (uint256[] memory) {}
    function h(uint256[] calldata arr) external {}
}
