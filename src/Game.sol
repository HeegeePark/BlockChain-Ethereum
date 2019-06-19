pragma solidity ^0.5.0;

contract Game {
    address owner;
    string whowin = "";
    struct Player{
        uint num;
        string name;
    }
    
    Player[] public PlayerArr;
    constructor() public {
        owner=msg.sender;
    }
    
    function addPlayer(uint num,string memory name) public {
        PlayerArr.push(Player(num,name));
    }
    
    
    function playGame() view public returns (string memory) {
        string memory whowin = "";
        Player memory p1 = PlayerArr[0];
        Player memory p2 = PlayerArr[1];
        
        if(p1.num == p2.num) {
            whowin = "Tie";
        }
        else if(p1.num == 1) {
            if(p2.num == 2) whowin = "B win";
            if(p2.num == 3) whowin = "A win";
        }
        
        else if(p1.num == 2) {
            if(p2.num == 1) whowin = "A win";
            if(p2.num == 3) whowin = "B win";
        }
        
        else {
            if(p2.num == 1) whowin = "B win";
            if(p2.num == 2) whowin = "A win";
        }
        
        return whowin;
        
        
        
    }
}
