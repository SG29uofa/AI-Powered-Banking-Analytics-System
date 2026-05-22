# AI-Powered Banking Analytics System

## Project Overview

This project demonstrates an end-to-end banking analytics workflow using Databricks, SQL, Python, statistical analysis, machine learning, and AI-powered conversational analytics concepts.

The project analyzes banking marketing campaign data to identify customer behaviors associated with term deposit subscriptions and develops a lightweight conversational query assistant capable of handling natural-language business questions.

---

## Objectives

- Perform exploratory data analysis (EDA)
- Conduct data quality validation
- Validate business relationships using statistical hypothesis testing
- Build a machine learning model for subscription prediction
- Develop a conversational analytics assistant using natural-language query handling

---

## Technologies Used

- Databricks
- SQL
- Python
- Pandas
- SciPy
- Scikit-learn
- Spark SQL
- Machine Learning
- Conversational Analytics

---

## Project Workflow

### 1. Data Understanding & SQL Analytics
- Loaded banking dataset into Databricks
- Performed SQL-based EDA and business analysis
- Conducted missing value and duplicate checks
- Analyzed customer demographics and campaign characteristics

### 2. Statistical Validation
- Performed Chi-Square Test of Independence
- Conducted Welch’s Two-Sample t-test
- Validated relationships between customer behavior and subscription outcomes

### 3. Machine Learning
- Built Logistic Regression model
- Performed feature engineering and one-hot encoding
- Evaluated model using:
  - Accuracy
  - Confusion Matrix
  - Precision
  - Recall
  - F1-score

### 4. AI-Powered Conversational Analytics Assistant
Developed a lightweight conversational analytics assistant capable of:
- Accepting natural-language business questions
- Detecting analytical intent
- Generating analytical outputs dynamically

Example prompts:
- "Which jobs subscribe the most?"
- "How many customers subscribed?"
- "Show average balance by deposit"

---

## Key Findings

- Previous campaign outcomes showed strong association with subscription behavior
- Customers with previous successful campaign outcomes had the highest subscription rates
- Subscribed customers maintained higher average balances
- Logistic Regression achieved moderate predictive performance
- Conversational analytics workflows can simplify business query interactions

---

## Repository Structure

```text
ai-powered-banking-analytics-system/
│
|-- README.md
|-- ai_powered_banking_analytics_system.ipynb
|-- bank_sql_analysis.sql
```

---

## Future Improvements

- Add advanced machine learning models
- Improve conversational query flexibility
- Integrate real LLM APIs for semantic SQL generation
- Expand conversational analytics capabilities

---

## Author

Shreyash Ghagare
