// We require the Hardhat Runtime Environment explicitly here. This is optional
// but useful for running the script in a standalone fashion through `node <script>`.
//
// When running the script with `hardhat run <script>` you'll find the Hardhat
// Runtime Environment's members available in the global scope.
// const { ethers, upgrades } = require("hardhat");

async function main() {
   const WordOfMouthUpgradable = await ethers.getContractFactory("WordOfMouthUpgradable");
   const myContract = await upgrades.deployProxy(WordOfMouthUpgradable,{initializer:"initialize"});

   await myContract.deployed();
   console.log("For upgrading the contract use this proxy contract address:", myContract.address);
   console.log("For verifying the contract use the created contract address from your eterscan activity");
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main()
  .then(() => process.exit(0))
  .catch(error => {
    console.error(error);
    process.exit(1);
  });
