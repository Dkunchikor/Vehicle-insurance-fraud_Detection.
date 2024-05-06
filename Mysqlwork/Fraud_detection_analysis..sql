/*--- Vehicle Insurance FRAUD DETECTION ---*/

/*-------DATA EXPLORATION------*/
---/* This query will fetch all rows and columns from the dataset for data exploration */---
SELECT * FROM fraud_detection;

/*--- These queries will fetch the columns individually for understanding----*/
SELECT make, COUNT(*) AS count FROM fraud_detection GROUP BY make;

SELECT accidentarea, COUNT(*) AS count FROM fraud_detection GROUP BY accidentarea;

select Maritalstatus, count(*) as count from fraud_detection group by MaritalStatus;

select Fault, count(*) as count from fraud_detection group by Fault;

select PolicyType, count(*) as count from fraud_detection group by Policytype;

select Sex, count(*) as count from fraud_detection group by Sex;

select Policereportfiled, count(*) as count from fraud_detection group by PoliceReportFiled;

select Witnesspresent, count(*) as count from fraud_detection group by WitnessPresent;

select AgentType, count(*) as count from fraud_detection group by AgentTYPE;

SELECT BasePolicy, count(*) as count from fraud_detection group by BasePolicy;

SELECT month, COUNT(*) AS count FROM fraud_detection GROUP BY month;
-- Analyze trends over time for fraud detection

/* altering the month column name to avoid further confusion */

ALTER TABLE fraud_detection
CHANGE `ï»¿Month` Month varchar(3);

/*------Descriptive Statistical Analysis-------*/

select min(age) as min_age, max(age) as max_age, avg(age) as avg_age from fraud_detection;

select min(vehicleprice) as min_vehicleprice, max(vehicleprice) as max_vehicleprice, avg(vehicleprice) as avg_vehicleprice from fraud_detection;

select min(Deductible) as min_Deductible, max(Deductible) as max_Deductible, avg(Deductible) as avg_Deductible from fraud_detection;

select min(Days_Policy_Accident) as min_Days_Policy_Accident, max(Days_Policy_Accident) as max_Days_Policy_Accident, avg(Days_policy_Accident) as avg_Days_Policy_Accident from fraud_detection;

select min(Days_Policy_Claim) as min_Days_Policy_Claim, max(Days_Policy_Claim) as max_Days_Policy_Claim, avg(Days_Policy_Claim) as avg_Days_Policy_Claim from fraud_detection;


/*----------Fruadulent analysis------*/
/* This query calculates the frequency of fraudulent 
   and non fraudulent claim applications using 
   aggregate func (count)  */
   
select fraudfound_p, Count(*) as count
from fraud_detection
group by fraudfound_p;

select Make, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Make;

select WitnessPresent, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by WitnessPresent;

select PoliceReportFiled, count(*) as count 
from fraud_detection
where FraudFound_P = 'fraudulent'
group by PoliceReportFiled;

select Fault, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by fault;

select Deductible, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by deductible;

select AccidentArea, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by AccidentArea;

select DayOfWeekClaimed, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by DayOfWeekClaimed;

select MonthClaimed, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by MonthClaimed;

select WeekOfMonthClaimed, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by WeekOfMonthClaimed;


 /*---Gender analysis-------*/
/* Analyzing the distribution of fraudulent claims by gender */

select sex, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by sex;

select  Age, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Age;

/*-----policytype analysis for fraudulent claims---*/
select PolicyType, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by PolicyType;

select AgeOfPolicyHolder, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by AgeOfPolicyHolder;

select Days_Policy_Accident, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Days_Policy_Accident;

select Days_Policy_Claim, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Days_Policy_Claim;

select BasePolicy, count(*) as count
from fraud_detection
where FraudFound_P = ' fraudulent'
group by BasePolicy;

/*----past claims of fraudulent claim----*/
select PastNumberOfClaims, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by PastNumberOfClaims;

/* --------Age analysis--------*/
/*Analyzing the age difstribution of fraudulent claimants */

select avg(age) as average_age, min(age) as minimum_age, max(age) as maximum_age
from fraud_detection
where fraudfound_p = 'fraudulent';

/*---------Temporal analysis---------*/
/* Analayzing if there are any temporal patterns in  fraudulent claims based 
on the dayoftheweek,month,year*/

select DayOfWeek, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by DayOfWeek;

select Month, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Month;

select Year, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Year;

    
/*----exploring the distinct vehiclecategory for furthur analysis---*/
/*-----selecting distinct vehiclecategory----/*

select distinct vehiclecategory
from fraud_detection;

/*---vehicle category analysis and vehicleprice----*/
/*Analyze the distribution of fraudulent claims by vehicle category*/
select VehicleCategory,count(*) as fraudulentclaimscount
from fraud_detection
where FraudFound_P = 'fraudulent'
group by VehicleCategory;

/*Analyze the distribution of fraudulent claims by vehicle price*/
select Vehicleprice, count(*) as count
from fraud_detection
where FraudFound_P = 'fraudulent'
group by Vehicleprice;




