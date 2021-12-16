/*그룹함수*/
--오류발생 이유 ->1개의 row에 표현할수없음 avg 107개임
select first_name, avg(salary)
from employees;

--그룹함수 avg()
select avg(salary)
from employees;

select avg(salary)
from employees;

--그룹함수 count()-->row의 개수 구하는것
select count(*)
from employees;

select  count(*),
        count(commission_pct)
from employees;

select count(*)
from employees
where department_id = 100;

--그룹함수 sum()
select sum(salary)
from employees;

select sum(salary), count(*), avg(salary)
from employees
where salary > 16000;

--그룹함수 avg()
select  count(*),
        sum(salary),
        avg( nvl(salary,0) )
from employees;

--그룹함수 max min
select  count(*),
        max(salary),
        min(salary)
from employees;


/*************************
group by 절
**************************/
select  avg(salary), 
        department_id
from employees
group by department_id;


