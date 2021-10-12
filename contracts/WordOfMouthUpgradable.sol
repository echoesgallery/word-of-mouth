// SPDX-License-Identifier: MIT
// This contract is not being used because it has not been tested.

pragma solidity ^0.8.2;

import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
//import "@openzeppelin/contracts/utils/Counters.sol";

contract WordOfMouthUpgradable is ERC1155Upgradeable {
  string public name;
  string public symbol;
  string public uri;

  mapping(uint => bool) initialized;

  function initialize() initializer public {
        name = "Word of Mouth Upgradable~";
        symbol = "WOMU";
        uri = "https://raw.githubusercontent.com/BDU-NFT-Course/NFT-Metadata/main/sample-stones-erc1155/{id}.json";
        __ERC1155_init(uri);
        _mint(msg.sender, 0, 1, "");
        initialized[0]=true;
   }

    function mint(address to,uint256 id) public virtual {
        require(!initialized[id],"This ID is already minted");
        _mint(to, id, id, "");
        initialized[id]=true;
    }

}

