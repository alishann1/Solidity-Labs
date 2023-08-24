// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract ExamGrader {
    function gradeExam(int score) public pure returns (bool passed, string memory grade) {
        if (score >= 60) {
            if (score >= 80 && score <= 100) {
                return (true, "Achieved Grade: A");
            } else if (score >= 60 && score <= 79) {
                return (true, "Achieved Grade: B");
            }
        } else {
            if (score >= 40 && score <= 59) {
                return (false, "Achieved Grade: C");
            } else {
                return (false, "Better Luck Next Time");
            }
        }
    }
}


