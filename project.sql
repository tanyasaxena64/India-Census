select * from Project.data1;
select * from Project.data2;

-- number of rows
select count(*) from Project.data1;
select count(*) from Project.data2;

-- dataset for Jharkhand & Bihar
select * from Project.data1 where state in ('Jharkhand','Bihar');

-- population of India
select sum(Population) population from Project.data2;

-- Average of Growth
select state,avg(Growth)*100 avg_growth from Project.data1 group by state;

-- Average sex ratio
select state,round(avg(Sex_Ratio),0) avg_sex_ratio from Project.data1 group by state order by avg_sex_ratio desc;

-- Average literacy rate
select state,round(avg(Literacy),0) avg_literacy from Project.data1
 group by state having round(avg(Literacy),0)>90 order by avg_literacy desc;
 
-- Top 3 states with highest growth ratio
select state,avg(Growth)*100 avg_growth from Project.data1 group by state order by avg_growth desc limit 3;
 
-- Bottom 3 states with lowest sex ratio
select state,round(avg(Sex_Ratio),0) avg_sex_ratio from Project.data1 group by state order by avg_sex_ratio asc limit 3;
 
-- Display both states from both tables
select state from Project.data1
union
select state from Project.data2;

 -- States with letter a
select distinct State from Project.data1 where lower(State) like 'a%'; 

-- Joining both tables

-- Population in previous census
select sum(m.previous_census_pop) previous_census_pop,sum(m.current_census_pop) current_census_pop from (
select e.state, sum(e.previous_census_pop), sum(e.current_census_pop) from
(select d.district ,d.state, round(d.population/(1+d.growth),0) previous_census_pop, d.population current_census_pop from
(select a.district,a.state,a.growth growth,b.population from project.data1 a inner join Project.data2 b on a.district=b.district)d)e group by e.state)m;

 
 
 
