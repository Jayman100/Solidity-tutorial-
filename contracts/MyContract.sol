// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract myContract {
    //State variables stays in the  contract itself and its accessible anywhere
    //in the contract
    uint myUint = 1;
    int myInt = -1;

    address public  owner;

    constructor() {
        owner = msg.sender;
    }

    struct  People  {
        uint favNumber;
        string name;
    }

        People public person = People({
            favNumber:5 , name: "Jayman"
        });
   
    mapping(uint => Book) public books;
    mapping (address => mapping(uint => Book)) public myBooks;

    struct Book {
        string title;
        string author;
    }


    uint[] public  numbers = [1, 2, 3,4,5,6,7,8,9,10];

    function countEvenNumber() public  view returns(uint) {
        uint count = 0;

        for(uint i = 0; i < numbers.length; i++) {
            if(isEven(numbers[i])) count++;
        }

        return  count;

    }

    function isEven(uint _number) public pure returns(bool value) {
            if(_number % 2 == 0) return  true;

            return  false;
            
    }

    

    mapping(address => mapping(string => string)) public name;

    function addName(string memory _firstName, string memory _lastName) public  {
        name[msg.sender][_firstName] = _lastName;

    }

    function addBook(uint _id, string memory _title, string memory _author) public {
        books[_id] = Book(_title, _author);
}

    function addMyBook(uint _id, string memory _title, string memory _author) public {
        myBooks[msg.sender][_id] = Book(_title, _author);
}




    function getValue () public  pure returns(uint) {

        //Local variales stays in a function and its only accessible inside the function
        //and not outside the function
        uint value = 1;
        
        return  value;
    }


    function isOwner() public  view returns(bool){
        return(owner == msg.sender);
    }
}

