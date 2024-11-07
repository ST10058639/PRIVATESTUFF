-- Turn off feedback and turn on server output for debugging if needed
SET FEEDBACK ON;
SET SERVEROUTPUT ON;

-- Drop existing tables if they exist
BEGIN
   EXECUTE IMMEDIATE 'DROP TABLE Bike CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE Volunteers CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE Donations CASCADE CONSTRAINTS';
   EXECUTE IMMEDIATE 'DROP TABLE Donor CASCADE CONSTRAINTS';
EXCEPTION
   WHEN OTHERS THEN
      -- Handle exceptions if needed
      NULL;
END;
/

CREATE TABLE Bike ( BIKE_ID VARCHAR2(26) NOT NULL,
BIKE_TYPE VARCHAR2(26),
MANUFACTURER VARCHAR2(26),
DESCRIPTION VARCHAR2(26));

CREATE TABLE Volunteers ( VOL_ID VARCHAR2(26),
VOL_FNAME VARCHAR2(26),
VOL_SNAME VARCHAR2(26),
CONTACT VARCHAR2(26),
ADDRESS VARCHAR2(26),
EMAIL VARCHAR2(26));

CREATE TABLE Donations ( DONATION_ID NUMBER(38),
DONOR_ID VARCHAR2(26),
BIKE_ID VARCHAR2(26),
Value NUMBER(38),
VOLUNTEER_ID VARCHAR2(26),
DONATION_DATE DATE);

CREATE TABLE Donor ( DONOR_ID VARCHAR2(26),
DONOR_FNAME VARCHAR2(26),
DONOR_LNAME VARCHAR2(26),
CONTACT_NO VARCHAR2(26),
EMAIL VARCHAR2(26));

-- Insert data into Bike table
INSERT ALL
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B001', 'Road Bike', 'BMX', 'BMX AX1')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B002', 'Road Bike', 'Giant', 'Giant Domain 1')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B003', 'Mountain Bike', 'Raleigh', 'Ascent 26In')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B004', 'Kids Bike', 'Canyon', 'Canyon 6X')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B005', 'Gravel Road Bike', 'BMX', 'Marvel')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B006', 'Mountain Bike', 'BMX', 'Mountain 21 Speed')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B007', 'Road Bike', 'Canyon', 'Canyon Roadster')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B008', 'Hybrid Bike', 'BMX', 'Legion 101')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B009', 'Road Bike', 'Trek', 'Madonna 9')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B010', 'Mountain Bike', 'Trek', 'Comp 2022')
  INTO Bike (BIKE_ID, BIKE_TYPE, MANUFACTURER, DESCRIPTION) VALUES ('B011', 'Road Bike', 'BMX', 'BMX AX15')
SELECT DUMMY FROM dual;

-- Insert data into Volunteers table
INSERT ALL
  INTO Volunteers (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol101', 'Kenny', 'Temba', '0677277521', '10 Sands Road', 'kennyt@bikerus.com')
  INTO Volunteers (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol102', 'Mamelodi', 'Marks', '0737377522', '20 Langes Street', 'mamelodim@bikerus.com')
  INTO Volunteers (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol103', 'Ada', 'Andrews', '0817117523', '31 Williams Street', 'adanyaa@bikerus.com')
  INTO Volunteers (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol104', 'Evans', 'Tambala', '0697215244', '1 Free Road', 'evanst@bikerus.com')
  INTO Volunteers (VOL_ID, VOL_FNAME, VOL_SNAME, CONTACT, ADDRESS, EMAIL) VALUES ('vol105', 'Xolani', 'Samson', '0727122255', '12 main road', 'xolanis@bikerus.com')
SELECT DUMMY FROM dual;

-- Insert data into Donations table
INSERT ALL
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (1, 'DID11', 'B001', 1500, 'vol101', to_date('01-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (2, 'DID12', 'B002', 2500, 'vol101', to_date('03-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (3, 'DID13', 'B003', 1000, 'vol103', to_date('03-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (4, 'DID14', 'B004', 1750, 'vol105', to_date('05-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (5, 'DID15', 'B006', 2000, 'vol101', to_date('07-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (6, 'DID16', 'B007', 1800, 'vol105', to_date('09-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (7, 'DID17', 'B008', 1500, 'vol101', to_date('15-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (8, 'DID18', 'B009', 1500, 'vol103', to_date('19-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (9, 'DID12', 'B0010', 2500, 'vol103', to_date('25-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (10, 'DID20', 'B005', 3500, 'vol105', to_date('05-May-23', 'DD-MON-RR'))
  INTO Donations (DONATION_ID, DONOR_ID, BIKE_ID, Value, VOLUNTEER_ID, DONATION_DATE) VALUES (11, 'DID19', 'B011', 2500, 'Vol103', to_date('30-May-23', 'DD-MON-RR'))
SELECT DUMMY FROM dual;

-- Insert data into Donor table
INSERT ALL
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID11', 'Jeff', 'Wanya', '0827172250', 'wanyajeff@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID12', 'Sthembeni', 'Pisho', '0837865670', 'sthepisho@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID13', 'James', 'Temba', '0878978650', 'jimmy@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID14', 'Luramo', 'Misi', '0826575650', 'luramom@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID15', 'Abraham', 'Xolani', '0797656430', 'axolani@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID16', 'Rumi', 'Jones', '0668899221', 'rjones@true.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID17', 'Xolani', 'Redo', '0614553389', 'xredo@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID18', 'Tenny', 'Stars', '0824228870', 'tenstars@true.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID19', 'Tiny', 'Rambo', '0715554333', 'trambo@ymail.com')
  INTO Donor (DONOR_ID, DONOR_FNAME, DONOR_LNAME, CONTACT_NO, EMAIL) VALUES ('DID20', 'Yannick', 'Leons', '0615554323', 'yleons@true.com')
SELECT DUMMY FROM dual;

--Question Two
SELECT 
    d.DONOR_ID, 
    b.BIKE_TYPE, 
    b.DESCRIPTION, 
    do.VALUE
FROM 
    Donations do
JOIN 
    Donor d ON do.DONOR_ID = d.DONOR_ID
JOIN 
    Bike b ON do.BIKE_ID = b.BIKE_ID
WHERE 
    do.VALUE > 1500;
    
--Question Three
-- Declare the VAT rate as a constant (15%)
DECLARE
    -- Declare variables to hold the bike details
    v_bike_description VARCHAR2(100);
    v_bike_manufacturer VARCHAR2(100);
    v_bike_type VARCHAR2(100);
    v_bike_value NUMBER;
    v_vat_amount NUMBER;
    v_total_amount NUMBER;
    v_vat_rate CONSTANT NUMBER := 0.15; -- VAT rate of 15%
BEGIN
    -- Cursor to fetch data for road bikes
    FOR bike_rec IN 
        (SELECT b.DESCRIPTION, 
                b.MANUFACTURER, 
                b.BIKE_TYPE, 
                do.VALUE
         FROM Donations do
         JOIN bike b ON do.BIKE_ID = b.BIKE_ID
         WHERE b.BIKE_TYPE = 'Road Bike') 
    LOOP
        -- Calculate VAT amount and total amount
        v_bike_description := bike_rec.DESCRIPTION;
        v_bike_manufacturer := bike_rec.MANUFACTURER;
        v_bike_type := bike_rec.BIKE_TYPE;
        v_bike_value := bike_rec.VALUE;
        v_vat_amount := v_bike_value * v_vat_rate;
        v_total_amount := v_bike_value + v_vat_amount;

        -- Display bike details in a neat vertical format
        DBMS_OUTPUT.PUT_LINE('Bike Description: ' || v_bike_description);
        DBMS_OUTPUT.PUT_LINE('Bike Manufacturer: ' || v_bike_manufacturer);
        DBMS_OUTPUT.PUT_LINE('Bike Type: ' || v_bike_type);
        DBMS_OUTPUT.PUT_LINE('Bike Value: ' || TO_CHAR(v_bike_value));
        DBMS_OUTPUT.PUT_LINE('VAT Amount: ' || TO_CHAR(v_vat_amount));
        DBMS_OUTPUT.PUT_LINE('Total Amount: ' || TO_CHAR(v_total_amount));
        DBMS_OUTPUT.PUT_LINE('-------------------------'); -- Divider between bikes
    END LOOP;
END;


--Question 4 
CREATE OR REPLACE VIEW vwBikeRUs AS
SELECT 
    d.DONOR_FNAME || ' ' || d.DONOR_LNAME AS DONOR_NAME,  
    d.CONTACT_NO AS DONOR_CONTACT, 
    b.BIKE_TYPE,  
    do.DONATION_DATE 
FROM 
    Donor d
JOIN 
    Donations do ON d.DONOR_ID = do.DONOR_ID  
JOIN 
    Bike b ON do.BIKE_ID = b.BIKE_ID 
JOIN 
    Volunteers v ON do.VOLUNTEER_ID = v.VOL_ID  
WHERE 
    do.VOLUNTEER_ID = 'vol105';  

SELECT * FROM vwBikeRUs;
-- Benefits of using a View:
--1.Simplification of Complex Queries: Views encapsulate complex SQL queries into a single object, allowing users to access and retrieve data 
--without the need to understand or rewrite the underlying query structure. This simplifies data retrieval and reduces query redundancy.
--2.Enhanced Security: Views enable database administrators to control access to specific columns or rows, 
--making it possible to hide sensitive data from certain users while allowing them to view only the necessary information. 
--This approach provides a layer of security, ensuring that users access only the data relevant to their roles.



--Question 5
CREATE OR REPLACE PROCEDURE spDonorDetails (
    p_bike_id IN VARCHAR2  -- Input parameter for Bike ID
) IS
    -- Declaring variables to hold the data that will be retrieved
    v_donor_name VARCHAR2(50);
    v_volunteer_fname VARCHAR2(26);
    v_bike_description VARCHAR2(50);
    v_donation_date DATE;
BEGIN
    -- Query to fetch donor name, contact, volunteer first name, bike description, and donation date
    SELECT 
        d.DONOR_FNAME || ' ' || d.DONOR_LNAME, -- Full donor name
        v.VOL_FNAME, -- Volunteer first name
        b.DESCRIPTION, -- Bike description
        do.DONATION_DATE -- Donation date
    INTO 
        v_donor_name, v_volunteer_fname, v_bike_description, v_donation_date
    FROM 
        Donor d
    JOIN 
        Donations do ON d.DONOR_ID = do.DONOR_ID
    JOIN 
        Volunteers v ON do.VOLUNTEER_ID = v.VOL_ID
    JOIN 
        Bike b ON do.BIKE_ID = b.BIKE_ID
    WHERE 
        do.BIKE_ID = p_bike_id; -- Filtering by the provided Bike ID

    -- Output the result in the required format
    DBMS_OUTPUT.PUT_LINE('ATTENTION: ' || v_donor_name || ' assisted by: ' || v_volunteer_fname || 
                         ', donated the: ' || v_bike_description || ' on the: ' || TO_CHAR(v_donation_date, 'DD/MON/YY'));

EXCEPTION
    -- Exception handling section
    WHEN NO_DATA_FOUND THEN
        -- This exception is raised if no data is found for the provided Bike ID
        DBMS_OUTPUT.PUT_LINE('No data found for the provided Bike ID: ' || p_bike_id);
    WHEN TOO_MANY_ROWS THEN
        -- This exception is raised if more than one row is returned (unexpected behavior)
        DBMS_OUTPUT.PUT_LINE('Unexpectedly, multiple donations found for the provided Bike ID: ' || p_bike_id);
    WHEN OTHERS THEN
        -- General exception handling to catch any other errors
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
END spDonorDetails;
/


BEGIN
    spDonorDetails('B004');  -- Replace 'B004' with any Bike ID you want to query
END;
/

--Question 6
CREATE OR REPLACE FUNCTION fnAverageDonationForDonor (
    p_donor_id IN VARCHAR2  -- Input parameter: Donor ID
) RETURN NUMBER IS
    v_avg_donation NUMBER := 0;  -- Variable to store the average donation value
BEGIN
    -- Query to calculate the average donation value for the given Donor ID
    SELECT 
        AVG(do.VALUE)  -- Average donation value for this Donor ID
    INTO 
        v_avg_donation
    FROM 
        Donations do
    WHERE 
        do.DONOR_ID = p_donor_id;  -- Filter by the provided Donor ID

    -- Output the result in a simple message
    DBMS_OUTPUT.PUT_LINE('The average donation value for Donor ID ' || p_donor_id || ' is: R' || TO_CHAR(v_avg_donation, '999,999.99'));

    -- Return the average donation value to the caller
    RETURN v_avg_donation;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        -- If no donations are found for the given Donor ID
        DBMS_OUTPUT.PUT_LINE('No donations found for the provided Donor ID: ' || p_donor_id);
        RETURN 0;  -- Return 0 to indicate no donations found
    WHEN OTHERS THEN
        -- General exception handling for any other errors
        DBMS_OUTPUT.PUT_LINE('An error occurred: ' || SQLERRM);
        RETURN 0;  -- Return 0 in case of any error
END fnAverageDonationForDonor;
/

DECLARE
    v_avg NUMBER;
BEGIN
    -- Call the function with a Donor ID, for example 'DID11'
    v_avg := fnAverageDonationForDonor('DID11');
    DBMS_OUTPUT.PUT_LINE('Average Donation Value for Donor DID11: R' || TO_CHAR(v_avg, '999,999.99'));
END;
/

--Question 7
DECLARE
    -- Declare a cursor to fetch data from the BIKE and DONATIONS tables
    CURSOR bike_cursor IS
        SELECT b.BIKE_ID, b.BIKE_TYPE, b.MANUFACTURER, d.VALUE
        FROM BIKE b
        JOIN DONATIONS d ON b.BIKE_ID = d.BIKE_ID;

    -- Variables to store each row of the cursor
    v_bike_id BIKE.BIKE_ID%TYPE;
    v_bike_type BIKE.BIKE_TYPE%TYPE;
    v_manufacturer BIKE.MANUFACTURER%TYPE;
    v_value DONATIONS.VALUE%TYPE;
    v_status VARCHAR2(20);
BEGIN
    -- Open the cursor and loop through the rows
    FOR bike_rec IN bike_cursor LOOP
        -- Assign values from cursor to local variables
        v_bike_id := bike_rec.BIKE_ID;
        v_bike_type := bike_rec.BIKE_TYPE;
        v_manufacturer := bike_rec.MANUFACTURER;
        v_value := bike_rec.VALUE;

        -- Determine the status based on the value
        IF v_value BETWEEN 0 AND 1500 THEN
            v_status := '1-star (*)';
        ELSIF v_value > 1500 AND v_value <= 3000 THEN
            v_status := '2-star (**)';
        ELSIF v_value > 3000 THEN
            v_status := '3-star (***)';
        ELSE
            v_status := 'Unknown Status';
        END IF;

        -- Display the data vertically
        DBMS_OUTPUT.PUT_LINE('Bike ID: ' || v_bike_id);
        DBMS_OUTPUT.PUT_LINE('Bike Type: ' || v_bike_type);
        DBMS_OUTPUT.PUT_LINE('Manufacturer: ' || v_manufacturer);
        DBMS_OUTPUT.PUT_LINE('Bike Value: ' || v_value);
        DBMS_OUTPUT.PUT_LINE('Status: ' || v_status);
        DBMS_OUTPUT.PUT_LINE('----------------------------'); -- Separate each bike entry
    END LOOP;
END;
/

--Question 8  
SELECT 
    b.BIKE_ID,
    b.BIKE_TYPE,
    b.MANUFACTURER,
    d.VALUE AS BIKE_VALUE,
    CASE
        WHEN d.VALUE BETWEEN 0 AND 1500 THEN '1-star (*)'
        WHEN d.VALUE > 1500 AND d.VALUE <= 3000 THEN '2-star (**)'
        WHEN d.VALUE > 3000 THEN '3-star (***)'
        ELSE 'Unknown Status'
    END AS STATUS
FROM 
    BIKE b
JOIN 
    DONATIONS d ON b.BIKE_ID = d.BIKE_ID;






