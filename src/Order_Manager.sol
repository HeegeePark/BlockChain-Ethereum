pragma solidity ^0.5.0;
contract Order_Manager {
    address minter;
    mapping (address => uint) balanceOf;
    string[] status = ["Ordered", "Delivered", "Receiverd", "Closed", "Returned"];
    
    struct Consumer{
        uint or_num;
        string item;
        uint item_cnt;
        uint cost;
        
    }
    constructor() public {
        minter = msg.sender;
    }
    
    Consumer[] public ConsumerArr;
    
    function Order(uint num,string memory name) public {
        ConsumerArr.push(Consumer(num,item,item_cnt,cost));
        addressByName[_name]=msg.sender;
    }
    
    function mint(address owner, uint amount) public {
        require(msg.sender == minter);
        balanceOf[owner] += amount;
    }
    function send(address receiver, uint amount) public {
        require(balanceOf[msg.sender]>=_value);
        balanceOf[msg.sender] -= amount; // Subtract from the sender
        balanceOf[receiver] += amount;   // Add the same to the recipient
    }
    function queryBalance(address addr) public view returns (uint) {
        return balanceOf[addr];
    }
}
