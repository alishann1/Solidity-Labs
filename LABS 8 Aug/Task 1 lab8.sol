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
        uint age;
        uint date;
        Department department;
        Status status;
        uint ObtainedMarks;
    }

    //Task 4
    mapping(uint => Student) TotalStudents;
    uint public StudentCount;
    uint[3] top3;

    // Task 5
    function register(
        string memory name,
        uint age,
        uint date,
        Department department,
        uint ObtainedMarks
    ) public returns (uint) {
        uint _roll = StudentCount + 1;
        TotalStudents[_roll] = Student(
            name,
            age,
            date,
            department,
            Status.NotEnrolled,
            ObtainedMarks
        );
        StudentCount++;
        return _roll;
    }

    // Task 6
    function update(
        uint rollno,
        string memory name,
        uint age,
        uint date,
        Department department,
        Status status,
        uint _ObtainedMarks
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
    function retrieve(uint rollno)
        public
        view
        returns (
            string memory name,
            uint age,
            uint date,
            Department department,
            Status status,
            uint ObtainedMarks
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
    function getCount(Department department) public view returns (uint) {
        uint count = 0;
        for (uint i = 1; i <= StudentCount; i++) {
            if (TotalStudents[i].department == department) {
                count++;
            }
        }
        return count;
    }

    // Task 9
    function TopAchiever() public pure returns (
            uint[3] memory names,
            uint[3] memory ages,
            uint[3] memory registrationDates,
            Status[3] memory statuses,
            uint[3] memory obtainedMarks
        )
    {
        return (names, ages, registrationDates, statuses, obtainedMarks);
    }

    function Top3Achievers() public {
        uint[] memory _arr = new uint[](StudentCount);
        for (uint i = 1; i <= StudentCount; i++) {
            _arr[i - 1] = i;
        }

        for (uint j = 0; j < _arr.length; j++) {
            for (uint k = 0; k < _arr.length - 1; k++) {
                if (
                    TotalStudents[_arr[k]].ObtainedMarks <
                    TotalStudents[_arr[k + 1]].ObtainedMarks
                ) {
                    uint _bucket = _arr[k + 1];
                    _arr[k + 1] = _arr[k];
                    _arr[k] = _bucket;
                }
            }
        }
        top3[0] = _arr[0];
        top3[1] = _arr[1];
        top3[2] = _arr[2];
    }
}
