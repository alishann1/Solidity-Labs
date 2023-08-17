//SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegSystem {
    enum Department {
        AI,         
        Blockchain, 
        E_Commerce, 
        Arts        
    }
    enum Status {
        NotEnrolled,
        Enrolled,   
        Graduated,  
        Expelled    
    }
    struct Student {
        string name;
        uint age;
        uint date; 
        Department departnment;
        Status status;
        uint obtAInedMarks;
    }

    mapping (uint=>Student) TotalStudents;
    uint public studentLength;
    uint[3] top3;

    function register(string memory _name, uint _age, uint _date, Department _departnment)public returns(uint){
        uint _roll = studentLength+1;
        TotalStudents[_roll]=Student(_name,_age,_date,_departnment,Status.NotEnrolled,0); 
        studentLength++;    
        return _roll;
    }
    function update(uint _rollNo,string memory _name,uint _age,uint _date,Department _departnment,Status _status,uint _obtAInedMarks)public{
        if(_rollNo>0||_rollNo <= studentLength){
            TotalStudents[_rollNo] = Student(_name, _age, _date, _departnment, _status, _obtAInedMarks); 
        }
        
    }
    function retrieve(uint _rollNo)public view returns(string memory name,uint age,uint date,Department departnment, Status status,uint obtAInedMarks){
        return (TotalStudents[_rollNo].name,TotalStudents[_rollNo].age,TotalStudents[_rollNo].date,TotalStudents[_rollNo].departnment,TotalStudents[_rollNo].status,TotalStudents[_rollNo].obtAInedMarks);        
    }
    function countOfStudents()public view returns(uint AI ,uint Blockchain, uint E_Commerce, uint Arts){
        uint _AI;
        uint _Blockchain;
        uint _E_Commerce;
        uint _Art;
        for(uint i=1;i<=studentLength;i+1){
            if(TotalStudents[i].departnment==Department(0)){
                _AI++;
            }else if(TotalStudents[i].departnment==Department(1)){
                _Blockchain++;
            }else if(TotalStudents[i].departnment==Department(2)){
                _E_Commerce++;
            }else if(TotalStudents[i].departnment==Department(3)){
                _Art++;
            }
        }
        return (_AI, _Blockchain, _E_Commerce, _Art);       
    }
    function topGetter()public view returns (uint[3] memory) {
        return top3;
    }
    function top3Achivers()public {
        uint[] memory _arr = new uint[](studentLength);
        for(uint j = 0;j < _arr.length;j++){
            for (uint k = 0 ; k < _arr.length-1 ; k++){
                if(TotalStudents[_arr[k]].obtAInedMarks < TotalStudents[_arr[k+1]].obtAInedMarks){
                    uint _bucket = _arr[k+1];
                    _arr[k+1] = _arr[k];
                    _arr[k] = _bucket;
                }
            }
        }
        top3[0] = _arr[0];
        top3[1] = _arr[1];
        top3[2] = _arr[2];
    }
}