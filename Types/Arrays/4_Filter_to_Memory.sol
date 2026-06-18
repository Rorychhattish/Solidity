// Goal: Filter Even Numbers
// Create a pure, external function called filterEven which takes an dynamic size array of unsigned integers as its only argument.
// Find all the even numbers and add them to a new array in memory. This array should contain only the even numbers.
// Return this new array.
//  Note: the return array should only be large enough to fit the even numbers inside. This means you'll need to figure out how many even numbers there are before instantiating the array.



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