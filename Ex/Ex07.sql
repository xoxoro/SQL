/***********************
sub Query
***********************/

--1)딘의 급여
select salary
from employees
where first_name = 'Den';

--2)찾는 급여
select  first_name,
        salary
from employees
where salary > 11000;

--3)Query문 완성
select  first_name,
        salary
from employees
where salary > (select salary
                from employees
                where first_name = 'Den');

--ex)급여를 가장 적게 받는 사람의 이름, 급여, 사원번호는?

--1. 급여를 가장 적게 받는 사람의 급여
select min(salary)
from employees;

--2. 2100받는 사람의 이름, 급여, 사원번호
select  first_name||' '||last_name,
        salary,
        employee_id
from employees
where salary = 2100; 
        
--3. 식 조합
select  first_name,
        salary,
        employee_id
from employees
where salary = (select min(salary)
                from employees);


--예제)
--평균 급여보다 적게 받는 사람의 이름, 급여를 출력하세요
--1. 평균급여
select avg(salary)
from employees;

--2. 6461.8317보다 적게 받는 사람의 이름,급여
select  first_name,
        salary
from employees
where salary < 6461.8317;

--식 조합
select  first_name,
        salary
from employees
where salary < (select avg(salary)
                from employees);

/***********************************
*Sub Query(다중행)
************************************/
--부서번호가 110인 직원의 급여와 같은 모든 직원의 사번, 이름, 급여를 출력하세요
--1. 부서번호가 110인 직원의 급여리스트를 구한다.
--   12008  8300
select  salary
from employees
where department_id = 110;

--2. 급여가 12008, 8300 인 직원의 리스틀 구한다
--표현1
select  employee_id,
        first_name,
        salary
from employees
where salary = 12008
or salary = 8300;

--표현2
select  employee_id,
        first_name,
        salary
from employees
where salary in (12008, 8300);

--3 두식을 조합한다
select  employee_id,
        first_name,
        salary
from employees
where salary in (select  salary
                 from employees
                 where department_id = 110);


--예제)
--각 부서별로 최고급여를 받는 사원을 출력하세요

--그룹(부서)별 최고급여를 구할때 사람 first_name은 표현할 수 없다
select  department_id,
        --first_name,
        max(salary)
from employees
group by department_id;

--사원테이블에서 그룹(부서)번호와 급여가 같은 직원을 구한다.
--row가 한줄이면 = 쓰면 되는데 결과를 여러줄 봐야하니까 in
--괄호로 안묶어주면 에러남
select  first_name,
        salary,
        department_id
from employees
where (department_id, salary) in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id)
order by department_id asc;

--null값 부서도 표현하고 싶을때>>근데 왜 0값으로 안바뀌는지 모르겠음
select  first_name,
        salary,
        department_id
from employees
where (nvl(department_id,0), salary) in (select nvl(department_id,0),
                                                max(salary)
                                         from employees
                                         group by department_id)
order by department_id asc;



--any 연산자
--부서번호가 110인 직원의 급여 보다 큰 모든 직원의
--사번, 이름, 급여를 출력하세요(or연산-->8300보다 큰)

--1. 부서번호가 110인 직원의 급여
select salary
from employees
where department_id = 110;

--2. 부서번호가 110인(12008,8300) 보다 급여가 큰 직원리스트(사번, 이름, 급여)를 출력
select  employee_id,
        first_name,
        salary
from employees
where salary > 12008
or salary > 8300;

--조합
select  employee_id,
        first_name,
        salary
from employees
where salary >any ( select salary
                    from employees
                    where department_id = 110);
                    

--all 연산자
--부서번호가 110인 직원의 급여보다 큰 모든 직원의
--사번, 이름, 급여를 출력하세요(and 연산--> 12008보다 큰)

--1. 부서번호가 110인 직원의 급여
select salary
from employees
where department_id = 110;

--2. 부서번호가 110인(12008, 8300) 보다 급여가 큰 직원리스트)사번, 이름, 급여)
select  employee_id,
        first_name,
        salary
from employees
where salary > 12008
and salary> 8300;

--3. 조합
select  employee_id,
        first_name,
        salary
from employees
where salary >all ( select salary
                    from employees
                    where department_id=110);
        
----------------------------------------------                    
 select *
from employees , (select department_id,
                         max(salary) salary
                  from employees
                  group by department_id);
                  
select  em.first_name,
        em.salary,
        em.department_id,
        ms.department_id,
        ms.salary
from employees em, (select department_id,
                         max(salary) salary
                  from employees
                  group by department_id) ms
where em.department_id = ms.department_id
and em.salary = ms.salary;

