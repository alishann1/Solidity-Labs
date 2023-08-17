// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

// //Task 1
// contract Public {
//     string public publicmsg = "Public Variable is Called";

//     function getpublic() public view returns (string memory) {
//         return publicmsg;
//     }
// }

// contract Public2 is Public {
//     //Yes the State Variables from Public contract to Public2 contract.
// }

// //Task 2
// contract PublicVisibility {
//     uint256 public publicData;
// }

// contract PublicChild is PublicVisibility {
//     function getPublicData() public view returns (uint256) {
//         return publicData;
//     }
// }

// //Task 3
// contract Private {
//     string private privatemsg = "Private Variable is Called";

//     function getprivate() public view returns (string memory) {
//         return privatemsg;
//     }

//     function getprivatevar() public view returns (string memory) {
//         return privatemsg;
//     }

//     function getprivatefunc() public view returns (string memory) {
//         //You are calling 'getprivate()' function here
//         //It returns a string value which is then returned by the
//         //'getprivatefunc()' function
//         return getprivate();
//     }
// }

// contract Private2 is Private {}

// //Task 4
// contract Bank {
//     uint256 private balance;
//     uint256 funds;

//     function deposit() public {
//         funds += balance;
//     }
// }

// contract BankUser is Bank {
//     // function get() public view returns (uint) {
//     //     return balance;
//     // }
//     // We were not able to access the balance state variable because the visibility was set to private
// }

// //Task 5
// contract Internal {
//     string public internalmsg = "Internal Variable is Called";

//     function getinternal() internal view returns (string memory) {
//         return internalmsg;
//     }

//     function getinternalvar() public view returns (string memory) {
//         return internalmsg;
//     }

//     function getinternalfunc() public view returns (string memory) {
//         return getinternal();
//     }
// }
// contract Internal2 is Internal{
//     function NewVal(string memory Newmsg) public {
//         internalmsg = Newmsg;
//     }
// }

// //Part 6
// contract FamilyFortune{
//     uint internal inheritance;
//     function addInheritance(uint amount) public {
//         inheritance += amount;
//     }
// }
// contract Heir is FamilyFortune{
//     function AddFortune(uint amount) public {
//         addInheritance(amount);
//     }
// }

// //Task 7
// contract External{
// // string external externalmsg = "External Variable is Called";
// function getexternal() external pure returns(string memory){
// return "External Function";
// }
// // function getexternalfunc() public view returns(string memory){
// // return getexternal();
// // }
// }
// contract External2 is External{
// //     function getexternalfunc() public view returns(string memory){
// // return getexternal();
// // }
// //No the function is still not running because getexternal() is marked as external.
// }

// //Task 8
// contract Apartment{
//     uint internal tenantcount;
//     function joinApartment() external {
//         tenantcount++;
//     }
// }
// contract Tenant is Apartment{
//     function getter() external view returns(uint) {
//         return tenantcount;
//     }
// }

// //Task 9
// contract Base {
//  uint public x;
//  function setX(uint _x) private {
//  x = _x; }
// }
// contract Derived is Base {
//  function getX() public view returns (uint) {
//  return x; }
// //If we change the visibility of set function to private we can no longer deploy the function and default value of x becomes 0.
// }

// //Task 10
// contract Parent{
//     uint public parentValue;
// }
// contract Child is Parent{
//     uint public childValue;
// }

// //Task 11
// contract Base {
//  string public base = "Base Contract";
//  function foo() public view virtual returns (string memory) {
//  return base; }
// }
// contract Middle is Base {
//  string public middle = "Middle Contract";
//  function foo() public view virtual override returns (string memory) {
//  return middle; }
// }
// contract Derived is Middle {
//  string public derived = "Derived Contract";
//  function foo() public view override returns (string memory) {
//  return derived; }
// }
// //Yes the number of variables is increasing as we move down the contract.

// //Task 12
// contract BaseUser{
//     address public MyAdd;
// }
// contract Moderator is BaseUser{
//     string public MyName;
// }
// contract Admin is Moderator{
//     uint public MyPin;
// }

// //Task 13
// contract Base {
//     uint256 public x;

//     function setX(uint256 _x) public {
//         x = _x;
//     }
// }

// contract DerivedA is Base {
//     function getX() public view returns (uint256) {
//         return x;
//     }
// }

// contract DerivedB is Base {
//     function getXTimesTwo() public view returns (uint256) {
//         return x * 2;
//     }
// }

// contract DerivedC is Base {
//     function getXCube() public view returns (uint256) {
//         return x * x * x;
//     }
// }

// //Task 14
// contract Car{
//     string public make;
//     uint public model;
// }

// contract ElectricCar is Car{
//     uint public batteryCapacity;
// }

// contract HybridCar is Car{
//     uint public gasTankCapacity;
// }

// //Task 15
// contract Engine{
//     uint public horsepower;
// }

// contract Transmission{
//     string public gearType;
// }

// contract Car is Engine, Transmission{

// }

// //Task 16
// contract WorkRole{
//     bool public submitWork;
// }

// contract ClientRole{
//     string public createProject;
// }

// contract Freelancer is WorkRole, ClientRole{

// }

// //Task 17
// contract Participant{

// }

// contract Supplier{
//     string public placeOrder; 
// }

// contract Manufacturer{
//     string public manufactureProduct;
// }

// contract Product is Supplier, Manufacturer{
//     string public trackProduct;
// }

//Task 18
contract Car {
 event Log(string message);
 function demo() public virtual {
 emit Log("Base Car demo Called");
 }
 function temp() public virtual {
 emit Log("Base Car temp Called");
 }
}
// "from": "0x0919E48b43e53F0Cbe6Be82f39AF8e688FcB0F61",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "Base Car demo Called",
// 			"message": "Base Car demo Called"

contract TOYOTA is Car {
 function demo() public virtual override {
 emit Log("TOYOTA demo called");
 }
 function temp() public virtual override {
 emit Log("TOYOTA temp called");
 super.temp();
 }
}
// [
// 	{
// 		"from": "0xA64F13F05479C8d1eB5adF6cDB85fA2303CcFC0f",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "TOYOTA temp called",
// 			"message": "TOYOTA temp called"
// 		}
// 	},
// 	{
// 		"from": "0xA64F13F05479C8d1eB5adF6cDB85fA2303CcFC0f",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "Base Car temp Called",
// 			"message": "Base Car temp Called"
// 		}
// 	}
// ]

contract BMW is Car {
 function demo() public virtual override {
 emit Log("BMW demo called");
 }
 function temp() public virtual override {
 emit Log("BMW temp called");
 super.temp();
 }
}
// [
// 	{
// 		"from": "0x49E04b199586A53334CB141d29D7B0220acE6e39",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "BMW temp called",
// 			"message": "BMW temp called"
// 		}
// 	},
// 	{
// 		"from": "0x49E04b199586A53334CB141d29D7B0220acE6e39",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "Base Car temp Called",
// 			"message": "Base Car temp Called"
// 		}
// 	}
// ]

contract Supra is TOYOTA, BMW {
 function demo() public override(TOYOTA, BMW) {
 super.demo();
 }
 function temp() public override(TOYOTA, BMW) {
 super.temp();
 }
}
// [
// 	{
// 		"from": "0x899065e9879a03b6a63f31540DDC3bdaFe9d5d0F",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "BMW temp called",
// 			"message": "BMW temp called"
// 		}
// 	},
// 	{
// 		"from": "0x899065e9879a03b6a63f31540DDC3bdaFe9d5d0F",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "TOYOTA temp called",
// 			"message": "TOYOTA temp called"
// 		}
// 	},
// 	{
// 		"from": "0x899065e9879a03b6a63f31540DDC3bdaFe9d5d0F",
// 		"topic": "0xcf34ef537ac33ee1ac626ca1587a0a7e8e51561e5514f8cb36afa1c5102b3bab",
// 		"event": "Log",
// 		"args": {
// 			"0": "Base Car temp Called",
// 			"message": "Base Car temp Called"
// 		}
// 	}
// ]