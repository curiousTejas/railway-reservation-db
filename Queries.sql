#Q.1) Find the names of all trains originating from Mumbai CSMT
SELECT train_name FROM train
WHERE train_src='MUMBAI CSMT';

#Q.2) Display the details of stations having 'Road' in their name
SELECT * FROM station
WHERE stn_name LIKE '%ROAD';

#Q.3) Find the names of unique trains by which the passengers are travelling
SELECT DISTINCT(t.train_name), t.train_num
FROM train AS t, passenger AS p 
WHERE t.train_num=p.train_num;

#Q.4) Display the details of all trains in the alphabetical order of their names
SELECT * FROM train
ORDER BY train.train_name;

#Q.5) Find the maximum fare paid by any passenger
SELECT MAX(f.amount)
FROM fare AS f;

#Q.6) Find the total number of stations which are junctions
SELECT COUNT(stn_code)
FROM station
WHERE stn_type='JUNCTION';

#Q.7) Find the number of trains originating from each station
SELECT t.train_src, COUNT(DISTINCT(t.train_num))
FROM train AS t
GROUP BY t.train_src;

#Q.8) Find the names of passengers and trains by which they are travelling
SELECT p.first_name, p.last_name, t.train_num, t.train_name
FROM passenger AS p, train AS t
WHERE t.train_num=p.train_num;

#Q.9) Find the names of passengers travelling from 'Konkan Kanya Express'
SELECT p.first_name, p.last_name
FROM passenger AS p
WHERE p.train_num IN (SELECT t.train_num FROM train AS t
					  WHERE t.train_name='KONKAN KANYA EXPRESS');

#Q.10) Find the names of passengers who have paid a fare of more than Rs. 1500
SELECT p.first_name, p.last_name
FROM passenger AS p
WHERE p.PNR IN (SELECT f.PNR FROM fare AS f
				WHERE f.amount>1500);

#Q.11) Update the reservation status of passengers having 'WAITING' to 'RAC'
SELECT first_name,reserve_status FROM passenger
UPDATE passenger 
SET reserve_status='RAC'
WHERE reserve_status='WAITING'

#Q.12) Find the names of passengers who have booked 'ADULT' type tickets
SELECT p.first_name, p.last_name, t.ticket_type
FROM passenger AS p NATURAL INNER JOIN books AS b NATURAL INNER JOIN ticket AS t
WHERE t.ticket_type='ADULT'
