const HelloWorld = artifacts.require("HelloWorld");

module.exports = async (deployer, _network) => {
  await deployer.deploy(HelloWorld);
};
