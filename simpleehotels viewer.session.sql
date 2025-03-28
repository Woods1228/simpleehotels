--INSERT INTO customer (ssn, name, address, registration_date) VALUES (123456789, 'John Doe', '123 Main St', '2018-01-01');
--SELECT * FROM customer WHERE customer.ssn='123456766';
--Select *
--From rooms
--Where (address, room_num) in(
--	SELECT address, room_num
--	From renting
--	Where current_date>= start_date and end_date>= current_date
--) or (address, room_num) in(
--	SELECT address, room_num
--	From booking
--	Where current_date>= start_date and end_date>= current_date
--);

SELECT MAX(CAST(SUBSTRING(booking_id, 2, 10) AS INTEGER)) AS max_booking_number
FROM archive;
--WHERE booking_id ~ '^b\\d{9}$';