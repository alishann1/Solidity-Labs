// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

//Task1
contract InputValidator{
    mapping(address => uint) public balances;
    constructor(){
        balances[msg.sender] = 10000;
    }
    function Transfer(uint256 amount, address recipient) public {  
        require(amount > 0 && amount <= 100);     
        balances[recipient] +=amount;
        balances[msg.sender] -= amount;
    }
}

//Task 2
contract QuotientCalculator{
    function calculateQuotient(uint dividend, uint divisor) public pure returns (uint) {
        require(divisor != 0,"Denominator Cannot Be 0");
        return(dividend/divisor);
    } 
} 

//Task 3
contract QuotientCalculatorr{
    function calculateQuotient(uint dividend, uint divisor) public pure returns (uint) {
        if(divisor == 0)
        revert("Divisor Cannot Be 0");
        return(dividend/divisor);
    } 
} 

//Task 4
contract VotingSystem{
    function vote(uint256 _candidateId) public {

    }
}

//Task 5
contract Assert{
    function subtract(uint num1, uint num2) public pure returns(uint){
        uint sub;
        assert(sub >= 0);
        sub = num1 - num2;
        return sub;
    }
}

//Task 6
contract Task6{
    uint256[] public DynArr;
    function pushElement(uint _value) public {
        DynArr.push(_value);
    }
    function popElement() public view {
        assert(DynArr.length > 0);
        DynArr.pop;
        
    }
}

//Task 7
contract UniAdmission{
    enum Department{
        Civil, 
        Mechanic, 
        Electrical, 
        Software
    }
    mapping(uint => bool) public AdmissionStatus;
    mapping(uint => Department) public chosenDepartment;
    function setAdmissionStatus(uint student, bool hasPassed) public{
        AdmissionStatus[student] = hasPassed;
    }
    function chooseDepartment(uint student, Department selectedDept) public {
        assert(AdmissionStatus[student] == true);
        chosenDepartment[student] = selectedDept;
    }
}

//Task 8
contract CustomError{
uint[] public arr;
error task (string message, uint num);
function upush(uint num) public{
if(IsPrime(num)){
revert("Number is not Prime");
}
arr.push(num);
}
function IsPrime(uint num) public pure returns(bool){
if(num == 0 || num == 1){
return false;
}
for(uint i = 2; i <= num/2; i++){
if(num % i == 0){
return true;
}
}
return false;
}
}

//Task 9
contract DriverLicense{
    error TooYoung(uint256 requiredAge, string message);

    function DriverID(uint age) public pure returns (uint) {
        uint requiredAge = 18;

        if (age >= requiredAge) {
            return 123; //DriverID 
        } else {
            revert TooYoung(requiredAge, "Too Young");
        }
    }
}

//Task 10
contract ATM{
    CashAvailable = 
}