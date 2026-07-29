-- ==========================================
-- Healthcare Analytics Project
-- Database Creation
-- ==========================================

CREATE DATABASE healthcare_analytics;

USE healthcare_analytics;
CREATE TABLE healthcare (

    Name VARCHAR(100),

    Age INT,

    Gender VARCHAR(20),

    Blood_Type VARCHAR(10),

    Medical_Condition VARCHAR(100),

    Date_of_Admission DATE,

    Doctor VARCHAR(100),

    Hospital VARCHAR(200),

    Insurance_Provider VARCHAR(100),

    Billing_Amount DECIMAL(10,2),

    Room_Number INT,

    Admission_Type VARCHAR(50),

    Discharge_Date DATE,

    Medication VARCHAR(100),

    Test_Results VARCHAR(50),

    Length_of_Stay INT,

    Age_Group VARCHAR(30),

    Admission_Year INT,

    Admission_Month VARCHAR(20),

    Admission_Quarter INT,

    Admission_Day VARCHAR(20),

    Weekend_Admission VARCHAR(20),

    Billing_Category VARCHAR(20)

);
SHOW TABLES;
DESCRIBE healthcare;

DESCRIBE healthcare;
DROP TABLE healthcare;
CREATE TABLE healthcare (

    Name VARCHAR(100),
    Age INT,
    Gender VARCHAR(20),
    Blood_Type VARCHAR(10),
    Medical_Condition VARCHAR(100),
    Date_of_Admission DATE,
    Doctor VARCHAR(100),
    Hospital VARCHAR(200),
    Insurance_Provider VARCHAR(100),
    Billing_Amount DECIMAL(10,2),
    Room_Number INT,
    Admission_Type VARCHAR(50),
    Discharge_Date DATE,
    Medication VARCHAR(100),
    Test_Results VARCHAR(50),
    Length_of_Stay INT,
    Age_Group VARCHAR(30),
    Admission_Year INT,
    Admission_Month VARCHAR(20),
    Admission_Day VARCHAR(20),
    Billing_Category VARCHAR(20)

);
DESCRIBE healthcare;
SELECT COUNT(*) AS Total_Rows
FROM healthcare;

