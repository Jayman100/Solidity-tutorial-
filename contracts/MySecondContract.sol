// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//Lesson:
    //Inheritance 
    //Factories
    //Interaction
    

contract Ownable {
    address owner;


    constructor () {
        owner = msg.sender;
    }

    modifier  onlyOwner {
        
        require(owner == msg.sender, "You are not allowed to read this secret.");
        _;
    }

}


contract SecretVault {
    string secret;
    
    constructor (string memory _secret) {
        secret = _secret;
    }
    
    function getSecret() public  view returns(string memory) {
        return  secret;
    }

}


contract MySecondContract is Ownable {
    address secretVault;

    constructor (string memory _secret)  {

        //Calling a contract inside another contract
        SecretVault _secretVault = new SecretVault(_secret);

        //type contract is not implicitly converted to address, so we need
        //to explicitly do it by wrapping the variable with address shown below: 
        secretVault = address(_secretVault);

        super; //Calls the immediate parent contract
    }

     function getSecret() public  view onlyOwner returns(string memory) {
        return  SecretVault(secretVault).getSecret();
    }       
}