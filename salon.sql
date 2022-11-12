/* John 3:16 */
CREATE TABLE customer(
	customer_id			VARCHAR(15) PRIMARY KEY,
	first_name			VARCHAR(20),
	last_name			VARCHAR(20),
	has_membership		VARCHAR(1)  DEFAULT 'N',
	order_id				VARCHAR(10)	UNIQUE,
	phone_number		VARCHAR(16)
);


INSERT INTO customer VALUES
	('C89328', 'George', 'Timothy', 'N', 'O1128', '214-834-1108'),
	('C10901', 'Paul', 'James', 'Y', 'O1198', '469-678-2183'),
	('C89243', 'Simon', 'Carter', 'Y', 'O2132', '345-212-1232'),
	('C89913', 'Merlyn', 'Paula', 'N', 'O3923', '214-928-1000'),
	('C94394', 'Kivy', 'Matt', 'Y', 'O4634', '548-128-2291'),
	('C87323', 'Kite', 'Patty', 'N', 'O2321', '214-928-1099'),
	('C23932', 'Monica', 'Kite', 'Y', 'O9899', '568-110-1189'),
	('C49733', 'Hanna', 'Avery', 'Y', 'O7293', '938-129-4389'),
	('C93922', 'Kevin', 'Parker', 'N', 'O7289', '458-109-9991'),
	('C29737', 'Nicholas', 'Pager', 'Y', 'O8632', '542-017-1110'),
	('C32932', 'Joshua', 'Peter', 'N', 'O6432', '456-690-1108'),
	('C88988', 'Navish', 'Kendal', 'Y', 'O8348', '234-190-1190'),
	('C93023', 'Grene', 'Leon', 'Y', 'O4932', '234-110-1108'),
	('C23633', 'Tarks', 'Kole', 'N', 'O9328', '109-029-1129'),
	('C01192', 'Kardell', 'Link', 'Y', 'O3283', '101-117-1778'),
	('C11872', 'Parker', 'Bill', 'Y', 'O7771', '213-120-9999'),
	('C10182', 'Jones', 'Beav', 'N', 'O2812', '456-110-1098'),
	('C20199', 'Brandy', 'Corner', 'N', 'O9383', '318-091-1109'),
	('C83493', 'Parken', 'Jones', 'Y', 'O2364', '782-329-2349'),
	('C99000', 'Kindel', 'Menz', 'N', 'O3262', '326-192-1000'),
	('C63820', 'Kevin', 'Gates', 'N', 'O4352', '219-110-1019'),
	('C82473', 'Leo', 'Bobs', 'N', 'O6531', '219-293-2821'),
	('C80010', 'John', 'Gates', 'Y', 'O0110', '122-119-7800'),
	('C90099', 'Jacob', 'Marker', 'Y', 'O8122', '271-192-1992'),
	('C00182', 'Keyna', 'Barber', 'N', 'O3939', '217-182-1929'),
	('C10898', 'Patter', 'Jones', 'N', 'O6436', '283-239-1109'),
	('C00991', 'Mario', 'Patterns', 'Y', 'O0922', '218-198-1900'),
	('C00109', 'Luis', 'Jacob', 'N', 'O8393', '110-910-1101'),
	('C09202', 'Kate', 'Happy', 'Y', 'O8821', '111-090-1100'),
	('C19827', 'Joshua', 'Peter', 'N', 'O0189', '456-690-1108'),
	('C01980', 'Navish', 'Kendal', 'Y', 'O1090', '234-190-1190'),
	('C87329', 'Paul', 'James', 'Y', 'O0091', '469-678-2183'),
	('C09389', 'Simon', 'Carter', 'Y', 'O9271', '345-212-1232'),
	('C10920', 'James', 'Patner', 'Y', 'O0917', '456-789-1109'),
	('C09283', 'Merlyn', 'Paula', 'N', 'O3100', '214-928-1000');
	('C78833', 'Kernal', 'Brown', 'Y', 'O3400', '212-200-1009'),
	('C73023', 'Barbara', 'Patt', 'N', 'O4001', '251-192-1092'),
	('C63282', 'Kate', 'Patty', 'N', 'O9278', '213-198-1099'),
	('C80000', 'Josh', 'Perry', 'Y', 'O0081', '461-198-1929'),
	('C01797', 'Paren', 'Sore', 'N', 'O8009', '345-901-1029'),
	('C67333', 'Jaren', 'Martinez', 'Y', 'O8371', '102-209-1029'),
	('C89900', 'Lauren', 'Baker', 'N', 'O9291', '234-109-1109');


SELECT * FROM customer
ORDER BY first_name;

CREATE TABLE brand(
	brand_id			VARCHAR(10) PRIMARY KEY,
	brand_name		VARCHAR(30),
	revenue			DOUBLE DEFAULT 0.00
);


SELECT * FROM brand;

INSERT INTO brand(brand_id, brand_name) VALUES
	('B1182', 'Olive Branch'),
	('B2109', 'Coco Bananas'),
	('B1932', 'Jobo Bojo'),
	('B1893', 'Argon Scents'),
	('B2323', 'Caramel Crayonz');

CREATE TABLE salon(
	salon_id			VARCHAR(10) PRIMARY KEY,
	salon_name		VARCHAR(25) DEFAULT 'Not Named',
	city				VARCHAR(30) NOT NULL,
	state				VARCHAR(30) NOT NULL
);

INSERT INTO salon VALUES
	('S172', 'Curls of Curls', 'Austin', 'TX'),
	('S178', 'Hair Fundamemtals', 'Dallas', 'TX'),
	('S129', 'Full of Coils', 'New Orleans', 'LA'),
	('S236', 'Olive Sisters', 'Bossier City', 'LA'); 
	
SELECT * FROM salon;

CREATE TABLE management(
	manage_id		VARCHAR(5) PRIMARY KEY,
	manager_name   VARCHAR(30) NOT NULL,
	salon_id			VARCHAR(10) UNIQUE,
	FOREIGN KEY(salon_id) REFERENCES salon(salon_id) ON DELETE CASCADE
);

INSERT INTO management VALUES
	('M118', 'Samuel Parker', 'S172'),
	('M184', 'Jones Coins', 'S178'),
	('M923', 'Pauline Sam', 'S129'),
	('M912', 'Michelle Pink', 'S236');

CREATE TABLE staff(
	staff_id			VARCHAR(10) PRIMARY KEY,
	first_name		VARCHAR(20) NOT NULL,
	last_name		VARCHAR(20) NOT NULL,
	salary			DOUBLE DEFAULT 29500 CHECK (salary <= 100000),
	manage_id		VARCHAR(5),
	job_pos			VARCHAR(20),
	clock_in			TIME,
	clock_out		TIME,
	FOREIGN KEY(manage_id) REFERENCES management(manage_id)
);	

/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

/* LOOK HERE */
/* Add more employees to these tables 

- In each insert
	The manager_id must MATCH
	The clock_in and clock_out times
	must be CONSISTENT

*/
/**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**//**/

INSERT INTO staff VALUES
	('W12973', 'Shira', 'Jones', 30300.50, 'M118', 'Cashier', '080000', '130000'),
	('W11958', 'Pauline', 'Georgia', 25899.99, 'M118', 'Cleaner', '080000', '120000'),
	('W83244', 'George', 'Paul', 34000.99, 'M118', 'Cleaner', '130000', '160000'),
	('W82338', 'Mark', 'Josh', 60000.00, 'M118', 'Jr. Manager', '080000', '130000'),
	('W93298', 'Elizabeth', 'Park', 62000.00, 'M118', 'Jr. Manager', '130000', '160000');

	
INSERT INTO staff VALUES
	('W43942', 'Yonder', 'Kandle', 61000.00, 'M184', 'Jr. Manager', '080000', '120000'),
	('W23932', 'Beth', 'Kindle', 63000.00, 'M184', 'Jr. Manager', '120000', '150000'),
	('W83923', 'Merlin', 'Tree', 35000.00, 'M184', 'Cashier', '080000', '120000'),
	('W29392', 'Yira', 'Prone', 32000.99, 'M184', 'Cashier', '120000', '150000'),
	('W83423', 'Leo', 'Talker', 40500.00, 'M184', 'Stocker', '120000', '150000'),
	('W28989', 'Launa', 'Prone', 31900.99, 'M184', 'Stocker', '080000', '110000'),
	('W89123', 'Rema', 'Crystal', 45000.00, 'M184', 'Stylist', '080000', '120000'),
	('W93288', 'Paula', 'Orlando', 42000.00, 'M184', 'Stylist', '120000', '150000'); 


SELECT * FROM staff;
	
INSERT INTO staff VALUES
	('W98238', 'Monice', 'Booker', 28330.99, 'M923', 'Cashier', '070000', '110000'),
	('W93287', 'Panya', 'Martinez', 31000.99, 'M923', 'Cashier', '110000', '170000'),
	('W54430', 'Karly', 'Paula', 29500.99, 'M923', 'Stocker', '070000', '110000'),
	('W68963', 'Willow', 'Johnson', 30500.00, 'M923', 'Stocker', '110000', '170000'),
	('W92743', 'Laura', 'Penny', 60500.00, 'M923', 'Jr. Manager', '070000', '130000'),
	('W49823', 'Perine', 'Penson', 55000.00, 'M923', 'Jr. Manager', '130000', '170000'),
	('W92492', 'Lizz', 'Karline', 45000.00, 'M923', 'Stylist', '070000', '110000'),
	('W38923', 'Grace', 'Harline', 42000.00, 'M923', 'Stylist', '110000', '170000');
	
INSERT INTO staff VALUES
	('W93293', 'Georgia', 'Bensen', 29000.00, 'M912', 'Cashier', '070000', '120000'),
	('W32878', 'Jessica', 'Pauline', 35000.00, 'M912', 'Cashier', '120000', '150000'),
	('W43932', 'Havanna', 'Brace', 33000.00, 'M912', 'Cleaner', '070000', '120000'),
	('W83231', 'Kora', 'Mauren', 34000.00, 'M912', 'Cleaner', '120000', '150000'),
	('W83929', 'Laurna', 'Mist', 70000.00, 'M912', 'Jr. Manager', '070000', '120000'),
	('W39232', 'Raula', 'Bail', 65000.00, 'M912', 'Jr. Manager', '120000', '150000'),
	('W29393', 'Abagail', 'Rain', 40000.00, 'M912', 'Stylist', '070000', '120000'),
	('W92833', 'Megan', 'Kite', 40000.00, 'M912', 'Stylist', '120000', '150000');  
	
SELECT * FROM staff
WHERE manage_id = 'M184';


CREATE TABLE product(
	product_id			VARCHAR(20) PRIMARY KEY,
	product_name		VARCHAR(40) NOT NULL,
	price					DOUBLE NOT NULL,
	brand_id				VARCHAR(20),	
	salon_id				VARCHAR(10),
	FOREIGN KEY(brand_id) REFERENCES brand(brand_id) ON DELETE CASCADE,
	FOREIGN KEY(salon_id) REFERENCES salon(salon_id)
);



INSERT INTO product VALUES
	('P9121', 'Olive Conditioner 2L', 15.99, 'B1182', 'S172'),
	('P9323', 'Olive Conditioner 1L', 8.99, 'B1182', 'S172'),
	('P9122', 'Extra Virgin Olive Oil 1L', 20.99, 'B1182', 'S172'),
	('P4585', 'Pure Olive Oil 1L', 14.99, 'B1932', 'S178'),
	('P1323', 'Peeled Banana Mask', 3.99, 'B2109', 'S178'),
	('P3282', 'Coconut Shampoo 2L', 5.99, 'B2109', 'S172'),
	('P5923', 'Joboja Oil 1L', 7.99, 'B1932', 'S172'),
	('P5233', 'Joboja Oil 2L', 14.99, 'B1932', 'S178'),
	('P5883', 'Pure Jamaican Oil 1L', 5.99, 'B1932', 'S178'),
	('P4384', 'Orange Peel Mask', 3.99, 'B1932', 'S172'),
	('P7893', 'Argon Oil 1L', 20.99, 'B1893', 'S172'),
	('P8238', 'Argon Oil 2L', 25.99, 'B1893', 'S172'),
	('P9898', 'Argon Oil 3L', 30.99, 'B1893', 'S172'),
	('P2387', 'Argon Oil 1L', 20.99, 'B1893', 'S178'),
	('P8423', 'Argon Oil 2L', 25.99, 'B1893', 'S178'),
	('P9128', 'Lavendar Conditioner 1L', 20.99, 'B2323', 'S172'),
	('P3826', 'Lavendar Conditioner 2L', 25.99, 'B2323', 'S172'),
	('P2633', 'Lavendar Conditioner 1L', 20.99, 'B2323', 'S178'),
	('P4842', 'Lavendar Conditioner 2L', 25.99, 'B2323', 'S178'),
	('P3278', 'Black Bean Mask', 2.99, 'B2109', 'S172'),
	('P3623', 'Rosemary Wipe Mask', 1.99, 'B2323', 'S172'),
	('P3923', 'Black Bean Mask', 3.99, 'B2109', 'S178'),
	('P2923', 'Rosemary Wipe Mask', 2.99, 'B2323', 'S178'),
	('P3729', 'Sunflower Conditioner', 12.99, 'B1932', 'S172'),
	('P8233', 'Blueberry Oil 1L', 5.99, 'B2109', 'S178'),
	('P9472', 'Blueberry Oil 2L', 5.99, 'B2109', 'S172'),
	('P3293', 'Coconut Hair Styler', 10.99, 'B2109', 'S172'),
	('P8443', 'Coconut Hair Styler', 10.99, 'B2109', 'S178'),	
	('P2378', 'Blackberry Oil 1L', 5.99, 'B2109', 'S178'),
	('P3287', 'Blackberry Oil 2L', 10.99, 'B2109', 'S172'),
	('P3290', 'Argon Oil 2L', 26.99, 'B1893', 'S129'),
	('P9234', 'Argon Oil 3L', 31.99, 'B1893', 'S129'),
	('P8348', 'Argon Oil 1L', 15.99, 'B1893', 'S236'),
	('P8489', 'Argon Oil 2L', 26.99, 'B1893', 'S236'),
	('P7210', 'Lavendar Conditioner 1L', 21.99, 'B2323', 'S129'),
	('P8120', 'Lavendar Conditioner 2L', 24.99, 'B2323', 'S129'),
	('P3682', 'Lavendar Conditioner 1L', 19.99, 'B2323', 'S236'),
	('P0909', 'Lavendar Conditioner 2L', 24.99, 'B2323', 'S236'),
	('P8323', 'Coconut Hair Styler', 11.99, 'B2109', 'S129'),
	('P2337', 'Extra Virgin Olive Oil 1L', 21.99, 'B1182', 'S236'),
	('P9324', 'Pure Olive Oil 1L', 14.99, 'B1932', 'S236'),
	('P6238', 'Peeled Banana Mask', 3.99, 'B2109', 'S129'),
	('P8239', 'Rosemary Wipe Mask', 4.99, 'B2323', 'S236'),
	('P2364', 'Black Bean Mask', 3.99, 'B2109', 'S236'),
	('P2632', 'Rosemary Wipe Mask', 3.99, 'B2323', 'S129'),
	('P3792', 'Sunflower Conditioner', 11.99, 'B1932', 'S129');

SELECT * FROM product;

/* Create orders */

CREATE TABLE orders(
	order_id				VARCHAR(10) PRIMARY KEY,
	product_id			VARCHAR(10) NOT NULL,
	salon_id				VARCHAR(10) NOT NULL,		
	quantity				INT NOT NULL,		
	total_price			DOUBLE DEFAULT 0.00,
	FOREIGN KEY( product_id ) REFERENCES product( product_id ) ON DELETE CASCADE,
	FOREIGN KEY( salon_id ) REFERENCES salon( salon_id ) ON DELETE CASCADE
);

SELECT * FROM orders;

/* Add orders */
INSERT INTO orders(order_id, product_id, salon_id, quantity) VALUES
	('O1128', 'P9121', 'S172', 2),
	('O1198', 'P5233', 'S178', 5),
	('O2132', 'P5883', 'S178', 3),
	('O2321', 'P9121', 'S172', 1),
	('O4634', 'P8423', 'S178', 4),
	('O4312', 'P3682', 'S236', 3),
	('O3923', 'P8423', 'S178', 3),
	('O9899', 'P8239', 'S236', 3),
	('O7293', 'P7210', 'S129', 5),
	('O7289', 'P9472', 'S172', 2),
	('O8632', 'P8239', 'S236', 3),
	('O6432', 'P2632', 'S129', 2),
	('O8348', 'P2337', 'S236', 1),
	('O4932', 'P8120', 'S129', 2),
	('O9328', 'P8239', 'S236', 3),
	('O9323','P8239', 'S236', 3),
	('O7829','P3826', 'S172', 3),
	('O7827','P9324', 'S236', 1),
	('O1161','P2632', 'S129', 2),
	('O7891','P2632', 'S129', 3),
	('O5317','P3792', 'S129', 5),
	('O7311','P2632', 'S129', 4),
	('O0871','P3792', 'S129', 5),
	('O1001','P2632', 'S129', 5),
	('O3283','P9234', 'S129', 2),
	('O7771','P3293', 'S172', 3),
	('O2812','P8120', 'S129', 4),
	('O9383','P2337', 'S236', 2),
	('O2364','P9324', 'S236', 4),
	('O3262','P6238', 'S129', 1),
	('O4352','P3792', 'S129', 6),
	('O6531','P4384', 'S172', 3),
	('O0110','P3282', 'S172', 1),
	('O3910','P9234', 'S129', 6),
	('O6436','P8120','S129', 3),
	('O0922','P2378','S178', 2),
	('O8393','P8120','S129', 1),
	('O8821','P9324','S236', 3),
	('O0189','P2364','S236', 3),
	('O1090','P8120','S129', 5),
	('O0091','P7210','S129', 3),
	('O9271','P8120','S129', 4),
	('O0917','P3293','S172', 2),
	('O3100','P3623','S172', 4),
	('O3400','P5883','S178', 4),
	('O4001','P8120','S129', 2),
	('O9278','P3293','S172', 5),
	('O0081','P5883','S178', 3),
	('O8009','P2632','S129', 3),
	('O8371','P5883','S178', 8),
	('O9291','P6238','S129', 1);

SELECT * FROM orders;

/* Examples */

# Find all staff working for Jones Coins who have a salary
# less than 35,000
SELECT * FROM staff
INNER JOIN management ON management.manage_id = staff.manage_id
WHERE management.manager_name LIKE '%Coins' AND staff.salary < 35000;


# Select all the products made by Jobo Bojo
SELECT * FROM product
INNER JOIN brand ON brand.brand_id = product.brand_id
WHERE brand.brand_name LIKE '%Bojo%';


/* check products from each branch */
SELECT * FROM product
INNER JOIN salon ON salon.salon_id = product.salon_id
ORDER BY salon.salon_id; 



SELECT * FROM customer;

/* Shows order prices */
CREATE PROCEDURE showOrderTotals()
BEGIN
	SELECT orders.order_id, orders.product_id, orders.salon_id, orders.total_price 
	+ (product.price * orders.quantity)
	AS real_price,
	orders.quantity
	FROM orders INNER JOIN
	product ON product.product_id = orders.product_id;
END;

CALL showOrderTotals();

SELECT * FROM products;

