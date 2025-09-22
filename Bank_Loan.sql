select * from Bank_loan_data

select COUNT(id) as Total_Loan_Application from Bank_loan_data

select COUNT(id) as MTD_Total_Loan_Application from Bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


select COUNT(id) as PMTD_Total_Loan_Application from Bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021


select SUM(loan_amount) as MTD_Total_Funded_Amount from Bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021


select SUM(loan_amount) as PMTD_Total_Funded_Amount from Bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

select SUM(total_payment) as Total_Amount_Received From Bank_loan_data

select SUM(total_payment) as MTD_Total_Amount_Received From Bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

select SUM(total_payment) as PMTD_Total_Amount_Received From Bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

select ROUND(AVG(int_rate), 4) * 100 as MTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

select ROUND(AVG(int_rate), 4) * 100 as PMTD_Avg_Interest_Rate from bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

select ROUND(AVG(dti), 4) * 100 as MTD_Avg_DTI from Bank_loan_data
where MONTH(issue_date) = 12 and YEAR(issue_date) = 2021

select ROUND(AVG(dti), 4) * 100 as PMTD_Avg_DTI from Bank_loan_data
where MONTH(issue_date) = 11 and YEAR(issue_date) = 2021

select 
    (COUNT(CASE when loan_status = 'Fully Paid' OR loan_status = 'Current' then id end)*100)
	/
	COUNT(id) as Good_loan_percentage
from Bank_loan_data

select COUNT(id) as Good_loan_Application from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select SUM(loan_amount) as Good_loan_Funded_Amount from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select SUM(total_payment) as Good_loan_Received_Amount from Bank_loan_data
where loan_status = 'Fully Paid' or loan_status = 'Current'

select
   (COUNT(case when loan_status = 'Charged off' then id end) *100.0) /
   COUNT(id) as Bad_loan_percentage
from Bank_loan_data

select COUNT(id) as Bad_loan_Application from Bank_loan_data
where loan_status = 'Charged off'

select SUM(loan_amount) as Bad_loan_Funded_Amount from Bank_loan_data
where loan_status = 'Charged off'

select SUM(total_payment) as Bad_loan_Received_Amount from Bank_loan_data
where loan_status = 'Charged off'

select 
      loan_status,
	  COUNT(id) as Tota_Loan_Application,
	  SUM(total_payment) as Total_Amount_Received,
	  SUM(loan_amount) as Total_Funded_Amount,
	  AVG(int_rate * 100) as Interest_Rate,
	  AVG(dti * 100) as DTI
  from
      Bank_loan_data
  group by 
      loan_status

select 
     loan_status,
	 SUM(total_payment) as MTD_Total_Amount_Recieved,
	 SUM(loan_amount) as MTD_Total_Funded_Amount
from Bank_loan_data
where MONTH(issue_date) = 12
group by loan_status

select 
     MONTH(issue_date) as Month_Number,
	 DATENAME(MONTH, issue_date) as Month_Name,
	 COUNT(id) as Total_loan_Application,
	 SUM(loan_amount) as Total_Funded_Amount,
	 SUM(total_payment) as Total_Amount_Received
from Bank_loan_data
group by  MONTH(issue_date) , DATENAME(MONTH, issue_date) 
order by Month_Number

select 
     address_state,
	 term,
	 emp_length,
	 purpose,
	 home_ownership,
	 COUNT(id) as Total_loan_Application,
	 SUM(loan_amount) as Total_Funded_Amount,
	 SUM(total_payment) as Total_Amount_Received
from Bank_loan_data
group by  address_state
order by address_state desc