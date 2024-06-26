// // SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.15;

// import "forge-std/Test.sol";
// import "forge-std/console.sol";
// import "@hack/wallet/wallet.sol";

// contract WalletTest is Test {
//     Wallet public w;
//     address public myUser = vm.addr(1);

//     function setUp() public {
//         vm.startPrank(myUser);
//         w = new Wallet();
//         vm.deal(myUser, 200);
//         payable(address(w)).transfer(100);
//         w.addGabay(0xCfEb056B0C0e2Cf1Cb321B4D22c1E35ee01CdAC7);
//         vm.stopPrank();
//     }

//     function testReceive(uint256 value) public {
//         uint256 balance = w.getBalance();
//         vm.startPrank(myUser);
//         payable(address(w)).transfer(value);
//         vm.stopPrank();
//         assertEq(w.getBalance(), balance + value);
//     }

//     function testAddGabayNotOwner(address add) public {
//         uint256 countTest = w.counter();
//         vm.startPrank(add);
//         vm.expectRevert("caller is not owner");
//         w.addGabay(0x074AC318E0f004146dbf4D3CA59d00b96a100100);
//         assertTrue(w.gabaim(0x074AC318E0f004146dbf4D3CA59d00b96a100100) == false);
//         assertEq(w.counter(), countTest);
//         vm.stopPrank();
//     }

//     function testAddGabayAlreadyExist() public {
//         vm.startPrank(myUser);
//         vm.expectRevert("this is already a Gabay");
//         w.addGabay(0xCfEb056B0C0e2Cf1Cb321B4D22c1E35ee01CdAC7);
//         vm.stopPrank();
//     }

//     function testAddGabayMoreThanThree(address add) public {
//         vm.startPrank(myUser);
//         w.addGabay(0x562b99aCA39C6e94d93F483E074BBaf5789c87Cd);
//         w.addGabay(0x29392969D235eA463A6AA42CFD4182ED2ecB5117);
//         vm.expectRevert("too many gabaies");
//         w.addGabay(add);
//         vm.stopPrank();
//     }

//     function testAddGabay(address add) public {
//         uint256 countTest = w.counter();
//         vm.startPrank(myUser);
//         vm.expectRevert("this is already a Gabay");
//         w.addGabay(add);
//         assertTrue(w.gabaim(add) == true);
//         assertEq(w.counter(), countTest + 1);
//         vm.stopPrank();
//     }

//     function testWithdraw(uint256 amount) public {
//         uint256 prevBalance = address(w).balance;
//         uint256 expectedBalance = prevBalance - amount;
//         vm.startPrank(myUser);
//         w.withdraw(amount);
//         assertEq(expectedBalance, address(w).balance, "ERROR! the balance didn't decrease after the withdraw");
//         vm.stopPrank();
//     }

//     function testWithdrawNotAllowed(address add) public {
//         vm.startPrank(add);
//         vm.expectRevert("caller is not allowed");
//         w.withdraw(20);
//         vm.stopPrank();
//     }

//     function testWithdrawNotEnoughMoney() public {
//         uint256 balance = w.getBalance();
//         vm.startPrank(myUser);
//         vm.expectRevert("There-is-no-enough-Eth-to-withdraw");
//         w.withdraw(balance + 1);
//         vm.stopPrank();
//     }

//     function testGetBalance() public {
//         uint256 myBalance = address(w).balance;
//         uint256 expected = w.getBalance();
//         assertEq(myBalance, expected, "ERROR! you should get the balance");
//     }

//     function testDeletGabay() public {
//         uint256 countTest = w.counter();
//         vm.startPrank(myUser);
//         w.deleteGabay(0xCfEb056B0C0e2Cf1Cb321B4D22c1E35ee01CdAC7);
//         assertTrue(w.gabaim(0xCfEb056B0C0e2Cf1Cb321B4D22c1E35ee01CdAC7) == false);
//         assertEq(w.counter(), countTest - 1);
//         vm.stopPrank();
//     }
// }
