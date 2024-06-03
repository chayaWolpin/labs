// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "../../new-project/src/MyToken.sol";

// contract newLending {
//     MyToken public immutable bDai;
//     MyToken public immutable Dai;
//     mapping(address => uint256) public borrowers;
//     mapping(address => uint256) public collaterals;
//     mapping(address => uint256) public depositTime;
//     mapping(address => uint256) deposits;
//     address public owner;
//     uint256 public immutable WAD = 1e18;
//     uint256 public ratePerWeek;

//     constructor(address tok, uint256 rate) {
//         address owner = msg.sender;
//         Dai = MyToken(0x6B175474E89094C44Da98b954EedeAC495271d0F);
//         bDai = MyToken(tok);
//         // ratePerWeek = rate;
//     }

//     function deposit(uint256 amount) public {
//         require(
//             depositTime[msg.sender] == 0,
//             "You have already deposited Dai. withdraw your Dai before depositing more Dai."
//         );
//         Dai.transferFrom(msg.sender, address(this), amount);
//         bDai.mint(msg.sender, amount);
//         depositTime[msg.sender] = block.timestamp;
//         deposits[msg.sender] = amount;
//     }

//     function calculateReward(address user, uint256 amount) private returns (uint256) {
//         uint256 rewardPerWeek = deposits[msg.sender] * ratePerWeek * amount;
//         uint256 week = 60 * 60 * 24 * 7;
//         uint256 duration = block.timestamp - depositTime[user];
//         return rewardPerWeek * duration / week;
//     }

//     function ETHValue() public returns (uint256) {
//         uint256 _ETH = 3087;
//         return _ETH;
//     }

//     function unbond(uint256 amount) public {
//         require(amount > 0, "Invalid amount");
//         _token.burn(msg.sender, amount);
//         uint256 reward = calculateReward(msg.sender, amount);
//         Dai.transferFrom(address(this), msg.sender, amount + reward);
//     }

//     function addCollateral(uint256 amount) public payable {
//         payable(msg.sender).transfer(amount);
//         collaterals[msg.sender] += amount;
//     }

//     function removeCollateral(uint256 amount) public {
//         collaterals[msg.sender] -= amount;
//     }

//     function borrow(uint256 amount) public {
//         uint256 limit = ETHValue() * collaterals[msg.sender] - borrowers[msg.sender];
//         require(limit >= amount, "You don't have enough collaterals");
//         borrowers[msg.sender] += amount;
//         Dai.transferFrom(address(this), msg.sender, amount);
//     }

//     function calculateCommission() private returns (uint256) {}

//     function repayBorrow(uint256 amount) external {
//         require(amount > 0, "You can't repay this amount");
//     }
// }
