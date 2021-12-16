/*
select 문
    select 절
    from 절
*/

--직원테이블 전체조회
select*
from employees;

select*from departments;

select employee_id, 
       first_name,
       last_name
from employees;

--예
select first_name,
       phone_number,
       hire_date,
       salary
from employees;
       
select first_name, 
        last_name, 
        salary, 
        phone_number, 
        email,
        hire_date
from employees;

--출력할 컬럼명 별명적용하기
select employee_id as empNo,
       first_name "f-name",
       salary "S a lary" -->대소문자 구분,공백,특수문자 등 필요한 경우 쌍따옴표붙여서 "급  여" 가능
from EMPLOYEEs;

select first_name as 이름,
       phone_number as 전화번호,
       hire_date as 입사일,
       salary as 급여
from employees;

select employee_id,
       first_name,
       last_name,
       salary,
       phone_number,
       email,
       hire_date
from employees;

SELECT first_name || last_name
FROM employees;

select employee_id as empNo,
       first_name "f-name",
       salary "Salary" -->대소문자 구분,공백,특수문자 등 필요한 경우 쌍따옴표붙여서 "연  봉" 가능
from EMPLOYEEs;

SELECT first_name || last_name
FROM employees;
    
SELECT first_name || ' ' || last_name as name
FROM employees;

SELECT first_name || ' 입사일은 ' || hire_date
FROM employees;

SELECT first_name || ' ' || last_name ||  ' ' ||phone_number as information
FROM employees;

--산술 연산자 사용하기
SELECT first_name,
       salary, -->월급
       salary*12, -->연봉
       (salary+300)*12
from employees;

--예)
select first_name ||'-'|| last_name as "이 름",
       salary as 월급,
       salary*12 as 연봉,
       (salary*12)+5000 as "Bonus",
       phone_number as 폰번호
from employees;

/*where 절*/
--비교연산자
--부서번호가 10인 사원의 이름을 구하시오.
select first_name,
        last_name,
        salary,
        department_id
from employees
where department_id = 10;

select first_name,
        last_name,
        salary,
        department_id
from employees
where department_id >= 50;

--연봉이 15000 이상인 사원들의 이름과 월급을 출력하세요
--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
--이름이 Lex인 직원의 연봉을 출력하세요문자, 날자는 ‘ ‘ 로 감싸줌    ‘ ‘는 대소문자를 구분한다
select first_name ||' '||last_name 이름,
        salary 월급
from employees
where salary >= 15000;

select first_name ||' '|| last_name 이름
from employees
where hire_date > '07/01/01';

select first_name ||' '|| last_name 이름
from employees
where first_name='Lex';

select *
from employees
where salary >= 14000
and salary<17000;

--IN 연산자로 여러조건 검색하기
select *
from employees
where first_name in ('Lex', 'John')
or last_name in ('Kochhar');

--예제)
select first_name,
        salary
from employees
where salary in (2100,3100,4100,5100);

--연봉이 14000 이하이거나 17000 이상이고
--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일을 출력하세요
select first_name || ' ' || last_name 이름,
        salary*12 연봉,
        hire_date 입사일
from employees
where salary*12 <= 14000
or salary*12 >= 100000
and hire_date > '04/01/01'
and hire_date < '05/12/31';

--연봉이 14000 이하이거나 17000 이상이거나
--입사일이 04/01/01 에서 05/12/31 사이의 사원의 이름과 입사일과 연봉을 출력하세요
select first_name || ' ' || last_name 이름,
        salary*12 연봉,
        hire_date 입사일
from employees
where salary*12 <= 14000
or salary*12 >= 100000
or hire_date between '04/01/01' and '05/12/31';

--Like 연산자로 비슷한것들 모두 찾기
select *
from employees
where first_name like 'Li%';

--이름에 am 을 포함한 사원의 이름과 연봉을 출력하세요
select first_name 이름,
        salary 연봉
from employees
where first_name like '%am%';--앞이나 뒤에 뭐가 오든 상관없음

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요
select first_name 이름,
        salary 연봉
from employees
where first_name like '_a%';

--이름의 네번째 글자가 a 인 사원의 이름을 출력하세요
select first_name 이름
from employees
where first_name like '___a%';


--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name 이름
from employees
where first_name like '__a_';

--null
select first_name, 
        salary, 
        commission_pct, 
        salary*commission_pct
from employees
where salary between 13000 and 15000;

--is null / is not null
select first_name,
       salary,
       commission_pct
from employees
where commission_pct is null;

--커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요
select first_name,
       salary*commission_pct
from employees
where commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요
select first_name,
       commission_pct
from employees
where commission_pct is null
and manager_id is null;

/*ORDER BY 절*/
select *
from employees
order by salary;-->asc랑 같음 오름차순

select *
from employees
order by salary desc;-->내림차순

select *
from employees
where salary >= 2500
order by salary asc, first_name desc;

--부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select department_id,
       salary,
       first_name
from employees
order by department_id asc;

--급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select first_name 이름,
       salary 급여
from employees
where salary >= 10000
order by salary desc;

--부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요  
select department_id,
       salary,
       first_name
from employees
order by department_id asc, salary desc;
