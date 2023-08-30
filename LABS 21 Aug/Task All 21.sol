// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//Task 1
contract Student {
    string private stdName;
    uint256 private stdRollNum;

    // setting values of state variables
    constructor(string memory name, uint256 rollNum) {
        stdName = name;
        stdRollNum = rollNum;
    }
}

contract StudentsList {
    // array to store students ( composition )
    Student[] public students;

    constructor() {
        Student newStudent = new Student("Burak", 20);
        students.push(newStudent);
    }
}

//Task 2
contract Person {
    string public Name;
    uint256 public Age;

    constructor(string memory _name, uint256 _age) {
        Name = _name;
        Age = _age;
    }
}

contract Patient is Person {
    string public Disease;

    constructor(
        string memory _name,
        uint256 _age,
        string memory _disease
    ) Person(_name, _age) {
        Disease = _disease;
    }
}

// contract PatienList {
//     Patient[] public Patients;

//     constructor() {
//         Patient newPatient = new Patient("Bob", 20, "Fever");
//         Patients.push(newPatient);
//     }

//     function getPatientRecords(uint256 _index) public view returns (Patient) {
//         return (Patients[_index]);
//     }
// }

contract PatienList {
    Patient[] public Patients;

    constructor() {
        Patient newPatient = new Patient("Bob", 20, "Fever");
        Patients.push(newPatient);
        //Patients = newPatient;
    }

    function getPatientRecords(uint _index) public view returns (string memory, uint256, string memory) {
        return (Patients[_index].Disease(), Patients[_index].Age(), Patients[_index].Name());
    }
}

//Task 3

contract PrimeChecker {
    constructor(uint256 a) {
        require(a != 0, "Invalid Entry");
        assert(a != 1);
    }

    function isPrime(uint256 b) internal pure returns (bool) {
        if (b <= 1) {
            return false;
        }
        if (b == 2) {
            return true;
        }
        if (b % 2 == 0) {
            return false;
        }
        for (uint256 i = 3; i * i <= b; i += 2) {
            if (b % i == 0) {
                return false;
            }
        }
        return true;
    }

    function onlyPrime(uint256 b) external pure returns (bool success) {
        // revert when a non-prime number is entered
        require(isPrime(b), "Ups! Reverting");
        success = true;
    }
}

contract TryCatch {
    // success event
    event SuccessEvent();
    // failure event
    event CatchEvent(string message);
    event CatchByte(bytes data);
    PrimeChecker even;

    constructor() {
        even = new PrimeChecker(2);
    }

    function execute(uint256 amount) external returns (bool success) {
        try even.onlyPrime(amount) returns (bool _success) {
            emit SuccessEvent();
            return _success;
        } catch Error(string memory reason) {
            // if call fails
            emit CatchEvent(reason);
        }
    }

    function executeNew(uint256 a) external returns (bool success) {
        try new PrimeChecker(a) returns (PrimeChecker _even) {
            // if call succeeds
            emit SuccessEvent();
            success = _even.onlyPrime(a);
        } catch Error(string memory reason) {
            emit CatchEvent(reason);
        } catch (bytes memory reason) {
            emit CatchByte(reason);
        }
    }
}

//Task 4
contract SimpleDivision {
    function Divide2Nums(uint256 numerator, uint256 denominator) external pure returns (uint256) {
        require(denominator != 0, "Division by zero");
        return numerator / denominator;
    }
}

contract TryCatchExample {
    SimpleDivision private SimpleDivisionContract;

    event DivisionResult(uint256 result);

    constructor(address simpleDivisionAddress) {
        SimpleDivisionContract = SimpleDivision(simpleDivisionAddress);
    }

    function tryDivide(uint256 numerator, uint256 denominator) external {
        try SimpleDivisionContract.Divide2Nums(numerator, denominator) returns (uint256 result) {
            emit DivisionResult(result);
        } catch Error(string memory errorMessage) {
            // Revert with the provided error message
            revert(errorMessage);
        } catch {
            // Revert with a generic error message
            revert("An error occurred");
        }
    }
}


//Task 6
library MathLib {
    function findSum(uint256 a, uint256 b) public pure returns (uint256 Sum) {
        return a + b;
    }

    function findDiff(uint256 a, uint256 b) public pure returns (uint256 Diff) {
        return a - b;
    }

    function findExpo(uint256 a, uint256 b) public pure returns (uint256 Expo) {
        return a**b;
    }
}

contract MathContr {
    function getSum(uint256 firstVal, uint256 secondVal)
        public
        pure
        returns (uint256)
    {
        return MathLib.findSum(firstVal, secondVal);
    }

    function getDiff(uint256 firstVal, uint256 secondVal)
        public
        pure
        returns (uint256)
    {
        return MathLib.findDiff(firstVal, secondVal);
    }

    function getExpo(uint256 firstVal, uint256 secondVal)
        public
        pure
        returns (uint256)
    {
        return MathLib.findExpo(firstVal, secondVal);
    }
}

//Task 7

// import Foo.sol from current directory
import "./Import.sol";

contract Import {
    Callee public demo = new Callee();

    // Test Callee.sol by getting it's name.
    function getdemoName() public view returns (string memory) {
        return demo.name();
    }
}

//Task 8
import "./Import2.sol";

//Task 9

contract ABIencode {
    function encode(address _address, uint256 data)
        public
        pure
        returns (bytes memory)
    {
        return (abi.encode(_address, data));
    }

    function encodePacked(address _address, uint256 data)
        public
        pure
        returns (bytes memory result)
    {
        result = abi.encodePacked(_address, data);
    }

    function encodeWithSelector(address _address, uint256 data)
        public
        pure
        returns (bytes memory result)
    {
        result = abi.encodeWithSelector(
            bytes4(keccak256("encodeWithSelector(address, uint )")),
            _address,
            data
        );
    }

    function encodeWithSignature(address _address, uint256 data)
        public
        pure
        returns (bytes memory result)
    {
        result = abi.encodeWithSignature(
            ("encodeWithSelector(address, uint)"),
            _address,
            data
        );
    }

    function decode(bytes memory data)
        public
        pure
        returns (address daddr, uint256 dnum)
    {
        (daddr, dnum) = abi.decode(data, (address, uint256));
    }
}

//Task 10

contract LaptopABI {
    struct Laptop {
        string Brand;
        uint256 RAM;
        uint256 ROM;
    }
    Laptop[] public Laptops;

    function Add(
        string memory _Brand,
        uint256 _RAM,
        uint256 _ROM
    ) public {
        Laptop memory add = Laptop(_Brand, _ROM, _RAM);
        Laptops.push(add);
    }

    function encodeABI(
        string memory _Brand,
        uint256 _RAM,
        uint256 _ROM
    ) public pure returns (bytes memory result) {
        return abi.encode(_Brand, _RAM, _ROM);
    }

    function decode(bytes memory data)
        public
        pure
        returns (
            string memory _Brand,
            uint256 _RAM,
            uint256 _ROM
        )
    {
        (_Brand, _RAM, _ROM) = abi.decode(data, (string, uint256, uint256));
    }
}

//Task 11

contract VotingContract {
    struct Voter {
        address VoterAddress;
        uint256 VoterID;
        string Name;
        uint256[3] DOB;
    }
    Voter[] public voters;

    function serializeVoter(
        address _VoterAdress,
        uint256 _VoterID,
        string memory _Name,
        uint256[3] memory _DOB
    ) public returns (bytes memory) {
        Voter memory voter = Voter(_VoterAdress, _VoterID, _Name, _DOB);
        voters.push(voter);
        return abi.encode(_VoterAdress, _VoterID, _Name, _DOB);
    }

    function decodeVoter(bytes memory data)
        public
        pure
        returns (
            address _VoterAdress,
            uint256 _VoterID,
            string memory _Name,
            uint256[3] memory _DOB
        )
    {
        (_VoterAdress, _VoterID, _Name, _DOB) = abi.decode(data, (address, uint256, string, uint256[3]));
    }
}
