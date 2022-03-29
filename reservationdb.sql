CREATE TABLE CLASS
(
class_num INT NOT NULL PRIMARY KEY,
seat_qty INT NOT NULL
);

CREATE TABLE STATION
(
stn_code VARCHAR(6) NOT NULL PRIMARY KEY,
stn_name VARCHAR(15) NOT NULL,
stn_type VARCHAR(10) NOT NULL		#Station type: Terminus, Junction, Central, Station etc.
);

CREATE TABLE TRAIN
(
train_num NUMERIC(5) NOT NULL PRIMARY KEY,
train_name VARCHAR(50) NOT NULL,
train_src VARCHAR(15) NOT NULL,
train_dstn VARCHAR(15) NOT NULL,
coach_qty INT NOT NULL
);

CREATE TABLE TICKET
(
ticket_num NUMERIC(6) NOT NULL PRIMARY KEY,
arrivalTime NUMERIC(4),
departureTime NUMERIC(4),
ticket_type VARCHAR(10)
);

CREATE TABLE PASSENGER
(PNR VARCHAR(20) NOT NULL PRIMARY KEY, 
first_name VARCHAR(15) NOT NULL,
last_name VARCHAR(15),
age INT NOT NULL,
gender VARCHAR(5),
phone_num VARCHAR(10) NOT NULL,
reserve_status VARCHAR(10) NOT NULL,
train_num NUMERIC(5),
class_num INT,
FOREIGN KEY (train_num) REFERENCES TRAIN(train_num),
FOREIGN KEY (class_num) REFERENCES CLASS(class_num)
);

CREATE TABLE FARE
(
receipt_num NUMERIC(5) PRIMARY KEY,
amount NUMERIC,
PNR VARCHAR(20),
FOREIGN KEY (PNR) REFERENCES PASSENGER(PNR)
);

CREATE TABLE books														
(
PNR VARCHAR(20),
ticket_num NUMERIC(6),
PRIMARY KEY (PNR, ticket_num),
FOREIGN KEY (PNR) REFERENCES PASSENGER(PNR),
FOREIGN KEY (ticket_num) REFERENCES TICKET(ticket_num)
);

CREATE TABLE STOPS_AT
(
train_num NUMERIC(5),
stn_code VARCHAR(6),
PRIMARY KEY (train_num, stn_code),
FOREIGN KEY (train_num) REFERENCES TRAIN(train_num),
FOREIGN KEY (stn_code) REFERENCES STATION(stn_code)
);



