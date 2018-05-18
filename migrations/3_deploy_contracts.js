var EtherstarsPrivileges = artifacts.require("EtherstarsPrivileges");
var StarBase = artifacts.require("./StarBase.sol");
var StarCore = artifacts.require("./StarCore.sol");

module.exports = function(deployer) {
  deployer.deploy(EtherstarsPrivileges);
  deployer.link(EtherstarsPrivileges, StarBase);
  deployer.deploy(StarBase);
  deployer.link(StarBase, StarCore);
  deployer.deploy(StarCore);
};
