//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "foundry-huff/HuffDeployer.sol";
import "@hack/store/store.sol";
import "@hack/Auction/Auction.sol";
import "@hack/Auction/MyNft.sol";
// import "@openzeppelin/contracts/token/ERC721/IERC721.sol";
import "../../new-project/src/MyToken.sol";

contract AuctionTest is Test {
    Auction public a;
    MyNft public nftT;
    MyToken public tokenT;
    uint256 private immutable WAD = 10 ** 18;
    address public myUser = vm.addr(1);

    function setUp() public {
        nftT=new MyNft();
        tokenT= new MyToken();
        a = new Auction(address(nftT), address(tokenT), 100, 1);
    }
    // function testAddBidder() public{
    //     uint amount=150;
    //     vm.startPrank(myUser);
     
    //     vm.stopPrank();
    // }
    // function testAddBidderTooLowAmount(80) public{
        
    // }
}
