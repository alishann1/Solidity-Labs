// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract StudentRegistrationSystem{
    enum Department{
        Artificial_Intelligence,
        Blockchain, 
        E_Commerce,
        Arts
    }
    enum Status{
        Enrolled,
        NotEnrolled,
        Graduated,
        Expelled
    }
    struct Student{
       string name;
       uint age;
       uint registrationDate;
       Department department;
       Status status;
       uint ObtainedMarks; 
    }
    mapping(uint => Student) public students;
    uint TotalStudents;

   function RegisterStudents(
       uint rollnumber,
       string memory name,
       uint age,
       uint registrationDate,
       Department department,
       Status status,
       uint ObtainedMarks   
    ) public {
        students[rollnumber] = Student(
        name,
        age,
        registrationDate,
        department,
        status,
        ObtainedMarks );
        TotalStudents++;
    }
    function UpdateStudentInfo(
       uint rollnumber,
       string memory name,
       uint age,
       uint registrationDate,
       Department department,
       Status status,
       uint ObtainedMarks   
    ) public {
        students[rollnumber] = Student(
        name,
        age,
        registrationDate,
        department,
        status,
        ObtainedMarks );
    }
    function Retrieve(uint rollnumber) public view returns (
       string memory name,
       uint age,
       uint registrationDate,
       Department department,
       Status status,
       uint ObtainedMarks 
    ) {Student storage student = students[rollnumber];
      
      return (
          student.name,
          student.age,
          student.registrationDate,
          student.department,
          student.status,
          student.ObtainedMarks
      );      
    }
    function getCount(Department _department) public view returns (uint) {
        uint count = 0;
        for (uint i = 1; i <= TotalStudents; i++)
             if(students[i].department == _department) {
                 count++;
    }
             return count;
    }
    function getTop3BlockchainAchievers() public view returns (
        string[3] memory names,
        uint[3] memory ages,
        uint[3] memory registrationDates,
        Status[3] memory statuses,
        uint[3] memory obtainedMarks
    ) {
        uint[3] memory topMarks;

        for (uint i = 1; i <= TotalStudents; i++) {
            Student storage student = students[i];

            if (student.department == Department.Blockchain && student.status != Status.Expelled && student.status != Status.NotEnrolled) {
                for (uint j = 0; j < 3; j++) {
                    if (student.ObtainedMarks > topMarks[j]) {
                        for (uint k = 2; k > j; k--) {
                            topMarks[k] = topMarks[k - 1];
                            names[k] = names[k - 1];
                            ages[k] = ages[k - 1];
                            registrationDates[k] = registrationDates[k - 1];
                            statuses[k] = statuses[k - 1];
                            obtainedMarks[k] = obtainedMarks[k - 1];
                        }
                        topMarks[j] = student.ObtainedMarks;
                        names[j] = student.name;
                        ages[j] = student.age;
                        registrationDates[j] = student.registrationDate;
                        statuses[j] = student.status;
                        obtainedMarks[j] = student.ObtainedMarks;
                    }
                }
            }
        }

        return (names, ages, registrationDates, statuses, obtainedMarks);
    }
  


    
}