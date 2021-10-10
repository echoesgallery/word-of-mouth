// scripts/deploy.js
async function main () {
    // We get the contract to deploy
    const WordOfMouth = await ethers.getContractFactory('WordOfMouth');
    console.log('Deploying Contract...');
    const myContract = await WordOfMouth.deploy();
    await myContract.deployed();
    console.log('Contract deployed to:', myContract.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch(error => {
      console.error(error);
      process.exit(1);
    });