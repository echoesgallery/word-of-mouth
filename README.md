# Word Of Mouth Art Therapy

## What is in thsi repo
This repo contains the source code for the smart contract and the metadata for minting NFTs.

## Create a metadata file

1. Upload the art image to pinata.cloud. Note the ipfs://xxx address for the image.
1. Create a metadata file in the metadata folder in this repo

Start with copying the latest json metadata file to a new file. The filename has to contain the item id in hexadecimal numbers padded with zeros in front to complete 16 characters total.
```
cd metadata
cp 0000000000000000000000000000000000000000000000000000000000000000.json 0000000000000000000000000000000000000000000000000000000000000002.json
```

Edit the json metadata file to update with the information for the new art image. Make sure you replace the image usrl with the ipfs for the pinata image.
1. Save the json metadata file in this github repo and publish. Note the URL for the raw json metadata file.

## Mint the art image
1. Open the contract URL on etherscan.io
2. Click on write contract 
3. Expand the mint function and enter the data needed for minting
4. Connect metamask
5. Submit transaction
6. Approve the transaction in metamask
7. View the newly minted item on opensea

# Compile, Deploy and verify the contract
1. Set up .secrets.json file with private keys
2. COmpile with ```npx hardahat compile --network polygon 
3. Deploy with ```npx hardhat run --network polygon
4. Verify with ```npx hardhat verify --network polygon <contract_id>