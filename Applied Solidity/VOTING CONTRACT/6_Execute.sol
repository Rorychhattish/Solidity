// Goal: Execute
// Let's make our minimum voting threshold be 10 participants. Once 10 members have voted yes on a proposal, execute it.
// Update the castVote function to execute the proposal when the 10 yes votes have been registered.
// Execute the vote by sending the data to the target address using the call syntax.
//  You should make sure that the proposal has not already been executed.




// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

contract Voting {
    struct Proposal {
        address target;
        bytes data;
        uint yesCount;
        uint noCount;
        bool executed;
    }

    Proposal[] public proposals;
    mapping(address => bool) public isMember;

    event ProposalCreated(uint proposalId);
    event VoteCast(uint proposalId, address voter);

    constructor(address[] memory _members) {
        isMember[msg.sender] = true;
        for (uint i = 0; i < _members.length; i++) {
            isMember[_members[i]] = true;
        }
    }

    modifier onlyMember() {
        require(isMember[msg.sender], "Not authorized");
        _;
    }

    function newProposal(address _target,bytes memory _data)external onlyMember{
        proposals.push(
            Proposal({
                target: _target,
                data: _data,
                yesCount: 0,
                noCount: 0,
                executed: false
            })
        );
        emit ProposalCreated(proposals.length - 1);
    }
    function castVote(uint proposalId,bool support) external onlyMember{
        Proposal storage p = proposals[proposalId];
        require(!p.executed, "Already executed");
        if (support) {
            p.yesCount++;
        } else {
            p.noCount++;
        }
        emit VoteCast(proposalId, msg.sender);

        if (p.yesCount >= 10 && !p.executed) {
            p.executed = true;

            (bool success, ) = p.target.call(p.data);
            require(success, "Execution failed");
        }
    }
}