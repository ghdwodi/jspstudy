CREATE TABLE shop_T	(
  num			 number(10)			Not Null primary key,
  category	 varchar2(4000)		Not Null,
  p_num		 varchar2(4000)		Not Null,
  p_name		 varchar2(4000)		Not Null,
  p_company varchar2(4000)		Not Null,
  p_price		 number(10)			Not Null,
  p_saleprice number(10)			Not Null,
  p_image_s	 varchar2(4000)		Null,
  p_image_l	 varchar2(4000)		Null,
  p_content	 varchar2(4000)	Not Null,
  p_date		 date					Not Null		
);

create sequence shop_num
increment by 1
start with 1;

insert into shop_t values(shop_num.nextVal,'sp003', 'RC-113',
'로체스 인라인','로체스',3200,1150,'pds1.jpg','pds1_z.jpg',
'바이오맥스 통풍 나일론-HGPU SHELL * 특수 충격 흡수 밑창 * 신발끈 메모리 버클 * 힐 락에 의한 신속한 신발끈 시스템 * 느린 메모리 포말에 의한 편안한 통풍성의 숨쉬는 라이너 * 쿨 통풍 시스템 * 통풍성의 인체공학적 신발밑창 * 손쉬운 엔트리 시스템(신기 편한 입구) * 몰디드 알루미늄 프레임 * 80mm 82a hyper dubbs 휠 * 강철 스페이서 * ABEC-5 베어링',sysdate);

insert into shop_t values(shop_num.nextVal,'ele002', 'vC-13',
'사니PDP-TV','사니',9200,4750,'pds4.jpg','pds4_z.jpg',
'질러~ 질러! 무조건 질러봐~ 후회 하지 않아~~',sysdate);

create table shop_member(
	memberidx	number	Not Null primary key,
	id			varchar2(255)	Not Null,
	pwd			varchar2(255)	Not Null,
	name		varchar2(255)	Not Null,
	age			number(10)		Not Null,
	gender		varchar2(255)	Not Null,
	email		varchar2(255),
	photo		varchar2(255),
	join_date	date			Not Null
);

create sequence member_num
increment by 1
start with 1;

insert into shop_member values(0,'admin', '1111',
'이홍재',31,'남성','ghdwo1987@gmail.com','관리자.jpg',sysdate);
insert into shop_member values(member_num.nextVal,'hong', '1111',
'홍길동',15,'남성','hong@hong.com','길동.jpg',sysdate);

select * from shop_member;

create table shop_cart(
	cartidx		number	Not Null primary key,
	memberidx	number 	Not Null,
	num			number	Not Null,
	cart_date	date	Not Null,
	CONSTRAINT mem_fk FOREIGN KEY (memberidx) REFERENCES shop_member(memberidx),
	CONSTRAINT p_fk FOREIGN KEY (num) REFERENCES shop_T(num)
);