# Railway Ticket Reservation System
Submitted for Course Database Management System

## Entities  

- Passenger(PNR, first name, last name, age, gender, phone num, reserve status)  
- Station(Stn code, Stn name, Stn type)  
- Train(Train num, train src, train dstn, coach qty)  
- Ticket(Ticket-num, arrivalTime, departureTime, ticket type)  
- Fare(Receipt-num, Amount)  
- Class (Class-num, Seat qty)  

## Relationships  

- Books: N:N Passenger to Ticket; Passenger total, Ticket total participation  
- Stops-at: N:N Train to Station; Train partial, Station total participation  
- Pays: N:1 Passenger to Fare; Passenger partial, Fare total participation
- Boards: N:1 Passenger to Train; Passenger partial, Train total participation  
- Travels-in: N:1 Passenger to Class; Passenger partial, class total participation  

## ER Diagram  
  
![ER-Diagram](/documents/ER-Diagram.png)

## Relational Model  

- Passenger(PNR, first name, last name, age, gender, phone num, reserve status, train num*, class num*)
- Station(Stn code, Stn name, Stn type)
- Train(Train num, train src, train dstn, coach qty)
- Ticket(Ticket-num, Arrival-time, depart-time, ticket-type)
- Fare(Receipt-num, Amount, PNR*)
- Class (Class-num, Seat qty)
- Books (PNR*, ticket num)
- Stops at (train num*, Stn code*)
