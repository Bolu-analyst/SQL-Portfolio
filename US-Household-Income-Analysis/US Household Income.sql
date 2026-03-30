-- US Household Income Data Cleaning

Alter table us_household_income_statistics rename column ï»¿id to id;



SELECT count(id)
FROM us_household_income
;



SELECT count(id)
FROM us_household_income_statistics
;




SELECT *
FROM us_household_income
;



SELECT *
FROM us_household_income_statistics
;

SELECT id, count(id)
FROM us_household_income
group by id
having count(id) >1
;
select *
from (
select row_id, 
id,
row_number () over(partition by id order by id) row_num
from us_household_income) duplicates
where row_num > 1
;


SELECT count(id)
FROM us_household_income_statistics
;
delete from us_household_income
where row_id in (
select row_id
from (
select row_id, 
id,
row_number () over(partition by id order by id) row_num
from us_household_income) duplicates
where row_num > 1)
;

SELECT distinct State_Name
FROM us_household_income_statistics
group by State_Name
order by 1
;


update us_household_income
set state_name = 'Georgia'
where state_name = 'georia';


update us_household_income
set state_name = 'Alabama'
where state_name = 'alabama';



SELECT *
FROM us_household_income
where county = 'Autauga County'
order by 1
;

update us_household_income
set place = 'Autaugaville'
where county = 'Autauga County'
and city = 'Vinemont';

SELECT type, count(type)
FROM us_household_income
group by type
-- order by 1
;

update us_household_income
set type = 'Borough'
where type = 'Boroughs';



SELECT aland, awater
FROM us_household_income
where aland = 0 or aland = '' or aland is null;


-- exploratory data analysis 


SELECT *
FROM us_household_income
;



SELECT *
FROM us_household_income_statistics
;


SELECT State_Name, sum(ALand), sum(AWater)
FROM us_household_income
group by State_Name
Order by 3 desc
limit 10
;

SELECT *
FROM us_household_income u
join us_household_income_statistics us
	on	u.id = us.id
where mean <> 0
;



SELECT *
FROM us_household_income_statistics
;


SELECT u.State_Name, round(avg(Mean),1), round(avg(Median),1)
FROM us_household_income u
join us_household_income_statistics us
	on	u.id = us.id
    where mean <> 0
    group by u.state_name
    order by 3 desc
    limit 10
;



SELECT Type, round(avg(Mean),1), round(avg(Median),1)
FROM us_household_income u
join us_household_income_statistics us
	on	u.id = us.id
    where mean <> 0
    group by 1
    order by 1 desc
    limit 20
;



SELECT Type, count(type), round(avg(Mean),1), round(avg(Median),1)
FROM us_household_income u
join us_household_income_statistics us
	on	u.id = us.id
    where mean <> 0
    group by 1
    having count(type) >100
    order by 4 desc
    limit 20
;


select*
from us_household_income
where type = 'community';





SELECT u.State_Name, city, round(avg(mean),1), round(avg(median),1)
FROM us_household_income u
join us_household_income_statistics us
	on	u.id = us.id
    group by u.State_Name, city
    order by 3 desc
    ;
    
    
    