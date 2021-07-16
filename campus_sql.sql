CREATE SEQUENCE CAMPUS_BOARD_SEQUENCE;
CREATE SEQUENCE CAMPUS_REPLY_SEQUENCE;


-- ��ǰ ī�װ�
CREATE TABLE CAMPUS_PRODUCT_CATEGORY(
    PC_CODE VARCHAR2(30) PRIMARY KEY,
    PC_NAME VARCHAR2(100) NOT NULL
); 

--�����
CREATE TABLE CAMPUS_USER(
    u_userid VARCHAR2(100) PRIMARY KEY,
    u_password VARCHAR2(100) NOT NULL,
    u_username VARCHAR2(100) NOT NULL,
    u_email VARCHAR2(100) NOT NULL,
    u_phone VARCHAR2(100) NOT NULL,
    u_address VARCHAR2(500) NOT NULL
);

--����� ����
CREATE TABLE CAMPUS_USER_AUTH(
    u_userid VARCHAR2(100) PRIMARY KEY,
    u_auth VARCHAR2(50) DEFAULT 'ROLE_USER' NOT NULL,
    constraint campus_user_auth foreign key(u_userid) references CAMPUS_USER(u_userid)
);

--��ǰ
CREATE TABLE CAMPUS_PRODUCT(
    p_number NUMBER(10) PRIMARY KEY,
    p_name VARCHAR2(100) NOT NULL,  
    p_price NUMBER(10) NOT NULL,
    p_option VARCHAR2(100) DEFAULT '',
    p_stock NUMBER(10) DEFAULT 0 NOT NULL,
    pc_code VARCHAR2(30) NOT NULL,
    constraint campus_p_category foreign key(pc_code) references CAMPUS_PRODUCT_CATEGORY(pc_code)
);

--�Խ���
CREATE TABLE CAMPUS_BOARD(
    b_no NUMBER(10) PRIMARY KEY,
    b_title VARCHAR2(100) NOT NULL,
    b_writer VARCHAR2(50) NOT NULL,
    b_views NUMBER(10) DEFAULT 0 NOT NULL,
    b_content VARCHAR2(4000) NOT NULL,
    b_sort VARCHAR2(100) NOT NULL,
    b_rating INT DEFAULT 0 NOT NULL,
    b_sysdate DATE DEFAULT sysdate,
    p_number NUMBER(10) DEFAULT 0 NOT NULL,
    constraint campus_board_product foreign key(p_number) references campus_product(p_number) 
);

--�Խ��� ���
CREATE TABLE CAMPUS_REPLY(
    b_no NUMBER(10) NOT NULL,
    r_no NUMBER(10) PRIMARY KEY,
    r_replyer VARCHAR2(50) NOT NULL,
    r_content VARCHAR2(4000) NOT NULL,
    r_sysdate DATE DEFAULT sysdate,
    constraint campus_board_reply foreign key(b_no) references CAMPUS_BOARD(b_no)
);

--��ٱ���
CREATE TABLE CAMPUS_CART(
    c_cartnumber NUMBER(10) PRIMARY KEY,
    u_userid VARCHAR2(100) NOT NULL,
    p_number NUMBER(10) NOT NULL,
    c_count NUMBER(10) NOT NULL,
    constraint campus_user_shopping foreign key(u_userid) references CAMPUS_USER(u_userid),
    constraint campus_user_pnumber foreign key(p_number) references CAMPUS_PRODUCT(p_number)
);

--�ֹ�
CREATE TABLE CAMPUS_ORDER(
    o_number NUMBER(10) PRIMARY KEY,
    u_userid VARCHAR2(100) NOT NULL,
    o_address1 VARCHAR2(500) NOT NULL,
    o_address2 VARCHAR2(500) NOT NULL,
    o_address3 VARCHAR2(500) NOT NULL,
    o_name VARCHAR2(100) NOT NULL,
    o_phone VARCHAR2(100) NOT NULL,
    o_sysdate DATE DEFAULT sysdate,
    constraint campus_order foreign key(u_userid) references CAMPUS_USER(u_userid)
);

--�ֹ���
CREATE TABLE CAMPUS_ORDER_DETAIL(
    d_number NUMBER(10) PRIMARY KEY,
    p_number NUMBER(10) NOT NULL,
    o_number NUMBER(10) NOT NULL,
    d_count NUMBER(10) NOT NULL,
    d_price NUMBER(10) NOT NULL,
    constraint campus_detail_p foreign key(p_number) references CAMPUS_PRODUCT(p_number),
    constraint campus_detail_o foreign key(o_number) references CAMPUS_ORDER(o_number)
);

--ķ����
CREATE TABLE CAMPUS_CAMPING(
    c_number NUMBER(10) PRIMARY KEY,
    c_name VARCHAR2(100) NOT NULL,
    c_area NUMBER(5) NOT NULL,
    c_sysdate DATE DEFAULT sysdate NOT NULL,
    c_rsysdate DATE DEFAULT sysdate NOT NULL,
    c_content VARCHAR2(4000) DEFAULT '' NOT NULL
);

--ķ���� ����
CREATE TABLE CAMPUS_RESERVATION(
    c_number NUMBER(10) NOT NULL,
    u_userid VARCHAR2(100) NOT NULL,
    constraint campus_reservation_u foreign key(u_userid) references CAMPUS_USER(u_userid),
    constraint campus_reservation_c foreign key(c_number) references CAMPUS_CAMPING(c_number)
);

--÷������
CREATE TABLE CAMPUS_ATTACH(
    b_no NUMBER(10) NOT NULL,
    a_uuid VARCHAR2(100) NOT NULL,
    a_path VARCHAR2(200) NOT NULL,
    a_name VARCHAR2(100) NOT NULL,
    a_type CHAR(1) DEFAULT 'I'
);

drop SEQUENCE CAMPUS_BOARD_SEQUENCE;
drop SEQUENCE CAMPUS_REPLY_SEQUENCE;
drop table campus_board;
drop table campus_REPLY;
drop table CAMPUS_PRODUCT;
drop table CAMPUS_USER;
drop table CAMPUS_USER_AUTH;
drop table CAMPUS_SHOPPINGBASKET;
drop table CAMPUS_ORDER;
drop table CAMPUS_ORDER_DETAIL;
drop table CAMPUS_CAMPING;
drop table CAMPUS_RESERVATION;
drop table CAMPUS_ATTACH;

select * from CAMPUS_USER;

insert into CAMPUS_USER(u_userid, u_password, u_username, u_email, u_phone, u_address)
values('hong', 12345, '홍길동', 'hong@gamil.com', '010-1234-5678', '서울시');

select u_userid, u_password from CAMPUS_USER where u_userid = 'hong' and u_password = '12345';


alter table CAMPUS_BOARD drop constraint p_number;

insert into CAMPUS_BOARD (b_no, b_title, b_writer, b_views, b_content, b_sort, b_rating, b_sysdate)
values(CAMPUS_BOARD_SEQUENCE.nextval, '게시글 제목7', '작성자7', 1, '몰라', '후기', 1, sysdate);
insert into CAMPUS_BOARD (b_no, b_title, b_writer, b_views, b_content, b_sort, b_rating, b_sysdate)
values(CAMPUS_BOARD_SEQUENCE.nextval, '게시글 제목8', '작성자8', 5, '안녕하세요', '리뷰', 1, sysdate);
insert into CAMPUS_BOARD (b_no, b_title, b_writer, b_views, b_content, b_sort, b_rating, b_sysdate)
values(CAMPUS_BOARD_SEQUENCE.nextval, '게시글 제목9', '작성자9', 3, '넌 누구냐', '리뷰', 1, sysdate);
insert into CAMPUS_BOARD (b_no, b_title, b_writer, b_views, b_content, b_sort, b_rating, b_sysdate)
values(CAMPUS_BOARD_SEQUENCE.nextval, '게시글 제목10', '작성자10', 2, '헬렐레', '질문', 1, sysdate);
insert into CAMPUS_BOARD (b_no, b_title, b_writer, b_views, b_content, b_sort, b_rating, b_sysdate)
values(CAMPUS_BOARD_SEQUENCE.nextval, '게시글 제목11', '작성자11', 7, '호호', '리뷰', 1, sysdate);

select * from CAMPUS_BOARD;
