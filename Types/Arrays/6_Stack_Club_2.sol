// Goal: Remove Members
// Create a constructor which will add the deployer address as the first member of the stack club.
// Create a removeLastMember function which will remove the last member added to the club.
//  Function Security
// Ensure that the removeLastMember function can only be called by an existing member
// Ensure that addMember can only be called by an existing member



// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract StackClub {
    // dynamic array of addresses
    address[] public members;

    // constructor -> deployer becomes first member
    constructor(){
        members.push(msg.sender);
    }

    // check if address is a member
    function isMember(address user) public view returns(bool){
        for(uint i = 0; i< members.length; i++){
            if(members[i] == user){
                return true;
            }
        }
        return false;
    }
    
    // add member (only existing member)
    function addMember(address newMember) external {
        require(isMember(msg.sender), "Not a member");
        members.push(newMember);
    }

    // remove last member (only existing member)
    function removeLastMember() external {
        require(isMember(msg.sender), "Not a member");
        members.pop();
    }
}