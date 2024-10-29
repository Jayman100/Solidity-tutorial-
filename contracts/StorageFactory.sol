//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract StorageFactory {

    SimpleStorage[] public  simpleStorageArray;

    function createSimpleStorageContract() public  {
       SimpleStorage simpleStorage = new SimpleStorage();
       simpleStorageArray.push(simpleStorage);
    }


    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public  {
        //In order to interact with a contract , we need :
        //- Address
        //- ABI (Application binary interface)
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public  view returns(uint256) {
        SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        return  simpleStorage.retreive();

        //We can also do chaining too:
        
        // simpleStorageArray[_simpleStorageIndex].retrieve(); -> This work for the "store" function too
    }


}
