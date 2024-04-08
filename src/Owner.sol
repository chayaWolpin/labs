// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.7.0 <0.9.0;

contract Owner {
    address private owner;

    event OwnerSet(address indexed oldOwner, address indexed newOwner);

    modifier isOwner() {
        require(msg.sender == owner, "Caller is not owner");
        //check if caller is the owner if not print "Caller is not owner"
        _;
    }

    constructor() {
        owner = msg.sender; // 'msg.sender' is sender of current call
        emit OwnerSet(address(0), owner);
    }

    function changeOwner(address newOwner) public isOwner {
        emit OwnerSet(owner, newOwner);
        owner = newOwner;
        //if isOwner==true change the owner to the address that the function got
    }

    //return address of owner

    function getOwner() external view returns (address) {
        return owner;
    }
}
