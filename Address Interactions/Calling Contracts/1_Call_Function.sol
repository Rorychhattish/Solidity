// Goal: Alert Hero
// Use the IHero interface and the hero address passed into sendAlert to alert the hero from the Sidekick contract.



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero) external {
        bytes4 signature = bytes4(keccak256("alert()"));

        (bool success, ) = hero.call(abi.encodePacked(signature));

        require(success,"Call failed");
    }
}
