// SPDX-License-Identifier: MIT

// https://solidity-by-example.org/defi/staking-rewards/

pragma solidity ^0.8.20;
import "../../new-project/src/MyToken.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract StakingRewards {
     IERC20 public immutable stakingToken;
     MyToken public immutable rewardsToken;
    address public owner;
    uint public rewardPerTokenStored;
    uint public startAt;
    uint public updateAt;
    uint public rewardRate;

    mapping(address => uint) public deposits;
    uint public totalSupply;
    mapping (address => uint) public startDate;

    mapping (address=> uint)public rewards;



    constructor(address _stakingToken, address _rewardToken) {
        owner = msg.sender;
        stakingToken = IERC20(_stakingToken);
        rewardsToken= new MyToken();
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "not authorized");
        _;
    }
    function deposit(uint256 _amount) external {
        require(_amount>0,"amount=0"); 
        stakingToken.transferFrom(msg.sender,address(this),_amount);
        totalSupply += _amount;
        uint256 precentOfDeposit=_amount*100/totalSupply;
        deposits[msg.sender]+=precentOfDeposit; 
        startDate[msg.sender]=block.timestamp;
        getReward(_amount);

    }

    function getReward(uint _amount) external {
       rewardsToken. transferFrom(address(this),msg.sender._amount);
       rewards[msg.sender]+=_amount;
    }

    modifier is7Days(){
        today=block.timestamp;
        require(today-startDate[msg.sender]>=7,"the reward duration is not finished yet");
        _;
    }


    function withdraw(uint amountRewardToken) external onlyOwner is7Days{
        require(deposits[msg.sender]>=amountRewardToken,"you dont have enough tokens to withdraw");
        require(amountRewardToken> 0, "amount = 0");
        uint finalRewards=deposits[msg.sender]/rewards[msg.sender]*amountRewardToken*totalSupply;
        deposits[msg.sender]-=amountRewardToken;
        stakingToken.transferFrom(address(this),msg.sender,finalRewards);
        totalSupply-=finalRewards;
    }
   
}
   
  
    

  
   
    



