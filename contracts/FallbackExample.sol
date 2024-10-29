// SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FallbackExample {

    uint public result;

    // recieve function get called when no data(callData) 
    // is send along with a transaction.
    receive() external payable {
        result = 1;
     }


    //fallack function get called when there is a calldata.
    fallback() external payable {
        result = 2;
     }

}
