CREATE DATABASE TravelOnTheGo;

USE TravelOnTheGo;

# 1) You are required to create two tables PASSENGER and PRICE with the following attributes and properties 

CREATE TABLE PASSENGER
(Passenger_name varchar(50),
 Category varchar(50),
 Gender varchar(50),
 Boarding_City varchar(50),
 Destination_City varchar(50),
 Distance int,
 Bus_Type varchar(50) 
);
CREATE TABLE PRICE 
( 
Bus_Type varchar(50),
Distance int,
Price int
);

# 2) Insert the following data in the tables

INSERT INTO PASSENGER VALUES("Sejal", "AC", "F", "Bengaluru", "Chennai", 350, "Sleeper");
INSERT INTO PASSENGER VALUES("Anmol", "Non-AC", "M", "Mumbai ", "Hyderabad", 700, "Sitting");
INSERT INTO PASSENGER VALUES("Pallavi", "AC", "F", "Panaji ", "Bengaluru", 600, "Sleeper");
INSERT INTO PASSENGER VALUES("Khushboo", "AC", "F", "Chennai", "Mumbai", 1500, "Sleeper");
INSERT INTO PASSENGER VALUES("Udit", "Non-AC", "M", "Trivandrum", "Panaji", 1000, "Sleeper");
INSERT INTO PASSENGER VALUES("Ankur", "AC", "M", "Nagpur ", "Hyderabad", 500, "Sitting");
INSERT INTO PASSENGER VALUES("Hemant", "Non-AC", "M", "panaji", "Mumbai", 700, "Sleeper");
INSERT INTO PASSENGER VALUES("Manish", "Non-AC", "M", "Hyderabad", "Bengaluru", 500, "Sitting");
INSERT INTO PASSENGER VALUES("Piyush", "AC", "M", "Pune", "Nagpur", 700, "Sitting");

INSERT INTO PRICE VALUES("Sleeper", 350, 770);
INSERT INTO PRICE VALUES("Sleeper", 500, 1100);
INSERT INTO PRICE VALUES("Sleeper", 600, 1320);
INSERT INTO PRICE VALUES("Sleeper", 700, 1540);
INSERT INTO PRICE VALUES("Sleeper", 1000, 2200);
INSERT INTO PRICE VALUES("Sleeper", 1200, 2640);
INSERT INTO PRICE VALUES("Sleeper", 350, 434);
INSERT INTO PRICE VALUES("Sitting", 500, 620);
INSERT INTO PRICE VALUES("Sitting", 500, 620);
INSERT INTO PRICE VALUES("Sitting", 600, 744);
INSERT INTO PRICE VALUES("Sitting", 700, 868);
INSERT INTO PRICE VALUES("Sitting", 1000, 1240);
INSERT INTO PRICE VALUES("Sitting", 1200, 1488);
INSERT INTO PRICE VALUES("Sitting", 1500, 1860);

# 3) How many females and how many male passengers travelled for a minimum distance of 600 KM s?

SELECT COUNT(Gender) FROM Passenger WHERE Gender = "M" AND Distance>=600;

# 4) Find the minimum ticket price for Sleeper Bus.

SELECT MIN(Price) FROM Price WHERE Bus_Type = "Sleeper";

# 5) Select passenger names whose names start with character 'S'

SELECT Passenger_name FROM Passenger WHERE Passenger_name LIKE 'S%';

# 6) Calculate price charged for each passenger displaying Passenger name, Boarding City, Destination City, Bus_Type, Price in the output

SELECT Passenger_name, Boarding_City, Destination_City, Passenger.Bus_Type, Price.Price FROM Passenger INNER JOIN Price ON Passenger.Bus_Type = Price.Bus_type AND Passenger.Distance = Price.Distance;

# 7) What is the passenger name and his/her ticket price who travelled in Sitting bus for a distance of 1000 KM s

SELECT Passenger.Passenger_name, Price.Price FROM Passenger, Price WHERE Passenger.Bus_Type = "Sitting" and Passenger.Distance>=1000;

# 8) What will be the Sitting and Sleeper bus charge for Pallavi to travel from Bangalore to Panaji?

SELECT Bus_Type, Price FROM Price WHERE Distance = ( SELECT Distance FROM Passenger WHERE Passenger_name="Pallavi");

# 9) List the distances from the "Passenger" table which are unique (non-repeated distances) in descending order.

SELECT DISTINCT(Distance) FROM Passenger ORDER BY Distance DESC;

# 10) Display the passenger name and percentage of distance travelled by that passenger from the total distance travelled by all passengers without using user variables 

SELECT Passenger_name, round(((Distance/(SELECT SUM(Distance) FROM Passenger)) *100), 2) as Percentage_Distance FROM Passenger;

# 11) Display the distance, price in three categories in table Price
		# a) Expensive if the cost is more than 1000
		# b) Average Cost if the cost is less than 1000 and greater than 500
		# c) Cheap otherwise

SELECT Price, Distance,
CASE
WHEN Price>1000 then 'Expensive'
WHEN Price>500 AND Price<1000 THEN 'Average Cost'
ELSE 'Cheap' 
END AS Cost
FROM Price;      