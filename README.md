# Word Of Mouth Art Therapy

## Purpose

This repo is dedicated to the [Word Of Mouth](https://opensea.io/collection/word-of-mouth-v4) NFT Collection started by Jillian Valentin. It contains 
* the source code for the smart contract
* the metadata for minting the first NFT and some testing
* the project branding assets - logo, banner, contract metadata 

The metadata folder in this repo is set up for using as storage for future NFT json metadata files. 

The art images are not stored in this repo. Links to ipfs images are provided by artists to be included in the jason metadata files.

## How To Use the repo

### Post your Art Image on ipfs

1. Upload the art image to ipfs network. Note the ipfs://xxx address for the image.
1. Provide the ipfs://xxx address of the image to collection founders.

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
- https://polygonscan.com/address/0xF26f76b3C0833aDBF078B455258648FD0C84f2A0
- https://rinkeby.etherscan.io/address/0x1Fe857b4d3CDe13eD2c5Ed07cc11bff9Ce0663B3
2. Click on Contract, then click on Write contract 
4. Connect your metamask with account that have permissions to mint
3. Expand the mint function and enter the data needed for minting
5. Submit transaction
6. Approve the transaction in metamask
7. Verify the newly minted item on opensea contract collection
- https://opensea.io/collection/word-of-mouth-v4
- https://testnets.opensea.io/collection/word-of-mouth-v11

### Compile, Deploy and verify the contract
Must have hardhat project set up following the instructions in [README-project-setup.md](https://github.com/BlockDevsUnited/NFT-COURSE/blob/main/README-project-setup.md). 
1. Compile with ```npx hardahat compile```
1. Deploy with ```npx hardhat run --network polygon scripts/deploy.js```
1. Verify with ```npx hardhat verify --network polygon <contract_id>```

## Aknowledgements
- Smart Contract sponsored by [Blockchain Developers United NFT-COURSE](https://github.com/BlockDevsUnited/NFT-COURSE)
- Test image is from [Pixabay Royalty Free images](https://pixabay.com/photos/people-viewer-exhibition-2944064/)