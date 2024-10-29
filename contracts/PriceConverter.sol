//SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

import  "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


//Library : smart contract with functionality that is
// reusable across other contracts to avoid code repetition.
// - Library can not have any state variable
// - They can not send any ether as well  
// - all functions have to be internal(not public)

library PriceConverter {
    function getPrice() internal view returns(uint256) {
        //What we need to interact with a contract outside this project:
        // ABI
        //address 0x694AA1769357215DE4FAC081bf1f309aDC325306

        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);

        //Price of ETh in USD
       (,int256 price,,, ) = priceFeed.latestRoundData();  

       //Typecasting- To convert price to uint 256
       //We need to convert it because the msg.value is in uint256
       return uint256(price * 1e10); 
    }

    function version() internal view returns(uint256)  {
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        return  priceFeed.version();

    }

    function getConversionRate(uint256 ethAmount) internal  view returns(uint256) {
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount) / 1e18;
        
        return  ethAmountInUsd;
    }
}