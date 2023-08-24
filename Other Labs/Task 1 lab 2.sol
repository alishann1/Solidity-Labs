// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;
contract TicketBookingSystem {

    // Exercise A

    //Part 1
    enum TicketType {
        Economy,
        Bussiness,
        FirstClass
    }
    //Part 2
    enum Days {
        Monday,
        Tuesday,
        Wednesday,
        Thursday,
        Friday,
        Saturday,
        Sunday
    }
    //Part 3
    struct Ticket {
        string passenger;
        TicketType ticketType;
        Days day;
        bool isBooked;
 }
   
    
    //Part 4

    Ticket[] public tickets;

  function bookTicket(string memory _name, TicketType _ticketType, Days _day)
   public {
       tickets.push(Ticket(_name, _ticketType, _day, true));
       }

     function getTicketType(uint256 _index) public view returns
    (TicketType){return tickets [_index].ticketType;


    }
    function getTicketDay(uint256 _index) public view returns
     (Days) {return tickets [_index].day;
     }


  function toggleStatus(uint256 _index) public    {
      tickets[_index].isBooked =!tickets[_index].isBooked;


    }
}

  


      
       
   



    


