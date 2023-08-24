// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

contract Enum {
    enum WeekDay {
        None,
        Monday,
        Tuesday,
        Wednesday
    }

    mapping(address => WeekDay) private DutyDay;

    function get(address addr) public view returns (WeekDay) {
        return DutyDay[addr];
    }

    function set(WeekDay _role, address _addr) public {
        DutyDay[_addr] = _role;
    }
}
