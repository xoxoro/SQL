/*******************
join
********************/
--c15 r2889(107*27)-->조건없어서 모든 경우의 수를 다 더하는게 '카디젼 프로덕트'
select *
from employees, departments;


--가로11 세로107
select *
from employees, departments;

--가로4 세로27
select *
from departments;

--join
select  employee_id,
        first_name,
        salary,
        department_name
from employees, departments
where employees.department_id = departments.department_id;

select first_name, 
       employees.department_id,
       departments.department_id,
       department_name
from   employees, departments
where  employees.department_id = departments.department_id;

select  first_name, 
        em.department_id, 
        department_name, 
        de.department_id
from    employees em, --별명을 만들어 축약해준다 
        departments de
where  em.department_id = de.department_id;

--107*27*19
select count(*)
from employees em, departments de, jobs jo;

--106건임(107건X)
--양쪽다 만족하는 경우만 조인됨 null은 조인안됨(제외됨)
select  em.first_name,
        em.department_id,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo
where em.department_id = de.department_id
and   em.job_id = jo.job_id
order by em.first_name asc;


