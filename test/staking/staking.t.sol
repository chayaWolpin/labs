// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "@hack/staking/staking.sol";

contract StakingRewardsTest is Test {
    StakingRewards public s;
    address public user = vm.addr(1);

    function setUp() public {
        vm.startPrank(user);
        s = new StakingRewards();
        vm.deal(myUser, 200);
        
    }
}