// Goal: Unsigned Int Constructor
// Create a constructor which will take a uint as an argument.
// Store this uint value inside a public storage variable called x.



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    uint public x;
    constructor(uint _x) {
        x = _x;
    }
    function increment() external {
         x = x + 1;
    }
    function add(uint _y) external view returns (uint) {
        return x + _y;
     }
}