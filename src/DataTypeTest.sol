pragma solidity ^0.5.0;

contract DataTypeTest {
    bool isMarried=true;
    int256 x=2;
    bytes1 b1=0xFF;
    bytes23 place23="7 hongji-dong jongro-gu";
    bytes8 place8 = "7 hongji";
    bytes place = "7 hongji-dong jongro-gu Seoul";
    string constant name ="phg";
    struct Student {
        uint num;
        string name;
        bool isEnrolled;
    }
    Student s1=Student(201710776,"hgpark", true);
    enum gender {male, female}
    function getB1() public view returns(byte) {
        return b1;
    }
    function getB23() public view returns(bytes23) {
        return place23;
    }
    function testInt() public view returns(bool) {
        assert(x==1);
        return true;
    }
    function getStudent() public view returns(uint, string memory, bool){
        return (s1.num, s1.name, s1.isEnrolled); // all return
        
    }
    function getStudentName() public returns(string memory){
        Student memory s2=Student(201911111,"jslim",true);
        return s2.name;
    }
    function testBytes() public returns(uint){
        bytes memory b ="7 hongji-dong jongro-gu";
        return b.length;
    }
    function testString() public returns(uint) {
        string memory nameLocal="phgLocal";
        return bytes(nameLocal).length;
    }
    function testArr() public returns(uint) {
        uint[3] memory intArr;
        return intArr.length;
    }    
    
    
    
    
}
