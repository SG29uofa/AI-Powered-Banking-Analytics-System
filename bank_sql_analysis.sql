-- BANK MARKETING ANALYTICS PROJECT
-- Databricks SQL Analysis



-- SECTION 1 — DATABASE CONFIGURATION


USE CATALOG demo;

USE SCHEMA default;



-- SECTION 2 — DATA UNDERSTANDING


-- Total number of rows
SELECT COUNT(*) AS total_numbers
FROM bank;

-- Show first 10 rows
SELECT *
FROM bank
LIMIT 10;

-- Show all column names
SHOW COLUMNS
IN bank;

-- Identify data types
DESCRIBE TABLE bank;

-- Distribution of target variable
SELECT deposit, COUNT(*)
FROM bank
GROUP BY deposit;



-- SECTION 3 — DATA QUALITY CHECKS


-- Missing values check
SELECT
    SUM(CASE WHEN age IS NULL THEN 1 ELSE 0 END) AS age,
    SUM(CASE WHEN job IS NULL THEN 1 ELSE 0 END) AS job,
    SUM(CASE WHEN marital IS NULL THEN 1 ELSE 0 END) AS marital,
    SUM(CASE WHEN education IS NULL THEN 1 ELSE 0 END) AS education,
    SUM(CASE WHEN default IS NULL THEN 1 ELSE 0 END) AS default_status,
    SUM(CASE WHEN balance IS NULL THEN 1 ELSE 0 END) AS balance,
    SUM(CASE WHEN housing IS NULL THEN 1 ELSE 0 END) AS housing,
    SUM(CASE WHEN loan IS NULL THEN 1 ELSE 0 END) AS loan,
    SUM(CASE WHEN contact IS NULL THEN 1 ELSE 0 END) AS contact,
    SUM(CASE WHEN day IS NULL THEN 1 ELSE 0 END) AS day,
    SUM(CASE WHEN month IS NULL THEN 1 ELSE 0 END) AS month,
    SUM(CASE WHEN duration IS NULL THEN 1 ELSE 0 END) AS duration,
    SUM(CASE WHEN campaign IS NULL THEN 1 ELSE 0 END) AS campaign,
    SUM(CASE WHEN pdays IS NULL THEN 1 ELSE 0 END) AS pdays,
    SUM(CASE WHEN previous IS NULL THEN 1 ELSE 0 END) AS previous,
    SUM(CASE WHEN poutcome IS NULL THEN 1 ELSE 0 END) AS poutcome,
    SUM(CASE WHEN deposit IS NULL THEN 1 ELSE 0 END) AS deposit
FROM bank;

-- Duplicate row check
SELECT COUNT(*)
FROM bank
GROUP BY age, job, marital, education, default,
         balance, housing, loan, contact,
         day, month, duration, campaign,
         pdays, previous, poutcome, deposit
HAVING COUNT(*) > 1;



-- SECTION 4 — EXPLORATORY DATA ANALYSIS (EDA)


-- Distribution of job categories
SELECT job, COUNT(*)
FROM bank
GROUP BY job;

-- Distribution of marital status
SELECT marital, COUNT(*)
FROM bank
GROUP BY marital;

-- Distribution of education categories
SELECT education, COUNT(*)
FROM bank
GROUP BY education;

-- Distribution of contact methods
SELECT contact, COUNT(*)
FROM bank
GROUP BY contact;

-- Distribution of previous campaign outcomes
SELECT poutcome, COUNT(*)
FROM bank
GROUP BY poutcome;



-- SECTION 5 — NUMERICAL SANITY CHECKS


-- Age statistics
SELECT
    MIN(age) AS min_age,
    MAX(age) AS max_age,
    AVG(age) AS average_age
FROM bank;

-- Balance statistics
SELECT
    MIN(balance) AS min_balance,
    MAX(balance) AS max_balance,
    AVG(balance) AS average_balance
FROM bank;

-- Call duration statistics
SELECT
    MIN(duration) AS min_duration,
    MAX(duration) AS max_duration,
    AVG(duration) AS average_duration
FROM bank;

-- Campaign statistics
SELECT
    MIN(campaign) AS min_campaign,
    MAX(campaign) AS max_campaign,
    AVG(campaign) AS average_campaign
FROM bank;



-- SECTION 6 — UNKNOWN VALUE ANALYSIS


-- Percentage of unknown jobs
SELECT
    COUNT(*) * 100.0 / (SELECT COUNT(job) FROM bank) AS percentage
FROM bank
WHERE job = 'unknown'
GROUP BY job;

-- Percentage of unknown education
SELECT
    COUNT(*) * 100.0 / (SELECT COUNT(education) FROM bank) AS percentage
FROM bank
WHERE education = 'unknown'
GROUP BY education;

-- Percentage of unknown contact methods
SELECT
    COUNT(*) * 100.0 / (SELECT COUNT(contact) FROM bank) AS percentage
FROM bank
WHERE contact = 'unknown'
GROUP BY contact;

-- Percentage of unknown previous campaign outcomes
SELECT
    COUNT(*) * 100.0 / (SELECT COUNT(poutcome) FROM bank) AS percentage
FROM bank
WHERE poutcome = 'unknown'
GROUP BY poutcome;



-- SECTION 7 — SUBSCRIPTION RATE ANALYSIS


-- Subscription rate by job
SELECT
    job,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS subscription_rate
FROM bank
GROUP BY job
ORDER BY subscription_rate DESC;

-- Subscription rate by education
SELECT
    education,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS subscription_rate
FROM bank
GROUP BY education
ORDER BY subscription_rate DESC;

-- Subscription rate by contact method
SELECT
    contact,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS subscription_rate
FROM bank
GROUP BY contact
ORDER BY subscription_rate DESC;

-- Subscription rate by previous campaign outcome
SELECT
    poutcome,
    COUNT(*) AS total_customers,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS subscribed,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) * 100.0 / COUNT(*) AS subscription_rate
FROM bank
GROUP BY poutcome
ORDER BY subscription_rate DESC;



-- SECTION 8 — STATISTICAL ANALYSIS PREPARATION


-- Contingency table for Chi-Square Test
SELECT
    poutcome,
    SUM(CASE WHEN deposit = 'yes' THEN 1 ELSE 0 END) AS yes,
    SUM(CASE WHEN deposit = 'no' THEN 1 ELSE 0 END) AS no
FROM bank
GROUP BY poutcome;

-- Average balance by subscription status
SELECT
    deposit,
    COUNT(*) AS total_customers,
    AVG(balance) AS avg_balance
FROM bank
GROUP BY deposit;