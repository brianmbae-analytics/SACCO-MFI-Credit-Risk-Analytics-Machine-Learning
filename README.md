# SACCO/MFI Credit Risk Analytics & Loan Default Prediction

## 📌 Project Overview

This project explores how **data analytics and machine learning can support credit-risk assessment for SACCOs, Microfinance Institutions (MFIs), and alternative lenders**.

The goal is to analyze borrower characteristics, financial behavior, loan information, and repayment history to identify factors associated with loan default and develop a model that can estimate the probability of a borrower defaulting.

The project is designed around a **Kenyan SACCO/MFI lending context**, where traditional credit information may not always provide a complete picture of a borrower's repayment capacity.

---

## 🎯 Business Problem

SACCOs and MFIs need to make lending decisions while managing the risk of borrowers failing to repay their loans.

Traditional lending decisions may rely heavily on:

* Credit history
* Salary/income
* Existing debt
* Savings
* Previous repayment behavior
* Employment information

However, alternative lenders can potentially incorporate additional behavioral and financial information to improve risk assessment.

This project asks:

> **Can borrower and loan characteristics be used to identify borrowers who are more likely to default?**

---

## 💡 Project Objectives

The main objectives are to:

1. Understand the characteristics of borrowers who default and those who do not.
2. Identify variables associated with loan default.
3. Perform exploratory and bivariate analysis.
4. Engineer additional features that may improve predictive power.
5. Build a machine-learning classification model.
6. Evaluate model performance using appropriate classification metrics.
7. Test different probability thresholds.
8. Translate the model results into practical lending applications.
9. Explore how the model could support a SACCO/MFI credit-risk dashboard.

---

## 📊 Dataset

The dataset represents a fictional but realistic SACCO/MFI lending environment.

Example variables include:

| Variable                 | Description                                               |
| ------------------------ | --------------------------------------------------------- |
| `age`                    | Borrower's age                                            |
| `county`                 | Borrower's county                                         |
| `employment_type`        | Type of employment                                        |
| `monthly_income`         | Monthly borrower income                                   |
| `loan_product`           | Type of loan taken                                        |
| `loan_amount`            | Amount borrowed                                           |
| `savings`                | Borrower's savings balance                                |
| `other_debt`             | Existing debt outside the current loan                    |
| `previous_defaults`      | Number of previous defaults                               |
| `previous_late_payments` | Previous late-payment count                               |
| `expenses`               | Estimated monthly expenses                                |
| `default`                | Target variable indicating whether the borrower defaulted |

### Target Variable

The target variable is:

`default`

where:

* `0` = Non-default
* `1` = Default

---

# 🔎 Exploratory Data Analysis

The analysis investigates how individual borrower and loan characteristics relate to default.

Examples include:

* Employment type → Default
* Loan product → Default
* County → Default
* Age → Default
* Monthly income → Default
* Loan amount → Default
* Savings → Default
* Other debt → Default
* Previous defaults → Default
* Previous late payments → Default

Correlation analysis was also used to examine relationships between numerical variables.

The purpose of this stage was not simply to identify correlations, but to understand **which characteristics may contain useful information for predicting credit risk**.

---

# 🛠️ Feature Engineering

Additional features were created from existing variables to represent borrower financial pressure and repayment capacity.

Examples include:

### Income-to-Expenses Ratio

```text
income_expense_ratio = monthly_income / expenses
```

This provides an indication of how much income a borrower has relative to their monthly expenses.

### Loan-to-Income Ratio

```text
loan_income_ratio = loan_amount / monthly_income
```

This helps represent the size of the requested loan relative to the borrower's income.

### Loan-to-Expenses Ratio

```text
loan_expense_ratio = loan_amount / expenses
```

This provides another perspective on the size of the loan relative to the borrower's regular financial obligations.

Feature engineering was used to transform raw variables into features that may better represent **financial capacity and credit risk**.

---

# 🤖 Machine Learning

A classification model was developed to predict the probability that a borrower will default.

The project focuses on **logistic regression** because it provides both predictive capability and interpretable coefficients, making it suitable for demonstrating how borrower characteristics can influence predicted risk.

The general workflow was:

```text
Raw Data
   ↓
Data Cleaning
   ↓
Exploratory Data Analysis
   ↓
Bivariate Analysis
   ↓
Feature Engineering
   ↓
Categorical Encoding
   ↓
Train/Test Split
   ↓
Feature Scaling
   ↓
Logistic Regression
   ↓
Probability Prediction
   ↓
Threshold Testing
   ↓
Model Evaluation
```

---

# ⚖️ Class Imbalance

Because loan default datasets can contain different numbers of default and non-default observations, class imbalance was considered during model development.

The model used:

```python
class_weight='balanced'
```

This gives additional importance to the minority class during model training.

For credit-risk applications, this can be useful because correctly identifying potential defaults may be more important than optimizing overall accuracy alone.

---

# 📈 Model Evaluation

The model was evaluated using several classification metrics.

### Accuracy

Measures the overall proportion of predictions that were correct.

### Precision

Answers:

> Of the borrowers predicted to default, how many actually defaulted?

### Recall

Answers:

> Of the borrowers who actually defaulted, how many did the model identify?

### F1 Score

Provides a balance between precision and recall.

### ROC-AUC

Measures how well the model distinguishes between default and non-default borrowers across different classification thresholds.

### Confusion Matrix

The confusion matrix provides a breakdown of:

* True Positives
* True Negatives
* False Positives
* False Negatives

These metrics are particularly important in credit-risk analysis because different types of prediction errors have different business consequences.

---

# 🎚️ Probability Threshold Analysis

Instead of automatically using the default threshold of:

```text
0.50
```

different probability thresholds were tested.

For example:

```text
0.30
0.40
0.50
0.60
0.70
```

Changing the threshold changes the balance between identifying more potential defaults and avoiding unnecessary rejection of lower-risk borrowers.

This demonstrates an important principle:

> **A machine-learning model does not make the lending decision by itself. The organization determines how predicted risk should translate into a lending policy.**

---

# 💼 Business Application

A SACCO or MFI could integrate a similar model into its loan assessment process.

A simplified workflow could look like:

```text
Loan Application
       ↓
Borrower Data
       ↓
Data Validation
       ↓
Feature Engineering
       ↓
Risk Model
       ↓
Default Probability
       ↓
Risk Classification
       ↓
Credit Officer Review
       ↓
Lending Decision
```

For example, the system could provide a borrower with:

```text
Predicted Default Probability: 18%
```

The organization could then combine this information with its own lending policies, affordability rules, credit history, and human review.

---

# 📊 Proposed Credit Risk Dashboard

The model can also be integrated into a **Power BI credit-risk dashboard**.

Potential dashboard sections include:

### Portfolio Overview

* Total loans
* Total loan value
* Default rate
* Average loan amount
* Average income
* Outstanding loan exposure

### Risk Analysis

* Default rate by county
* Default rate by loan product
* Default rate by employment type
* Default rate by income band
* Default rate by loan-size band

### Borrower Risk

* Predicted default probability
* Risk distribution
* High-risk applications
* Previous default history
* Loan-to-income ratio
* Income-to-expenses ratio

### Portfolio Monitoring

* Monthly default trends
* Default rate by loan product
* Loan exposure by risk segment
* Geographic risk distribution

---

# 🌍 Potential Kenyan SACCO/MFI Use Case

The concept could be extended to alternative lending environments where additional borrower information is available.

Potential data sources could include:

* Loan repayment history
* SACCO savings history
* Mobile-money transaction summaries
* Utility-payment history
* Airtime/recharge patterns
* Existing debt
* Income and expenses
* Previous late payments
* Loan application information

Such data would need to be collected and used in accordance with applicable **privacy, consumer-protection, and lending regulations**.

---

# 🧰 Tools & Technologies

* **Python**
* **Pandas**
* **NumPy**
* **Matplotlib**
* **Seaborn**
* **Scikit-learn**
* **Jupyter Notebook**
* **MySQL**
* **Power BI**
* **Git & GitHub**

---

# 📁 Suggested Repository Structure

```text
sacco-mfi-credit-risk/
│
├── data/
│   └── sacco_credit_risk.csv
│
├── notebooks/
│   ├── 01_data_cleaning.ipynb
│   ├── 02_eda_and_bivariate_analysis.ipynb
│   ├── 03_feature_engineering.ipynb
│   └── 04_credit_risk_model.ipynb
│
├── sql/
│   └── credit_risk_queries.sql
│
├── dashboard/
│   └── credit_risk_dashboard.pbix
│
├── reports/
│   └── credit_risk_project_report.pdf
│
├── images/
│   └── dashboard_preview.png
│
└── README.md
```

---

# 🔑 Key Analytical Questions

The project addresses questions such as:

1. Which borrower characteristics are associated with higher default rates?
2. Does previous default history provide useful predictive information?
3. How does loan size relate to borrower income?
4. Does the level of existing debt relate to default?
5. How does savings relate to repayment behavior?
6. Are some loan products associated with different default patterns?
7. Are there meaningful differences in default rates across counties?
8. Which features contribute most to the predictive model?
9. How does changing the probability threshold affect precision and recall?
10. How could the model support credit officers without replacing human review?

---

# 🚀 Future Improvements

Possible future development includes:

* Comparing logistic regression with Random Forest and Gradient Boosting.
* Hyperparameter tuning.
* Cross-validation.
* ROC and Precision-Recall curve analysis.
* Model calibration.
* Feature importance and model explainability.
* SHAP analysis.
* Deployment as an API.
* Automated loan-application scoring.
* Power BI integration.
* Database/API-based data ingestion.
* Model monitoring for changing borrower behavior.
* Testing the model on real-world, properly governed lending data.

---

# ⚠️ Important Disclaimer

This project uses a **synthetic/educational dataset** and is intended to demonstrate data analytics and machine-learning techniques.

The model should **not be used to make real lending decisions without appropriate validation, governance, fairness testing, privacy controls, regulatory review, and monitoring using representative real-world data**.

A predictive model should support—not automatically replace—appropriate credit assessment and institutional lending policies.

---

# 📌 Project Outcome

This project demonstrates an end-to-end credit-risk analytics workflow:

**Business Problem → Data → EDA → Feature Engineering → Machine Learning → Model Evaluation → Threshold Analysis → Business Application**

The broader objective is to demonstrate how **data analytics and machine learning can transform raw borrower information into actionable credit-risk insights for SACCOs, MFIs, and alternative lenders.**

---

## 👤 Author

**Brian Mbae Mwarania**

Civil Engineering Technologist | Data Analyst | Water & Irrigation Engineering

GitHub: `brianmbae-analytics`

LinkedIn: `linkedin.com/in/brian-mbae-598070223`
