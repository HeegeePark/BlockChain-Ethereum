pragma solidity ^0.5.0;

contract BankV2 {
    address owner; // 20byte gyejeongjuso (initial baepo)
    constructor() public {
        msg.sender;
    }
    event Sent(address from, address to, uint amount);
    
    function sendTo(address payable _receiver, uint amount) payable public{
        require(msg.sender==owner); // if owner send start
        _receiver.transfer(msg.value);
        emit Sent(msg.sender, _receiver, msg.value);
    }
    function queryBalance() public view returns(uint) {
        return address(this).balance;
    }
    function deposit(uint amount) public payable {
        require(msg.value==amount);
    }
    function withdraw() public {
        require(msg.sender==owner);
        msg.sender.transfer(address(this).balance);
    }
}
