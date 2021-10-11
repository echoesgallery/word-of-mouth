// File: contracts/WordOfMouth.sol
// SPDX-License-Identifier: MIT

pragma solidity ^0.8.2;

import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

contract WordOfMouth is ERC1155, Ownable {
    uint256 public constant VOICE = 0;
 
    constructor() ERC1155("https://raw.githubusercontent.com/echoesgallery/word-of-mouth/main/metadata/{id}.json"){
        _mint(msg.sender,VOICE,1,"");
    }

    function mint(address account, uint256 id, uint256 amount) public onlyOwner {
        _mint(account, id, amount, "");
    }

    function burn(address account, uint256 id, uint256 amount) public {
        require(msg.sender == account);
        _burn(account, id, amount);
    }

    function contractURI() public pure returns (string memory) {
        return "https://raw.githubusercontent.com/echoesgallery/word-of-mouth/main/metadata/wordofmouth-contract-metadata.json";
    }

}