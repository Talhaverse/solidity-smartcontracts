// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.7.0 <0.9.0;

contract Task1 { 
  //string  public str = "Hello world"; - directly

  function gethello() public pure returns(string memory)  {

        string memory  str = "Hello world";
            return(str);

  }
}

contract Task2 {
    uint256 num;
constructor(){
    num=10;
}

function returnStateVariable() public view returns(uint){
    return num;
}


}