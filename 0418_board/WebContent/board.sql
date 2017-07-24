CREATE SEQUENCE board_seq
increment by 1
start with 1
nomaxvalue
nocycle
cache 10;

CREATE SEQUENCE board_group
increment by 1
start with 1
nomaxvalue
nocycle
cache 10;

CREATE TABLE board(
 seq NUMBER,
 writer VARCHAR2(10) NOT NULL,
 title VARCHAR2(100) NOT NULL,
 content CLOB,
 pwd VARCHAR2(20) NOT NULL,
 hit NUMBER NOT NULL,
 groups NUMBER NOT NULL,
 step NUMBER NOT NULL,
 lev NUMBER NOT NULL,
 bname VARCHAR2(10) NOT NULL,
 regdate date NOT NULL,
 filename VARCHAR2(50),
 ip VARCHAR2(15),
 CONSTRAINT board_pk PRIMARY KEY (seq)
);

INSERT INTO board (seq, writer, title,
 pwd,hit,groups,step,lev,bname,regdate,ip)
 VALUES(0, '한빛', '한빛연습입니다.',
 '1111',0,0,0,0,'BBS',sysdate,'127.0.0.1');
 
