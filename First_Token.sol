pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract First_Token is ERC721URIStorage {
    using Counters for Counters.Counter;
    Counters.Counter public _tokenIds;

    constructor(string memory Tname, string memory Tsym) ERC721(Tname, Tsym) {}

    function create_Token(address owner, string memory tokenURI)
        public
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(owner, newItemId);
        _setTokenURI(newItemId, tokenURI);

        return newItemId;
    }
}
