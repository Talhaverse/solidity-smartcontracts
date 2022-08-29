// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract owner{
   address public  owners;

   constructor(){
       owners = msg.sender;
   }

   modifier onlyOwner(){
       require(msg.sender == owners);
       _;
   }

function setOwners(address _newOwn)public {
    require(msg.sender != address(0));
    owners = _newOwn;

}

function get()public onlyOwner{

}


   
}