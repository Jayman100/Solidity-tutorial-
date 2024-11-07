//SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;
// This kind of import works like pasting the whole contract here(another contract) ,
// But what if we have more than one contract in there, solidity will
// have to do thhe computations for other contract too during transaction,
// so we will have to pay more for the tx. So solve this we should always 
// use named import to import the specific contract we need 
// import "./SimpleStorage.sol";

// NAMED IMPORT
import {SimpleStorage} from "./SimpleStorage.sol";

// Deploying a contract from another contract
contract StorageFactory {

    SimpleStorage[] public  listOfSimpleStorageContracts;

    function createSimpleStorageContract() public  {

        // Create a new SimpleStorage 
       SimpleStorage simpleStorage = new SimpleStorage();

        // Add the currently created simpleStorage in an array to keep track
        // of the simpleStorage contracts we are creating  
       listOfSimpleStorageContracts.push(simpleStorage);
    }


    function sfStore(uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public  {
        //In order to interact with a contract , we need :
        //- Address
        //- ABI (Application binary interface)
        SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        simpleStorage.store(_simpleStorageNumber);

    }

    function sfGet(uint256 _simpleStorageIndex) public  view returns(uint256) {
        SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        
        return  simpleStorage.retreive();

        //We can also do chaining too:
        
        // simpleStorageArray[_simpleStorageIndex].retrieve(); -> This work for the "store" function too
    }

    function sfAddPerson(uint256 _simpleStorageIndex, string calldata _simpleStorageName, uint256 _simpleStorageFavNumber) public {
        SimpleStorage simpleStorage = listOfSimpleStorageContracts[_simpleStorageIndex];
        simpleStorage.addPerson(_simpleStorageName, _simpleStorageFavNumber);
    

    }
    

    function sfGetPersonFavNum(uint256 _simpleStorageIndex, string calldata _simpleStorageName) public view returns(uint256) {
            return    listOfSimpleStorageContracts[_simpleStorageIndex].nameToFavoriteNumber(_simpleStorageName);

    }




   


}
