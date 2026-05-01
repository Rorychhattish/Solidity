// Goal: Make Some Food!
// In the enum provided you'll see there are four types of Foods 
// Take the values and store them in food1, food2, food3, and food4
// Feel free to pick your own favorite foods and use them instead!



 // SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    enum Foods { Apple, Pizza, Bagel, Banana }
	Foods public food1 = Foods.Apple;
	Foods public food2 = Foods.Bagel;
	Foods public food3 = Foods.Banana;
	Foods public food4 = Foods.Pizza;
}