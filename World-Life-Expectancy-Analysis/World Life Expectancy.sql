-- world life expectancy project (data cleaning)


SELECT * 
FROM world_life_expectancy
;


SELECT Country, year, concat(country, year), count(concat(country, year))
FROM world_life_expectancy
group by Country, year, concat(country, year)
having count(concat(country, year)) > 1
;
select *
from (
select row_id, 
concat(country, year),
row_number() over(partition by concat(country, year) order by concat(country, year)) as row_num
from world_life_expectancy) as row_table
where row_num > 1
;


delete from world_life_expectancy
where 
	row_id in (
    select row_id
from (
select row_id, 
concat(country, year),
row_number() over(partition by concat(country, year) order by concat(country, year)) as row_num
from world_life_expectancy) as row_table
where row_num > 1
)
;

SELECT * 
FROM world_life_expectancy
where status = ''
;


SELECT distinct(status)
FROM world_life_expectancy
where status <> ''
;


select distinct (country)
from world_life_expectancy
where status = 'developing'
;


update world_life_expectancy
set status = 'developing'
where country in (
	select distinct (country)
	from world_life_expectancy
	where status = 'developing');


update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
set t1.status = 'Developing'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developing'
;


SELECT * 
FROM world_life_expectancy
where country = 'United States of America'
;

update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
set t1.status = 'Developed'
where t1.status = ''
and t2.status <> ''
and t2.status = 'Developed'
;

UPDATE world_life_expectancy
SET status = CONCAT(
    UPPER(LEFT(status, 1)),
    LOWER(SUBSTRING(status, 2))
);



SELECT * 
FROM world_life_expectancy
where `Life expectancy` = ''
;

SELECT country, year, `Life expectancy`
FROM world_life_expectancy
-- where `Life expectancy` = ''
;


SELECT t1.country, t1.year, t1.`Life expectancy`, 
t2.country, t2.year, t2.`Life expectancy`,
t3.country, t3.year, t3.`Life expectancy`,
round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
FROM world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
    and t1.year = t2.year -1
join world_life_expectancy t3
	on t1.country = t3.country
    and t1.year = t3.year +1
where t1.`Life expectancy` = ''
;


update world_life_expectancy t1
join world_life_expectancy t2
	on t1.country = t2.country
    and t1.year = t2.year -1
join world_life_expectancy t3
	on t1.country = t3.country
    and t1.year = t3.year +1
set t1.`Life expectancy` = round((t2.`Life expectancy` + t3.`Life expectancy`)/2,1)
where t1.`Life expectancy` = ''
;


SELECT * 
FROM world_life_expectancy
-- where `Life expectancy` = ''
;



-- exploratory data analysis 

select *
from world_life_expectancy 
;


select Country, min(`Life expectancy`), 
max(`Life expectancy`),
round(max(`Life expectancy`) - min(`Life expectancy`), 1) as life_increase
from world_life_expectancy 
group by country 
having min(`Life expectancy`) <>0
and max(`Life expectancy`) <> 0
order by life_increase asc
;



select year, round(avg(`Life expectancy`),2)
from world_life_expectancy 
where `Life expectancy`<>0
and `Life expectancy` <> 0
group by year 
order by year 
;


select country, round(avg(`Life expectancy`),1) as life_exp , round(avg(gdp),1) as gdp
from world_life_expectancy 
group by country 
having life_exp >0
and gdp >0
order by gdp desc
;


select 
sum(case when GDP >=1500 then 1 else 0 end )High_GDP_Count,
avg (case when GDP >= 1500 then `life expectancy` else null end) as high_GDP_life_expectancy,
sum(case when GDP <=1500 then 1 else 0 end )low_GDP_Count,
avg (case when GDP <= 1500 then `life expectancy` else null end) as low_GDP_life_expectancy
from world_life_expectancy 
;



select status, round(avg(`life expectancy`),1)
from world_life_expectancy 
group by status
;

select status, count(distinct country), round(avg(`life expectancy`),1)
from world_life_expectancy 
group by status
;


select country, round(avg(`Life expectancy`),1) as life_exp , round(avg(BMI),1) as BMI
from world_life_expectancy 
group by country 
having life_exp >0
and BMI >0
order by BMI ASC
;



select Country, 
Year,
`Life expectancy`,
`Adult Mortality`,
sum(`Adult Mortality`) over(partition by country order by year) as Rolling_total
from world_life_expectancy
where country like '%united%'
;






