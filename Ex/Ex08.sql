/******************************
 * rownum
 *****************************/

--01. rownum 이해
select rownum,
        first_name,
        salary
from employees;

--02. 급여순으로 정렬 (단, rownum 먼저 매겨지고 정렬됨)
select  rownum,
        first_name,
        salary
from employees
order by salary desc;

--혹은 where문으로 정렬
select  rownum,
        first_name,
        salary
from employees
where salary <= 24000;

--03. 정렬부터 시켜놓고 rownum 매김
select  rownum,
        first_name,
        salary,
        phone_number
from (select first_name,
             salary,
             phone_number
     from employees
     order by salary desc);

--급여를 가장 많이 받는 5명의 직원의 이름을 출력하시오
select  rownum,
        first_name,
        salary
from (select first_name,
             salary
     from employees
     order by salary desc) ot --정렬된테이블
where rownum >= 1
and rownum <= 5;

--->(1)정렬하고 (2)rownum 붙이고 (3)where절 사용

select  ort.rn,
        ort.first_name,
        ort.salary
from   (select  rownum rn,
                ot.first_name,
                ot.salary
        from (select first_name,
                     salary
            from employees
            order by salary desc) ot   ---(1)
        ) ort                          ---(2)
where rn >= 2
and rn <= 5; ----(3)

/*
select  rownum rn,
        ot.first_name,
        ot.salary
from (select first_name,
             salary
     from employees
     order by salary desc) ot; --(1)
*/

     
     
--예제) 07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은? 
--->(1)정렬하고 (2)rownum 붙이고 (3)where절 사용

select  ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date   
from(   select  rownum rn,
                ot.first_name,
                ot.hire_date,
                ot.salary
        from   (select  first_name,
                        hire_date,
                        salary
                from employees
                where hire_date > '07/01/01'
                and hire_date <= '07/12/31'
                order by salary desc)ot
    ) ort
where rn >= 3
and rn <= 7;

--예제) 07년에 입사한 직원중 급여가 많은 직원중 
--3에서 7등의 이름 급여 입사일+부서명은? 
--->(1)정렬하고 (2)rownum 붙이고 (3)where절 사용

select  ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date,
        ort.department_name
from    (select  rownum rn,
                ot.first_name,
                ot.salary,
                ot.hire_date,
                ot.department_name
        from (select   em.first_name,
                        em.salary,
                        em.hire_date,
                        de.department_name
                from employees em, departments de
                where em.department_id = de.department_id
                and hire_date >= '07/01/01'
                and hire_date < '08/01/01'
                order by salary desc) ot
        )ort
where rn >= 3
and rn <= 7
;
