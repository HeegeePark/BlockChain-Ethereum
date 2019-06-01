pragma solidity ^0.5.0;

contract BankV3 {
    address owner;
    uint256 timeToDeposit;
    event PrintLog(string);
    event Sent(address from, address to, uint amount );
    constructor() public {
        owner=msg.sender;
    }
    function() external {
        emit PrintLog("Fallback called");
    }
    function sendTo(address payable _receiver) public payable onlyOwner {
        //require(msg.sender==owner);
        _receiver.transfer(msg.value);
        emit Sent(msg.sender, _receiver, msg.value);
    }
    function queryBalance() public view returns(uint) {
        return address(this).balance;
    }
    function deposit(uint amount) public payable onlyAfter {
        timeToDeposit=now+10 seconds;
        require(msg.value==amount);
    }
    function withdraw() public onlyOwner minBalance {
        //require(msg.sender==owner);
        msg.sender.transfer(address(this).balance);
    }
    modifier onlyOwner {
        require(msg.sender==owner);
        _;
    }
    modifier onlyAfter {
        require(now>=timeToDeposit);
        _;
    }
    modifier minBalance {
        require(address(this).balance>101 wei);
        _;
    }
}
