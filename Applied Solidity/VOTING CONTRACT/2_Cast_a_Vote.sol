// Goal: Cast Vote
// Create an external function castVote which takes a uint proposalId and a bool which indicates whether the vote supports the proposal (true for yes, false for no).
// For each vote cast, update the yesCount and noCount in the referenced proposal accordingly.
//  Don't worry about double votes for the moment, we'll get to that in the next stage!




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
    function castVote(uint proposalId,bool support) external{
        // get reference to proposal
        Proposal storage p = proposals[proposalId];

        // update vote
        if (support) {
            p.yesCount++;
        } else {
            p.noCount++;
        }
    }
}
