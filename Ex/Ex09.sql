--webdb 계정에 book 테이블 만들기
create table book(
    book_id number(5), 
    title varchar2(50),
    author varchar2(10),
    pub_date date
);

--book테이블에 pubs 컬럼 추가하기
alter table book add(pubs varchar2(50));

--book테이블에 컬럼속성 변경하기
alter table book modify(title varchar2(100)); --글자수변경
alter table book rename column title to subject; --제목변경
alter table book drop(author); --컬럼삭제

--테이블 명 변경하기
rename book to article;
select *
from article;

--테이블 삭제
drop table article;

--작가(author) 테이블 만들기
create table author(
    author_id number(10),
    author_name varchar2(100) not null,--비어있으면 안되는곳 (null값 입력불가)
    author_desc varchar2(500),
    primary key(author_id) --pk는 not null+unique(중복값 입력불가,null값은 허용) 유일성을 보장하는 칼럼이기에 테이블 하나당 하나
);

-책(book) 테이블 만들기
create table book(
    book_id number(10),
    title varchar2(100) not null,
    pubs varchar2(100),
    pub_date date,
    author_id number(10),
    primary key(book_id),
    constraint book_fk foreign key(author_id) --테이블끼리를 연결하는 컬럼
    references author(author_id) --작가테이블의 작가아이디(pk)를 참조,book테이블의 fk와 값이 동일해야함
);

select * from book;
select * from author;

--작가(author) 테이블에 데이터 추가(insert)
insert into author
values(1, '박경리', '토지 작가');

insert into author(author_id, author_name, author_desc)
values(2, '이문열', '삼국지등등 작가'); 

insert into author
values(3, '기안84', 'navertoon 작가');


--작가 테이블 정보 수정
update author
set author_name = '김경리',
    author_desc = '토지작가'
where author_id = 1; --and나 or도 가능/where절이 생략되면 모든 레코드에 적용(주의)

--작가 테이블정보 삭제
delete from author
where author_id = 3;

select * from author;

--sequence(시퀀스) 번호표 : 알아서 순서대로 배정해줌
create sequence seq_author_id
increment by 1
start with 1
nocache; --캐시 미리 뽑아놓기 싫을때

insert into author
values(seq_author_id.nextval, '박경리', '토지 작가');

insert into author
values(seq_author_id.nextval, '이문열', '삼국지 작가');

--시퀀스 삭제
drop sequence seq_author_id;

--시퀀스 조회
select * from user_sequences;

--현재 시퀀스 조회
select seq_author_id.currval
from dual;

--다음 시퀀스 조회 (확인만 해도 무조건 올라감)
select seq_quthor_id.nextval
from dual;

