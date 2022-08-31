const { ethers } = require("hardhat");

async function main() {
  const whitelistContract = await ethers.getContractFactory("Whitelist");

  // deploy the contract
  // 10 is the maximum number of whitelisted address allowed
  const deployedWhitelistContract = await whitelistContract.deploy(10);

  // wait for the contract to deploy
  await deployedWhitelistContract.deployed();

  console.log("Whitelist Contract Address", deployedWhitelistContract.address);
}

// call the main function and catch if there is any error
main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.log(error);
    process.exit(1);
  });
