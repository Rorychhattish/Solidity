// Goal: Require 1 Ether
// Add a payable constructor method that requires a 1 ether deposit.
// If at least 1 ether is not sent to the constructor, revert the transaction.
//  There are globally available ether units such as ether that you can use instead of having to convert from Wei (1 ether == 1e18).



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    constructor() payable {
        require (msg.value >= 1 wei ,"Send at least 1 ether");
    }
}