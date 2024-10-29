//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

contract FunctionModifier {
    address public  owner;

    constructor() {
        owner = msg.sender;
    }

    // 1. Resctrict acess: checking if contract owner is calling a function
    modifier  onlyOwner {
        require(msg.sender == owner, "not owner");
        // underscore is a special character use only in
        // modifier and it means to execute the remaining code .            

        _;
    }

    function mintNewCoin() public  onlyOwner {
        // only the contract owner can call this function


    } 


    //2. validate inputs: modifiers too can take in an arguments.
    //  This modifier is checking if the new address is not the address(0)
    
    modifier newAddress(address _addr) {
        require(_addr != address(0), "The same address as  before" );


        _;
    }


    function ChangeOwner( address newOwner) public onlyOwner newAddress(newOwner) {
        owner = newOwner;
    }





    
}