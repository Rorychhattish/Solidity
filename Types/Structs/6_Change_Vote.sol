// Goal: Change Vote
// Create an external function called changeVote which takes a Choices argument and changes the choice on the existing vote for the msg.sender.
// If they do not have an existing vote, revert the call. 



// SPDX-License-Identifier: MIT
pragma solidity 0.8.20;

contract Contract {
	enum Choices { Yes, No }
	
	struct Vote {
		Choices choice;
		address voter;
	}
	Vote[] public votes;

	function createVote(Choices choice) external {
		(bool found, ) = _findVote(msg.sender);
        require(!found, "Already voted");
		votes.push(Vote(choice,msg.sender));
	}

	 // change vote
    function changeVote(Choices newChoice) external {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == msg.sender) {
                votes[i].choice = newChoice;
                return;
            }
        }
        // no vote found
        revert("No existing vote");
    }

	// internal helper (code reuse)
	function _findVote(address user) internal view returns (bool, Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return (true, votes[i].choice);
            }
        }
        return (false, Choices.Yes); // default value
    }

	function findChoice(address user) external view returns(Choices){
		(, Choices choice) = _findVote(user);
        return choice;
	}
}