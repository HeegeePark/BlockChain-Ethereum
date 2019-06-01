pragma solidity ^0.5.0;

contract mybank {
    function deposit(uint256 amount) payable public {
        require(msg.value==amount);
        
    }
    function withdraw() public {
        msg.sender.transfer(address(this).balance);
    }
    function queryBalance() public view returns (uint256) {
        return address(this).balance;
    }
}
