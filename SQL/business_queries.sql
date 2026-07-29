USE healthcare_analytics;
SELECT *
FROM healthcare limit 10;
SELECT
    Name,
    Age,
    Gender
FROM healthcare;

SELECT
    Name,
    Age,
    Medical_Condition
FROM healthcare
WHERE Age > 60;

SELECT *
FROM healthcare
WHERE Gender = 'Female';
SELECT
    Name,
    Age,
    Medical_Condition
FROM healthcare
WHERE Medical_Condition = 'Diabetes';
SELECT
    Name,
    Billing_Amount
FROM healthcare
WHERE Billing_Amount > 30000;

SELECT
    Name,
    Billing_Amount
FROM healthcare
ORDER BY Billing_Amount DESC;
SELECT DISTINCT Medical_Condition
FROM healthcare;

SELECT DISTINCT Insurance_Provider
FROM healthcare;


SELECT COUNT(*) AS Total_Patients
FROM healthcare;


SELECT ROUND(AVG(Age),2) AS Average_Age
FROM healthcare;

SELECT
abs(MIN(Billing_Amount)) AS Minimum_Billing,
MAX(Billing_Amount) AS Maximum_Billing
FROM healthcare;


SELECT
SUM(Billing_Amount) AS Total_Billing
FROM healthcare;

SELECT
Gender,
COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Gender;


SELECT
Medical_Condition,
COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Medical_Condition
ORDER BY Total_Patients DESC;


SELECT
Medical_Condition,
ROUND(AVG(Billing_Amount),2) AS Average_Billing
FROM healthcare
GROUP BY Medical_Condition
ORDER BY Average_Billing DESC;


SELECT
Insurance_Provider,
COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Insurance_Provider
ORDER BY Total_Patients DESC;


SELECT
Admission_Type,
COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Admission_Type;


SELECT
Medical_Condition,
COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Medical_Condition
HAVING COUNT(*) > 9000
ORDER BY Total_Patients DESC;


SELECT
    Name,
    Age,
    CASE
        WHEN Age < 18 THEN 'Child'
        WHEN Age BETWEEN 18 AND 35 THEN 'Young Adult'
        WHEN Age BETWEEN 36 AND 50 THEN 'Adult'
        WHEN Age BETWEEN 51 AND 65 THEN 'Senior Adult'
        ELSE 'Elderly'
    END AS Age_Category
FROM healthcare;


SELECT
    Name,
    Billing_Amount,
    CASE
        WHEN Billing_Amount < 20000 THEN 'Low'
        WHEN Billing_Amount BETWEEN 20000 AND 40000 THEN 'Medium'
        ELSE 'High'
    END AS Billing_Level
FROM healthcare;


SELECT
    Name,
    Date_of_Admission
FROM healthcare
WHERE YEAR(Date_of_Admission) = 2023;


SELECT
    YEAR(Date_of_Admission) AS Admission_Year,
    COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY YEAR(Date_of_Admission)
ORDER BY Admission_Year;


SELECT
    MONTHNAME(Date_of_Admission) AS Admission_Month,
    COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY MONTH(Date_of_Admission),
         MONTHNAME(Date_of_Admission)
ORDER BY MONTH(Date_of_Admission);


SELECT
    ROUND(AVG(Length_of_Stay),2) AS Average_Stay_Days
FROM healthcare;


SELECT
    Name,
    Billing_Amount
FROM healthcare
ORDER BY Billing_Amount DESC
LIMIT 10;

SELECT
    Hospital,
    ROUND(AVG(Billing_Amount),2) AS Average_Billing
FROM healthcare
GROUP BY Hospital
ORDER BY Average_Billing DESC;


SELECT
    Doctor,
    COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Doctor
HAVING COUNT(*) > 100
ORDER BY Total_Patients DESC;


SELECT
    Doctor,
    COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Doctor
ORDER BY Total_Patients DESC
LIMIT 10;

SELECT
    Name,
    Billing_Amount,
    RANK() OVER (ORDER BY Billing_Amount DESC) AS Billing_Rank
FROM healthcare;

SELECT
    Name,
    Billing_Amount,
    DENSE_RANK() OVER (ORDER BY Billing_Amount DESC) AS Billing_Rank
FROM healthcare;

WITH Billing_CTE AS
(
    SELECT
        Name,
        Billing_Amount,
        RANK() OVER (ORDER BY Billing_Amount DESC) AS Billing_Rank
    FROM healthcare
)

SELECT *
FROM Billing_CTE
WHERE Billing_Rank <= 5;


SELECT
    Name,
    Billing_Amount,
    SUM(Billing_Amount)
    OVER(ORDER BY Billing_Amount) AS Running_Total
FROM healthcare;


DROP VIEW Patient_Billing;
CREATE VIEW Patient_Billing AS

SELECT
    Name,
    Age,
    Gender,
    Medical_Condition,
    Billing_Amount
FROM healthcare;
SELECT *
FROM Patient_Billing
LIMIT 10;

SELECT
    Hospital,
    ROUND(SUM(Billing_Amount),2) AS Total_Billing
FROM healthcare
GROUP BY Hospital
ORDER BY Total_Billing DESC;

SELECT
    Insurance_Provider,
    ROUND(AVG(Billing_Amount),2) AS Average_Billing
FROM healthcare
GROUP BY Insurance_Provider
ORDER BY Average_Billing DESC;

SELECT
    Doctor,
    ROUND(AVG(Length_of_Stay),2) AS Average_Stay
FROM healthcare
GROUP BY Doctor
ORDER BY Average_Stay DESC;
SELECT
    Admission_Month,
    COUNT(*) AS Total_Patients
FROM healthcare
GROUP BY Admission_Month
ORDER BY FIELD(
    Admission_Month,
    'January','February','March','April','May','June',
    'July','August','September','October','November','December'
);


SELECT
    COUNT(*) AS Total_Patients,
    ROUND(AVG(Age),2) AS Average_Age,
    ROUND(AVG(Billing_Amount),2) AS Average_Billing,
    ROUND(SUM(Billing_Amount),2) AS Total_Billing,
    ROUND(AVG(Length_of_Stay),2) AS Average_Stay
FROM healthcare;

