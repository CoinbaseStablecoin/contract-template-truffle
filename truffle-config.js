process.env.TS_NODE_FILES = "true";
require("ts-node/register/transpile-only");
// Fix Typescript callsite reporting
Object.defineProperty(Error, "prepareStackTrace", { writable: false });

const HDWalletProvider = require("@truffle/hdwallet-provider");

module.exports = {
  compilers: {
    solc: {
      version: "0.6.11",
      settings: {
        optimizer: {
          enabled: true,
          runs: 10000,
        },
      },
    },
  },
  networks: {
    development: {
      host: "localhost",
      port: 8545,
      network_id: "*",
    },
    mainnet: {
      provider() {
        const { MNEMONIC, INFURA_API_KEY } = process.env;
        if (!MNEMONIC || !INFURA_API_KEY) {
          console.error(
            "Environment variables MNEMONIC and INFURA_API_KEY are required"
          );
          process.exit(1);
        }
        return new HDWalletProvider(
          MNEMONIC,
          `https://mainnet.infura.io/v3/${INFURA_API_KEY}`
        );
      },
      network_id: 1,
    },
  },
  mocha: {
    timeout: 10000,
    reporter: "Spec",
  },
  plugins: ["solidity-coverage"],
};
