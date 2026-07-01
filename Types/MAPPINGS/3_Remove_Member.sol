// Goal: Remove Member
// Create an external function called removeMember that will take an address and set its corresponding value in the members mapping to false.




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Contract {
    mapping(address => bool) public members;
    function addMember(address user) external{
        members[user]=true;
    }
    function isMember(address user)external view returns(bool){
        return members[user];
    }
    function removeMember(address user) external{
        members[user]=false;
    }
}