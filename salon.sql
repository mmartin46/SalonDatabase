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
	('C94394', 'Paul', 'James', 'Y', 'O1198', '469-678-2183'),
	('C89243', 'Simon', 'Carter', 'Y', 'O2132', '345-212-1232'),
	('C72983', 'James', 'Patner', 'Y', 'O2321', '456-789-1109');


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
	('S178', 'Hair Fundamemtals', 'Dallas', 'TX');

CREATE TABLE management(
	manage_id		VARCHAR(5) PRIMARY KEY,
	manager_name   VARCHAR(30) NOT NULL,
	salon_id			VARCHAR(10) UNIQUE,
	FOREIGN KEY(salon_id) REFERENCES salon(salon_id) ON DELETE CASCADE
);

INSERT INTO management VALUES
	('M118', 'Samuel Parker', 'S172'),
	('M184', 'Jones Coins', 'S178');

CREATE TABLE staff(
	staff_id			VARCHAR(10) PRIMARY KEY,
	first_name		VARCHAR(20) NOT NULL,
	last_name		VARCHAR(20) NOT NULL,
	salary			DOUBLE DEFAULT 29500 CHECK (salary <= 100000),
	manage_id		VARCHAR(5),
	job_pos			VARCHAR(20),
	start_at			TIME,
	finish_by		TIME,
	FOREIGN KEY(manage_id) REFERENCES management(manage_id)
);	


INSERT INTO staff VALUES
	('W11958', 'Pauline', 'Georgia', 25899.99, 'M118', 'Cleaner', '080000', '120000'),
	('W12973', 'Shira', 'Jones', 30300.50, 'M118', 'Cashier', '080000', '130000'),
	('W29392', 'Yira', 'Prone', 32000.99, 'M184', 'Cashier', '120000', '150000'),
	('W28989', 'Launa', 'Prone', 31900.99, 'M184', 'Stocker', '090000', '110000'),
	('W83244', 'George', 'Paul', 34000.99, 'M118', 'Cleaner', '130000', '160000'),
	('W83423', 'Leo', 'Talker', 40500.00, 'M184', 'Stocker', '120000', '160000'); 


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
	('P4384', 'Orange Peel Mask', 3.99, 'B1932', 'S172');
	('P7893', 'Argon Oil 1L', 20.99, 'B1893', 'S172'),
	('P8238', 'Argon Oil 2L', 25.99, 'B1893', 'S172'),
	('P9898', 'Argon Oil 3L', 30.99, 'B1893', 'S172'),
	('P2387', 'Argon Oil 1L', 20.99, 'B1893', 'S178'),
	('P8423', 'Argon Oil 2L', 25.99, 'B1893', 'S178');

SELECT * FROM product;

/* Create orders */

CREATE TABLE orders(
	order_id				VARCHAR(10) PRIMARY KEY,
	product_id			VARCHAR(10),
	salon_id				VARCHAR(10),		
	quantity				INT NOT NULL,		
	total_price			DOUBLE DEFAULT 0.00,
	FOREIGN KEY( order_id ) REFERENCES customer( order_id ) ON DELETE CASCADE,
	FOREIGN KEY( salon_id ) REFERENCES salon( salon_id ) ON DELETE CASCADE
);


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

/* Add orders */
INSERT INTO orders(order_id, product_id, salon_id, quantity) VALUES
	('O1128', 'P9121', 'S172', 2),
	('O1198', 'P5233', 'S178', 5),
	('O2132', 'P5883', 'S178', 3),
	('O2321', 'P9121', 'S172', 1);

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

