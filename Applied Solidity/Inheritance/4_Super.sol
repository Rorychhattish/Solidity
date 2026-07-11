// Goal: Add the Super!
// The attack function is now implemented by the Hero base contract. It will take the enemy as an argument and decrement energy from our hero after every attack.
// Let's invoke this base contract function from within the attack function for both (derived) hero contracts: Mage and Warrior.



// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

import "./Hero.sol";

contract Mage is Hero{
    constructor() Hero(50){}
    function attack(Enemy enemy) public override {
        super.attack(enemy);
        enemy.takeAttack(AttackTypes.Spell);
    }
}
contract Warrior is Hero{
    constructor() Hero(200){}
    function attack(Enemy enemy) public override {
        super.attack(enemy);
        enemy.takeAttack(AttackTypes.Brawl);
    }
}