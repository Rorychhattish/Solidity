// Goal: Increment x
// Let's build on your code from the previous stage!
// Create an external function called increment that will add 1 to the state variable x.



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