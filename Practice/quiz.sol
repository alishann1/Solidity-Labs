// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract QUiz {

    // Task 9 
    function getTop3BlockchainAchievers() public view returns (
        string[3] memory names,
        uint[3] memory ages,
        uint[3] memory registrationDates,
        Status[3] memory statuses,
        uint[3] memory obtainedMarks
    ) {
        uint[3] memory topMarks;

        for (uint i = 1; i <= totalStudents; i++) {
            Student storage student = students[i];

            if (student.department == Department.Blockchain && student.status != Status.Expelled) {
                // Compare obtained marks to find top 3 achievers
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
                        break;
                    }
                }
            }
        }

        return (names, ages, registrationDates, statuses, obtainedMarks);
    }
  
}
