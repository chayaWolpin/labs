// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.20;

///@title
contract Wallet {
    address payable public owner;
    address[]public owners;
    
    constructor() {
        owner = payable (msg.sender); // 'msg.sender' is sender of current call
        owners.push(msg.sender);
    }
    receive() external payable {}
   
    modifier  isOwner()  {
        bool flag=false;
        for (uint i=0; i<=owners.length;i++) 
        {
            if (msg.sender==owners[i]){
            flag=true;
            break ;
            }
        } require(flag, "Permission denied");
        _;
    }
     function addOwner (address gabay) public isOwner{
        require(owners.length<3,"There are already three owners");
        owners.push(gabay);
    }

    function withdraw(uint256 amount) external isOwner{
        require(msg.sender.balance>=amount,"There-is-no-enough-Eth-to-withdraw");
        payable(msg.sender).transfer(amount) ;
    }
    function getBalance() external view returns (uint){
        return address(this).balance;
    }
}
