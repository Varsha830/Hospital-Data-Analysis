/*
==========================================================
Project Name : Hospital Data Analysis Using SQL
Author       : Varsha Maurya
Database     : hospital_analysis
Table Name   : hospital_data
Description  : SQL queries for hospital data analysis
==========================================================
*/

-- ======================================================
-- Select Database
-- ======================================================

USE hospital_analysis;

-- ======================================================
-- View Dataset
-- ======================================================

SELECT * FROM hospital_data;

-- ======================================================
-- Query 1: Total Number of Patients
-- ======================================================

SELECT
    SUM(`Patients Count`) AS Total_Patients
FROM hospital_data;

-- ======================================================
-- Query 2: Average Number of Doctors per Hospital
-- ======================================================

SELECT
    `ï»¿Hospital Name`,
    AVG(`Doctors Count`) AS Average_Doctors
FROM hospital_data
GROUP BY `ï»¿Hospital Name`
ORDER BY `ï»¿Hospital Name`;

-- ======================================================
-- Query 3: Top 3 Departments with Highest Number of Patients
-- ======================================================

SELECT
    Department,
    SUM(`Patients Count`) AS Total_Patients
FROM hospital_data
GROUP BY Department
ORDER BY Total_Patients DESC
LIMIT 3;

-- ======================================================
-- Query 4: Hospital with Maximum Medical Expenses
-- ======================================================

SELECT
    `ï»¿Hospital Name`,
    SUM(`Medical Expenses`) AS Total_Medical_Expenses
FROM hospital_data
GROUP BY `ï»¿Hospital Name`
ORDER BY Total_Medical_Expenses DESC
LIMIT 1;

-- ======================================================
-- Query 5: Daily Average Medical Expenses
-- ======================================================

SELECT
    `ï»¿Hospital Name`,
    `Admission Date`,
    AVG(`Medical Expenses`) AS Daily_Average_Expenses
FROM hospital_data
GROUP BY `ï»¿Hospital Name`, `Admission Date`
ORDER BY `ï»¿Hospital Name`, `Admission Date`;

-- ======================================================
-- Query 6: Longest Hospital Stay
-- ======================================================

SELECT
    `ï»¿Hospital Name`,
    Location,
    Department,
    DATEDIFF(
        STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
        STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
    ) AS Stay_Days
FROM hospital_data
ORDER BY Stay_Days DESC
LIMIT 1;

-- ======================================================
-- Query 7: Total Patients Treated Per City
-- ======================================================

SELECT
    Location,
    SUM(`Patients Count`) AS Total_Patients
FROM hospital_data
GROUP BY Location
ORDER BY Total_Patients DESC;

-- ======================================================
-- Query 8: Average Length of Stay Per Department
-- ======================================================

SELECT
    Department,
    ROUND(
        AVG(
            DATEDIFF(
                STR_TO_DATE(`Discharge Date`, '%d-%m-%Y'),
                STR_TO_DATE(`Admission Date`, '%d-%m-%Y')
            )
        ),
        2
    ) AS Average_Stay_Days
FROM hospital_data
GROUP BY Department
ORDER BY Average_Stay_Days DESC;

-- ======================================================
-- Query 9: Department with Lowest Number of Patients
-- ======================================================

SELECT
    Department,
    SUM(`Patients Count`) AS Total_Patients
FROM hospital_data
GROUP BY Department
ORDER BY Total_Patients ASC
LIMIT 1;

-- ======================================================
-- Query 10: Monthly Medical Expenses Report
-- ======================================================

SELECT
    MONTHNAME(STR_TO_DATE(`Admission Date`, '%d-%m-%Y')) AS Month,
    YEAR(STR_TO_DATE(`Admission Date`, '%d-%m-%Y')) AS Year,
    SUM(`Medical Expenses`) AS Total_Medical_Expenses
FROM hospital_data
GROUP BY
    YEAR(STR_TO_DATE(`Admission Date`, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(`Admission Date`, '%d-%m-%Y')),
    MONTHNAME(STR_TO_DATE(`Admission Date`, '%d-%m-%Y'))
ORDER BY
    YEAR(STR_TO_DATE(`Admission Date`, '%d-%m-%Y')),
    MONTH(STR_TO_DATE(`Admission Date`, '%d-%m-%Y'));

-- ======================================================
-- End of Project
-- ======================================================