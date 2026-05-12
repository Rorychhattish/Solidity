// Goal: Self Destruct
// When the donate function is called, trigger a selfdestruct in the contract!
//  The selfdestruct will send all remaining funds to the address passed in, so it might be a good candidate to replace the existing functionality in your donate function by sending the funds to the charity! Just be sure to cast the address to an address payable as shown in the example above.



// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    address public owner;
    address public charity;

    constructor(address _charity) {
        owner = msg.sender;
        charity = _charity;
    }

    receive() external payable {
    }

    function tip() public payable {
        payable(owner).transfer(msg.value);
    }

    function donate() public {
        selfdestruct(payable(charity));
    }
}