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
    uint public immutable duration = 7;
    uint public immutable WAD = 10**18;
    

    mapping(address => uint) public deposits;
    uint public totalSupply;
    mapping (address => uint) public startDate;
    mapping (address => uint) public tokens_in_pool;
    mapping (address=> uint)public rewards;

    constructor(address _stakingToken) {
        owner = msg.sender;
        stakingToken = IERC20(_stakingToken);
        rewardsToken= new MyToken();
    
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "not authorized");
        _;
    }
    //  function getReward(uint _amount) external {
    //    rewardsToken. mint(deposits[msg.sender],_amount);
    // }

    function deposit(uint256 _amount) external {
        require(_amount>0,"amount=0"); 
        _amount = _amount*WAD;
        stakingToken.transferFrom(msg.sender,address(this),_amount);
        totalSupply += _amount;
        uint256 precentOfDeposit=_amount*100/totalSupply;
        deposits[msg.sender]+=precentOfDeposit; 
        tokens_in_pool[msg.sender]+= _amount;
        startDate[msg.sender]=block.timestamp;
        rewardsToken. mint(msg.sender,_amount);
        // StakingRewards.getReward(_amount);

    }

   
    modifier isEnoughDays(){
        uint today=block.timestamp;
        require(today-startDate[msg.sender]>=duration,"the reward duration is not finished yet");
        _;
    }


    function withdraw(uint amountRewardToken) external onlyOwner isEnoughDays{
        require(tokens_in_pool[msg.sender]>=amountRewardToken,"you dont have enough tokens to withdraw");
        require(amountRewardToken> 0, "amount = 0");
        uint finalRewards=deposits[msg.sender]/rewards[msg.sender]*amountRewardToken*totalSupply;
        deposits[msg.sender]-=amountRewardToken;
        stakingToken.transferFrom(address(this),msg.sender,finalRewards);
        totalSupply-=finalRewards;
    }
   
}
   
  
    

  
   
    



