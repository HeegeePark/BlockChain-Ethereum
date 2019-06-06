pragma solidity ^0.5.0;
contract Member {
    address owner;
    struct Member {
        uint id;
        string name;
    }
    Member[] public memberArr;
    constructor() public {
        owner=msg.sender;
    }
    function del() public {
        delete memberArr;
    }
    function delOne(uint i) public {
        delete memberArr[i];
    }
    function add(uint id, string memory name) public {
        memberArr.push(Member(id,name));
    }
    function getMember(string memory who) view public returns(uint, string memory) {
        uint _id;
        string memory _name;
        for(uint i=0;i<memberArr.length;i++) {
            _name=memberArr[i].name;
            if(keccak256(abi.encodePacked(_name))==keccak256(abi.encodePacked(who))) {
                _id=memberArr[i].id;
                _name=memberArr[i].name;
            }
        }
        return(_id, _name); 
    }
}
