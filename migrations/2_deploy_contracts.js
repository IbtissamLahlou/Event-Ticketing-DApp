// Importer le contrat Ticketing
const Ticketing = artifacts.require("Ticketing");

module.exports = function (deployer) {
  // Déployer le smart contract Ticketing
  deployer.deploy(Ticketing);
};
