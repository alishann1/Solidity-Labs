// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract Maper {
    mapping(string=> uint) public Mapper;
    function set(string memory _name, uint _uint) public{
       Mapper[_name] = _uint;
    }
    function get(string memory _name) public view returns(uint){
        return Mapper[_name];
    }
    function reset(string memory _name) public {
        delete Mapper[_name];
    }

    mapping(string => mapping (address => address)) public Mappers;

} 