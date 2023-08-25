create database if not exists City_Data;
use City_Data;
create table if not exists City(
id int Not NUll,
`name` Varchar(17),
countrycode varchar(5),
district varchar(20),
population varchar(25),
primary key(id)
);

# Data input done and removed data code because it was consuming too much space.

/*
Q1. Query all columns for all American cities in the CITY table with populations larger than 100000.
The CountryCode for America is USA.
The CITY table is described as follows:*/
select * from City where countrycode="USA" and population>100000;

/*
Q2. Query the NAME field for all American cities in the CITY table with populations larger than 120000.
The CountryCode for America is USA.
The CITY table is described as follows:*/
select `name` from City where countrycode="USA" and population>120000;

/*
Q3. Query all columns (attributes) for every row in the CITY table.
The CITY table is described as follows:*/
select * from city;

/*
Q4. Query all columns for a city in CITY with the ID 1661.
The CITY table is described as follows:*/
select * from City where id = 1661;

/*
Q5. Query all attributes of every Japanese city in the CITY table. The COUNTRYCODE for Japan is
JPN.*/
select * from City where countrycode="JPN";

/*
Q6. Query the names of all the Japanese cities in the CITY table. The COUNTRYCODE for Japan is
JPN.*/
select `name` from City where countrycode="JPN";

/*
Q7. Query a list of CITY and STATE from the STATION table.
The STATION table is described as follows:*/
create table if not exists Station(
id int not null,
city varchar(21),
state varchar(2),
lat_n int,
long_w int,
primary key(id),
foreign key(id) references City(id)
);
describe station;
# Data input done and removed data code because it was consuming too much space.
select * from station;

/*
Q8. Query a list of CITY names from STATION for cities that have an even ID number. Print the results
in any order, but exclude duplicates from the answer.
The STATION table is described as follows:*/
select city from station where id%2=0;

/*
Q9. Find the difference between the total number of CITY entries in the table and the number of
distinct CITY entries in the table.*/
SELECT COUNT(*) - COUNT(DISTINCT CITY) AS difference from station;
# COUNT(*) returns the total number of rows in the CITY table.
# COUNT(DISTINCT CITY) returns the number of distinct values in the CITY column of the CITY table.

/*
Q10. Query the two cities in STATION with the shortest and longest CITY names, as well as their
respective lengths (i.e.: number of characters in the name). If there is more than one smallest or
largest city, choose the one that comes first when ordered alphabetically.*/
# short city
SELECT CITY, LENGTH(CITY) AS name_length FROM STATION ORDER BY name_length, CITY LIMIT 1;

# long city
SELECT CITY, LENGTH(CITY) AS name_length FROM STATION ORDER BY name_length DESC, CITY LIMIT 1;


/*
Q11. Query the list of CITY names starting with vowels (i.e., a, e, i, o, or u) from STATION. Your result
cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) IN ('a','e','i','o','u','A', 'E', 'I', 'O', 'U');


/*
Q12. Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot
contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) IN ('a','e','i','o','u','A', 'E', 'I', 'O', 'U');

/*
Q13. Query the list of CITY names from STATION that do not start with vowels. Your result cannot
contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u','A', 'E', 'I', 'O', 'U');

/*
Q14. Query the list of CITY names from STATION that do not end with vowels. Your result cannot
contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE right(CITY, 1) IN ('a','e','i','o','u','A', 'E', 'I', 'O', 'U');

/*
Q15. Query the list of CITY names from STATION that either do not start with vowels or do not end
with vowels. Your result cannot contain duplicates.*/
SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY, 1) NOT IN ('a','e','i','o','u','A', 'E', 'I', 'O', 'U') and  RIGHT(CITY, 1) NOT IN ('a','e','i','o','u','A', 'E', 'I', 'O', 'U');

