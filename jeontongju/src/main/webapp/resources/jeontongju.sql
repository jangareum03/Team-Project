-------------------- 멤버 테이블 ------------------------
create table tr_member(
  userId varchar2(15)  not null primary key,    -- 아이디
  userPass varchar2(100) not null,				-- 비밀번호
  userName varchar2(12) not null,				-- 이름
  userEmail varchar2(100),						-- 이메일
  userPhone varchar2(11) not null,				-- 전화번호
  userPostCode number not null,				-- 우편번호
  userAddr varchar2(300) not null,				-- 주소
  userDetailAddr varchar(500) not null,		-- 상세주소
  userBday Date not null,						-- 생일
  verify Number not null						-- 관리자 구분(1: 사용자)
);

drop table tr_member cascade Constraints;

delete from tr_member where userName='aa';

select * from tr_member;

insert into tr_member
values ('admin',1234,'김주영','juyoung412@gmail.com','01085146744',12345, '상계동', '상세주소', '93/04/12',9);

insert into tr_member
values ('test',1234,'장아름','areum@test.com','01027182631',00000, '여기도 세상시 일동구 행복동 158-8', '2층 201호', '93/04/12',1);
insert into tr_member
values ('kakao',1234,'카카오','kakao@test.com','01012345678',14578, '여기도 세상시 일동구 행복동 158-8', '2층 201호', '93/04/12',1);


-------------------- 주문 테이블 ------------------------
create table tr_order(		
  oId varchar2(15) primary key,				-- 주문번호
  oDate date default sysdate,				-- 주문날짜
  userId varchar2(15),						-- 아이디
  count number(2),							-- 주문 수량
  pNo varchar2(30),							-- 상품번호
  delivery varchar2(20) default '배송준비',	-- 주문상태
  rName varchar2(12),						-- 받는분 이름
  rAddr varchar2(300),						-- 받는분 주소
  rPhone varchar2(11),						-- 받는분 연락처
  oMemo varchar2(100),						-- 요구사항
  oTotal number								-- 총 금액
);

create sequence sq_order
increment by 1
start with 1
maxvalue 1000
nocache;

alter table tr_order ADD CONSTRAINT tr_order_userId FOREIGN KEY(userId) REFERENCES tr_member(userId);

drop table tr_order CASCADE CONSTRAINTS
drop sequence sq_order;
drop table tr_order;

insert into tr_order(oId,userId,count,pNo,rName,rAddr,rPhone,oMemo,oTotal)
values (sq_order.nextval,'aaa',1,'m1','주영','상계동',010,'배송',200);

select * from tr_order;

-------------------- 주문상세 테이블 ------------------------
create table tr_orderDetails(
	oNo number primary Key,
	oId varchar2(15),
	pNo varchar2(10),
	count number
);

create sequence sq_oDetails
increment by 1
start with 1
maxvalue 1000
nocache;

alter table tr_orderDetails ADD CONSTRAINT tr_orderDetials_oId FOREIGN KEY(oId) REFERENCES tr_order(oId);

drop table tr_orderDetails;
drop sequence sq_oDetails;

select * from tr_orderDetails;

-------------------- 장바구니 테이블 ------------------------
create table tr_cart(
cId number primary key,				-- 카트번호
userId varchar2(15) not null,		-- 아이디
pNo varchar2(10) not null,			-- 상품번호
count number						-- 주문 수량
);

alter table tr_cart ADD FOREIGN key(userId) REFERENCES tr_member(userId);
alter table tr_cart ADD FOREIGN key(pNo) REFERENCES tr_product(pNo);

create sequence sq_cart		--시퀀스 for cart
increment by 1
start with 1
maxvalue 1000
nocache;

select * from TR_CART;
drop table tr_cart;
drop sequence sq_cart;

insert into tr_cart(cId,userId,pNo,count) values (sq_cart.nextval,'aa','m14',1);

INSERT INTO tr_cart VALUES(sq_cart.NEXTVAL, 'aaa', 'W001', 5);
INSERT INTO tr_cart VALUES(sq_cart.NEXTVAL, 'aaa', 'M001', 2);

----------------------상품 테이블--------------------------------
create table tr_product(
	pNo varchar2(10) not null primary key,   	--상품번호
	pName varchar2(100) not null,				--상품명
	pPrice number(10) not null,					--판매가
	pCount number(10) default 0,				--재고
	pInfo varchar2(1000),						--상품정보
	pSales number(3) default 0,					--판매량
	pImg varchar2(500),							--상품 이미지
	pThumbImg varchar(200)						--섬네일
);

--막걸리
insert into tr_product values('m' || sq_m.NEXTVAL, '가야양조장 님그리다막걸리 6도750ml 무감미료김해쌀', 27000, 30, '가야양조장 님그리다막걸리 6도750ml 무감미료김해쌀', 
								0, '가야양조장 님그리다막걸리 6도750ml 무감미료김해쌀.jpg', '가야양조장 님그리다막걸리 6도750ml 무감미료김해쌀.jpg');
insert into tr_product values('m' || sq_m.NEXTVAL, '대한주조 천지수 순생막걸리 6도 750ml', 16000, 30, '대한주조 천지수 순생막걸리 6도 750ml', 
								5, '대한주조 천지수 순생막걸리 6도 750ml.jpg', '대한주조 천지수 순생막걸리 6도 750ml.jpg');

--소주
insert into tr_product values('s' || sq_s.NEXTVAL, '모월 로 25도 500ml 증류식 소주', 7000, 30, '모월 로 25도 500ml 증류식 소주', 
								12, '모월 로 25도 500ml 증류식 소주.jpg', '모월 로 25도 500ml 증류식 소주.jpg');
insert into tr_product values('s' || sq_s.NEXTVAL, '두레양조 아우내 20도 360ml 거봉포도증류주', 5000, 30, '두레양조 아우내 20도 360ml 거봉포도증류주', 
								0, '두레양조 아우내 20도 360ml 거봉포도증류주.jpg', '두레양조 아우내 20도 360ml 거봉포도증류주.jpg');
insert into tr_product values('s' || sq_s.NEXTVAL, '두레양조 아우내 20도 360ml 거봉포도증류주', 5000, 30, '두레양조 아우내 20도 360ml 거봉포도증류주', 
								0, '두레양조 아우내 20도 360ml 거봉포도증류주.jpg', '두레양조 아우내 20도 360ml 거봉포도증류주.jpg');


--약주
insert into tr_product values('y' || sq_y.NEXTVAL, '술아원 복단지 14도 350ml 복분자약주', 25000, 30, '술아원 복단지 14도 350ml 복분자약주', 
								1, '술아원 복단지 14도 350ml 복분자약주.jpg', '술아원 복단지 14도 350ml 복분자약주.jpg');
insert into tr_product values('y' || sq_y.NEXTVAL, '담을술공방 주향담을 41도 500ml 3년 항아리숙성', 36000, 30, '담을술공방 주향담을 41도 500ml 3년 항아리숙성', 
								1, '담을술공방 주향담을 41도 500ml 3년 항아리숙성.jpg', '담을술공방 주향담을 41도 500ml 3년 항아리숙성.jpg');
insert into tr_product values('y' || sq_y.NEXTVAL, '남도탁주 정고집 옛날 생동동주 6도 750ml', 36000, 30, '남도탁주 정고집 옛날 생동동주 6도 750ml', 
								1, '남도탁주 정고집 옛날 생동동주 6도 750ml.jpg', '남도탁주 정고집 옛날 생동동주 6도 750ml.jpg');
insert into tr_product values('y' || sq_y.NEXTVAL, '중원당 청명주 무형문화재 지정 약주 17도 375ml', 15000, 30, '중원당 청명주 무형문화재 지정 약주 17도 375ml', 
								5, '중원당 청명주 무형문화재 지정 약주 17도 375ml.jpg', '중원당 청명주 무형문화재 지정 약주 17도 375ml.jpg');
insert into tr_product values('y' || sq_y.NEXTVAL, '지란지교 프리미엄탁주 13도500ml 우리술품평회우수상', 36000, 30, '지란지교 프리미엄탁주 13도500ml 우리술품평회우수상', 
								21, '지란지교 프리미엄탁주 13도500ml 우리술품평회우수상.jpg', '지란지교 프리미엄탁주 13도500ml 우리술품평회우수상.jpg');

								
--과실주
insert into tr_product values('f' || sq_f.NEXTVAL, '고도리와이너리 사과와인 골드 7도 375ml', 20000, 30, '고도리와이너리 사과와인 골드 7도 375ml', 
								30, '고도리와이너리 사과와인 골드 7도 375ml.jpg', '고도리와이너리 사과와인 골드 7도 375ml.jpg');
insert into tr_product values('f' || sq_f.NEXTVAL, '오미나라 오미로제 연 8도 750ml 오미자스파클링와인', 32000, 30, '오미나라 오미로제 연 8도 750ml 오미자스파클링와인', 
								7, '오미나라 오미로제 연 8도 750ml 오미자스파클링와인.jpg', '오미나라 오미로제 연 8도 750ml 오미자스파클링와인.jpg');

--안주
insert into tr_product values('n' || sq_n.NEXTVAL, '청정원 안주야 직화곱창 160g', 32000, 30, '청정원 안주야 직화곱창 160g', 
								0, '청정원 안주야 직화곱창 160g.jpg', '청정원 안주야 직화곱창 160g.jpg');
insert into tr_product values('n' || sq_n.NEXTVAL, '청정원 안주야 직화곱창 160g', 32000, 30, '청정원 안주야 직화곱창 160g', 
								0, '청정원 안주야 직화곱창 160g.jpg', '청정원 안주야 직화곱창 160g.jpg');

								
								
alter table tr_product add(pThumbImg varchar(200));
drop table tr_product;
drop table tr_product CASCADE CONSTRAINTS;
select * from tr_product;



drop sequence sq_y; --약주
drop sequence sq_s; --소주
drop sequence sq_m; --막걸리
drop sequence sq_f; --과실주
drop sequence sq_n; --안주

create sequence sq_m		--시퀀스 for 막걸리
increment by 1
start with 1
maxvalue 1000
nocache;

create sequence sq_s		--시퀀스 for 소주
increment by 1
start with 1
maxvalue 1000
nocache;

create sequence sq_y		--시퀀스 for 약주
increment by 1
start with 1
maxvalue 1000
nocache;

create sequence sq_f		--시퀀스 for 과실주
increment by 1
start with 1
maxvalue 1000
nocache;

create sequence sq_n		--시퀀스 for 안주
increment by 1
start with 1
maxvalue 1000
nocache;

--------------------------문의사항 테이블--------------------------
create table tr_qna(
	qNo number(10) not null primary key,		-- 문의사항 번호
	qTitle varchar2(100) not null ,				-- 제목
	qWriter varchar2(100) ,						--작성자
	qDate date default sysdate,					-- 작성날짜
	qContent varchar2(1000) not null, 			-- 내용
	qPass number(12)							-- 비밀번호
);

create sequence sq_qna
increment by 1
start with 1
maxvalue 1000
nocache;

select * from tr_qna;

drop table tr_qna CASCADE CONSTRAINTS;
drop sequence sq_qna

-------------------답글 테이블---------------------
create table tr_reply( 
	qNo number not null,						-- 문의사항 번호
	rNo number not null,						-- 답글 번호
	rContent varchar2(1000) not null,			-- 답글 내용				
	rWriter varchar2(10) default '관리자',		-- 답글 작성자
	rDate date default sysdate not null			-- 답글 작성날짜
);

drop table tr_reply;

alter table tr_order
ADD Foreign Key(Id) REFERENCES tr_member(Id);

alter table tr_cart
ADD Foreign Key(cId) REFERENCES tr_member(mId);

alter table tr_cart
ADD Foreign Key(cNo) REFERENCES tr_pro(pNo);

alter table tr_reply 
ADD Foreign Key(qNo) REFERENCES tr_qna(qNo);

insert into tr_reply(qNo, rNo, rContent)
values(1, sq_reply.nextval, 'test');

select * from TR_reply;

create sequence sq_reply
increment by 1
start with 1
maxvalue 1000
nocache;

create sequence sq_order
increment by 1
start with 1
maxvalue 1000
nocache;

drop sequence sq_reply;
drop sequence sq_order;

insert into tr_qna(qNo, qTitle, qWriter, qContent, qPass)
values(sq_qna.nextval, 'test', 'tester', '안녕', 1234);

delete from tr_qna
where qNo = 2;


-------------------카테고리 테이블---------------------
create table tr_category( 
	cateName varchar2(20) not null,				-- 카테고리 이름
	cateCode varchar2(10) not null primary key	-- 카테고리 코드
);
insert into tr_category values('소주','s');
insert into tr_category values('막걸리','m');
insert into tr_category values('약주','y');
insert into tr_category values('과실주','f');
insert into tr_category values('안주','n');

drop table tr_category;
-------------------상품평 테이블---------------------
create table tr_comment(
	pNo varchar2(10),				-- 상품 번호
	cNo number(3) not null,			-- 상품평 번호
	cContent varchar2(1000),		-- 상품평 내용
	cDate DATE DEFAULT sysdate,		-- 상품평 작성 날짜
	userId varchar2(15)  not null	-- 사용자 아이디
);
alter table tr_comment ADD CONSTRAINT tr_comment_pNo FOREIGN KEY(pNo) REFERENCES tr_product(pNo);
alter table tr_comment ADD CONSTRAINT tr_comment_userId FOREIGN KEY(userId) REFERENCES tr_member(userId);

create sequence sq_comment		
increment by 1
start with 1
maxvalue 1000
nocache;

drop table tr_comment;
drop sequence sq_comment;
drop sequence sq_qna;
select * from TR_COMMENT;