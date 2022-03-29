//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract auction {
 //state variables
address payable public beneficiary;
uint public auctionEndTime;
address public owner;
address public highestBidder;
uint public highestBid;
mapping(address => uint) public pendingReturns;
bool ended = false;
//event
event HighestBidIncrease(address bidder, uint amount);
event AuctionEnded(address winner, uint amount);

//constructor
constructor(uint _biddingTime, address payable _beneficiary){
    beneficiary = _beneficiary;
    auctionEndTime = block.timestamp + _biddingTime * 60;
    owner = msg.sender;
}
//bid function
function bid() public payable {
    require(block.timestamp < auctionEndTime, "auction is already ended");
    require(msg.value > highestBid, " there exist a higher bid already");
    pendingReturns[highestBidder] += highestBid;

    highestBidder = msg.sender;
    highestBid = msg.value;
    emit HighestBidIncrease(msg.sender, msg.value);
}

//withdraw function 
function withDraw() public returns(bool) {
    uint amount = pendingReturns[msg.sender];

    if(amount > 0){
        pendingReturns[msg.sender] = 0;
        (bool sent,) = msg.sender.call{value: amount}("");

        if(!sent) {
            pendingReturns[msg.sender] = amount;
            return false;
        }

    }
    return true;
}

//auction end

function AuctionEnd() public returns (bool) {
    require(block.timestamp > auctionEndTime, "The auction is not yet ended");
    require(!ended, "the function auction end has already been called");

    ended = true;
    emit AuctionEnded(highestBidder, highestBid);

    (bool sent,) = beneficiary.call{value: highestBid}("");
    return sent;
}
}