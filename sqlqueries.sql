SHOW TABLES;



-- 1. Get all customers from the USA
SELECT customerName, country
FROM customers
WHERE country = 'USA';

-- 2. List orders over $10,000, sorted by amount

SELECT orderNumber, status, customerNumber
FROM orders
WHERE status = 'Shipped'
ORDER BY orderNumber DESC;

-- 3. Total payments by each customer
SELECT customerNumber, SUM(amount) AS total_payment
FROM payments
GROUP BY customerNumber;

-- 4. Average amount of payments made
SELECT AVG(amount) AS average_payment FROM payments;
-- 5. Orders with customer names (INNER JOIN)
SELECT o.orderNumber, c.customerName
FROM orders o
INNER JOIN customers c ON o.customerNumber = c.customerNumber;

-- 6. LEFT JOIN: all customers, whether they have orders or not
SELECT c.customerName, o.orderNumber
FROM customers c
LEFT JOIN orders o ON c.customerNumber = o.customerNumber;
-- 7. Customers who made the highest single payment
SELECT customerNumber, amount
FROM payments
WHERE amount = (
    SELECT MAX(amount) FROM payments
);
-- 8. Create a view for monthly payment summaries
CREATE VIEW monthly_summary AS
SELECT DATE_FORMAT(paymentDate, '%Y-%m') AS month, SUM(amount) AS total
FROM payments
GROUP BY month;
-- 9. Add index on customerNumber in orders
CREATE INDEX idx_customerNumber ON orders(customerNumber);


