create table reply (
    no number primary key,
    content varchar2(500),
    ref number,
    name varchar2(20),
    rdate date
);

create sequence seq_reply nocache;

insert into reply values(seq_reply.nextval, '와우 첫 댓글이다', 1, '김처음', '2025-02-25');
insert into reply values(seq_reply.nextval, '행복한 그림이네요', 1, '박행복', '2025-03-06');
insert into reply values(seq_reply.nextval, '고양이가 예뻐요', 1, '나고양', sysdate);

commit;