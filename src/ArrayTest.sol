pragma solidity ^0.5.0;
pragma experimental ABIEncoderV2;

contract ArrayTest {
    int[5] mathMarks;
    uint[3][] marks = [[100, 80, 95], [20, 30, 40]];
    string[3] cities1 = ["Seoul", "Sydney", "Tokyo"];
    string[] cities2 = new string[](2);
    string[] cities3;
    
    function setMathMarks() public {
        mathMarks = [100, 60, 95, 50, 80];
    }
    function getMathAbove70() view public returns(int[] memory) {
        uint8 counter = 0;
        uint8 lengthOfMathAbove70 = 0;
        for(uint8 i=0;i<mathMarks.length;i++)
            if(mathMarks[i]>70) counter++;
        lengthOfMathAbove70 = counter;
        int[] memory mathAbove70 = new int[](lengthOfMathAbove70);
        counter=0;
        for(uint i=0;i<mathMarks.length;i++) {
            if(mathMarks[i]>70) {
                mathAbove70[counter]=mathMarks[i];
                counter++;
            }
        }
        return mathAbove70;
    }
    function updateMarks() public returns(uint[3][] memory) {
        marks[0][0]=90;
        return marks;
    }
    function setCities() public {
        cities2[0] = "New York";
        cities2.push("Busan");
        //cities3[0]="Seoul";
    }
    function getCities() view public returns(string[] memory) {
        return cities2;
    }
    function getMarksArr() view public returns(uint[3][] memory) {
        return marks;
    }
    function getArrMemory() pure public returns(uint[] memory) {
        uint[] memory num = new uint[](3);
        for(uint i=0;i<num.length;i++)
            num[i]=i;
        return num;
        
    }
    function getDynamicArrMemory() pure public returns(string[] memory) {
        string[2] memory places = ["9000", "Sydney"];
        places[0]="Seoul";
        //return places; //no
    }
}
