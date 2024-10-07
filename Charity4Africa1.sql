-- Turn off feedback and turn on server output for debugging if needed
SET FEEDBACK ON;
SET SERVEROUTPUT ON;

-- Drop existing tables if they exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE RETURNS CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE INVOICE CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DELIVERY CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DONATION CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE DONATOR CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE EMPLOYEE CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE CUSTOMER CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      -- Handle exceptions silently
      NULL;
END;
/

-- Create tables
CREATE TABLE CUSTOMER (
  CUSTOMER_ID NUMBER PRIMARY KEY,
  FIRST_NAME VARCHAR2(50),
  SURNAME VARCHAR2(50),
  ADDRESS VARCHAR2(100),
  PHONE_NUM VARCHAR2(20),
  EMAIL VARCHAR2(50)
);

CREATE TABLE EMPLOYEE (
  EMPLOYEE_ID NUMBER PRIMARY KEY,
  FIRST_NAME VARCHAR2(50),
  SURNAME VARCHAR2(50),
  ADDRESS VARCHAR2(100),
  PHONE_NUM VARCHAR2(20),
  EMAIL VARCHAR2(50)
);

CREATE TABLE DONATOR (
  DONATOR_ID NUMBER PRIMARY KEY,
  FIRST_NAME VARCHAR2(50),
  SURNAME VARCHAR2(50),
  PHONE_NUM VARCHAR2(20),
  EMAIL VARCHAR2(50)
);

CREATE TABLE DONATION (
  DONATION_ID NUMBER PRIMARY KEY,
  DONATION VARCHAR2(50),
  PRICE NUMBER,
  DONATION_DATE DATE,
  DONATOR_ID NUMBER,
  FOREIGN KEY (DONATOR_ID) REFERENCES DONATOR(DONATOR_ID)
);

CREATE TABLE DELIVERY (
  DELIVERY_ID NUMBER PRIMARY KEY,
  DELIVERY_NOTES VARCHAR2(50),
  DISPATCH_DATE DATE,
  DELIVERY_DATE DATE
);

CREATE TABLE RETURNS (
  RETURN_ID VARCHAR2(10) PRIMARY KEY, 
  RETURN_DATE DATE,
  REASON VARCHAR2(50),
  CUSTOMER_ID NUMBER,
  DONATION_ID NUMBER,
  EMPLOYEE_ID NUMBER,
  FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
  FOREIGN KEY (DONATION_ID) REFERENCES DONATION(DONATION_ID),
  FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

CREATE TABLE INVOICE (
  INVOICE_ID NUMBER PRIMARY KEY,
  INVOICE_DATE DATE,
  DELIVERY_ID NUMBER,
  CUSTOMER_ID NUMBER,
  DONATION_ID NUMBER,
  EMPLOYEE_ID NUMBER,
  FOREIGN KEY (DELIVERY_ID) REFERENCES DELIVERY(DELIVERY_ID),
  FOREIGN KEY (CUSTOMER_ID) REFERENCES CUSTOMER(CUSTOMER_ID),
  FOREIGN KEY (DONATION_ID) REFERENCES DONATION(DONATION_ID),
  FOREIGN KEY (EMPLOYEE_ID) REFERENCES EMPLOYEE(EMPLOYEE_ID)
);

-- Insert data into CUSTOMER table
INSERT ALL
  INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (11011, 'Jack', 'Smith', '18 Water Rd', '0877277521', 'jsmith@isat.com')
  INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (11012, 'Pat', 'Hendricks', '22 Water Rd', '0863257857', 'ph@mcom.co.za')
  INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (11013, 'Andre', 'Clark', '101 Summer Lane', '0834567891', 'aclark@mcom.co.za')
  INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (11014, 'Kevin', 'Jones', '55 Mountain way', '0612547895', 'kj@isat.co.za')
  INTO CUSTOMER (CUSTOMER_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (11015, 'Lucy', 'Williams', '5 Main rd', '0827238521', 'lw@mcal.co.za')
SELECT DUMMY FROM dual;

-- Insert data into EMPLOYEE table
INSERT ALL
  INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (101, 'Jeff', 'Davis', '10 main road', '0877277521', 'jand@isat.com')
  INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (102, 'Kevin', 'Marks', '18 water road', '0837377522', 'km@isat.com')
  INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (103, 'Adanya', 'Andrews', '21 circle lane', '0817117523', 'aa@isat.com')
  INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (104, 'Adebayo', 'Dryer', '1 sea road', '0797215244', 'aryer@isat.com')
  INTO EMPLOYEE (EMPLOYEE_ID, FIRST_NAME, SURNAME, ADDRESS, PHONE_NUM, EMAIL) VALUES (105, 'Xolani', 'Samson', '12 main road', '0827122255', 'xosam@isat.com')
SELECT DUMMY FROM dual;

-- Insert data into DONATOR table
INSERT ALL
  INTO DONATOR (DONATOR_ID, FIRST_NAME, SURNAME, PHONE_NUM, EMAIL) VALUES (20111, 'Jeff', 'Watson', '0827172250', 'jwatson@ymail.com')
  INTO DONATOR (DONATOR_ID, FIRST_NAME, SURNAME, PHONE_NUM, EMAIL) VALUES (20112, 'Stephen', 'Jones', '0837865670', 'joness@ymail.com')
  INTO DONATOR (DONATOR_ID, FIRST_NAME, SURNAME, PHONE_NUM, EMAIL) VALUES (20113, 'James', 'Joe', '0878978650', 'jj@isat.com')
  INTO DONATOR (DONATOR_ID, FIRST_NAME, SURNAME, PHONE_NUM, EMAIL) VALUES (20114, 'Kelly', 'Ross', '0826575650', 'kross@gsat.com')
  INTO DONATOR (DONATOR_ID, FIRST_NAME, SURNAME, PHONE_NUM, EMAIL) VALUES (20115, 'Abraham', 'Clark', '0797656430', 'aclark@ymail.com')
SELECT DUMMY FROM dual;

-- Insert data into DONATION table
INSERT ALL
  INTO DONATION (DONATION_ID, DONATION, PRICE, DONATION_DATE, DONATOR_ID) VALUES (7111, 'KIC Fridge', 599 , TO_DATE('2024-05-01', 'YYYY-MM-DD'), 20111)
  INTO DONATION (DONATION_ID, DONATION, PRICE, DONATION_DATE, DONATOR_ID) VALUES (7112, 'Samsung 42inch LCD', 1299, TO_DATE('2024-05-03', 'YYYY-MM-DD'), 20112)
  INTO DONATION (DONATION_ID, DONATION, PRICE, DONATION_DATE, DONATOR_ID) VALUES (7113, 'Sharp Microwave', 1599 , TO_DATE('2024-05-03', 'YYYY-MM-DD'), 20113)
  INTO DONATION (DONATION_ID, DONATION, PRICE, DONATION_DATE, DONATOR_ID) VALUES (7114, '6 Seat Dining room table', 799, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 20115)
  INTO DONATION (DONATION_ID, DONATION, PRICE, DONATION_DATE, DONATOR_ID) VALUES (7115, 'Lazyboy Sofa', 1199 , TO_DATE('2024-05-07', 'YYYY-MM-DD'), 20114) 
  INTO DONATION (DONATION_ID, DONATION, PRICE, DONATION_DATE, DONATOR_ID) VALUES (7116, 'JVC Surround Sound System', 179 , TO_DATE('2024-05-09', 'YYYY-MM-DD'), 20113)
SELECT DUMMY FROM dual;

-- Insert data into DELIVERY table
INSERT ALL
  INTO DELIVERY (DELIVERY_ID, DELIVERY_NOTES, DISPATCH_DATE, DELIVERY_DATE) VALUES (511, 'Double packaging requested', TO_DATE('2024-05-10', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'))
  INTO DELIVERY (DELIVERY_ID, DELIVERY_NOTES, DISPATCH_DATE, DELIVERY_DATE) VALUES (512, 'Delivery to work address', TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'))
  INTO DELIVERY (DELIVERY_ID, DELIVERY_NOTES, DISPATCH_DATE, DELIVERY_DATE) VALUES (513, 'Signature required', TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-17', 'YYYY-MM-DD'))
  INTO DELIVERY (DELIVERY_ID, DELIVERY_NOTES, DISPATCH_DATE, DELIVERY_DATE) VALUES (514, 'No notes', TO_DATE('2024-05-12', 'YYYY-MM-DD'), TO_DATE('2024-05-15', 'YYYY-MM-DD'))
  INTO DELIVERY (DELIVERY_ID, DELIVERY_NOTES, DISPATCH_DATE, DELIVERY_DATE) VALUES (515, 'Birthday present wrapping required', TO_DATE('2024-05-18', 'YYYY-MM-DD'), TO_DATE('2024-05-19', 'YYYY-MM-DD'))
  INTO DELIVERY (DELIVERY_ID, DELIVERY_NOTES, DISPATCH_DATE, DELIVERY_DATE) VALUES (516, 'Delivery to work address', TO_DATE('2024-05-20', 'YYYY-MM-DD'), TO_DATE('2024-05-25', 'YYYY-MM-DD'))
SELECT DUMMY FROM dual;

-- Insert data into RETURNS table
INSERT ALL
  INTO RETURNS (RETURN_ID, RETURN_DATE, REASON, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES ('ret001', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Customer not satisfied with product', 11011, 7116, 101)
  INTO RETURNS (RETURN_ID, RETURN_DATE, REASON, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES ('ret002', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'Product had broken section', 11013, 7114, 103)
SELECT DUMMY FROM dual;

-- Insert data into INVOICE table
INSERT ALL
  INTO INVOICE (INVOICE_ID, INVOICE_DATE, DELIVERY_ID, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES (8111, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 511, 11011, 7111, 103)
  INTO INVOICE (INVOICE_ID, INVOICE_DATE, DELIVERY_ID, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES (8112, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 512, 11013, 7114, 101)
  INTO INVOICE (INVOICE_ID, INVOICE_DATE, DELIVERY_ID, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES (8113, TO_DATE('2024-05-17', 'YYYY-MM-DD'), 513, 11012, 7112, 101)
  INTO INVOICE (INVOICE_ID, INVOICE_DATE, DELIVERY_ID, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES (8114, TO_DATE('2024-05-17', 'YYYY-MM-DD'), 514, 11015, 7113, 102)
  INTO INVOICE (INVOICE_ID, INVOICE_DATE, DELIVERY_ID, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES (8115, TO_DATE('2024-05-17', 'YYYY-MM-DD'), 515, 11011, 7115, 102)
  INTO INVOICE (INVOICE_ID, INVOICE_DATE, DELIVERY_ID, CUSTOMER_ID, DONATION_ID, EMPLOYEE_ID) VALUES (8116, TO_DATE('2024-05-18', 'YYYY-MM-DD'), 516, 11015, 7116, 103)
SELECT DUMMY FROM dual;

--QUESTION TWO
SELECT 
    C.FIRST_NAME || ' ' || C.SURNAME AS Customer_Name,
    I.EMPLOYEE_ID,
    D.DELIVERY_NOTES,
    DN.DONATION AS Donation_Purchased,
    I.INVOICE_ID,
    I.INVOICE_DATE
FROM 
    INVOICE I
JOIN 
    CUSTOMER C ON I.CUSTOMER_ID = C.CUSTOMER_ID
JOIN 
    DELIVERY D ON I.DELIVERY_ID = D.DELIVERY_ID
JOIN 
    DONATION DN ON I.DONATION_ID = DN.DONATION_ID
WHERE 
    I.INVOICE_DATE > TO_DATE('2024-05-16', 'YYYY-MM-DD');
    
SET SERVEROUTPUT ON;


--QUESTION THREE
-- Create the Funding table
DROP TABLE FUNDING CASCADE CONSTRAINTS;
CREATE TABLE FUNDING (
    funding_id NUMBER GENERATED BY DEFAULT AS IDENTITY PRIMARY KEY,
    funder VARCHAR2(100) NOT NULL,
    funding_amount NUMBER NOT NULL
);

-- Example insert statement
INSERT INTO Funding (funder, funding_amount) 
VALUES ('Gculisa Kolobe Foundation', 5000);

-- The Funding table is created with an automatically generated unique identifier (funding_id) using 
-- the IDENTITY feature to ensure that each funding record is uniquely identified without requiring 
-- manual input or a separate sequence. The 'funder' and 'funding_amount' fields are set as NOT NULL 
-- to enforce data integrity, ensuring that all funding records have the necessary information for 
-- proper tracking and reporting.

--QUESTION FOUR
DECLARE
    CURSOR return_cursor IS
        SELECT 
            C.FIRST_NAME || ' ' || C.SURNAME AS CUSTOMER_NAME,
            D.DONATION AS DONATION_PURCHASED,
            D.PRICE AS DONATION_PRICE,
            R.REASON AS RETURN_REASON
        FROM 
            RETURNS R
        JOIN 
            CUSTOMER C ON R.CUSTOMER_ID = C.CUSTOMER_ID
        JOIN 
            DONATION D ON R.DONATION_ID = D.DONATION_ID;

BEGIN
    FOR rec IN return_cursor LOOP
        DBMS_OUTPUT.PUT_LINE('Customer Name: ' || rec.CUSTOMER_NAME);
        DBMS_OUTPUT.PUT_LINE('Donation Purchased: ' || rec.DONATION_PURCHASED);
        DBMS_OUTPUT.PUT_LINE('Donation Price: ' || rec.DONATION_PRICE);
        DBMS_OUTPUT.PUT_LINE('Return Reason: ' || rec.RETURN_REASON);
        DBMS_OUTPUT.PUT_LINE('--------');  -- Separator
    END LOOP;
END;

--QUESTION FIVE
DECLARE
  v_customer_id NUMBER := 11011;
BEGIN
  FOR cur_rec IN (
    SELECT 
      c.FIRST_NAME || ' ' || c.SURNAME AS customer_name,
      e.FIRST_NAME || ' ' || e.SURNAME AS employee_name,
      d.DONATION,
      de.DISPATCH_DATE,
      de.DELIVERY_DATE,
      de.DELIVERY_DATE - de.DISPATCH_DATE AS days_between_dispatch_delivery
    FROM 
      CUSTOMER c
      JOIN INVOICE i ON c.CUSTOMER_ID = i.CUSTOMER_ID
      JOIN EMPLOYEE e ON i.EMPLOYEE_ID = e.EMPLOYEE_ID
      JOIN DELIVERY de ON i.DELIVERY_ID = de.DELIVERY_ID
      JOIN DONATION d ON i.DONATION_ID = d.DONATION_ID
    WHERE 
      c.CUSTOMER_ID = v_customer_id
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('Customer Name: ' || cur_rec.customer_name);
    DBMS_OUTPUT.PUT_LINE('Employee Name: ' || cur_rec.employee_name);
    DBMS_OUTPUT.PUT_LINE('Donation: ' || cur_rec.DONATION);
    DBMS_OUTPUT.PUT_LINE('Dispatch Date: ' || TO_CHAR(cur_rec.DISPATCH_DATE, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Delivery Date: ' || TO_CHAR(cur_rec.DELIVERY_DATE, 'YYYY-MM-DD'));
    DBMS_OUTPUT.PUT_LINE('Days between Dispatch and Delivery: ' || cur_rec.days_between_dispatch_delivery);
    DBMS_OUTPUT.PUT_LINE('------------------------');
  END LOOP;
END;

--QUESTION SIX
BEGIN
  FOR cur_rec IN (
    SELECT 
      c.FIRST_NAME AS first_name,
      c.SURNAME AS surname,
      SUM(d.PRICE) AS total_amount_spent,
      CASE 
        WHEN SUM(d.PRICE) >= 1500 THEN ' [***]'
        ELSE ''
      END AS customer_rating
    FROM 
      CUSTOMER c
      JOIN INVOICE i ON c.CUSTOMER_ID = i.CUSTOMER_ID
      JOIN DONATION d ON i.DONATION_ID = d.DONATION_ID
    GROUP BY 
      c.FIRST_NAME, c.SURNAME
    ORDER BY 
      total_amount_spent DESC
  )
  LOOP
    DBMS_OUTPUT.PUT_LINE('First Name: ' || cur_rec.first_name);
    DBMS_OUTPUT.PUT_LINE('Surname: ' || cur_rec.surname);
    DBMS_OUTPUT.PUT_LINE('Total Amount Spent: R ' || TO_CHAR(cur_rec.total_amount_spent, '999,999.99') || cur_rec.customer_rating);
    DBMS_OUTPUT.PUT_LINE('------------------------');
  END LOOP;
END;

--QUESTION SEVEN
-- We are assuming that I'm managing a database for  Bookstore and the involved tables are BOOKS, CUSTOMERS, ORDERS
-- BOOKS (Book_ID, Title, Price), CUSTOMERS (Customer_ID, First_Name, Last_Name), ORDERS (Order_ID, Customer_ID, Book_ID, Order_Date, Quantity)

-- Create BOOKS table
DROP TABLE BOOKS CASCADE CONSTRAINTS;
CREATE TABLE BOOKS (
    BOOK_ID NUMBER PRIMARY KEY,    
    TITLE VARCHAR2(100),          
    PRICE NUMBER(6, 2)             
);
-- Create CUSTOMERS table
DROP TABLE BUYERS CASCADE CONSTRAINTS;
CREATE TABLE BUYERS (
    BUYER_ID NUMBER PRIMARY KEY,   
    FIRST_NAME VARCHAR2(50),          
    LAST_NAME VARCHAR2(50)            
);
-- Create ORDERS table
DROP TABLE ORDERS CASCADE CONSTRAINTS;
CREATE TABLE ORDERS (
    ORDER_ID NUMBER PRIMARY KEY,    
    BUYER_ID NUMBER,             
    BOOK_ID NUMBER,                 
    ORDER_DATE DATE,               
    QUANTITY NUMBER,              
    CONSTRAINT fk_buyer FOREIGN KEY (BUYER_ID) REFERENCES BUYERS(BUYER_ID),
    CONSTRAINT fk_book FOREIGN KEY (BOOK_ID) REFERENCES BOOKS(BOOK_ID)
);

--EXAMPLE OF %TYPE USAGE
DECLARE
    -- Declaring a variable with the same type as the Price column in the BOOKS table
    v_book_price BOOKS.PRICE%TYPE;
    v_book_title BOOKS.TITLE%TYPE;
BEGIN
    -- Assigning some values to the variables
    v_book_price := 475.00; 
    v_book_title := 'The Great Gatsby';

    -- Displaying the book price and title
    DBMS_OUTPUT.PUT_LINE('Book: ' || v_book_title);
    DBMS_OUTPUT.PUT_LINE('Price: R ' || v_book_price);
END;
/
--EXAMPLE OF %ROWTYPE USAGE
DECLARE
-- Declaring a variable with the same type as the order column in the ORDERS table
    v_order_record ORDERS%ROWTYPE;
BEGIN
-- Assigning some values to the variables
    v_order_record.ORDER_ID := 101;
    v_order_record.BUYER_ID := 21012;
    v_order_record.BOOK_ID := 301;
    v_order_record.ORDER_DATE := SYSDATE;
    v_order_record.QUANTITY := 2;

    DBMS_OUTPUT.PUT_LINE('Order ID: ' || v_order_record.ORDER_ID);
    DBMS_OUTPUT.PUT_LINE('Buyer ID: ' || v_order_record.BUYER_ID);
    DBMS_OUTPUT.PUT_LINE('Book ID: ' || v_order_record.BOOK_ID);
    DBMS_OUTPUT.PUT_LINE('Order Date: ' || v_order_record.ORDER_DATE);
    DBMS_OUTPUT.PUT_LINE('Quantity: ' || v_order_record.QUANTITY);
END;
/
--EXAMPLE OF User-Defined Exception
DECLARE

    v_book_price BOOKS.PRICE%TYPE; -- Declare a variable to hold the book price, using the data type of the PRICE column in the BOOKS table
    v_max_price NUMBER := 1000;  
    e_high_price EXCEPTION; -- Declare a user-defined exception to handle cases when the book price exceeds the limit
BEGIN
    v_book_price := 1200; -- Assign a price value to the variable (example: R 1200)

    IF v_book_price > v_max_price THEN
        RAISE e_high_price;
    ELSE
        -- If the condition is false, output a message that the price is affordable
        DBMS_OUTPUT.PUT_LINE('The book is affordable at R ' || v_book_price);
    END IF;

EXCEPTION
    -- Handle the exception when the book price exceeds the maximum limit
    WHEN e_high_price THEN
        DBMS_OUTPUT.PUT_LINE('Error: The book price exceeds the maximum limit of R ' || v_max_price);
END;
/


--QUESTION EIGHT
SELECT 
  c.FIRST_NAME || ' ' || c.SURNAME AS customer_name,
  SUM(d.PRICE) AS total_amount_spent,
  CASE 
    WHEN SUM(d.PRICE) >= 1500 THEN ' [***]'
    WHEN SUM(d.PRICE) BETWEEN 1000 AND 1400 THEN ' [**]'
    ELSE ' [*]'
  END AS customer_rating
FROM 
  CUSTOMER c
  JOIN INVOICE i ON c.CUSTOMER_ID = i.CUSTOMER_ID
  JOIN DONATION d ON i.DONATION_ID = d.DONATION_ID
GROUP BY 
  c.FIRST_NAME, c.SURNAME
ORDER BY 
  total_amount_spent DESC;
