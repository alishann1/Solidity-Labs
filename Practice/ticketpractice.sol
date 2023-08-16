// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract TicketBookingSystem {
    // Part 1
    enum TicketType{
        Economy,
        Bussiness,
        FirstClass
    }
    // Part 2
    enum Days{
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday
    }
    //Part 3
    struct Ticket{
        string passengername;
        TicketType ticketType;
        Days day;
        bool isBooked;
    }
    //Part 4
    Ticket[] public tickets;
    //Part 5
    function bookTicket(string memory _passengername, TicketType _ticketType, Days _day)
    public {tickets.push(Ticket(_passengername, _ticketType, _day, true));
    }
    //Part 6
    function getTicketType(uint256 _index) public view returns
    (TicketType) {return tickets [_index].ticketType;
    }
    //Part 7
    function getTicketDay(uint256 _index) public view returns 
    (Days) {return tickets [_index].day;
    }
    //Part 8
    function toggleStatus(uint256 _index) public 
    {tickets[_index].isBooked =! tickets[_index].isBooked;
    }
}   

    

 



    