/**
 * @type import('hardhat/config').HardhatUserConfig
 */

require('@nomiclabs/hardhat-ethers');
require("@nomiclabs/hardhat-etherscan");

// private keys for rinkeby testnet
const { alchemyAPIKey, ethereumAccount, etherscanAPIKey} = require('./.secrets.json');

// private keys for polygon mainnet
//const { alchemyAPIKey, ethereumAccount, etherscanAPIKey} = require('./.secrets-polygon.json');

module.exports = {
  solidity: "0.8.4",
  networks: {
    hardhat: {
    },
    rinkeby: {
      
      // On https://dashboard.alchemyapi.io/ display the key with "View Key" button
      url: alchemyAPIKey,
      // In methamask, choose "Account details", then "Export Private Key".
      accounts: [ethereumAccount]
    },
    polygon: {
      
      // On https://dashboard.alchemyapi.io/ display the key with "View Key" button
      url: alchemyAPIKey,
      // In methamask, choose "Account details", then "Export Private Key".
      accounts: [ethereumAccount]
    }
  },
  etherscan: {
    apiKey: etherscanAPIKey
  }
};
