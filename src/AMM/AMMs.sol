// SPDX-License-Identifier: MIT
// https://solidity-by-example.org/defi/staking-rewards/
// Code is a stripped down version of Synthetix
pragma solidity ^0.8.20;
 import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
contract AMMs{
    IERC20 public immutable A;
    IERC20 public immutable B;
    uint private totalSuplly;
    uint private amountA;
    uint private balanceA;
    uint private amountB;
    uint private balanceB;
    uint private valueA;
    uint private valueB;
    

    constructor(uint Aa,uint Bb,address _A,address _B){
        amountA=Aa;//amount of A tokens in the pool 
        amountB=Bb;
        // balanceA=Aa;//the value of each A token in the pool
        // balanceB=Bb;
       valueB= amountA/amountB;//value of each B token 
        valueA=1;//value of each A token
        totalSuplly=Aa*Bb;
        A =IERC20(_A);
        B =IERC20(_B);
    }
    // function price(uint amount, uint first)public returns(uint){
    //    return first/amount;
    // }
    function price(uint amountA,uint amountB) public returns (uint){
        valueB=amountA/amountB;
        return valueB;
    }
    function swapA(uint amount) public {
        require(amount>0,"Can't swap this amount");
        A.transferFrom(msg.sender,address(this),amount);
        amountA+=amount;
        uint BB=amountB;
        amountB = totalSuplly/amountA;

        valueB=price(amountA,amountB);
        // balanceA=price(amountA,firstA);
        // balanceB=price(amountB,firstB);
        B.transferFrom(address(this),msg.sender,BB-amountB);
    }
   
    function swapB(uint amount)public {
        require(amount>0,"Can't swap this amount");
        B.transferFrom(msg.sender,address(this),amount);
        amountB+=amount;
        uint AA=amountA;
        amountA = totalSupply/amountB;
         valueB=price(amountA,amountB);
        
        // balanceB=price(amountB,firstB);
        // balanceA=price(amountA,firstA);
        A.transferFrom(address(this),msg.sender,AA-amountA);
    }
    function provide(uint amount)public{
       uint putLiquidityA=amount/(valueA+valueB);
       uint putLiquidityB=amount/(valueA+valueB)*valueB;
       A.transferFrom(msg.sender,address(this),putLiquidityA);
       B.transferFrom(msg.sender,address(this),putLiquidityB);
       amountA=amountA+putLiquidityA;
       amountB=amountB+putLiquidityB;
       totalSupply=amountA*amountB;
    }
    
}