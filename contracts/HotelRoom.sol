// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {
    // Ether Payment 

        //Hotel room Statuses
        enum Statuses {Vacant, Occupied}
        //Variable to track the status(enum)
        Statuses public  status;

        event Occupy(address _occupant, uint _value);

        address payable  public owner;

        constructor() {
            owner = payable(msg.sender);
        }
        
        modifier costs(uint _amount) {
            
            //Checking the price 

            require(msg.value >=  _amount, "Not enough ether provided.");

            _;
        }

        modifier onlyWhileVacant {
            //Check the status -> can only book if it is vacant else revert
            require(status == Statuses.Vacant, "This room is already booked(currently occupied)");

            _;
        }

        
        function  book() public payable costs(2 ether) onlyWhileVacant {


            //Update the status to occupied
            status = Statuses.Occupied;

            //Pay for the hotel room
            (bool sent, bytes memory data) = owner.call{value: msg.value}("");
            require(sent, "Failed to sent ether");

            emit Occupy(msg.sender, msg.value);

        }


    
}