/* printing : 인쇄형태 */
CREATE TABLE printing (
	pt_idx NUMBER NOT NULL primary key, /* pt_idx */
	printing VARCHAR2(255) NOT NULL, /* printing */
	pt_price NUMBER NOT NULL, /* pt_price */
	pt_photo VARCHAR2(255) /* pt_photo */
);

/* paperform : 용지 */
CREATE TABLE paperform (
	pf_idx NUMBER NOT NULL primary key, /* pf_idx */
	paper_form VARCHAR(255) NOT NULL, /* paper_form */
	pf_price NUMBER NOT NULL, /* pf_price */
	pf_photo VARCHAR2(255) /* pf_photo */
);

/* innerpaper : 간지/속지 */
CREATE TABLE innerpaper (
	ip_idx NUMBER NOT NULL primary key, /* ip_idx */
	inner_paper VARCHAR2(255) NOT NULL, /* inner_paper */
	ip_price NUMBER NOT NULL, /* ip_price */
	ip_photo VARCHAR2(255) /* ip_photo */
);

/* cover : 표지 */
CREATE TABLE cover (
	cover_idx NUMBER NOT NULL primary key, /* cover_idx */
	cover VARCHAR2(255) NOT NULL, /* cover */
	cover_price NUMBER NOT NULL, /* cover_price */
	cover_photo VARCHAR2(255) /* cover_photo */
);

/* bind : 제본 */
CREATE TABLE bind (
	bind_idx NUMBER NOT NULL primary key, /* bind_idx */
	bind VARCHAR2(255) NOT NULL, /* bind */
	bind_price NUMBER NOT NULL, /* bind_price */
	bind_photo VARCHAR2(255) /* bind_photo */
);

/* customer_T : 고객테이블 */
CREATE TABLE customer_T (
	c_idx NUMBER NOT NULL PRIMARY KEY, /* c_idx */
	c_id VARCHAR2(255) NOT NULL, /* c_id */
	c_pw VARCHAR2(255) NOT NULL, /* c_pw */
	c_name VARCHAR2(255) NOT NULL, /* c_name */
	c_email VARCHAR2(255), /* c_email */
	c_addrnum NUMBER NOT NULL, /* c_addrnum */
	c_addr VARCHAR2(1000) NOT NULL, /* c_addr */
	c_date DATE NOT NULL /* c_date */
);

/* bbs_T : 게시판테이블 */
CREATE TABLE bbs_T (
	b_idx NUMBER NOT NULL primary key, /* b_idx */
	title VARCHAR2(255) NOT NULL, /* title */
	pwd VARCHAR2(20) NOT NULL,
	hit NUMBER NOT NULL,
	groups NUMBER NOT NULL,
	step NUMBER NOT NULL,
	lev NUMBER NOT NULL,
	content clob NOT NULL, /* content */
	c_idx NUMBER NOT NULL, /* c_idx */
	b_date DATE NOT NULL /* b_date */
);

/* notice_T : 공지사항 테이블 */
CREATE TABLE notice_T (
	b_idx NUMBER NOT NULL primary key, /* b_idx */
	title VARCHAR2(255) NOT NULL, /* title */
  	pwd VARCHAR2(20) NOT NULL,
	hit NUMBER NOT NULL,
  	groups NUMBER NOT NULL,
	step NUMBER NOT NULL,
  	lev NUMBER NOT NULL,
	content clob NOT NULL, /* content */
	c_idx NUMBER NOT NULL, /* c_idx */
	b_date DATE NOT NULL /* b_date */
);

/* order_T : 주문테이블 */
CREATE TABLE order_T (
	o_idx NUMBER NOT NULL primary key, /* o_idx */
	c_idx NUMBER, /* c_idx */
	pf_idx NUMBER NOT NULL, /* pf_idx */
	copy_num NUMBER NOT NULL, /* copy_num */
	page_num NUMBER NOT NULL, /* page_num */
	pt_idx NUMBER NOT NULL, /* pt_idx */
	ip_idx NUMBER, /* ip_idx */
	inner_paper_num NUMBER, /* inner_paper_num */
	cover_idx NUMBER, /* cover_idx */
	bind_idx NUMBER NOT NULL, /* bind_idx */
	price NUMBER NOT NULL, /* price */
	orderdate DATE NOT NULL /* orderdate */
);

ALTER TABLE bbs_T
	ADD
		CONSTRAINT FK_customer_T_TO_bbs_T
		FOREIGN KEY (
			c_idx
		)
		REFERENCES customer_T (
			c_idx
		);
    
ALTER TABLE order_T
	ADD
		CONSTRAINT FK_paperform_TO_order_T
		FOREIGN KEY (
			pf_idx
		)
		REFERENCES paperform (
			pf_idx
		);

ALTER TABLE order_T
	ADD
		CONSTRAINT FK_printing_TO_order_T
		FOREIGN KEY (
			pt_idx
		)
		REFERENCES printing (
			pt_idx
		);

ALTER TABLE order_T
	ADD
		CONSTRAINT FK_innerpaper_TO_order_T
		FOREIGN KEY (
			ip_idx
		)
		REFERENCES innerpaper (
			ip_idx
		);

ALTER TABLE order_T
	ADD
		CONSTRAINT FK_bind_TO_order_T
		FOREIGN KEY (
			bind_idx
		)
		REFERENCES bind (
			bind_idx
		);

ALTER TABLE order_T
	ADD
		CONSTRAINT FK_customer_T_TO_order_T
		FOREIGN KEY (
			c_idx
		)
		REFERENCES customer_T (
			c_idx
		);

ALTER TABLE order_T
	ADD
		CONSTRAINT FK_cover_TO_order_T
		FOREIGN KEY (
			cover_idx
		)
		REFERENCES cover (
			cover_idx
		);