// Goal: SuperHero Attacks
// You'll notice the Hero.sol tab has changed once again! This time there's three important things to notice:
// The Hero contract is an abstract contract. It has a virtual function called attack which we'll need to override in both Warrior and Mage.
// An enum called AttackTypes has been added to the Hero contract to differentiate between the different types of attacks our heroes can do.
// There's a contract called Enemy which has a method called takeAttack on it.
// Your job is to implement the attack function on the Warrior and Mage contracts:
// Add an override function called attack to both the Warrior and Mage contracts. This function should take an Enemy parameter which will be an Enemy contract.
// Invoke takeAttack function on the Enemy contract and change the parameter based on the hero:
// For the Warrior, invoke the enemy's takeAttack with the Brawl attack type. 
// For the Mage, invoke the enemy's takeAttack with the Spell attack type. 



// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Mage is Hero{
    constructor() Hero(50){}
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Spell);
    }
}
contract Warrior is Hero{
    constructor() Hero(200){}
    function attack(Enemy enemy) public override {
        enemy.takeAttack(AttackTypes.Brawl);
    }
}

