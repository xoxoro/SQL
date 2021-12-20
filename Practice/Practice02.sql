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

--문3)마지막으로 신입사원이 들어온 날은 언제입니까?
--예)2014년 07월 10일
select hire_date
from employees
order by hire_date desc;

select to_char(max(hire_date),'YYYY"년"MM"월"DD"일"') 마지막입사일
from employees;