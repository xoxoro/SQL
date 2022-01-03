-- 문제1
select first_name, 
       manager_id, 
       commission_pct, salary
from employees
where manager_id is not null and 
      commission_pct is null and
      salary > 3000;
      
-- 문제2
select employee_id 직원번호, 
       first_name 이름, 
       salary 급여, 
       to_char(hire_date,'yy-mm-dd day') 입사일, 
       replace(phone_number,'.','-') 전화번호, 
       department_id 부서번호
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;                                  

-- 문제3
select ma.manager_id, first_name, avg_Sal, min_Sal, max_Sal
from (select manager_id, round(avg(salary),0) avg_Sal, min(salary) min_Sal, max(salary) max_Sal
      from employees
      where hire_date >= '05/01/01'
      group by manager_id
      having avg(salary)>=5000 ) ma, employees em
where ma.manager_id = em.employee_id
order by avg_sal desc;

-- 문제4
select em.employee_id, em.first_name, department_name, ma.first_name
from employees em, departments de, employees ma
where em.department_id = de.department_id(+) and
      em.manager_id = ma.employee_id;
      
-- 문제5
select employee_id, first_name, department_name, salary, hire_date
from(select rownum rn, employee_id, first_name, department_name, salary, hire_date
     from ( select employee_id, first_name, department_name, salary, hire_date
            from employees em, departments de
            where em.department_id = de.department_id and
                  hire_date >= '05/01/01'
            order by hire_date
           )
    )
where rn >= 11 and rn <= 20;

-- 문제6
select name 이름, 
       salary 연봉, 
       department_name 부서명, 
       hire_date
from (select first_name ||' '|| last_name name , salary ,hire_date, department_id
      from employees
      where hire_date in (select max(hire_date) 
                          from employees)
     ) em, departments de
where em.department_id = de.department_id;

-- 문제7              

select employee_id 사번, 
       first_name 이름, 
       last_name 성,
       salary 급여, 
       avg_salary, 
       job_title
from (select department_id, salary avg_salary
      from (select department_id, avg(salary) salary
            from employees 
            group by department_id
            order by salary desc)
      where rownum=1
      ) max_sal, employees em, jobs jo
where em.department_id = max_sal.department_id and
      em.job_id = jo.job_id;

-- 문제8 평균 급여가 가장 높은 부서는 ?
select department_name
from departments
where department_id = (select department_id
                       from (select department_id, avg(salary) salary
                             from employees 
                             group by department_id
                             order by salary desc)
                       where rownum=1 );

-- 문제9 평균 급여가 가장 높은 지역은 ?
select region_name
from regions
where region_id = (select region_id
                from(select re.region_id, avg(salary)
                     from employees em, departments de, locations lo, countries co, regions re
                     where em.department_id = de.department_id and
                           lo.location_id = de.location_id and
                           lo.country_id = co.country_id and
                           re.region_id = co.region_id
                     group by re.region_id
                     order by avg(salary) desc )
                where rownum =1 );

-- 문제10 평균 급여가 가장 높은 업무는 ?
select job_title
from jobs
where job_id = (select job_id
                from(select jo.job_id, avg(salary)
                     from employees em, jobs jo
                     where em.job_id = jo.job_id
                     group by jo.job_id
                     order by avg(salary) desc )
                where rownum =1 );
