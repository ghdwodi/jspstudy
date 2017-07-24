select * from printing;
select * from paperform;
select * from innerpaper;
select * from cover;
select * from bind;
select * from customer_T;
select * from bbs_T;
select * from order_T;

insert into printing values(
	1,'흑백/단면',50,'흑_단.png');
insert into printing values(
	2,'흑백/양면',80,'흑_양.png');
insert into printing values(
	3,'컬러/단면',150,'컬_단.png');
insert into printing values(
	4,'컬러/양면',250,'컬_양.png');

insert into paperform values(
	1,'A4',1,'a4.png');
insert into paperform values(
	2,'A3',2,'a3.png');
insert into paperform values(
	3,'B5',0.75,'b5.png');

insert into innerpaper values(
	1,'간지,빨강',50,'간_빨.png');
insert into innerpaper values(
	2,'간지,노랑',50,'간_노.png');
insert into innerpaper values(
	3,'속지,빨강',50,'속_빨.png');
insert into innerpaper values(
	4,'속지,노랑',50,'속_노.png');

insert into cover values(
	1,'무선/무광',1200,'무_무.png');
insert into cover values(
	2,'무선/유광',1000,'무_유.png');
insert into cover values(
	3,'필름코팅',2000,'필름.png');

insert into bind values(
	1,'무선(종이제본)',50,'무선(종이제본).png');
insert into bind values(
	2,'양장',50,'양장.png');
insert into bind values(
	3,'스프링',50,'스프링.png');
insert into bind values(
	4,'플라스틱링',50,'플라스틱링.png');
insert into bind values(
	5,'와이어',50,'와이어.png');
insert into bind values(
	6,'스테플러',50,'스테플러.png');

insert into customer_T values(
	0,'admin','1111','관리자',
	'ghdwo1987@naver.com',
	'10410','경기도 고양시',sysdate);
insert into customer_T values(
	1,'test','1111','테스트',
	'ghdwo1987@naver.com',
	'10410','경기도 고양시',sysdate);

