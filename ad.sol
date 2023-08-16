// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract StudentRegistry {
    enum Department { Artificial_Intelligence, Blockchain, E_Commerce, Arts }
    enum Status { Enrolled, NotEnrolled, Graduated, Expelled }

    struct Student {
        string name;
        uint age;
        uint registrationDate;
        Department department;
        Status status;
        uint obtainedMarks;
    }

    mapping(string => Student) private students;
    mapping(Department => uint) private departmentCounts;

    function registerStudent(
        string memory _rollNo,
        string memory _name,
        uint _age,
        Department _department
    ) public {
        require(students[_rollNo].registrationDate == 0, "Student already registered");
        
        students[_rollNo] = Student({
            name: _name,
            age: _age,
            registrationDate: block.timestamp,
            department: _department,
            status: Status.Enrolled,
            obtainedMarks: 0
        });
        
        departmentCounts[_department]++;
    }

    function updateStudentDetails(
        string memory _rollNo,
        string memory _name,
        uint _age,
        Department _department,
        Status _status,
        uint _obtainedMarks
    ) public {
        require(students[_rollNo].registrationDate > 0, "Student not registered");
        
        students[_rollNo].name = _name;
        students[_rollNo].age = _age;
        students[_rollNo].department = _department;
        students[_rollNo].status = _status;
        students[_rollNo].obtainedMarks = _obtainedMarks;
        
        if (_department != students[_rollNo].department) {
            departmentCounts[students[_rollNo].department]--;
            departmentCounts[_department]++;
        }
    }

    function getStudentDetails(string memory _rollNo) public view returns (
        string memory name,
        uint age,
        uint registrationDate,
        Department department,
        Status status,
        uint obtainedMarks
    ) {
        Student memory student = students[_rollNo];
        require(student.registrationDate > 0, "Student not found");
        return (
            student.name,
            student.age,
            student.registrationDate,
            student.department,
            student.status,
            student.obtainedMarks
        );
    }

    function getDepartmentCount(Department _department) public view returns (uint) {
        return departmentCounts[_department];
    }
function getTopThreeBlockchainAchievers() public view returns (
    string memory first,
    string memory second,
    string memory third
) {
    string[3] memory achievers;
    uint[3] memory marks;
    
    for (uint i = 0; i < 3; i++) {
        marks[i] = 0;
    }

    for (uint i = 0; i < 3; i++) {
        for (uint j = 0; j < 3; j++) {
            string memory currentRollNo = achievers[j];
            if (students[currentRollNo].obtainedMarks < students[achievers[i]].obtainedMarks) {
                marks[j] = students[achievers[i]].obtainedMarks;
                achievers[j] = achievers[i];
                break;
            }
        }
    }
    
    return (achievers[0], achievers[1], achievers[2]);
}
}