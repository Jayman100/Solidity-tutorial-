
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;


contract SimpleStorage {

    //functions or methods that modifies state of a blockchain requires gas fee 


    //Types: String, boolean, address, uint, int, bytes
    // The variable favoriteNumber get initialized to zero
    uint256 public favoriteNumber ;

    // How mapping works?
    mapping (string => uint256) public  nameToFavoriteNumber;

    //Struct is like a class in OOP?
    struct People {
        uint256 favoriteNumber;
        string name;
    }

    //Instance of People struct
    People[ ] public  person;


    function store (uint256 _favoriteNumber) public virtual  {
        favoriteNumber = _favoriteNumber;
    } 


    function retreive() public  view returns(uint256) {
        return  favoriteNumber;
    }


    //calldata, memory, storage
    function addPerson(string calldata _name, uint256 _favoriteNumber) public  {
        //Another way to push to an array -> People memory newPerson = People({favoriteNumber: _favoriteNumber, name: _name});
        
        // person.push(newPerson);

        person.push(People(_favoriteNumber, _name));
        nameToFavoriteNumber[_name] = _favoriteNumber;
    }

   
}