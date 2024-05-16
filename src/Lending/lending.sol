// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "../../new-project/src/MyToken.sol";

contract Lending {
    MyToken public immutable _token;
    MyToken public immutable Dai;
    mapping(address => uint256) public borrowers;
    mapping(address => uint256) public collaterals;
    mapping(address => uint256) public depositTime;
    mapping(address => uint256) deposits;
    address payable public owner;
    uint256 public immutable WAD = 1e18;
    uint256 public ratePerWeek;

    constructor(address tok, uint256 rate) {
        address owner = msg.sender;
        Dai = MyToken(0x6B175474E89094C44Da98b954EedeAC495271d0F);
        _token = MyToken(tok);
        ratePerWeek = rate;
    }

    function deposit(uint256 amount) public {
        require(
            depositTime[msg.sender] == 0,
            "You have already deposited Dai. withdraw your Dai before depositing more Dai."
        );
        Dai.transferFrom(msg.sender, address(this), amount);
        _token.mint(msg.sender, amount);
        depositTime[msg.sender] = block.timestamp;
        deposits[msg.sender] = amount;
    }

    function calculateReward(address user, uint256 amount) private returns (uint256) {
        uint256 rewardPerWeek = deposits[msg.sender] * ratePerWeek * amount;
        uint256 week = 60 * 60 * 24 * 7;
        uint256 duration = block.timestamp - depositTime[user];
        return rewardPerWeek * duration / week;
    }

    function unbond(uint256 amount) public {
        require(amount > 0, "Invalid amount");
        _token.burn(msg.sender, amount);
        uint256 reward = calculateReward(msg.sender, amount);
        Dai.transferFrom(address(this), msg.sender, amount + reward);
    }

    function addCollateral(uint256 amount) public {}
}
