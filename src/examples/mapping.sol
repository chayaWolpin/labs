// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Mapping {
    mapping(address => uint256) public map;

    function get(address _addr) public view returns (uint256) {
        return map[_addr];
    }

    function set(address _addr, uint256 _i) public {
        map[_addr] = _i;
    }

    function remove(address _addr) public {
        delete map[_addr];
    }
}

contract NestedMapping {
    mapping(address => mapping(uint256 => bool)) public nestedMap;

    function get(address _addr, uint256 _i) public view returns (bool) {
        return nestedMap[_addr][_i];
    }

    function set(address _addr, uint256 _i, bool _boo) public {
        nestedMap[_addr][_i] = _boo;
    }

    function remove(address _addr, uint256 _i) public {
        delete nestedMap[_addr][_i];
    }
}
