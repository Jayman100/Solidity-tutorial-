//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;

// ERC20 interface
interface  ERC20Interface {
    function totalSupply() external   view returns(uint256 supply);
    function balanceOf(address account) external   view returns(uint256 balance);
    function transfer(address recipient, uint amount) external  returns(bool success); 
    function approve(address sender, uint amount) external  returns(bool success); 
    function transferFrom(address owner, address spender, uint amount) external returns( bool success);
    function allowance(address owner, address spender) external  view returns (uint remaining);

    //Events to be emitted later
    event Transfer(address indexed from, address indexed to, uint value); 
    event Approval(address indexed owner, address indexed spender, uint value); 
    
}


// The actual contract

contract StateCoin is ERC20Interface {
    

    string public  name ;
    string public  symbol;
    uint8 public  decimals;
    uint public  _totaSupply;

    mapping (address => uint) balance;

    mapping (address => mapping (address => uint)) allow;

    constructor() {
        name = "StateCoin";
        symbol = "STC";
        decimals = 9;
        _totaSupply = 12_000_000 * 1e9;
         balance[0x4e18a59CB489Edc01c4bd14013f4AC33F781C512] = _totaSupply;
         emit Transfer(address(0),0x4e18a59CB489Edc01c4bd14013f4AC33F781C512, _totaSupply);  

    }


    function totalSupply() public view returns(uint supply) {
        supply = _totaSupply - balance[address(0)];
    }

    function balanceOf(address account) public view returns(uint balances) {
        return  balance[account];
    }

    function transfer(address recipient, uint amount) public  returns(bool success) {
        balance[msg.sender] -= amount;
        balance[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);

        return  true;
    }

    function approve(address  spender, uint amount) public  returns(bool success) {
        allow[msg.sender][spender] = amount;
        emit Approval(msg.sender, spender, amount);

        return  true;
    }

    function transferFrom(address sender, address recipient, uint amount) public  returns (bool success) {
        balance[sender] -= amount;
        allow[sender][msg.sender] -= amount;
        balance[recipient] += amount;

        emit Transfer(sender, recipient, amount);

        return  true;
    }

    function allowance(address owner, address sender) public  view returns(uint remaining) {
        return  allow[owner][sender];
    }

}