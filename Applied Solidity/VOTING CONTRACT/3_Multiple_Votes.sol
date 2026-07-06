// Goal: Vote Changing
// Modify the castVote function to allow voters to change their vote on a particular proposal.
//  The implementation of this is up to you! You'll need to figure out a new way to track which addresses have already voted on which proposal.




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
     // proposalId => user => vote
    mapping(uint => mapping(address => int8)) public votes;
    function castVote(uint proposalId,bool support) external{
        // get reference to proposal
        Proposal storage p = proposals[proposalId];
        int8 prevVote = votes[proposalId][msg.sender];

        // 🔹 remove previous vote
        if (prevVote == 1) {
            p.yesCount--;
        } else if (prevVote == -1) {
            p.noCount--;
        }

        if (support) {
            p.yesCount++;
            votes[proposalId][msg.sender] = 1;
        } else {
            p.noCount++;
            votes[proposalId][msg.sender] = -1;
        }
    }
}