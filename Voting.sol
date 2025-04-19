// SPDX-License-Identifier: MIT
pragma solidity ^0.8.28;

contract Vote{

    struct Candidate{
        string name;
        uint256 votes;
    }

    Candidate[] public candidates;

    struct Voters{
        address id;
    }

    Voters[] public voters;

    mapping(address => bool)hasVoted;

    function registerCandidates(string memory _name) public {
        for (uint i = 0; i < candidates.length; i++) 
        {
            require(keccak256(abi.encodePacked(candidates[i].name)) != keccak256(bytes(_name)), "Candidate has already been registered!");
        }
        candidates.push(Candidate(_name, 0));
    }

    function registerVoters() public {
        require(!hasVoted[msg.sender], "You have already voted!");
        
        for (uint i = 0; i < voters.length; i++){
            require(voters[i].id != msg.sender, "Already registered!");
        }
        voters.push(Voters(msg.sender));
    }

    function vote(string memory _name) public { 
        require(!hasVoted[msg.sender], "You have already voted!");
        for(uint i = 0; i < candidates.length;i++){
            if (keccak256(abi.encodePacked(candidates[i].name)) == keccak256(bytes(_name))){
                candidates[i].votes++;
                hasVoted[msg.sender] = true;
                return;
            }
        }
    }

    function getWinner() public view returns(string memory){
        uint maxVotes = 0;
        uint winnerIndex = 0;
        for (uint i = 0; i < candidates.length; i++) {
            if (candidates[i].votes > maxVotes) {
                winnerIndex = i;
                maxVotes = candidates[winnerIndex].votes;
            }
        }
        return candidates[winnerIndex].name;
    }

    function getVotes(string memory _name) public view returns (uint256) {
        for (uint i = 0; i < candidates.length; i++) {
            if (keccak256(bytes(candidates[i].name)) == keccak256(bytes(_name))) {
                return candidates[i].votes;
            }
        }
        revert("Candidate not found");
    }
    
}