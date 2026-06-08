CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15),
    registration_date DATE
);

CREATE TABLE addresses (
    address_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    address_type VARCHAR(20),
    city VARCHAR(50),
    state VARCHAR(50),
    pincode VARCHAR(10),
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

CREATE TABLE categories (
    category_id SERIAL PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL,
    parent_category_id INT,
    FOREIGN KEY (parent_category_id)
        REFERENCES categories(category_id)
);

CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    supplier_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);


CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    description TEXT,
    price DECIMAL(10,2) NOT NULL,
    stock_quantity INT NOT NULL,
    category_id INT,
    supplier_id INT,
    FOREIGN KEY (category_id)
        REFERENCES categories(category_id),
    FOREIGN KEY (supplier_id)
        REFERENCES suppliers(supplier_id)
);


CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    order_date DATE NOT NULL,
    order_status VARCHAR(50),
    total_amount DECIMAL(10,2),
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE order_items (
    order_item_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    unit_price DECIMAL(10,2) NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    payment_date DATE,
    payment_method VARCHAR(50),
    payment_status VARCHAR(50),
    amount DECIMAL(10,2),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);

CREATE TABLE shipments (
    shipment_id SERIAL PRIMARY KEY,
    order_id INT NOT NULL,
    shipment_date DATE,
    delivery_date DATE,
    shipment_status VARCHAR(50),
    FOREIGN KEY (order_id)
        REFERENCES orders(order_id)
);


CREATE TABLE reviews (
    review_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    review_text TEXT,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);



CREATE TABLE wishlist (
    wishlist_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    product_id INT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


CREATE TABLE cart (
    cart_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);


CREATE TABLE cart_items (
    cart_item_id SERIAL PRIMARY KEY,
    cart_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    FOREIGN KEY (cart_id)
        REFERENCES cart(cart_id),
    FOREIGN KEY (product_id)
        REFERENCES products(product_id)
);


CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100) NOT NULL,
    manager_id INT,
    salary DECIMAL(10,2),
    designation VARCHAR(100),
    FOREIGN KEY (manager_id)
        REFERENCES employees(employee_id)
);



INSERT INTO categories (category_id, category_name, parent_category_id)
VALUES
(1,'Electronics',NULL),
(2,'Mobiles',1),
(3,'Laptops',1),
(4,'Fashion',NULL),
(5,'Men Clothing',4),
(6,'Women Clothing',4);


INSERT INTO suppliers (supplier_id, supplier_name, email, phone)
VALUES
(1,'ABC Electronics','abc@gmail.com','9876543210'),
(2,'Tech World','tech@gmail.com','9876543211'),
(3,'Fashion Hub','fashion@gmail.com','9876543212');


INSERT INTO customers
(customer_id, customer_name, email, phone, registration_date)
VALUES
(1,'Rohan Reddy','rohan@gmail.com','9000000001','2025-01-10'),
(2,'Arjun Kumar','arjun@gmail.com','9000000002','2025-02-15'),
(3,'Priya Sharma','priya@gmail.com','9000000003','2025-03-20'),
(4,'Sneha Reddy','sneha@gmail.com','9000000004','2025-04-10'),
(5,'Rahul Verma','rahul@gmail.com','9000000005','2025-05-05');


INSERT INTO addresses
(address_id, customer_id, address_type, city, state, pincode)
VALUES
(1,1,'Home','Hyderabad','Telangana','500001'),
(2,2,'Home','Bangalore','Karnataka','560001'),
(3,3,'Home','Chennai','Tamil Nadu','600001'),
(4,4,'Home','Vijayawada','Andhra Pradesh','520001'),
(5,5,'Home','Mumbai','Maharashtra','400001');


INSERT INTO products
(product_id, product_name, description, price, stock_quantity, category_id, supplier_id)
VALUES
(1,'iPhone 15','Apple Mobile',80000,20,2,1),
(2,'Samsung S24','Samsung Mobile',70000,25,2,1),
(3,'Dell XPS','Laptop',95000,10,3,2),
(4,'HP Pavilion','Laptop',65000,15,3,2),
(5,'Men T-Shirt','Cotton Shirt',1000,100,5,3),
(6,'Women Kurti','Designer Kurti',1500,80,6,3);

INSERT INTO orders
(order_id, customer_id, order_date, order_status, total_amount)
VALUES
(1,1,'2025-06-01','Delivered',81000),
(2,2,'2025-06-02','Delivered',70000),
(3,3,'2025-06-03','Pending',65000),
(4,1,'2025-06-04','Shipped',2000),
(5,4,'2025-06-05','Delivered',96500);

INSERT INTO order_items
(order_item_id, order_id, product_id, quantity, unit_price)
VALUES
(1,1,1,1,80000),
(2,1,5,1,1000),
(3,2,2,1,70000),
(4,3,4,1,65000),
(5,4,5,2,1000),
(6,5,3,1,95000),
(7,5,6,1,1500);

INSERT INTO payments
(payment_id, order_id, payment_date, payment_method, payment_status, amount)
VALUES
(1,1,'2025-06-01','UPI','Success',81000),
(2,2,'2025-06-02','Credit Card','Success',70000),
(3,3,'2025-06-03','UPI','Pending',65000),
(4,4,'2025-06-04','Cash','Success',2000),
(5,5,'2025-06-05','Debit Card','Success',96500);


INSERT INTO shipments
(shipment_id, order_id, shipment_date, delivery_date, shipment_status)
VALUES
(1,1,'2025-06-02','2025-06-05','Delivered'),
(2,2,'2025-06-03','2025-06-06','Delivered'),
(3,3,'2025-06-04',NULL,'Processing'),
(4,4,'2025-06-05',NULL,'In Transit'),
(5,5,'2025-06-06','2025-06-09','Delivered');

INSERT INTO reviews
(review_id, customer_id, product_id, rating, review_text)
VALUES
(1,1,1,5,'Excellent phone'),
(2,2,2,4,'Good mobile'),
(3,4,3,5,'Great laptop'),
(4,3,4,3,'Average performance'),
(5,1,5,4,'Nice quality');


INSERT INTO wishlist
(wishlist_id, customer_id, product_id)
VALUES
(1,1,3),
(2,2,4),
(3,3,1),
(4,4,2),
(5,5,6);


INSERT INTO cart
(cart_id, customer_id)
VALUES
(1,1),
(2,2),
(3,3),
(4,4),
(5,5);


INSERT INTO cart_items
(cart_item_id, cart_id, product_id, quantity)
VALUES
(1,1,2,1),
(2,1,6,2),
(3,2,1,1),
(4,3,5,3),
(5,4,3,1),
(6,5,4,1);


INSERT INTO employees
(employee_id, employee_name, manager_id, salary, designation)
VALUES
(1,'Amit Sharma',NULL,120000,'CEO'),
(2,'Ravi Kumar',1,90000,'Manager'),
(3,'Priya Singh',1,85000,'Manager'),
(4,'Kiran Reddy',2,50000,'Developer'),
(5,'Neha Gupta',2,55000,'Developer'),
(6,'Arun Patel',3,45000,'Support');



-- 1. Display all customers.
select * from customers;


-- 2. Display all products costing above ₹5000. 
select * from products where price>5000;


-- 3  Display products with stock less than 10. 
select * from products;
select * from products where stock_quantity<10;

-- 4. Display all suppliers. 

select * from suppliers;

--  5. Display all completed orders. 

select * from orders;


select * from orders where order_status='Delivered';

--  6. Display orders placed this month. 

select * from orders where extract(month from order_date ) = 6;


-- 7. Display customers registered in the last 30 days. 

select * from customers;

select * from customers where registration_date >= CURRENT_DATE - INTERVAL '30 days';


-- 8. Display products sorted by price descending. 

select * from products;


select * from products 
order by price DESC;


-- 9. Display top 10 expensive products. 

select * from products 
order by price DESC
limit 10;


-- 10. Display all active shipments. 

select * from shipments;

select * from shipments where shipment_status not in ('Delivered','In Transit');


-- 11. find total customers
select count(*) as total_customers
from customers;

-- 12. find total products
select count(*) as total_products
from products;

-- 13. find average product price
select avg(price) as avg_product_price
from products;

-- 14. find highest priced product
select * from products
where price = (select max(price) from products);

-- 15. find lowest priced product
select * from products
where price = (select min(price) from products);

-- 16. find total revenue generated
select sum(total_amount) as total_revenue
from orders;

-- 17. find total orders placed
select count(*) as total_orders
from orders;

-- 18. find total stock available
select sum(stock_quantity) as total_stock
from products;

-- 19. find average order value
select avg(total_amount) as avg_order_value
from orders;

-- 20. find total payment received
select sum(amount) as total_payment_received
from payments;


-- 21. Find number of products category-wise. 
select * from products;

select count(product_name),category_id
from products
group by category_id;

-- 22. Find total sales category-wise. 

select *
from products ;


-- 24. find customer count city-wise
select city, count(*) as customer_count
from customers
group by city;

-- 25. find order count status-wise
select order_status, count(*) as order_count
from orders
group by order_status;

-- 26. find average rating product-wise
select product_id, avg(rating) as avg_rating
from reviews
group by product_id;

-- 27. find total products supplier-wise
select supplier_id, count(*) as total_products
from products
group by supplier_id;

-- 28. find shipment count status-wise
select shipment_status, count(*) as shipment_count
from shipments
group by shipment_status;

-- 29. find total payments method-wise
select payment_method, sum(amount) as total_payments
from payments
group by payment_method;

-- 30. Find monthly sales report. 

select * from orders;


select extract(month from order_date) as month,
       sum(total_amount) as total_sales
from orders
group by extract(month from order_date)
order by month;



-- 31. display categories having more than 20 products
select category_id, count(*) as total_products
from products
group by category_id
having count(*) > 20;

-- 32. display suppliers supplying more than 10 products
select supplier_id, count(*) as total_products
from products
group by supplier_id
having count(*) > 10;

-- 33. display customers having more than 5 orders
select customer_id, count(*) as total_orders
from orders
group by customer_id
having count(*) > 5;

-- 34. display products having average rating above 4
select product_id, avg(rating) as avg_rating
from reviews
group by product_id
having avg(rating) > 4;

-- 35. display cities with more than 50 customers


select * from customers;

-- 36. Display customer names with order details. 

select * from orders;

select a.customer_name,b.order_date,b.order_status,b.total_amount
from customers a 
inner join orders b on a.customer_id=b.customer_id;


-- 37. display order details with products
select a.order_id,b.product_name,a.quantity
from order_items a
inner join products b
on a.product_id=b.product_id;

-- 38. display product names with category names
select a.product_name,b.category_name
from products a
inner join categories b
on a.category_id=b.category_id;

-- 39. display product names with supplier names
select a.product_name,b.supplier_name
from products a
inner join suppliers b
on a.supplier_id=b.supplier_id;

-- 40. display reviews with customer names
select b.customer_name,a.rating,a.review_text
from reviews a
inner join customers b
on a.customer_id=b.customer_id;

-- 41. display payment details with customer names

select * from payments;
select * from customers;
select * from orders;

select c.customer_name,a.payment_date,a.payment_method,a.payment_status
from payments a 
inner join orders b on a.payment_id=b.order_id
inner join customers c on b.order_id=c.customer_id;


-- 42. display shipment details with order details
select a.shipment_id,a.shipment_status,
       b.order_date,b.total_amount
from shipments a
inner join orders b
on a.order_id=b.order_id;

-- 43. display cart items with product names
select a.cart_item_id,
       b.product_name,
       a.quantity
from cart_items a
inner join products b
on a.product_id = b.product_id;


-- 44. display wishlist items with product names
select a.wishlist_id,
       b.product_name
from wishlist a
inner join products b
on a.product_id = b.product_id;

-- 45. display customer addresses with customer names
select b.customer_name,
       a.address_type,
       a.city,
       a.state,
       a.pincode
from addresses a
inner join customers b
on a.customer_id = b.customer_id;


-- 46. find customers who never placed orders
select a.customer_id,a.customer_name
from customers a
left join orders b
on a.customer_id=b.customer_id
where b.order_id is null;

-- 47. find products never ordered
select a.product_id,a.product_name
from products a
left join order_items b
on a.product_id=b.product_id
where b.order_id is null;

-- 48. find products with no reviews
select a.product_id,a.product_name
from products a
left join reviews b
on a.product_id=b.product_id
where b.review_id is null;

-- 49. find customers without addresses
select a.customer_id,a.customer_name
from customers a
left join addresses b
on a.customer_id=b.customer_id
where b.address_id is null;

-- 50. find orders without payments
select a.order_id,a.order_date
from orders a
left join payments b
on a.order_id=b.order_id
where b.payment_id is null;



-- 51. Find all products and corresponding reviews. 


select * from products;

select a.product_name,b.review_text
from products a 
left join reviews b on a.product_id=b.product_id;


-- 52. Find all customers and their orders. 
select a.customer_name,
       b.order_id,
       b.order_date,
       b.order_status
from customers a
left join orders b
on a.customer_id = b.customer_id;


-- 53. Find all suppliers and products. 
select a.supplier_name,b.product_name
from suppliers a
left join products b on a.supplier_id=b.supplier_id;


-- 54. Find all categories and products. 

select a.category_name,
       b.product_name
from categories a
left join products b
on a.category_id = b.category_id;



-- 55. Find all orders and shipments. 
select a.order_id,
       a.order_date,
       b.shipment_status,
       b.delivery_date
from orders a
left join shipments b
on a.order_id = b.order_id;




