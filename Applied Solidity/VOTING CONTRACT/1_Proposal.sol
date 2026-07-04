// Goal: Proposals
// Create a public array of type Proposal and call it proposals.
// Create an external function newProposal which takes two arguments:
// An address argument which will be the target address of the proposal. We'll send some calldata to this address.
// A bytes argument which will be the calldata to eventually send to the smart contract when the proposal is executed.
// In the newProposal function create a new Proposal with the arguments passed in and the yes/no vote counts are initialized at 0.
// Add the new Proposal to the proposals array.




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }
    Proposal[] public proposals;
    function newProposal(address _target,bytes memory _data)external{
        proposals.push(
            Proposal({
                target: _target,
                data: _data,
                yesCount: 0,
                noCount: 0
            })
        );

    }
}