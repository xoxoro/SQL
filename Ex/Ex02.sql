/*단일행 함수*/

--문자함수 - INITCAP(컬럼명) 대소문자 구분하기
select initcap(email),
       email "이메일",
       department_id
from employees 
where department_id = 100;

--문자함수 -LOWER(컬럼명)/UPPER(컬럼명)
select first_name,
       lower(first_name) l_first_name, --all 소문자
       upper(first_name) --all 대문자
from employees
where department_id = 100;

--문자함수 - SUBSTR(컬럼명,시작위치,글자수)
select email,
       initcap(substr(email,1,3)),
       substr(email,-4,2) --뒤에서부터 4번째가 시작위치,시작위치에서 두개를 셈
from employees
where department_id = 100;

--문자함수
--이름 10글자로 채우고 빈칸은 *으로 변경하기
select first_name,
       lpad(first_name, 10, '*'), --공백으로 놔둘수도 있음, 왼쪽
       rpad(first_name, 10, '*') --오른쪽
from employees;
       
--문자함수 replace (컬럼명, 문자1, 문자2) 문자1을 문자2로 대체하기
select first_name,
       replace(first_name, 'a', '*')
from employees
where department_id = 100;

--두번째 숫자를 @로 바꾸기
select first_name,
       replace(first_name, substr(first_name,2,1),'@'), --2번째만 @로
       replace(first_name, substr(first_name,2,3),'***')
from employees
where department_id = 100;

--dual 가상의공간
--숫자함수 ROUND(숫자,출력을 원하는 자리수)/반올림되어나옴
select 123.346 "123"
from dual;

select round(123.364,1) "R1",
       round(123.364,0) "R0",
       round(167.364,-1) "R-1"
from dual;

--숫자함수 TRUNC(숫자, 출력을 원하는 자리수)
select trunc(123.364,1) "R1",
       trunc(123.364,0) "R0",
       trunc(167.764,-1) "R-1"
from dual;

--날짜함수
select sysdate
from dual;

select sysdate,
       hire_date,
       trunc(months_between(sysdate,hire_date),0),
       months_between(hire_date,sysdate)
from employees
where department_id = 100;

--TO_CHAR(숫자, '출력모양') 숫자형->문자형으로 변환
select first_name,
       salary,
       to_char(salary*12, '$99999999'), --포맷을 9라는 기호로 정함 숫자x
       to_char(salary*12*12, '$999,999,999')
from employees
where department_id = 100;

--변환함수>TO_CHAR(날짜, '출력모양') 날짜->문자형으로 변환
select  sysdate,
        to_char(sysdate,'YYYY')
from dual;

select  sysdate,
        to_char(sysdate,'YYYY'),
        hire_date,
        to_char(hire_date, 'DD')
from employees;

select  sysdate,
        to_char(sysdate,'HH'),
        to_char(sysdate,'MM'),
        to_char(sysdate, 'HH24'),
        to_char(sysdate,'MI'),
        to_char(sysdate,'SS')
from dual;

select  sysdate,
        to_char(sysdate, 'YYYY-MM-DD HH24:MI:SS')
from dual;

--일반함수>NvL null값을 계산식 가능하도록 0으로 표현하는것
select  first_name,
        commison_PCT,
        nvl(commission_pct, 0)
from employees;

--null아닌값은 100, null값은 0으로
select  first_name,
        commission_PCT,
        nvl2(commission_pct,100,0) 
from employees;


