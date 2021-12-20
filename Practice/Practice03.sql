--문1)매니저가 있는 직원은 몇명?
select count(*)
from employees em, departments de
where em.manager_id = de.manager_id;

--문2)직원중에 최고임금(salary)과 최저임금을 “최고임금, “최저임금” 타이틀로 출력
--두 임금의 차이를 “최고임금 – 최저임금” 타이틀로 함께 출력
select  max(salary)최고임금,
        min(salary)최저임금
from employees;

select  first_name,
        salary
from employees
where salary = 24000
or salary = 2100;

select  max(salary)최고임금,
        min(salary)최저임금,
        max(salary)-min(salary) "최고임금-최저임금"
from employees;
