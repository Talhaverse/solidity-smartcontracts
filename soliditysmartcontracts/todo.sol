//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Todo {
    //mapping to store todos for individual addresses
    mapping (address => string[] ) public todos;

    //addTodo function
    function addTodo(string memory _todo) public {
        //adds the _todo  
        todos[msg.sender].push(_todo);
         }
         //get todos function
         function getTodos() public view returns(string[] memory ){
            return todos[msg.sender];
         }
//get todos length
function getTodosLength() public view returns (uint){
    return todos[msg.sender].length;
}

//delete todo **tricky
function delTodo(uint _idx) public {
    // for checking a conditon if its true function will executed or else function will not be executed
    require(_idx < todos[msg.sender].length,"the index does not exists" );
     //delete todos[msg.sender][_idx];
    todos[msg.sender][_idx] = todos[msg.sender][getTodosLength() - 1 ];
    todos[msg.sender].pop();
}


}