--INSERT INTO customer (ssn, name, address, registration_date) VALUES (123456789, 'John Doe', '123 Main St', '2018-01-01');
SELECT * FROM customer WHERE customer.ssn='123456789';