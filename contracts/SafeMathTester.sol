// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


// from version 0.8.0, solidity will automatically check for 
// overflow or underflow on a varaible but if we want otherwise
// we can use the "unchecked" keyword 
contract SafeMathTester {
    uint8  public  number  = 255;

    function add() public  {
       unchecked {number += 1;}
    }
}
