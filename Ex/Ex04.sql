/***************
group by 절
***************/
select avg(salary)
from employees
group by department_id;


select avg(salary), department_id
from employees
group by department_id
order by department_id asc;

--예제
--연봉(salary)합계가 20000 이상인 부서의 부서 번호와, 인원수, 급여합계를 출력하세요
select  department_id,
        count(*),
        sum(salary)
from employees
where sum(salary) >= 20000 --where절에는 그룹함수를 쓸 수 없어 오류남
group by department_id
order by department_id asc;

--Having 절
select  department_id,
        count(*),
        sum(salary)
from employees
--where절에는 그룹함수를 쓸 수 없어 having절로 대체한다
group by department_id
having sum(salary) >= 20000 
and department_id = 100; --연봉합계가 2만이상인 애들중에 부서번호가 100번인 애들

--case ~ end 문
select  employee_id,
        salary
        job_id,
        case when job_id = 'AC_ACCOUNT' then salary + salary*0.1
             when job_id = 'SA_REP' then salary + salary*0.2
             when job_id = 'ST_CLERK' then salary + salary*0.3
             else salary
        end  Bonus
from employees;

--DECODE() '같으면'만 가능
select  employee_id,
        salary,
        decode( job_id,'AC_ACCOUNT', salary+salary*01,
                       'SA_REP', salary + salary*0.2,
                       'ST_CLERK', salary + salary*0.3,
        salary)as Bonus
from employees;

----예제)
--직원의 이름,부서,팀을 출력하세요
--팀은 코드로 결정하며 부서코드가 10~50이면 'A-TEAM'
--60~100이면 'B-TEAM' 110~150이면 'C-TEAM' 나머지는 '팀없음'으로 출력하세요
select  first_name,
        decode(department_id, '10<department_id<=50','A-TEAM',
                              '60<department_id<=100','B-TEAM',
                              '110<department_id<=150','C-TEAM',
        '팀없음')as TEAM
from employees;


select  first_name,
        department_id,
        case when department_id >= 10 and department_id <= 50 then 'A-TEAM'
             when department_id >= 60 and department_id <= 100 then 'B-TEAM'
             when department_id >= 110 and department_id <= 150 then 'C-TEAM'
             else '팀없음'
        end as team
from employees;