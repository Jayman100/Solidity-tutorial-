//SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

contract Counter {
    string public  greet = "Hello world";

    uint256  ct;

    int256 public  minInt = type(int256).min;
    int256 public  maxInt = type(int256).max;

    bytes4 public  a ;

    constructor () {
        a = 0x12345678;
    }

    function getByte() public  view  returns(bytes1) {
        return a[0];
    }

    function count() public  view returns(uint256) {
        return  ct;
    }


    function inc() public  {
        ct += 1;
    }

    function dec() public  {
        ct -= 1 ;
    }


    //   function doSomething() public view {
    //     // Local variables are not saved to the blockchain.
    //     uint256 i = 456;

    //     // Here are some global variables
    //     uint256 timestamp = block.timestamp; // Current block timestamp
    //     address sender = msg.sender; // address of the caller
    // }

    //  // Several ways to initialize an array
    // uint256[] public arr;
    // uint256[] public arr2 = [1, 2, 3];
    // // Fixed sized array, all elements initialize to 0
    // uint256[10] public myFixedSizeArr;

    // function get(uint256 i) public view returns (uint256) {
    //     return arr[i];
    // }

    // // Solidity can return the entire array.
    // // But this function should be avoided for
    // // arrays that can grow indefinitely in length.
    // function getArr() public view returns (uint256[] memory) {
    //     return arr;
    // }

    // function push(uint256 i) public {
    //     // Append to array
    //     // This will increase the array length by 1.
    //     arr.push(i);
    // }

    // function pop() public {
    //     // Remove last element from array
    //     // This will decrease the array length by 1
    //     arr.pop();
    // }

    // function getLength() public view returns (uint256) {
    //     return arr.length;
    // }

    // function removeItem(uint256 index) public {
    //     // Delete does not change the array length.
    //     // It resets the value at index to it's default value,
    //     // in this case 0
    //     delete arr[index];
    // }

    // function examples() external pure {
    //     // create array in memory, only fixed size can be created
    //     uint256[] memory b = new uint256[](5);
    // }

     // [1, 2, 3] -- remove(1) --> [1, 3, 3] --> [1, 3]
    // [1, 2, 3, 4, 5, 6] -- remove(2) --> [1, 2, 4, 5, 6, 6] --> [1, 2, 4, 5, 6]
    // [1, 2, 3, 4, 5, 6] -- remove(0) --> [2, 3, 4, 5, 6, 6] --> [2, 3, 4, 5, 6]
    // [1] -- remove(0) --> [1] --> []

     uint256[] public arr;


    // This function takes the index as parameter then move
    // the array item at that partcular index to the end
    // of the array , then use arr.pop() to remove it...
    function remove(uint256 _index) public {
        require(_index < arr.length, "index out of bound");

        for (uint256 i = _index; i < arr.length - 1; i++) {
            arr[i] = arr[i + 1];
        }
        arr.pop();
    }

    function test() external {
        arr = [1, 2, 3, 4, 5];
        remove(2);
        // [1, 2, 4, 5]
        assert(arr[0] == 1);
        assert(arr[1] == 2);
        assert(arr[2] == 4);
        assert(arr[3] == 5);
        assert(arr.length == 4);

        // arr = [1];
        // remove(0);
        // // []
        // assert(arr.length == 0);
    }


    function getWholeArr() public  view returns(uint256[] memory) {
        require(arr.length > 0);

        return  arr;
    }


    //ENUM

    enum Status {
        pending,
        shipped,
        accepted,
        rejected,
        canceled
    }

    Status public  status;

    function gets() public  view returns(Status) {
        return  status;   
    }

   function getLargestValue() public pure returns (Status) {
        return type(Status).max;
    }

   function getSmallestValue() public pure returns (Status) {
        return type(Status).min;
    }


struct Instructor {
    uint256 age;
    string name;
    string[] favorites;
}

Instructor public  student;


function getStudent() public  view  returns(Instructor memory) {
    student;
}

uint256[] public  gasArr;

// mapping (uint256 => uint256) gasMap;

function getGasPrice() public view returns(uint256) {
    return  tx.gasprice;
}

function setGasArr() public {
    gasArr.push(getGasPrice());
}

function getGas() public  view returns(uint256[] memory gas) {
   return  gasArr;
}



 
}

