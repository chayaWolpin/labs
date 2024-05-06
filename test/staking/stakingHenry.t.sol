// // SPDX-License-Identifier: Unlicense
// pragma solidity ^0.8.20;
// //  import "foundry-huff/HuffDeployer.sol";
// import "forge-std/Test.sol";
// import "@hack/store/store.sol";
// import "../../../src/staking/staking.sol";
// import "../../../MyToken/new-project/src/MyToken.sol";
// contract TestStaking is Test {
//     // uint WAD = 10 ** 18;
//     // StakingRewards public stack;
//     // MyToken token;
//     // address public myUser = vm.addr(1234);
//     // function setUp() public {
//     //     token = new MyToken();
//     //     stack = new StakingRewards(address(token));
//     // }
//     // function TestDeposit() public {
//     //     uint sum = 100 * WAD;
//     //     token.mint(address(this), 1000);
//     //     uint256 balanceBefore = stack.getBalance();
//     //     token.approve(address(stake), sum);
//     //     stack.deposit(sum);
//     //     uint256 balanceAffterDeposit = stack.getBalance();
//     //     assertEq(
//     //         balanceBefore,
//     //         balanceAfterDeposit,
//     //         "Contract balance not updated correctly"
//     //     );
//     // }
//     // function TestWithdraw() {
//     //     console.log("testWithdraw");
//     //     uint256 sum = 100 * WAD;
//     //     token.mint(address(this), sum);
//     //     token.approve(address(stake), sum);
//     //     stake.deposit(sum);
//     //     vm.warp(block.timestamp + 7 days);
//     //     uint256 balanceBefore = stake.getBalance();
//     //     stake.withdraw(sum);
//     //     uint256 finalUserBalance = stake.getBalance(); //100
//     //     console.log("finamsglUserBalance", finalUserBalance);
//     //     assertEq(balanceBefore, finalUserBalance, "error");
//     // }
//     // function TestIsNtWithdraw() {
//     //     uint256 sum = 200 * WAD;
//     //     token.mint(address(this), sum);
//     //     token.approve(address(stake), sum);
//     //     stake.deposit(sum);
//     //     uint256 balanceBefore = stake.getBalance();
//     //     vm.expectRevert(); //Not a week has passed
//     //     stake.withdraw(sum);
//     // }
//     // function calcReward() {
//     //     uint total = 10000 * WAD;
//     //     uint calc = stack.calc();
//     // }
//         StakingRewards public s;
//     IERC20 public stakingToken;
//     IERC20 public rewardsToken;
//     address public user = vm.addr(1);
//     function setUp() public {
//         stakingToken=new IERC20();
//         rewardsToken=new IERC20();
//         sr=new StakingRewards(address(stakingToken),address(rewardsToken));
//      }


// }




