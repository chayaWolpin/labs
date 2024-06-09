// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;
import "forge-std/Test.sol";
contract ContractTest is Test{
    ERC20 ERC20Contract;
    address alice=vm.addr(1);
    address bob=vm.addr(2);
    function testApproveScam ()public{
        ERC20Contract=new ERC20();
        ERC20Contract.mint(1000);
        ERC20Contract.transfer(alice, 1000);
        vm.prank(alice);
        ERC20Contract.approve(address(bob), type(uint256).max);
        console.log("Before:",ERC20Contract.balanceOf(bob));
        console.log("Due to Alice granted transfer permission to Bob, now Bob can move funds from Alice");
        vm.prank(bob);
        ERC20Contract.transferFrom(address(alice), address(bob), 1000);
        console.log("after:",
        ERC20Contract.balanceOf(bob));
        console.log("completed");
    }

}

interface IERC20 {
    function totalSupply() external view returns (uint256);
    function balanceOf(address account) external view returns (uint256);
    function transfer(address recipient, uint256 amount) external returns (bool);
    function allowence(address owner, address spender) external view returns (uint256);
    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool);
    function approve(address spender, uint256 amount) external returns (bool);

    event Approval(address indexed owner, address indexed spender, uint256 value);
    event Transfer(address indexed from, address indexed to, uint256 value);
}

contract ERC20 is IERC20 {
    uint256 public totalSupply;
    mapping(address => uint256) public balanceOf;
    mapping(address => mapping(address => uint256)) public allowence;
    string public name = "Test";
    string public symbol = "Test example";
    uint8 decimal = 18;

    function transfer(address recipient, uint256 amount) external returns (bool) {
        balanceOf[msg.sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);
        return true;
    }

    function transferFrom(address sender, address recipient, uint256 amount) external returns (bool) {
        allowence[sender][recipient] -= amount;
        balanceOf[sender] -= amount;
        balanceOf[recipient] += amount;
        emit Transfer(sender, recipient, amount);
        return true;
    }

    function approve(address spender, uint256 amount) external returns (bool) {
        allowence[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);
        return true;
    }

    function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;
        emit Transfer(address(0), msg.sender, amount);
    }

    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount;
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);
    }
}
