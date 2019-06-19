pragma solidity ^0.5.0;
contract SimpleContract {
    address public owner;
    mapping (address => uint) private balances;

    event PrintLog(address addr, uint amount);

    constructor() public {
        owner = msg.sender;
    }
    function deposit(uint amount) public payable returns (uint) {
        require(amount==msg.value);
        balances[msg.sender] += msg.value;
        emit PrintLog(msg.sender, msg.value);
        return balances[msg.sender];
    }

    function withdraw(uint amount) public returns (uint) {
        if (amount <= balances[msg.sender]) {
            balances[msg.sender] -= amount;
            msg.sender.transfer(amount);
        }
        return balances[msg.sender];
    }
    function queryBalance() public view returns (uint) {
        return balances[msg.sender];
    }
}
