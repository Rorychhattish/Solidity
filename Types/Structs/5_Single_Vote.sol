// Goal: Vote Once
// Each address should only be allowed to call createVote once.
// If they try again, the call should be reverted. 
//  Remember that external functions can be changed to public if you'd like to use them internally as well! 



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

	// internal helper (code reuse)
	function _findVote(address user) internal view returns (bool, Choices) {
        for (uint i = 0; i < votes.length; i++) {
            if (votes[i].voter == user) {
                return (true, votes[i].choice);
            }
        }
        return (false, Choices.Yes); // default value
    }

	function hasVoted(address user) external view returns(bool){
		(bool found, ) = _findVote(user);
        return found;
	}

	function findChoice(address user) external view returns(Choices){
		(, Choices choice) = _findVote(user);
        return choice;
	}
}