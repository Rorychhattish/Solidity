// Goal: Add Members 
// Create a dynamic sized array of addresses called members
// Create an external function addMember which has a single parameter: an address for a new member. Add this address to the members array.
// Create a public view function isMember that takes an address and returns a bool indicating whether the address is a member or not.



// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
    function filterEven(uint[] calldata arr) external pure returns(uint[] memory){
        
        // Count even numbers
        uint count = 0;
        for(uint i = 0; i< arr.length; i++){
            if(arr[i]%2 == 0){
                count++;
            }
        }
        
        // Create memory array of exact size
        uint[] memory result = new uint[](count);

        // Fill the array
        uint index = 0;
        for (uint i = 0; i < arr.length; i++) {
            if (arr[i] % 2 == 0) {
                result[index] = arr[i];
                index++;
            }
        }
        return result;
    }
}