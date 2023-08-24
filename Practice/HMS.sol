// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;


contract Person {
    string public Name;
    uint public Age;
    
    constructor(string memory _name, uint _age) {
        Name = _name;
        Age = _age;
    }
}

contract Patient is Person {
    string public Disease;

    constructor(string memory _name, uint _age, string memory _disease)
        Person(_name, _age)
    {
        Disease = _disease;
    }
}

contract PatientList {
    Patient[] public Patients;

    constructor() {
        Patient newPatient = new Patient("Bob", 20, "Fever");
        Patients.push(newPatient);
    }

    function getNumPatients() public view returns (uint) {
        return Patients.length;
    }

    function getPatientDetails(uint _index) public view returns (string memory, uint, string memory) {
        require(_index < Patients.length, "Patient index out of bounds");

        Patient patient = Patients[_index];
        // return (patient.Name, patient.Age, patient.Disease);
    }
}
