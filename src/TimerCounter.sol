pragma solidity ^0.5.0;
contract Timer_Count {
    uint256 startTime;
    uint256 counter = 0;
    
    function add() public {
        counter++;
    }
    
    function start() public {
        startTime=now;
    }
    function timePassed() public view returns(uint256) {
        return now-startTime;
    }
    function getCounter() public view returns (uint256) {
        return counter;
    }
    function getNow() view public returns(uint) {
        return now;
    }
}
