//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract Whitelist {

    // max number of whitelisted address allowed
    uint8 public maxWhitelistedAddress; 

    // current number of address whitelisted
    uint8 public numAddressesWhitelisted;

    // create a mapping for whitelistedAddress
    // if an address is whitelisted, we will set it to true
    mapping(address => bool) public whitelistedAddress;

    // setting the max number of whitelist address
    // user will put in a value at the time of deployment
    constructor(uint8 _maxWhitelistedAddress) {
        maxWhitelistedAddress = _maxWhitelistedAddress;
    }

    function addAddressToWhiteList() public {
        // check if the user has already been whitelisted
        require(!whitelistedAddress[msg.sender], "Sender already in the whitelist");
        // check if the number of whitelisted address still less than the limit
        require(numAddressesWhitelisted < maxWhitelistedAddress, "Max limit reached");
        // add the address to the whitelist address array
        whitelistedAddress[msg.sender] = true;
        // increase the number of whitelisted address
        numAddressesWhitelisted += 1;
    }
}