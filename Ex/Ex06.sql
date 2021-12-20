select *
from employees, departments;
-->카디젼프로덕트로 107*27개 됨

select  *
from employees, departments
where employees.department_id = departments.department_id;
-->106개인 이유:부서명중에 null이 있어서 한줄이 버려짐

select  first_name,
        salary,
        de.department_id,
        de.department_name
from employees em, departments de -->from의 별명은 as 붙일수없음
where em.department_id = de.department_id;

/*outer join*/
--좌측 테이블기준
select  first_name,
        salary,
        de.department_id,
        de.department_name
from employees em left outer join departments de -->좌측 em을 기준으로 하여 null을 노출시킴
on em.department_id = de.department_id; -->where 대신 on

select  first_name,
        de.department_id,
        department_name
from employees em, departments de
where em.department_id(+) = de.department_id; -->null로 표현해야하는곳에 +붙인다고 생각하자.

--오른쪽 테이블 기준
select  first_name,
        salary,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id = de.department_id(+); -->right outer join과 동일한 의미
and em.employee_id = 178; -->178번

--full outer join
select *
from employees em full outer join departments de
on em.department_id = de.department_id;

--단,이런 문법은 없음
select *
from employees em, departments de
where em.department_id(+) = de.department_id(+);

--self join -->직원테이블 부서테이블 join문과 비교
select  em.employee_id 사원번호,
        em.first_name||' '||em.last_name 직원이름,
        em.salary,
        em.phone_number,
        em.manager_id 매니저번호,
        mn.employee_id 매니저의사원번호, -->매니저의 직원번호
        mn.first_name||' ' ||mn.last_name 매니저이름,
        mn.email
from employees em, employees mn
where em.manager_id = mn.employee_id;

--연관이 없는데 우연히 들어맞았을 경우가 있으니 주의
select  em.employee_id,
        em.first_name,
        em.salary,
        lo.location_id,
        lo.city
from employees em, locations lo
where em.salary = lo.location_id

