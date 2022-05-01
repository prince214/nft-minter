// SPDX-License-Identifier: UNLICENSED

pragma solidity ^0.8.1;

// We first import some OpenZeppelin Contracts.
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "hardhat/console.sol";

// We inherit the contract we imported. This means we'll have access
// to the inherited contract's methods.

contract MyEpicNFT is ERC721URIStorage  {

    // Magic given to us by OpenZeppelin to help us keep track of tokenIds.
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    //We need to pass the name of our NFTs token and its symbol.
    constructor() ERC721 ("BeastLion", "SQUARE") {
        console.log("This is my first NFT Contract. Boom!");
    }

    // A function our user will hit to get their NFT.
    function makeAnEpicNFT() public {
        //Get the current tokenID, this start at 0.
        uint256 newItemId = _tokenIds.current();

        //Actually mint the NFT to the sender using msg.sender.
        _safeMint(msg.sender, newItemId);

        // Set the NFTs data.
        _setTokenURI(newItemId, "https://jsonkeeper.com/b/YZCD");

        console.log("An NFT w/ ID %s has been minted to %s", newItemId, msg.sender);

        // Increment the counter for when the next NFT is minted.
        _tokenIds.increment();
    }
}