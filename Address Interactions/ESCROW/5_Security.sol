// Goal: Security
// If anyone tries to call approve other than the arbiter address, revert the transaction.

// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Escrow {
    address public depositor;
    address public beneficiary;
    address public arbiter;

    constructor (address _arbiter , address _beneficiary) payable {
        depositor = msg.sender;
        arbiter = _arbiter;
        beneficiary = _beneficiary;
    }
    function approve() external {
        require(msg.sender == arbiter, "Only the arbiter can approve the escrow");
        payable(beneficiary).transfer(address(this).balance);
    }
}