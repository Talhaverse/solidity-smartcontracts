//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract MyPoem {
    string poem = "yaya yaya yaya day day day ohohoh hohoho";
    string poet = " i am talha and i wrote this poem on 2-jan-1910";

    function getDetails() public view returns (string memory, string memory){
        return(poem, poet);
    }

}