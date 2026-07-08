// Goal: Members
// Create a public constructor which takes an array of address. These addresses, plus the deployer of the function, should all be allowed to create new proposals and vote on those proposals.
// If anyone else attempts to create a proposal or vote, the call should be reverted. 




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
                noCount: 0
            })
        );
        emit ProposalCreated(proposals.length - 1);
    }
    function castVote(uint proposalId,bool support) external onlyMember{
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

