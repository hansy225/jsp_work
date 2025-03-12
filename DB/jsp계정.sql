create table test(
    userid varchar2(30) primary key,
    userpw varchar2(30) not null
);

insert into test values('user01', 'pass01');
insert into test values('user02', 'pass02');
insert into test values('user03', 'pass03');
commit;

create table member(
    id varchar2(20) primary key,
    pwd varchar2(20) not null,
    name varchar2(20) not null,
    gender char(1),
    birthday char(6),
    email varchar2(30),
    zipcode char(5),
    address varchar2(100),
    detailAddress varchar2(50),
    hobby char(5),
    job varchar2(30)
);

insert into member values('kim', '1234', '홍길동', '1', '980312', 'kim@naver.com', '12345', '서울특별시 강남구 한국빌딩', '801호', '11010', '학생');
