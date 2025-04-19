# 🗳️ Simple Voting Smart Contract

This is a simple voting system built with Solidity for the Ethereum blockchain. It allows the registration of candidates and voters, voting by eligible users, and determining the winner based on vote count.

## 🚀 Features

- ✅ Candidate registration (no duplicates)
- ✅ Voter registration (one vote per address)
- ✅ Vote for a registered candidate
- ✅ View vote count per candidate
- ✅ Determine the winner

## 📄 Smart Contract

### Contract Name: `Vote`

### Data Structures

- `Candidate`: Stores `name` and `votes`.
- `Voters`: Stores voter's Ethereum address.
- `mapping(address => bool) hasVoted`: Tracks if an address has voted.

### Functions

#### `registerCandidates(string memory _name)`

Registers a candidate if they haven't been registered already.

#### `registerVoters()`

Registers a voter (the caller). Ensures a voter can only register once and hasn’t voted before.

#### `vote(string memory _name)`

Allows a registered voter to vote for a registered candidate. Each address can only vote once.

#### `getVotes(string memory _name) → uint256`

Returns the number of votes a candidate has.

#### `getWinner() → string memory`

Returns the name of the candidate with the highest number of votes.

## 🛠️ Tools Used

- [Solidity ^0.8.28](https://soliditylang.org/)
- Compatible with [Remix IDE](https://remix.ethereum.org/) for quick testing and deployment.

## 🔒 Security Notes

- Duplicate registrations are prevented using `require`.
- Voting is restricted to registered users and only once per address.
- Winner selection handles ties by returning the first highest.

## 🧪 How to Use

1. **Deploy the Contract** on Remix or any Ethereum test environment.
2. **Register Candidates** using `registerCandidates("Name")`.
3. **Register Voters** by calling `registerVoters()` from different accounts.
4. **Vote** using the `vote("CandidateName")` function.
5. **Check Results** using `getVotes("CandidateName")` or `getWinner()`.

## 📌 License

This project is licensed under the [MIT License](LICENSE).

---

Made by ME!!!!
