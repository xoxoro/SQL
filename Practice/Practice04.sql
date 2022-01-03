/*
문제1.
평균 급여보다 적은 급여을 받는 직원은 몇명인지 구하시요(56건)
*/

select count(salary)
from employees
where salary < (select avg(salary)
                from employees);
                
/*
문제2.평균급여 이상 , 최대급여 이하의 월급을 받는 사원의
직원번호(employee_id), 이름 (first_name), 급여 (salary), 평균급여 , 최대급여를
급여의 오름차순으로 정렬하여 출력하세요(51건)
*/            

select employee_id,
       first_name,
       salary,
       (select avg(salary) from employees) 평균급여,
       (select max(salary) from employees) 최대급여
from employees
where salary >= (select avg(salary) from employees) and
      salary <= (select max(salary) from employees)
order by salary;

/*
문제3.직원중 Steven(first_name) king(last_name)이 소속된 부서가 있는 곳의 주소를 알아보려고 한다
도시아이디(location_id), 거리명 (street_address), 우편번호 (postal_code), 도시명 (city), 주(state_province), 나라아이디 (country_id) 를 출력하세요
(1건)
*/

select location_id, street_address, postal_code, city, state_province, country_id
from locations
where location_id = (select location_id 
                     from departments 
                     where department_id = (select department_id
                                            from employees
                                            where first_name||' '||last_name = 'Steven King'));
                                            
/*
문제4
job_id가 'ST_MAN' 인 직원의 급여보다 작은 직원의 사번 이름 급여를 급여의 내림차순으로 출력하세요
-ANY 연산자 사용(74건)
*/
select employee_id, first_name, salary
from employees
where salary < ANY (select salary
                from employees
                where job_id = 'ST_MAN')
order by salary;

/*
문제5 .각 부서별로 최고의 급여를 받는 사원의 직원번호 (employee_id), 이름 (first_name) 과 급여(salary) 부서번호 (department_id) 를 조회하세요
단 조회결과는 급여의 내림차순으로 정렬되어 나타나야 합니다 .
조건절비교, 테이블조인 2 가지 방법으로 작성하세요
(11건)
*/

-- 조건절비교 방법
select employee_id, first_name, salary, department_id
from employees
where (department_id, salary) in (select department_id, max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;                                  
                                
-- 테이블조인 방법                            
select e.employee_id, e.first_name, e.salary, e.department_id
from employees e, (select department_id, max(salary) salary
                   from employees
                   group by department_id) s
where e.department_id = s.department_id and
      e.salary = s.salary
order by e.salary desc;      
                                
                                
/*
문제6
각 업무 (job) 별로 연봉(salary)의 총합을 구하고자 합니다 .
연봉 총합이 가장 높은 업무부터 업무명 (job_title) 과 연봉 총합을 조 회하시오 (19건)
*/  
      
select job_title, salary
from jobs, (select job_id, max(salary) salary
            from employees
            group by job_id) e
where jobs.job_id = e.job_id
order by salary desc;
                                

/* 
문제7
자신의 부서 평균 급여보다 연봉 (salary)이 많은 직원의 직원번호 (employee_id), 이름
(first_ 과 급여 (salary) 을 조회하세요 (38건)
*/                          

select employee_id, first_name, salary
from employees e
where salary > (select avg(salary)
                from employees
                where department_id = e.department_id);                    
                          
                                
/*
문제8
직원 입사일이 11 번째에서 15 번째의 직원의 사번 , 이름 , 급여 , 입사일을 입사일 순서로 출력하세요
*/                                                    
select employee_id, first_name, salary, hire_date
from (select rownum rn, employee_id, first_name, salary, hire_date
      from (select employee_id, first_name, salary, hire_date 
            from employees 
            order by hire_date))
where rn >= 11 and rn <= 15;