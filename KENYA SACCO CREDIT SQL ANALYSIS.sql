create database kenya_sacco_credit_risk_db;
select * from kenya_sacco_credit_risk;
describe kenya_sacco_credit_risk;

-- CONVERT APPLICATION DATE DATATYPE TO DATE DATATYPE
alter table kenya_sacco_credit_risk
modify column application_date date;

-- HOW MANY RECORDS DOES THE DATASET HAVE
select count(*) as records from kenya_sacco_credit_risk;

-- COUNT OF TOTAL LOAN APPLICATIONS
select count(*) as total_loan_applications from kenya_sacco_credit_risk;

-- COUNT OF UNIQUE BORROWERS
select count(distinct borrower_id) as total_borrowers from kenya_sacco_credit_risk;
-- There are 50000 unique borrowers from the dataset

-- HOW MANY BRANCHES DOES THE SACCO HAVE
select count(distinct branch) as branches from kenya_sacco_credit_risk;
select distinct
   branch
from kenya_sacco_credit_risk
group by 1;   
-- The sacco has 10 branches

-- DATE RANGE
select
   min(application_date) as earliest_application,
   max(application_date) as latest_application
from kenya_sacco_credit_risk;   
-- Earliest application = 2024-01-01
-- Latest application = 2026-08-31

-- TOTAL LOAN AMOUNT
select
   sum(loan_amount_kes) as total_loan_amount
from kenya_sacco_credit_risk;
-- The total loan amount is 15,829,125,800
   
-- AVERAGE LOAN AMOUNT
select
   round(avg(loan_amount_kes), 0) as average_loan_amount
from kenya_sacco_credit_risk;
-- Average loan amount is 316,583
   
-- MINIMUM AND MAXIMUM LOAN AMOUNT  
select
   min(loan_amount_kes) as minimum_loan_amount,
   max(loan_amount_kes) as maximum_loan_amount
from kenya_sacco_credit_risk;   
-- Minimum loan amount = 13,000
-- Maximum loan amount = 1,000,000

-- AVERAGE BORROWER INCOME
select 
  round(avg(monthly_income_kes), 0) as average_borrower_income
from kenya_sacco_credit_risk;  
-- The average borrower income is 64,657

-- TOTAL SAVINGS
select sum(savings_balance_kes) as total_savings from kenya_sacco_credit_risk;
-- The total savings are 9,592,528,000

-- LOAN PORTFOLIO BY PRODUCT

-- WHICH PRODUCT HAS THE HIGHEST LOAN APPLICATIONS
select
   loan_product,
   count(*) as loan_applications
from kenya_sacco_credit_risk
group by 1
order by 2 desc;   
-- Development has the highest loan applications(11,989) then Business(9972), Emergency(7,846 applications) and agriculture(7,113)
-- Asset finance has the least loan applications(6,032)

-- TOTAL LOAN AMOUNT BY PRODUCT
select
   loan_product,
   sum(loan_amount_kes) as total_loan_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc;   
-- The highest loan amount went to development(3,820,910,600)
-- The lowest loan amount went to asset finance(1,897,920,900)

-- AVERAGE LOAN AMOUNT BY PRODUCT
select
   loan_product,
   round(avg(loan_amount_kes), 0) as average_loan_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc; 
-- Development product had the highest average loan amount(318,701)
-- Asset finance product had the lowest average loan amount(314,642)

-- TOTAL REPAYMENT AMOUNT BY PRODUCT
select
  loan_product,
  sum(monthly_repayment_kes) as total_repayment_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc;
-- Emergency(537,068,900), School Fees(489,890,300), Business(287,736,300), Agriculture(257,347,400), Development(219,586,500), Asset Finance(57,524,700)
  
-- AVERAGE REPAYMENT AMOUNT BY PRODUCT
select
  loan_product,
  round(avg(monthly_repayment_kes),0) as average_repayment_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc;
-- School Fees(69,508), Emergency(68,451), Agriculture(36,180), Business(28,854), Development(18,316), Asset Finance(9,537)

-- LOAN PORTFOLIO BY BRANCH

-- LOAN APPLICATIONS PER BRANCH
select
   branch,
   count(*) as loan_applications
from kenya_sacco_credit_risk
group by 1
order by 2 desc;

-- TOTAL LOAN AMOUNT PER BRANCH
select
   branch,
   sum(loan_amount_kes) as total_loan_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc;

-- AVERAGE LOAN AMOUNT PER BRANCH
select
   branch,
   round(avg(loan_amount_kes), 0) as average_loan_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc; 

-- GEOGRAPHIC ANALYSIS

-- TOTAL LOAN APPLICATIONS BY COUNTY
select
   county,
   count(*) as total_loan_applications
from kenya_sacco_credit_risk
group by 1
order by 2 desc;

-- TOTAL LOAN AMOUNT APPLIED PER COUNTY
select
   county,
   sum(loan_amount_kes) as total_loan_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc;   

-- EMPLOYMENT ANALYSIS

-- LOAN APPLICATIONS BY EMPLOYMENT TYPE
select
   employment_type,
   count(*) as number_of_loan_applications
from kenya_sacco_credit_risk
group by 1 
order by 2 desc;
   
-- AVERAGE INCOME BY EMPLOYMENT TYPE
select
   employment_type,
   round(avg(monthly_income_kes),0) as average_income
from kenya_sacco_credit_risk
group by 1
order by 2 desc;

-- AVERAGE LOAN AMOUNT APPLIED FOR BY EMPLOYMENT TYPE
select
   employment_type,
   round(avg(loan_amount_kes),0) as average_loan_amount
from kenya_sacco_credit_risk
group by 1
order by 2 desc;

-- DEFAULT ANALYSIS

-- NUMBER OF DEFAULTS
select
   count(*) as defaults
from kenya_sacco_credit_risk
where defaulted = 1;
   
-- NUMBER OF NON DEFAULTS
select
   count(*) as non_defaults
from kenya_sacco_credit_risk   
where defaulted = 0;  

-- DEFAULT RATE
select
  round(((count(case when defaulted = 1 then 'default' end) / count(defaulted)) * 100), 1) as default_rate
from kenya_sacco_credit_risk;  

-- NUMBER OF DEFAULTS BY LOAN PRODUCT
select 
   loan_product,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc;   
 
-- DEFAULT RATE BY LOAN PRODUCT
with loan_products_default_count as (
select 
   loan_product,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc
)

select
  loan_product,
  round((average_defaults * 100), 2) as default_rate
from  loan_products_default_count
group by 1
order by 2 desc; 

-- NUMBER OF DEFAULTS BY EMPLOYMENT TYPE
select 
   employment_type,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc;  

-- DEFAULT RATE BY EMPLOYMENT TYPE
with employment_type_default_count as (
select 
   employment_type,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc
)

select
  employment_type,
  round((average_defaults * 100), 2) as default_rate
from  employment_type_default_count
group by 1
order by 2 desc; 
  
-- LOAN AMOUNT VS DEFAULT
select
  defaulted,
  count(loan_amount_kes) as number_of_loans,
  avg(loan_amount_kes) as average_loan_amount,
  std(loan_amount_kes) as std_loan_amount,
  min(loan_amount_kes) as minimum_loan_amount,
  max(loan_amount_kes) as maximum_loan_amount
from kenya_sacco_credit_risk
group by 1;
  
 -- NUMBER OF DEFAULTS BY COUNTY
select 
   county,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc;  

-- DEFAULT RATE BY COUNTY
with county_default_count as (
select 
   county,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc
)
select
  county,
  round((average_defaults * 100), 2) as default_rate
from  county_default_count
group by 1
order by 2 desc;  

-- INCOME VS DEFAULT
select
  defaulted,
  count(monthly_income_kes) as income_records,
  avg(monthly_income_kes) as average_income,
  std(monthly_income_kes) as std_income,
  min(monthly_income_kes) as minimum_income,
  max(monthly_income_kes) as maximum_income
from kenya_sacco_credit_risk
group by 1;  


-- PREVIOUS DEFAULTS VS CURRENT DEFAULT COUNT
select 
   previous_defaults,
   count(defaulted) as total_applications,
   sum(defaulted) as number_of_current_defaults,
   round(avg(defaulted),4) as average_current_defaults
from kenya_sacco_credit_risk
group by 1
order by 1 asc;  

-- PREVIOUS DEFAULTS VS CURRENT DEFAULT RATE
with previous_defaults_analysis as (
select 
   previous_defaults,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc
)
select
  previous_defaults,
  round((average_defaults * 100), 2) as default_rate
from  previous_defaults_analysis
group by 1
order by 1 asc;  

-- PREVIOUS LATE PAYMENTS VS CURRENT DEFAULT RATE
with previous_late_payments_analysis as (
select 
   previous_late_payments,
   count(*) as total_applications,
   sum(defaulted) as number_of_defaults,
   round(avg(defaulted),4) as average_defaults
from kenya_sacco_credit_risk
group by 1
order by 4 desc
)
select
  previous_late_payments,
  round((average_defaults * 100), 2) as default_rate
from  previous_late_payments_analysis
group by 1
order by 1 asc;  

-- SAVINGS VS DEFAULT
select 
   defaulted,
   count(savings_balance_kes) as total_applications,
    avg(savings_balance_kes) as average_savings,
  std(savings_balance_kes) as std_savings,
  min(savings_balance_kes) as minimum_savings,
  max(savings_balance_kes) as maximum_savings
from kenya_sacco_credit_risk
group by 1
order by 1 asc; 

-- OTHER DEBT VS DEFAULT
select 
   defaulted,
   count(other_monthly_debt_kes) as total_applications,
    avg(other_monthly_debt_kes) as average_debts,
    std(other_monthly_debt_kes) as std_debts,
    min(other_monthly_debt_kes) as minimum_debts,
    max(other_monthly_debt_kes) as maximum_debts
from kenya_sacco_credit_risk
group by 1
order by 1 asc; 

  
-- DEFAULT RATE BY BRANCH
-- DEFAULT RATE BY EMPLOYMENT
-- DEFAULT RATE BY RISK CATEGORY
select * from kenya_sacco_credit_risk;

