// Goal: Alert the Hero with Arguments
// Alert the Hero by calling alert and passing the number of enemies and whether or not they are armed 
//  Be careful! The type uint is an alias for uint256 but only uint256 will work with abi.encodeWithSignature.




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Sidekick {
    function sendAlert(address hero, uint enemies, bool armed) external {
        (bool success, ) = hero.call(
            abi.encodeWithSignature(
                "alert(uint256,bool)",
                enemies,
                armed
            )
        );

        require(success);
    }
}