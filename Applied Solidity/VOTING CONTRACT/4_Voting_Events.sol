// Goal: Proposal Created & Vote Cast Events
// Create an event ProposalCreated which takes a single argument: a uint proposal ID. Emit this event whenever a new Proposal struct is created.
// Create an event VoteCast which takes two arguments: a uint proposal ID and an address for the voter's address. Emit this event any time a new vote is cast.




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
    }

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);
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
        emit ProposalCreated(proposals.length - 1);
    }
    function castVote(uint proposalId,bool support) external{
        // get reference to proposal
        Proposal storage p = proposals[proposalId];

        if (support) {
            p.yesCount++;
        } else {
            p.noCount++;
        }
        emit VoteCast(proposalId, msg.sender);
    }
}
