--ipAddress = "localhost";
--dbServerPort = "5432";
--dbName = "simpleehotels";
--dbUsername = "postgres";
--dbPassword = "postgres";



-- create table hotel_chain(
-- 	address VARCHAR(255) PRIMARY KEY,
-- 	email VARCHAR(255) NOT NULL,
-- 	num_of_hotels INT NOT NULL
-- );

-- CHECK
-- create table hotel(
-- 	address VARCHAR(255) PRIMARY KEY,
-- 	num_of_rooms INT NOT NULL CHECK (num_of_rooms > 0),
-- 	email VARCHAR(50),
-- 	stars INT CHECK (stars BETWEEN 1 AND 5),
-- 	chain_address VARCHAR(255),
-- 	FOREIGN KEY (chain_address) REFERENCES hotel_chain(address) ON DELETE CASCADE
-- );

-- Select * from hotel;

-- CREATE TABLE employee (
-- 	ssn CHAR(9) PRIMARY KEY,
-- 	name VARCHAR(100) NOT NULL,
-- 	address VARCHAR(255),
-- 	hotel_address VARCHAR(255),
-- 	FOREIGN KEY (hotel_address) REFERENCES hotel(address)

-- );

-- Select * from employee;

-- CREATE TABLE manager (
-- 	ssn CHAR(9) PRIMARY KEY,
-- 	name VARCHAR(100) NOT NULL,
-- 	address VARCHAR(255),
-- 	hotel_address VARCHAR(255),
-- 	FOREIGN KEY (hotel_address) REFERENCES hotel(address),
-- 	FOREIGN KEY (ssn) REFERENCES employee(ssn)
-- );


-- CREATE TABLE rooms (
-- 	room_num INT CHECK(room_num>0),
-- 	address VARCHAR(255),
-- 	price DECIMAL(10,2),
-- 	amenities VARCHAR(100),
-- 	capacity VARCHAR(12) CHECK(capacity IN ('single', 'double', 'queen', 'double queen', 'suite')),
-- 	view_type VARCHAR(8) CHECK(view_type IN ('sea', 'mountain')),
-- 	damages VARCHAR(255),
-- 	extendible BOOLEAN,
-- 	PRIMARY KEY(room_num, address),
-- 	FOREIGN KEY (address) REFERENCES hotel(address)
-- );




-- CREATE TABLE customer (
-- 	ssn CHAR(9) PRIMARY KEY,
-- 	name VARCHAR(100) NOT NULL,
-- 	address VARCHAR(255),
-- 	registration_date DATE CHECK (registration_date<=current_date)

-- );


-- CREATE TABLE renting(
-- 	renting_ID VARCHAR(10) CHECK (renting_ID ~ '^r\d{9}$') PRIMARY KEY,
-- 	start_date DATE CHECK (start_date<=current_date),
-- 	end_date DATE CHECK(end_date > start_date),
-- 	price DECIMAL(10,2),
-- 	customer_ssn CHAR(9),
-- 	room_num INT CHECK(room_num>0),
-- 	address VARCHAR(255),
	
-- 	FOREIGN KEY (room_num, address) REFERENCES rooms(room_num, address), --made address here because it is composite primary key in rooms relation
-- 	FOREIGN KEY (customer_ssn) REFERENCES customer(ssn)
	
-- 	);

-- CREATE TABLE booking(
-- 	booking_ID VARCHAR(10) CHECK (booking_ID ~ '^b\d{9}$') PRIMARY KEY,
-- 	start_date DATE CHECK (start_date<=current_date),
-- 	end_date DATE CHECK(end_date > start_date),
-- 	price DECIMAL(10,2),
-- 	customer_ssn CHAR(9),
-- 	room_num INT CHECK(room_num>0),
-- 	address VARCHAR(255),
	
-- 	FOREIGN KEY (room_num, address) REFERENCES rooms(room_num, address), --made address here because it is composite primary key in rooms relation
-- 	FOREIGN KEY (customer_ssn) REFERENCES customer(ssn)
	
-- 	);

-- CREATE TABLE makes(
-- 	ssn CHAR(9),
-- 	booking_ID VARCHAR(10),
-- 	PRIMARY KEY(ssn,booking_ID),
-- 	FOREIGN KEY (ssn) REFERENCES customer(ssn), --If customer deleted booking also deleted --> do we need that
-- 	FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID) --If booking deleted relationship also deleted --> do we need that
-- );

-- CREATE TABLE archives(
-- 	archive_ID VARCHAR(9) CHECK (archive_ID ~ '^[br]\d{9}$') PRIMARY KEY,
-- 	start_time TIME CHECK (start_time<=current_time),
-- 	end_time TIME CHECK(end_time > start_time),
-- 	price DECIMAL(10,2),
-- 	customer_SSN VARCHAR(9),
-- 	archive_type VARCHAR(7) CHECK(archive_type IN ('renting', 'booking')),
-- 	renting_ID VARCHAR(10), --didn't add conditions
-- 	booking_ID VARCHAR(10),
-- 	FOREIGN KEY (renting_ID) REFERENCES renting(renting_ID), --If customer deleted booking also deleted --> do we need that
-- 	FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID),
-- 	FOREIGN KEY (customer_ssn) REFERENCES customer(ssn)
-- 	);

-- CREATE TABLE transforms_br(
-- 	employee_ssn CHAR(9),
-- 	renting_ID VARCHAR(10),
-- 	booking_ID VARCHAR(10),
-- 	FOREIGN KEY (renting_ID) REFERENCES renting(renting_ID), --If customer deleted booking also deleted --> do we need that
-- 	FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID),
-- 	FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
-- 	PRIMARY KEY(employee_ssn,renting_ID,booking_ID)
-- 	);

-- CREATE TABLE creates(
-- 	employee_ssn CHAR(9),
-- 	customer_ssn VARCHAR(9),
-- 	renting_ID VARCHAR(10),
-- 	FOREIGN KEY(customer_ssn) REFERENCES customer(ssn),
-- 	FOREIGN KEY (renting_ID) REFERENCES renting(renting_ID), --If customer deleted booking also deleted --> do we need that
-- 	FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
-- 	PRIMARY KEY(employee_ssn,renting_ID,customer_ssn)
-- 	);
	



--//////////////////////NOT COMMENTED OUT///////////////////////////////


CREATE TABLE employee (
 	ssn CHAR(9) PRIMARY KEY,
 	name VARCHAR(100) NOT NULL,
 	address VARCHAR(255),
 	hotel_address VARCHAR(255),
 	FOREIGN KEY (hotel_address) REFERENCES hotel(address)
);

CREATE TABLE manager (
	ssn CHAR(9) PRIMARY KEY,
 	name VARCHAR(100) NOT NULL,
 	address VARCHAR(255),
 	hotel_address VARCHAR(255),
 	FOREIGN KEY (hotel_address) REFERENCES hotel(address),
 	FOREIGN KEY (ssn) REFERENCES employee(ssn)
);

CREATE TABLE customer (
 	ssn CHAR(9) PRIMARY KEY,
 	name VARCHAR(100) NOT NULL,
 	address VARCHAR(255),
 	registration_date DATE CHECK (registration_date<=current_date)
);

 CREATE TABLE renting(
 	renting_ID VARCHAR(10) CHECK (renting_ID ~ '^r\d{9}$') PRIMARY KEY,
 	start_date DATE CHECK (start_date<=current_date),
 	end_date DATE CHECK(end_date > start_date),
 	price DECIMAL(10,2),
 	customer_ssn CHAR(9),
 	room_num INT CHECK(room_num>0),
 	address VARCHAR(255),
	
 	FOREIGN KEY (room_num, address) REFERENCES rooms(room_num, address), --made address here because it is composite primary key in rooms relation
 	FOREIGN KEY (customer_ssn) REFERENCES customer(ssn)
 );

CREATE TABLE booking(
 	booking_ID VARCHAR(10) CHECK (booking_ID ~ '^b\d{9}$') PRIMARY KEY,
 	start_date DATE CHECK (start_date<=current_date),
 	end_date DATE CHECK(end_date > start_date),
 	price DECIMAL(10,2),
 	customer_ssn CHAR(9),
 	room_num INT CHECK(room_num>0),
 	address VARCHAR(255),
	
 	FOREIGN KEY (room_num, address) REFERENCES rooms(room_num, address), --made address here because it is composite primary key in rooms relation
 	FOREIGN KEY (customer_ssn) REFERENCES customer(ssn)
);

 CREATE TABLE makes(
 	ssn CHAR(9),
 	booking_ID VARCHAR(10),
 	PRIMARY KEY(ssn,booking_ID),
 	FOREIGN KEY (ssn) REFERENCES customer(ssn), --If customer deleted booking also deleted --> do we need that
 	FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID) --If booking deleted relationship also deleted --> do we need that
);

CREATE TABLE archives(
 	archive_ID VARCHAR(9) CHECK (archive_ID ~ '^[br]\d{9}$') PRIMARY KEY,
 	start_time TIME CHECK (start_time<=current_time),
 	end_time TIME CHECK(end_time > start_time),
 	price DECIMAL(10,2),
 	customer_SSN VARCHAR(9),
 	archive_type VARCHAR(7) CHECK(archive_type IN ('renting', 'booking')),
 	renting_ID VARCHAR(10), --didn't add conditions
 	booking_ID VARCHAR(10),
 	FOREIGN KEY (renting_ID) REFERENCES renting(renting_ID), --If customer deleted booking also deleted --> do we need that
 	FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID),
 	FOREIGN KEY (customer_ssn) REFERENCES customer(ssn)
);

CREATE TABLE transforms_br(
 	employee_ssn CHAR(9),
 	renting_ID VARCHAR(10),
 	booking_ID VARCHAR(10),
 	FOREIGN KEY (renting_ID) REFERENCES renting(renting_ID), --If customer deleted booking also deleted --> do we need that
 	FOREIGN KEY (booking_ID) REFERENCES booking(booking_ID),
 	FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
 	PRIMARY KEY(employee_ssn,renting_ID,booking_ID)
);

CREATE TABLE creates(
 	employee_ssn CHAR(9),
 	customer_ssn VARCHAR(9),
 	renting_ID VARCHAR(10),
 	FOREIGN KEY(customer_ssn) REFERENCES customer(ssn),
 	FOREIGN KEY (renting_ID) REFERENCES renting(renting_ID), --If customer deleted booking also deleted --> do we need that
 	FOREIGN KEY (employee_ssn) REFERENCES employee(ssn),
 	PRIMARY KEY(employee_ssn,renting_ID,customer_ssn)
);




--////////////////////////////// INPUTS ///////////////////////////////

INSERT INTO hotel_chain (address, email, num_of_hotels) VALUES
('500 Park Ave, New York, NY', 'info@grandhotels.com', 12),
('1200 Sunset Blvd, Los Angeles, CA', 'contact@skylinehotels.com', 10),
('300 Ocean Dr, Miami Beach, FL', 'support@seasidehotels.com', 9),
('800 Mountain Way, Denver, CO', 'hello@mountainlodges.com', 8),
('950 Bayfront Rd, San Francisco, CA', 'reservations@sunsetresorts.com', 11);

INSERT INTO hotel (address, num_of_rooms, email, stars, chain_address) VALUES
-- Grand Hotels (New York) - 12 Hotels
('10 Madison Ave, New York, NY', 50, 'madison@grandhotels.com', 5, '500 Park Ave, New York, NY'),
('250 Broadway, New York, NY', 60, 'broadway@grandhotels.com', 4, '500 Park Ave, New York, NY'),
('35 Central Park West, New York, NY', 70, 'cpw@grandhotels.com', 5, '500 Park Ave, New York, NY'),
('89 Lexington Ave, New York, NY', 55, 'lexington@grandhotels.com', 4, '500 Park Ave, New York, NY'),
('15 Fifth Ave, New York, NY', 65, 'fifth@grandhotels.com', 5, '500 Park Ave, New York, NY'),
('78 Hudson St, New York, NY', 40, 'hudson@grandhotels.com', 3, '500 Park Ave, New York, NY'),
('33 Wall St, New York, NY', 45, 'wall@grandhotels.com', 4, '500 Park Ave, New York, NY'),
('60 Riverside Dr, New York, NY', 50, 'riverside@grandhotels.com', 5, '500 Park Ave, New York, NY'),
('99 Empire State Plaza, New York, NY', 55, 'empire@grandhotels.com', 5, '500 Park Ave, New York, NY'),
('432 Park Ave, New York, NY', 75, 'park432@grandhotels.com', 5, '500 Park Ave, New York, NY'),
('21 Brooklyn Bridge Blvd, Brooklyn, NY', 65, 'brooklyn@grandhotels.com', 4, '500 Park Ave, New York, NY'),
('500 Broadway, New York, NY', 80, 'broadway500@grandhotels.com', 5, '500 Park Ave, New York, NY'),

-- Skyline Hotels (Los Angeles) - 10 Hotels
('100 Hollywood Blvd, Los Angeles, CA', 50, 'hollywood@skylinehotels.com', 4, '1200 Sunset Blvd, Los Angeles, CA'),
('555 Beverly Hills Dr, Beverly Hills, CA', 60, 'beverly@skylinehotels.com', 5, '1200 Sunset Blvd, Los Angeles, CA'),
('777 Rodeo Dr, Los Angeles, CA', 70, 'rodeo@skylinehotels.com', 4, '1200 Sunset Blvd, Los Angeles, CA'),
('888 Melrose Ave, Los Angeles, CA', 55, 'melrose@skylinehotels.com', 5, '1200 Sunset Blvd, Los Angeles, CA'),
('909 Wilshire Blvd, Los Angeles, CA', 65, 'wilshire@skylinehotels.com', 4, '1200 Sunset Blvd, Los Angeles, CA'),
('112 Sunset Plaza, Los Angeles, CA', 40, 'sunsetplaza@skylinehotels.com', 3, '1200 Sunset Blvd, Los Angeles, CA'),
('42 Vine St, Los Angeles, CA', 45, 'vine@skylinehotels.com', 5, '1200 Sunset Blvd, Los Angeles, CA'),
('25 Mulholland Dr, Los Angeles, CA', 50, 'mulholland@skylinehotels.com', 4, '1200 Sunset Blvd, Los Angeles, CA'),
('310 Pacific Coast Hwy, Malibu, CA', 60, 'malibu@skylinehotels.com', 5, '1200 Sunset Blvd, Los Angeles, CA'),
('999 Echo Park Ave, Los Angeles, CA', 75, 'echopark@skylinehotels.com', 4, '1200 Sunset Blvd, Los Angeles, CA'),

-- Seaside Hotels (Miami Beach) - 9 Hotels
('1 Ocean Dr, Miami Beach, FL', 60, 'ocean@seasidehotels.com', 5, '300 Ocean Dr, Miami Beach, FL'),
('155 Collins Ave, Miami Beach, FL', 75, 'collins@seasidehotels.com', 4, '300 Ocean Dr, Miami Beach, FL'),
('230 Bayshore Dr, Miami Beach, FL', 90, 'bayshore@seasidehotels.com', 5, '300 Ocean Dr, Miami Beach, FL'),
('305 Biscayne Blvd, Miami, FL', 65, 'biscayne@seasidehotels.com', 4, '300 Ocean Dr, Miami Beach, FL'),
('789 Palm Ave, Miami Beach, FL', 50, 'palm@seasidehotels.com', 5, '300 Ocean Dr, Miami Beach, FL'),
('600 South Beach Rd, Miami Beach, FL', 55, 'southbeach@seasidehotels.com', 4, '300 Ocean Dr, Miami Beach, FL'),
('999 Key Biscayne Blvd, Key Biscayne, FL', 70, 'keybiscayne@seasidehotels.com', 5, '300 Ocean Dr, Miami Beach, FL'),
('345 Flamingo Dr, Miami Beach, FL', 45, 'flamingo@seasidehotels.com', 3, '300 Ocean Dr, Miami Beach, FL'),
('777 Pier Ave, Miami Beach, FL', 80, 'pier@seasidehotels.com', 5, '300 Ocean Dr, Miami Beach, FL'),

-- Mountain Lodges (Denver) - 8 Hotels
('15 Alpine Way, Aspen, CO', 45, 'aspen@mountainlodges.com', 5, '800 Mountain Way, Denver, CO'),
('222 Summit Ave, Boulder, CO', 55, 'boulder@mountainlodges.com', 4, '800 Mountain Way, Denver, CO'),
('333 Snowy Peak Rd, Vail, CO', 50, 'vail@mountainlodges.com', 5, '800 Mountain Way, Denver, CO'),
('44 Pine Lodge Rd, Breckenridge, CO', 40, 'breckenridge@mountainlodges.com', 4, '800 Mountain Way, Denver, CO'),
('777 Rocky Trail, Estes Park, CO', 60, 'estespark@mountainlodges.com', 5, '800 Mountain Way, Denver, CO'),
('999 Winter Park Rd, Winter Park, CO', 70, 'winterpark@mountainlodges.com', 5, '800 Mountain Way, Denver, CO'),
('555 Bear Creek Dr, Durango, CO', 65, 'durango@mountainlodges.com', 4, '800 Mountain Way, Denver, CO'),
('808 Mountain High Rd, Telluride, CO', 55, 'telluride@mountainlodges.com', 5, '800 Mountain Way, Denver, CO'),

-- Sunset Resorts (San Francisco) - 11 Hotels
('700 Golden Gate Ave, San Francisco, CA', 60, 'goldengate@sunsetresorts.com', 5, '950 Bayfront Rd, San Francisco, CA'),
('505 Marina Blvd, San Francisco, CA', 50, 'marina@sunsetresorts.com', 4, '950 Bayfront Rd, San Francisco, CA'),
('333 Fisherman’s Wharf, San Francisco, CA', 75, 'wharf@sunsetresorts.com', 5, '950 Bayfront Rd, San Francisco, CA'),
('88 Twin Peaks Rd, San Francisco, CA', 70, 'twinpeaks@sunsetresorts.com', 4, '950 Bayfront Rd, San Francisco, CA'),
('999 Lombard St, San Francisco, CA', 55, 'lombard@sunsetresorts.com', 5, '950 Bayfront Rd, San Francisco, CA'),
('222 Pier 39, San Francisco, CA', 80, 'pier39@sunsetresorts.com', 5, '950 Bayfront Rd, San Francisco, CA'),
('777 Nob Hill Rd, San Francisco, CA', 65, 'nobhill@sunsetresorts.com', 4, '950 Bayfront Rd, San Francisco, CA'),
('420 Ocean Beach Ave, San Francisco, CA', 50, 'oceanbeach@sunsetresorts.com', 4, '950 Bayfront Rd, San Francisco, CA'),
('600 Alcatraz View Rd, San Francisco, CA', 55, 'alcatraz@sunsetresorts.com', 5, '950 Bayfront Rd, San Francisco, CA'),
('900 Castro St, San Francisco, CA', 70, 'castro@sunsetresorts.com', 4, '950 Bayfront Rd, San Francisco, CA'),
('300 Haight-Ashbury Blvd, San Francisco, CA', 45, 'haight@sunsetresorts.com', 3, '950 Bayfront Rd, San Francisco, CA');

-- ***** For Rooms Please refer to addRooms.py *****
