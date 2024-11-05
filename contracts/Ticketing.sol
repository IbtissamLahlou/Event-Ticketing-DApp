// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Ticketing {
    struct Ticket {
        uint id;
        string eventName;
        uint price;
        address owner;
        bool isAvailable;
    }

    mapping(uint => Ticket) public tickets;
    mapping(address => uint[]) public purchasedTickets;
    uint public ticketCount;

    function createTicket(string memory _eventName, uint _price, uint _availableCount) public {
        for (uint i = 0; i < _availableCount; i++) {
            ticketCount++;
            tickets[ticketCount] = Ticket(ticketCount, _eventName, _price, msg.sender, true);
        }
    }

    function buyTicket(uint _ticketId) public payable {
        require(tickets[_ticketId].isAvailable, "Le billet n'est pas disponible");
        require(msg.value >= tickets[_ticketId].price, "Not enough ETH sent");

        tickets[_ticketId].isAvailable = false;
        tickets[_ticketId].owner = msg.sender;
        purchasedTickets[msg.sender].push(_ticketId);
    }

    function getPurchasedTickets(address _user) public view returns (uint[] memory) {
        return purchasedTickets[_user];
    }
}
