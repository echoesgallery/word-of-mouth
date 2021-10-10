# Word Of Mouth Art Therapy

## Purpose
This repo contains the source code for the smart contract and the metadata for minting the first NFT. It is also set up for using as storage for future NFT json metadata files.

## How To Use the repo

### Port your Art Image on ipfs

1. Upload the art image to ipfs network. Note the ipfs://xxx address for the image.
1. E-mail the ipfs://xxx address of the image to echoesgallery.info@gmail.com

### Create a metadata file

1. Create a metadata file in the metadata folder in this repo using the naming convention descriped in the Metadata section in the [EIP-1155: Multi Token Standard](https://eips.ethereum.org/EIPS/eip-1155).

The easiest is to copy the latest json metadata file to a new file with a filename following the standard.
```
cd metadata
cp 0000000000000000000000000000000000000000000000000000000000000000.json 0000000000000000000000000000000000000000000000000000000000000002.json
```

2. Edit the newly copied json metadata file to update with the information for the new art image. Make sure you replace the image url with the ipfs for the new art image.
3. Save the json metadata file in this github repo and publish. Note the URL for the raw json metadata file.

### Mint the art image
Must have permissions to mint.

1. Open the contract URL on etherscan.io
- https://rinkeby.etherscan.io/address/0x83A9934A412fc1F60DDa03830b34C8E3d5D339e3
2. Click on write contract 
4. Connect your metamask with account that have permissions to mint
3. Expand the mint function and enter the data needed for minting
5. Submit transaction
6. Approve the transaction in metamask
7. Verify the newly minted item on opensea

### Compile, Deploy and verify the contract
Must have hardhat project set up following the instructions in [README-project-setup.md](https://github.com/BlockDevsUnited/NFT-COURSE/blob/main/README-project-setup.md). 
1. Compile with ```npx hardahat compile```
1. Deploy with ```npx hardhat run --network polygon scripts/deploy.js```
1. Verify with ```npx hardhat verify --network polygon <contract_id>```