// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract StudentRegistrationSystem {
    // Task 1
    enum Department {
        AI,
        Blockchain,
        E_Commerce,
        Arts
    }

    // Task 2
    enum Status {
        NotEnrolled,
        Enrolled,
        Graduated,
        Expelled
    }

    //Task 3
    struct Student {
        string name;
        uint256 age;
        uint256 date;
        Department department;
        Status status;
        uint256 ObtainedMarks;
    }

    //Task 4
    mapping(uint256 => Student) TotalStudents;
    uint256 public StudentCount;
    uint256[3] top3;

    // Task 5
    function register(
        string memory name,
        uint256 age,
        uint256 date,
        Department department,
        uint256 ObtainedMarks,
        Status status
    ) public returns (uint256) {
        uint256 _roll = StudentCount + 1;
        TotalStudents[_roll] = Student(
            name,
            age,
            date,
            department,
            status,
            ObtainedMarks
        );
        StudentCount++;
        return _roll;
    }

    // Task 6
    function update(
        uint256 rollno,
        string memory name,
        uint256 age,
        uint256 date,
        Department department,
        Status status,
        uint256 _ObtainedMarks
    ) public {
        if (rollno > 0 && rollno <= StudentCount) {
            TotalStudents[rollno] = Student(
                name,
                age,
                date,
                department,
                status,
                _ObtainedMarks
            );
        }
    }

    // Task 7
    function retrieve(uint256 rollno)
        public
        view
        returns (
            string memory name,
            uint256 age,
            uint256 date,
            Department department,
            Status status,
            uint256 ObtainedMarks
        )
    {
        require(rollno > 0 && rollno <= StudentCount, "Invalid roll number");
        return (
            TotalStudents[rollno].name,
            TotalStudents[rollno].age,
            TotalStudents[rollno].date,
            TotalStudents[rollno].department,
            TotalStudents[rollno].status,
            TotalStudents[rollno].ObtainedMarks
        );
    }

    // Task 8
    function getCount(Department department) public view returns (uint256) {
        uint256 count = 0;
        for (uint256 i = 1; i <= StudentCount; i++) {
            if (TotalStudents[i].department == department) {
                count++;
            }
        }
        return count;
    }

    // Task 9
    function Top3BlockchainAchievers() public view returns (Student memory S1, Student memory S2, Student memory S3) {
        for (uint256 i = 1; i <= StudentCount; i++) {
            if (TotalStudents[i].department == Department.Blockchain) {
                if (TotalStudents[i].status == Status.Enrolled) {
                    if (TotalStudents[i].ObtainedMarks > S1.ObtainedMarks) {
                        S3 = S2;
                        S2 = S1;
                        S1 = TotalStudents[i];
                    } else if (
                        TotalStudents[i].ObtainedMarks > S2.ObtainedMarks
                    ) {
                        S3 = S2;
                        S1 = TotalStudents[i];
                    } else if (
                        TotalStudents[i].ObtainedMarks > S3.ObtainedMarks
                    ) {
                        S3 = TotalStudents[i];
                    }
                }
            }
        }
    } 
}
