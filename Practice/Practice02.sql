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

--문4)부서별로 평균임금, 최고임금, 최저임금을 부서아이디(department_id)와 함께 출력합니다.
--정렬순서는 부서번호(department_id) 내림차순입니다
select  round(avg(salary),0),
        max(salary),min(salary),
        department_id
from employees
group by department_id
order by department_id desc;

--문5)업무(job_id)별로 평균임금, 최고임금, 최저임금을 업무아이디(job_id)와 함께 출력하고 정렬
--순서는 최저임금 내림차순, 평균임금(소수점 반올림), 오름차순 순입니다.
--(정렬순서는 최소임금 2500 구간일때 확인해볼 것)
