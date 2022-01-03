drop table book;
drop table author;

create table author(
    author_id number(10),
    author_name varchar2(100) not null,
    author_desc varchar2(500),
    primary key(author_id)
);

CREATE TABLE book (
    book_id     NUMBER(10),
    title       VARCHAR2(100) NOT NULL,
    pubs        VARCHAR2(100),
    pub_date    DATE,
    author_id   NUMBER(10),
    
    PRIMARY KEY(book_id),
    CONSTRAINT book_fk FOREIGN KEY (author_id) REFERENCES author(author_id)
);

drop sequence seq_author_id;
drop sequence seq_book_id;

create sequence seq_author_id
increment by 1
start with 1
nocache;

create sequence seq_book_id
increment by 1
start with 1
nocache;

INSERT INTO author 
VALUES (seq_author_id.nextval, '이문열', '경북 영양' );
INSERT INTO author 
VALUES (seq_author_id.nextval, '박경리', '경상남도 통영' );
INSERT INTO author 
VALUES (seq_author_id.nextval, '유시민', '17대 국회의원' );
INSERT INTO author 
VALUES (seq_author_id.nextval, '기안84', '기안동에서 산 84년생' );
INSERT INTO author 
VALUES (seq_author_id.nextval, '강풀', '온라인 만화가 1세대' );
INSERT INTO author 
VALUES (seq_author_id.nextval, '김영하', '알쓸신잡' );

INSERT INTO book 
VALUES (seq_book_id.nextval, '우리들의 일그러진 영웅', '다림', '1998/02/22' , 1);
INSERT INTO book 
VALUES (seq_book_id.nextval, '삼국지', '민음사', '2002/03/01' , 1);
INSERT INTO book 
VALUES (seq_book_id.nextval, '토지', '마로니에북스', '2012/08/15' , 2);
INSERT INTO book 
VALUES (seq_book_id.nextval, '유시민의 글쓰기 특강', '생각의길', '2015/04/01' , 3);
INSERT INTO book 
VALUES (seq_book_id.nextval, '패션왕', '중앙북스(books)', '2012/02/22' , 4);
INSERT INTO book 
VALUES (seq_book_id.nextval, '순정만화', '재미주의', '2011/08/03' ,5);
INSERT INTO book 
VALUES (seq_book_id.nextval, '오직두사람', '문한동네', '2017/05/04' , 6);
INSERT INTO book 
VALUES (seq_book_id.nextval, '26년', '재미주의', '2012/02/04' , 5);


select book_id,
       title,
       pubs,
       to_char(pub_date,'yyyy-mm-dd') pub_date,
       author.author_id,
       author_name,
       author_desc
from book, author
where book.author_id = author.author_id;

update author
set author_desc = '서울특별시'
where author_name = '강풀';

delete
from author
where author_name = '기안84';