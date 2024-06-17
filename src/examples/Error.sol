// SPDX-License-Identifier: MIT
pragma solidity ^0.8.15;

contract Error {
    function testRequire(uint256 _i) public pure {
        require(_i > 10, "i is less than 10");
    }

    function testRevert(uint256 _i) public pure {
        if (_i < 10) {
            revert("i is less than 10");
        }
    }

    uint256 public num;

    function testAssert() public view {
        assert(num == 0);
    }

    error errorBalance(uint256 balance, uint256 withdrawAmount);

    function testCustomError(uint256 _withdrawAmount) public view {
        uint256 _balance = address(this).balance;
        if (_balance < _withdrawAmount) {
            revert errorBalance({balance: _balance, withdrawAmount: _withdrawAmount});
        }
    }
}
