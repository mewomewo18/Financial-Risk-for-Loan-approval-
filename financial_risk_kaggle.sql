SET SQL_SAFE_UPDATES = 0;
USE kaggle_data;
UPDATE loan
SET ApplicationDate = STR_TO_DATE(ApplicationDate, '%m/%d/%Y')
WHERE ApplicationDate LIKE '%/%/%';
ALTER TABLE loan
MODIFY ApplicationDate DATE;
SET SQL_SAFE_UPDATES = 1;
DESCRIBE loan;
USE kaggle_data;
Select 
DATE_FORMAT(ApplicationDate, '%Y') As _year,
	Case
		when LoanApproved = 1 then 'Approved'
		else 'Declined'
    end as approval_status,
	count(*) as total_applicants,
	round(avg(Age),2) as avg_age,
	round(avg(AnnualIncome),2) as avg_income,
	round(avg(TotalAssets),2) as avg_assets, 
	round(avg(TotalLiabilities),2) as avg_liabilities,
	round(avg(SavingsAccountBalance),2) as avg_savings, 
	round(avg(JobTenure),2) as avg_jobtenure, 
	round(avg(TotalDebtToIncomeRatio),2) as avg_debtincomeratio
From loan
Group by 1,2
Order by 1;



