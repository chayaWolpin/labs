// // SPDX-License-Identifier: MIT
// pragma solidity ^0.8.20;

// // import "../../new-project/lib/openzeppelin-contracts/contracts/token/ERC721/IERC721.sol";
// import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
// import "../../new-project/src/MyToken.sol";
// import "./MyNft.sol";

// contract Auction {
//     MyNft nft;
//     MyToken public immutable _token;
//     mapping(address => uint256) public bidders;
//     mapping(uint256 => address) indexes;
//     uint256 counter;
//     uint256 duration = 7 days;
//     address public max;
//     address payable public owner;
//     uint256 private Id;
//     uint256 public immutable WAD = 1e18;

//     constructor(address Nft, address tok, uint256 amount, uint256 _Id) {
//         Id = _Id;
//         address owner = msg.sender;
//         counter = 1;
//         nft = MyNft(Nft);
//         _token = MyToken(tok);
//         bidders[owner] = amount * WAD;
//         max = owner;
//         nft.transferFrom(msg.sender, address(this), Id);
//     }

//     function addBidder(uint256 amount) private {
//         require(amount * WAD > bidders[max], "The value is less than the initial value");
//         max = msg.sender;
//         _token.transferFrom(msg.sender, address(this), amount);
//         bidders[msg.sender] = amount * WAD;
//         counter += 1;
//         indexes[counter] = msg.sender;
//     }

//     function addBid(uint256 amount) external {
//         if (block.timestamp >= duration) {
//             endAuction();
//         } else {
//             addBidder(amount);
//         }
//     }

//     modifier isOwner() {
//         require(msg.sender == owner, " isnt owner");
//         _;
//     }

//     function removeOffer() external isOwner {
//         require(bidders[msg.sender] != bidders[max], "You cannot withdraw the money because you have the highest value");
//         uint256 money = bidders[msg.sender] / WAD;
//         bidders[msg.sender] = 0;
//         _token.transferFrom(address(this), msg.sender, money);
//     }

//     function endAuction() private {
//         bidders[max] = 0;
//         while (counter > 0) {
//             address bidder = indexes[counter];
//             _token.transferFrom(address(this), bidder, bidders[bidder] / WAD);
//             counter = counter - 1;
//         }
//         nft.transferFrom(address(this), address(max), Id);
//     }
// }
