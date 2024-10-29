//SPDX-License-Identifier: MIT
pragma solidity ^0.8.8;


contract jayCoin {
    string public  name;
    string public  symbol;
    uint8 public  decimals;
    uint256 public _totalSupply;

    //events
   event Transfer(address indexed  from,address indexed to, uint value);
   event Approval(address indexed  owner,address indexed spender, uint value);

    //use the address to get the balance of the address
    mapping(address => uint256) balance; 

    //to select the amount a smart contract is allow to spend

    mapping (address =>mapping(address => uint256)) allow; 

    constructor () {
        name = "Jayman coin";
        symbol = "JAY";
        decimals = 18;
        _totalSupply = 1_000_002 * 1e18;
        balance[0x4e18a59CB489Edc01c4bd14013f4AC33F781C512] = _totalSupply;
        emit Transfer(address(0), 0x4e18a59CB489Edc01c4bd14013f4AC33F781C512, _totalSupply);
        
    }


    function totalSupply() public  view returns(uint256) {
        return  _totalSupply - balance[address(0)];
    }

    function balanceOf(address account) public view  returns(uint256 ) {
        return  balance[account];
    }


    function transfer(address recipient, uint256 amount) public  returns(bool success)  {
        balance[msg.sender] -= amount;
        balance[recipient] += amount;
        emit Transfer(msg.sender, recipient, amount);

        return  true;
    }


    function approve (address spender, uint amount) public  returns(bool success ) {
        allow[msg.sender][spender ] = amount;
        emit Approval(msg.sender, spender, amount);

        return  true;
    }

    // this function is very similar to transfer function , but it
    // needs allowance to spend from account of the sender 
    function transerFrom(address sender, address recipient, uint256 amount) public  returns(bool success) {
        balance[sender] -= amount;
        allow[sender][msg.sender] -= amount;
        balance[recipient] += amount;

        emit Transfer(sender, recipient, amount);
        return  true;    }


    
function allowance(address owner, address spender) public view returns(uint256 remaining) {
    return  allow[owner][spender];
}
}

