// File: contracts/WordOfMouth.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract WordOfMouth is ERC1155, Ownable {
    uint256 public constant VOICE = 0;
    string public constant name = "Word of Mouth";
    string public constant symbol = "WOM";
    string public itemURI = "https://raw.githubusercontent.com/echoesgallery/word-of-mouth/main/metadata/{id}.json";
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;
    uint public maxSupply = 8;
    uint public totalSupply;

    //MoreMintAddr feature
    //uint public maxMinter = 20;
    mapping(address => bool) public minters;

    mapping(uint => bool) isInitialized;

    constructor() ERC1155(itemURI){
        _mint(msg.sender,VOICE,1,"");
        isInitialized[VOICE]=true;
        _tokenIds.increment();
        totalSupply = _tokenIds.current();
        minters[msg.sender] = true; //adding Owner during Verify?
    }

    function addMinter(address newMinterAddr) public onlyOwner {
        minters[newMinterAddr] = true;
    }

    function removeMinter(address newMinterAddr) public onlyOwner {
        minters[newMinterAddr] = false;
    }

    function mint(address toAccount) public returns (uint256) {
        require(_tokenIds.current() < maxSupply,"Max Supply Reached");
        require(minters[msg.sender] == true, "Not an authorized minter");
        uint256 id = _tokenIds.current();
        require(!isInitialized[id], "Token ID already minted");
        _mint(toAccount, id, id, "");
        isInitialized[id]=true;
        _tokenIds.increment();
        totalSupply = _tokenIds.current();
        return id;
    }

    function burn(address itemOwnerAccount, uint256 id, uint256 amount) public {
        require(msg.sender == itemOwnerAccount);
        _burn(itemOwnerAccount, id, amount);
    }

    function contractURI() public pure returns (string memory) {
        return "https://raw.githubusercontent.com/echoesgallery/word-of-mouth/main/metadata/wordofmouth-contract-metadata.json";
    }

}