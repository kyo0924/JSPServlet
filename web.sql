create user web identified by web;
grant connect, resource to web;

CREATE TABLE MEMBER(
  USERID VARCHAR2(15) PRIMARY KEY
 ,PASSWORD VARCHAR2(100) NOT NULL
 ,USERNAME  VARCHAR2(20) NOT NULL
 ,GENDER CHAR(1) CHECK (GENDER IN ('M','F'))
 ,AGE NUMBER
 ,EMAIL VARCHAR2(30)
 ,PHONE CHAR(11)  NOT NULL
 ,ADDRESS VARCHAR2(100)
 ,HOBBY VARCHAR2(50)
 ,ENROLLDATE DATE DEFAULT SYSDATE
);
select * from member;
drop table member;
SELECT * FROM MEMBER ORDER BY ENROLLDATE DESC;
delete from member where userid = 'test232';
delete from member where userid = 'gogo';
ALTER TABLE TBL_USER_ALTER MODIFY USER_PWD VARCHAR2(200);
ALTER TABLE MEMBER MODIFY PASSWORD VARCHAR2(1000); 
COMMIT;
rollback;

-- FROM에 테이블(RESULTSET)이 넘겨질때 ROWNUM이 생성되기 때문에 이후 ORDER BY로 정렬할 경우 순번이 뒤섞임
SELECT ROWNUM, A.* FROM MEMBER A ORDER BY ENROLLDATE DESC;
-- FROM에 서브쿼리로 정렬된 상태의 RESULTSET을 넘겨준 뒤 순번을 매김
SELECT ROWNUM, A.* FROM (SELECT * FROM MEMBER ORDER BY ENROLLDATE DESC) A;

-- ROWNUM을 1부터 시작해서 범위를 구할 경우 정상적으로 결과가 나오지만 중간부터 시작할 경우 값을 받아오지 못함
SELECT ROWNUM, A.* 
FROM (SELECT * FROM MEMBER ORDER BY ENROLLDATE DESC) A
WHERE ROWNUM BETWEEN 1 AND 10;

SELECT ROWNUM, A.* 
FROM (SELECT * FROM MEMBER ORDER BY ENROLLDATE DESC) A
WHERE ROWNUM BETWEEN 2 AND 10; -- 중간부터 시작할 경우 값을 받아오지 못함
                        

-- ROWNUM이 1부터 시작하는 것뿐만 아니라 다양한 중간 범위에 대해 구하기 위해서 ROWNUM에 별칭(RNUM)을 붙이고 서브쿼리로 넘겨준 뒤
-- 메인쿼리의 WHERE에서 별칭(RNUM)을 이용하여 ROWNUM의 특정 범위를 구함
-- 가장 안쪽의 서브쿼리(SELECT * FROM MEMBER ORDER BY ENROLLDATE DESC) A)에서 특정 조건에 맞는 데이터를 구함 
-- ex) 이름이 김씨인 회원 - SELECT * FROM MEMBER WHERE USERNAME LIKE '%김%'
-- SELECT * FROM(SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM MEMBER WHERE USERNAME LIKE '%김%') A ) WHERE RNUM BETWEEN 6 AND 10
SELECT * FROM MEMBER WHERE USERNAME LIKE '%김%';
-- 현재 페이지가 2페이지, 페이지당 출력 자료가 5개인 경우(cPage=2, numPerPage=5)  WHERE ROWNUM BETWEEN (cPage - 1) * numPerPage + 1 AND cPage * numPerPage => WHERE RNUM BETWEEN 6 AND 10
SELECT * FROM (SELECT ROWNUM AS RNUM, A.* FROM (SELECT * FROM MEMBER WHERE USERNAME LIKE '%김%') A) WHERE RNUM BETWEEN 6 AND 10;

INSERT INTO MEMBER VALUES ('abcde','1234','아무개','M',25,'abcde@naver.com','01012345678','서울시 강남구','운동,등산,독서',DEFAULT);
INSERT INTO MEMBER VALUES ('qwerty','asdf','김말년','F',30,'qwerty@naver.com','01098765432','서울시 관악구','운동,등산',DEFAULT);
INSERT INTO MEMBER VALUES ('admin','1234','관리자','F',33,'admin@naver.com','01012345678','서울시 강남구','독서',DEFAULT);
INSERT INTO MEMBER VALUES ('test232','1234','ww','F',323,'admin@naver.com','01012345678','서울시 강남구','독서',SYSDATE);
update member set password = '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==' where userid='admin';
update member set password = '1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==';

CREATE TABLE NOTICE(
        NOTICE_NO NUMBER PRIMARY KEY,
        NOTICE_TITLE VARCHAR2(100) NOT NULL,
        NOTICE_WRITER VARCHAR2(15) NOT NULL,
        NOTICE_CONTENT VARCHAR2(4000) NOT NULL,
        NOTICE_DATE DATE DEFAULT SYSDATE,
        FILEPATH VARCHAR2(300),
        STATUS VARCHAR2(1) DEFAULT 'Y',
        constraint fk_notice_writer FOREIGN KEY (NOTICE_WRITER) REFERENCES MEMBER (USERID)
    );
CREATE SEQUENCE SEQ_NOTICE_NO;
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
INSERT INTO NOTICE VALUES(SEQ_NOTICE_NO.NEXTVAL,'공지사항테스트','admin','공지사항테스트입니다',default,'pretty.jpg',default);
COMMIT;
SELECT * FROM NOTICE WHERE NOTICE_NO BETWEEN 1 AND 5 ORDER BY NOTICE_DATE DESC;
SELECT * FROM MEMBER where userid = 'test';

Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('hihiroo','NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==','김안녕','F',43,'hihiroo@naver.com','01023454635','경기도 시흥시','운동,여행',to_date('18/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('encrypten_man','mZNR9KFjogJnD9J0+gGMKxAAstZidIXEKPLv+Ns42TvZY/o9QcBbDR0s1Vjm4a5HqKZDVPH+sAuM1BD/YwKyVw==','암호화','M',23,null,'01012341243',null,null,to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('abcd','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김준호','M',25,'abcd@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/01/01','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('bcde','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서지와','F',25,'bcde@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/02','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('cdef','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김윤정','M',25,'cdef@naver.com','01056745678','서울시 강북구','운동,독서',to_date('18/01/03','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('defg','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박봉철','F',25,'defg@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('18/01/04','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('efgh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','하정운','M',25,'efgh@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/05','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('fghi','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유병송','F',25,'fghi@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('18/01/06','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ghij','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노민우','M',25,'ghij@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('18/01/07','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('hijk','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김지호','M',25,'hijk@naver.com','01012345678','서울시 관악구','등산,독서',to_date('18/01/08','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ijkl','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장동준','M',25,'ijkl@naver.com','01012345678','서울시 중랑구','운동,등산,독서',to_date('18/01/09','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('jklm','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연','M',32,'jklm@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('18/01/10','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('klmn','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연호','M',25,'klmn@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/11','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('lmno','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김연우','M',25,'lmno@naver.com','01056745678','서울시 중랑구','운동,등산,독서',to_date('18/01/12','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mnop','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정지운','M',25,'mnop@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('18/01/13','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('nopq','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정구운','M',25,'nopq@naver.com','01012345678','서울시 관악구','운동,독서',to_date('18/01/14','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('opqr','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안성우','M',25,'opqr@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('pqrs','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','이주은','M',25,'pqrs@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('qrst','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보리','M',25,'qrst@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('18/01/17','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('rstu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','차보라','M',25,'rstu@naver.com','01056745678','서울시 서초구','운동,등산,독서',to_date('18/01/18','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('stuv','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장경자','M',25,'stuv@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('tuvw','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정성택','M',25,'tuvw@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/01/20','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('uvwx','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김정은','M',25,'uvwx@naver.com','01012345678','서울시 서초구','운동,등산,독서',to_date('18/01/21','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('wxyz','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박보람','M',25,'wxyz@naver.com','01098765678','서울시 중구','운동,등산,독서',to_date('18/01/22','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('catmom','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구본우','M',25,'catmom@naver.com','01098765678','서울시 관악구','운동,등산,독서',to_date('18/01/23','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('bear','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','가제트','M',25,'bear@naver.com','01012345678','서울시 관악구','운동,독서',to_date('18/01/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('dogpapa','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','한석규','M',25,'dogpapa@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('18/01/25','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('fishman','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','두석규','M',25,'fishman@naver.com','01012345678','서울시 강남구','등산,독서',to_date('18/01/26','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('buckey','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세석규','M',25,'buckey@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/27','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mmary','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네석규','M',25,'mmary@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('18/01/28','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('usbteacher','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마동석','M',25,'usbteacher@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('18/01/29','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mslove','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아무개','M',25,'mslove@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('18/01/30','RR/MM/DD'));


Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('spongebob','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김밥','F',40,'spongebob@naver.com','01023454635','경기도 시흥시','운동,여행',to_date('16/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ordovician','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','암호화','M',23,null,'01012341243',null,null,to_date('16/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('patli','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김준호','M',39,'patli@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/01/01','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('skitz','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서지와','F',25,'skitz@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/02','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('hlal','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정윤정','M',39,'hlal@naver.com','01056745678','서울시 강북구','운동,독서',to_date('16/01/03','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('skytear','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박봉철','F',21,'skyTear@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('16/01/04','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('leander','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','하정운','M',22,'leander@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/05','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ripsnarl','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유병송','F',23,'ripSnarl@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('16/01/06','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('eleuia','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노민우','M',24,'eleuia@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('16/01/07','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mrcuddles','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김지호','M',35,'mrCuddles@naver.com','01012345678','서울시 관악구','등산,독서',to_date('16/01/08','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('lior','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장동준','M',26,'lior@naver.com','01012345678','서울시 중랑구','운동,등산,독서',to_date('16/01/09','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('eseit','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연','M',32,'eseit@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('16/01/10','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('shimmer','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연호','M',21,'shimmer@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/11','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('nibbles','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김연우','M',22,'nibbles@naver.com','01056745678','서울시 중랑구','운동,등산,독서',to_date('16/01/12','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('pastel','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정지운','F',23,'pastel@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('16/01/13','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('pewner','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정구운','M',24,'pewner@naver.com','01012345678','서울시 관악구','운동,독서',to_date('16/01/14','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mrglows','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안성우','M',25,'mrGlows@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('raich','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','이주은','M',26,'raich@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('jasmine','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보리','M',27,'jasmine@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('16/01/17','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('zothath','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','차보라','M',28,'zothath@naver.com','01056745678','서울시 서초구','운동,등산,독서',to_date('16/01/18','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('imamu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장경자','M',29,'imamu@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('floater','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정성택','M',28,'floater@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/01/20','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('nana','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김정은','M',30,'nana@naver.com','01012345678','서울시 서초구','운동,등산,독서',to_date('16/01/21','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('shotsathothu','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박보람','M',39,'shotSathothu@naver.com','01098765678','서울시 중구','운동,등산,독서',to_date('16/01/22','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('kisaki','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구본우','M',25,'kisaki@naver.com','01098765678','서울시 관악구','운동,등산,독서',to_date('16/01/23','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('notyours','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','가제트','M',39,'notYours@naver.com','01012345678','서울시 관악구','운동,독서',to_date('16/01/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('cipanr','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','한석규','M',25,'cipanr@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('16/01/30','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('iarsere','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','두석규','M',25,'iarsere@naver.com','01012345678','서울시 강남구','등산,독서',to_date('16/01/26','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('kubcthothoth','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세석규','M',39,'kubCthothoth@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/27','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('claw','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네석규','M',25,'claw@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('16/01/28','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('hibiscus','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마동석','M',39,'hibiscus@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('16/01/29','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('elania','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아무개','M',25,'elania@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('16/01/30','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mothball','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노바디','M',34,'mothball@naver.com','01012341234','서울시 중구','등산',to_date('16/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ssynec','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네오','M',12,'ssynec@naver.com','01040021863','서울시 강남구',null,to_date('16/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('amethyst','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','감사용','M',45,'amethyst@naver.com','01012341234','부산시 동래구','운동,등산',to_date('16/04/19','RR/MM/DD'));


Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('xapreiye','NieQminDE4Ggcewn98nKl3Jhgq7Smn3dLlQ1MyLPswq7njpt8qwsIP4jQ2MR1nhWTQyNMFkwV19g4tPQSBhNeQ==','허안녕','F',43,'xapreiye@naver.com','01023454635','경기도 시흥시','운동,여행',to_date('17/02/05','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('fliostium','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','부호화','M',23,null,'01012341243',null,null,to_date('17/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ocrait','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박준호','M',39,'ocrait@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('17/01/01','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('oshary','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','치와와','F',25,'oshary@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('17/01/02','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('bleze','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박윤정','M',39,'bleze@naver.com','01056745678','서울시 강북구','운동,독서',to_date('17/01/03','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('megriuvania','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','박성철','M',54,'megriuvania@naver.com','01012345678','전라도 여수시','운동,등산,독서',to_date('17/01/04','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('glosau','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','고정운','M',35,'glosau@naver.com','01012345678','서울시 송파구','독서',to_date('17/03/05','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('lasken','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','유병우','F',55,'lasken@naver.com','01056745678','수원시 팔달구','운동,등산,독서',to_date('17/01/06','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('nesnesh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노민호','M',65,'nesnesh@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('17/01/07','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('granite','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김진호','M',20,'granite@naver.com','01012345678','서울시 관악구','등산,독서',to_date('17/01/08','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('arachnid','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장옹이','M',23,'arachnid@naver.com','01012345678','서울시 중랑구','운동,등산,독서',to_date('17/01/09','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('blight','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서지연','F',32,'blight@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('17/01/10','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mist','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','서연요','M',29,'mist@naver.com','01012345678','서울시 강북구','운동,등산',to_date('17/01/11','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('mouse','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김연유','M',45,'mouse@naver.com','01056745678','서울시 중랑구','운동,등산,독서',to_date('17/01/12','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('scramble','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정지훈','M',34,'scramble@naver.com','01056745678','서울시 관악구','운동,등산,독서',to_date('17/01/13','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('rime','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정수윤','F',25,'rime@naver.com','01012345678','서울시 관악구','운동,독서',to_date('17/01/14','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('wireless','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','안성호','M',43,'wireless@naver.com','01012345678','서울시 강북구','운동',to_date('17/01/15','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('fiend','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','이주흔','M',27,'fiend@naver.com','01012345678','서울시 강북구','운동,독서',to_date('17/01/16','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('pebble','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보리차','M',20,'pebble@naver.com','01056745678','서울시 중구','운동,등산,독서',to_date('17/01/17','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('disperse','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','차보라','M',28,'disperse@naver.com','01056745678','서울시 서초구','등산,독서',to_date('17/01/18','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('inferno','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','장경택','M',56,'inferno@naver.com','01012345678','서울시 관악구','운동',to_date('17/01/19','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('virtue','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','정은택','M',52,'virtue@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('17/01/20','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('plague','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김정인','F',32,'plague@naver.com','01012345678','서울시 서초구','등산,독서',to_date('17/01/21','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('light','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김보람','M',39,'light@naver.com','01098765678','서울시 중구','운동,등산,독서',to_date('17/01/22','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('plasma','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','구본승','M',25,'plasma@naver.com','01098765678','인천','등산',to_date('17/01/23','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('nightshade','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','가제현','M',65,'nightshade@naver.com','01012345678','서울시 관악구','운동,독서',to_date('17/01/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('ooze','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','한고은','F',39,'ooze@naver.com','01012345678','서울시 강남구','운동,등산,독서',to_date('17/01/25','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('shift','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','두고은','F',39,'shift@naver.com','01012345678','서울시 강남구','등산,독서',to_date('17/01/26','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('luna','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','세고은','F',25,'luna@naver.com','01012345678','서울시 강북구','운동,등산,독서',to_date('17/01/27','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('cecirh','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네고은','F',39,'cecirh@naver.com','01012345678','서울시 관악구','운동,등산,독서',to_date('17/01/28','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('illuminos','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','마동탁','M',25,'illuminos@naver.com','01012345678','서울시 중구','운동,등산,독서',to_date('17/01/29','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('shockwave','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','아무나','M',45,'shockwave@naver.com','01012345678','서울시 강북구','여행',to_date('17/01/30','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('thunder','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','애니바디','M',34,'thunder@naver.com','01012341234','서울시 중구','등산',to_date('17/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('steelskin','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김쇠살','M',12,'steelskin@naver.com','01040021863','서울시 강남구',null,to_date('17/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('glutton','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','감사용','M',45,'glutton@naver.com','01012341234','부산시 동래구','운동,등산',to_date('17/04/19','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('puma','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','하퓨마','M',45,'puma@naver.com','01012341234','부산광역시','운동',to_date('17/04/18','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('shadow','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','그리무','M',45,'shadow@naver.com','01012341234','대구','독서',to_date('17/04/17','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('bandit','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','반디','M',38,'bandit@naver.com','01012341234','충청남도','등산',to_date('17/04/16','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('pandemonium','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','김판선','M',29,'pandemonium@naver.com','01012341234','경상북도','등산,여행',to_date('17/04/15','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('shqkel','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','노바디','M',34,'shqkel@naver.com','01012341234','서울시 중구','등산',to_date('18/03/24','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('neoneo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','네오','M',12,'neoneo@naver.com','01040021863','서울시 강남구',null,to_date('18/04/20','RR/MM/DD'));
Insert into WEB.MEMBER (USERID,PASSWORD,USERNAME,GENDER,AGE,EMAIL,PHONE,ADDRESS,HOBBY,ENROLLDATE) values ('kamsayoyo','1ARVn2Auq2/WAqx2gNrL+q3RNjAzXpUfCXrzkA6d4Xa22yhRLy4AC50E+6UTPoscbo31nbOoq51gvkuXzJ6B2w==','감사용','M',45,'ksy@naver.com','01012341234','부산시 동래구','운동,등산',to_date('18/04/19','RR/MM/DD'));
COMMIT;

 --게시판생성
   CREATE TABLE BOARD (   
      "BOARD_NO" NUMBER, 
      "BOARD_TITLE" VARCHAR2(50), 
      "BOARD_WRITER" VARCHAR2(15), 
      "BOARD_CONTENT" VARCHAR2(2000), 
      "BOARD_ORIGINAL_FILENAME" VARCHAR2(100), 
      "BOARD_RENAMED_FILENAME" VARCHAR2(100), 
      "BOARD_DATE" DATE DEFAULT SYSDATE, 
      "BOARD_READCOUNT" NUMBER DEFAULT 0, 
      CONSTRAINT PK_BOARD_NO PRIMARY KEY(BOARD_NO),
      CONSTRAINT FK_BOARD_WRITER FOREIGN KEY(BOARD_WRITER) REFERENCES MEMBER(USERID) ON DELETE SET NULL
   );
SELECT * FROM BOARD ORDER BY BOARD_DATE DESC;
SELECT * FROM BOARD WHERE BOARD_NO = 2;
   COMMENT ON COLUMN "BOARD"."BOARD_NO" IS '게시글번호';
   COMMENT ON COLUMN "BOARD"."BOARD_TITLE" IS '게시글제목';
   COMMENT ON COLUMN "BOARD"."BOARD_WRITER" IS '게시글작성자 아이디';
   COMMENT ON COLUMN "BOARD"."BOARD_CONTENT" IS '게시글내용';
   COMMENT ON COLUMN "BOARD"."BOARD_ORIGINAL_FILENAME" IS '첨부파일원래이름';
   COMMENT ON COLUMN "BOARD"."BOARD_RENAMED_FILENAME" IS '첨부파일변경이름';
   COMMENT ON COLUMN "BOARD"."BOARD_DATE" IS '게시글올린날짜';
   COMMENT ON COLUMN "BOARD"."BOARD_READCOUNT" IS '조회수';
select * from board;
   --게시판시퀀스생성
   CREATE SEQUENCE SEQ_BOARD_NO
   START WITH 1
   INCREMENT BY 1
   NOMINVALUE
   NOMAXVALUE
   NOCYCLE
   NOCACHE;
   
   Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 1','abcd','반갑습니다',null,null,to_date('18/01/11','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 1','abcd','반갑습니다',null,null,to_date('18/02/10','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 2','bcde','반갑습니다',null,null,to_date('18/02/12','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 3','cdef','반갑습니다',null,null,to_date('18/02/13','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 4','defg','반갑습니다',null,null,to_date('18/02/14','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 5','efgh','반갑습니다',null,null,to_date('18/02/15','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 6','fghi','반갑습니다',null,null,to_date('18/02/16','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 7','ghij','반갑습니다',null,null,to_date('18/02/17','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 8','hijk','반갑습니다',null,null,to_date('18/02/18','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 9','ijkl','반갑습니다',null,null,to_date('18/02/19','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 10','jklm','반갑습니다',null,null,to_date('18/02/20','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 11','klmn','반갑습니다',null,null,to_date('18/03/11','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 12','lmno','반갑습니다',null,null,to_date('18/03/12','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 13','mnop','반갑습니다',null,null,to_date('18/03/13','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 14','nopq','반갑습니다',null,null,to_date('18/03/14','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 15','opqr','반갑습니다',null,null,to_date('18/03/15','RR/MM/DD'),0);


Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 16','pqrs','반갑습니다',null,null,to_date('18/03/16','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 17','qrst','반갑습니다',null,null,to_date('18/03/17','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 18','rstu','반갑습니다',null,null,to_date('18/03/18','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 19','stuv','반갑습니다',null,null,to_date('18/03/19','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 20','tuvw','반갑습니다',null,null,to_date('18/03/20','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 21','uvwx','반갑습니다',null,null,to_date('18/04/01','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 22','vwxy','반갑습니다',null,null,to_date('18/04/02','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 23','wxyz','반갑습니다',null,null,to_date('18/04/03','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 24','admin','반갑습니다',null,null,to_date('18/04/04','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 25','abcde','반갑습니다',null,null,to_date('18/04/05','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 26','admin','반갑습니다',null,null,to_date('18/04/06','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 27','abcde','반갑습니다',null,null,to_date('18/04/07','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 28','admin','반갑습니다',null,null,to_date('18/04/08','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 29','abcde','반갑습니다',null,null,to_date('18/04/09','RR/MM/DD'),0);
Insert into WEB.BOARD (BOARD_NO,BOARD_TITLE,BOARD_WRITER,BOARD_CONTENT,BOARD_ORIGINAL_FILENAME,BOARD_RENAMED_FILENAME,BOARD_DATE,BOARD_READCOUNT) values (SEQ_BOARD_NO.nextval,'안녕하세요, 게시판입니다 - 30','admin','반갑습니다',null,null,to_date('18/04/10','RR/MM/DD'),0);

COMMIT;

CREATE TABLE BOARD_COMMENT(
        "BOARD_COMMENT_NO" NUMBER,
        "BOARD_COMMENT_LEVEL" NUMBER DEFAULT 1,
        "BOARD_COMMENT_WRITER" VARCHAR2(15), 
        "BOARD_COMMENT_CONTENT" VARCHAR2(2000), 
        "BOARD_REF" NUMBER, 
        "BOARD_COMMENT_REF" NUMBER, 
        "BOARD_COMMENT_DATE" DATE DEFAULT SYSDATE, 
        CONSTRAINT PK_BOARD_COMMENT_NO PRIMARY KEY(BOARD_COMMENT_NO),
        CONSTRAINT FK_BOARD_COMMENT_WRITER FOREIGN KEY(BOARD_COMMENT_WRITER) REFERENCES MEMBER(USERID) ON DELETE SET NULL,
        CONSTRAINT FK_BOARD_REF FOREIGN KEY(BOARD_REF) REFERENCES BOARD(BOARD_NO) ON DELETE CASCADE,
        CONSTRAINT FK_BOARD_COMMENT_REF FOREIGN KEY(BOARD_COMMENT_REF) REFERENCES BOARD_COMMENT(BOARD_COMMENT_NO) ON DELETE CASCADE
    );

    --DROP TABLE BOARD_COMMENT;

COMMENT ON COLUMN BOARD_COMMENT.BOARD_COMMENT_NO IS '게시판댓글번호';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_COMMENT_LEVEL IS '게시판댓글 레벨';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_COMMENT_WRITER IS '게시판댓글 작성자';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_COMMENT_CONTENT IS '게시판댓글';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_REF IS '참조원글번호';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_COMMENT_REF IS '게시판댓글 참조번호';
COMMENT ON COLUMN BOARD_COMMENT.BOARD_COMMENT_DATE IS '게시판댓글 작성일';

    
CREATE SEQUENCE SEQ_BOARD_COMMENT_NO
START WITH 1
INCREMENT BY 1
NOMINVALUE
NOMAXVALUE
NOCYCLE
NOCACHE;

INSERT INTO BOARD_COMMENT VALUES(SEQ_BOARD_COMMENT_NO.NEXTVAL, DEFAULT, 'opqr','글 잘읽었습니다.',33,NULL,DEFAULT);
INSERT INTO BOARD_COMMENT VALUES(SEQ_BOARD_COMMENT_NO.NEXTVAL, DEFAULT, 'efgh','좋은 정보 감사합니다.',33,NULL,DEFAULT);
commit;
SELECT * FROM BOARD_COMMENT;

-- 계층형 쿼리~~! 조직도 사장 부사장 부서장 과장(오라클에만 있음)
-- JOIN을 통해 수평적으로 기준 컬럼을 연결시킨 것과 달리 기준 컬럼을 가지고 수직적으로 관계를 만드는 것.
-- 조직도, 메뉴, 답변형 게시판(댓글) 구조를 표현하는데 적합
-- START WITH : 부모행(노드)을 지정
-- CONNECT BY : 부모/자식 관계 설정
-- PRIOR : START WITH절에서 제시한 부모행의 기준컬럼을 지정함, 등호(=)와 동등한 레벨로 사용되는 연산자로 동등연산자(등호) 좌우에 올 수 있음
-- LEVEL : 계층에 대한 정보를 나타냄
SELECT * 
FROM BOARD_COMMENT 
-- 부모 노드 지정
START WITH BOARD_COMMENT_LEVEL = 1 
-- BOARD_COMMENT_REF는 부모노드의 BOARD_COMMENT_NO와 연결되므로 PRIOR 키워드는 부모노드의 기준 컬럼 BOARD_COMMENT_NO 앞에 있어야 한다
-- 부모노드의 BOARD_COMMENT_NO와 값이 같은 BOARD_COMMENT_REF를 가진 노드는 부모노드가 가진 레벨의 다음 레벨을 갖는다. 
-- EX) LEVEL1 BOARD_COMMENT_NO 4를 BOARD_COMMENT_REF로 가진 BOARD_COMMENT_NO가 7인 노드는 LEVEL2
CONNECT BY PRIOR BOARD_COMMENT_NO = BOARD_COMMENT_REF 
ORDER SIBLINGS BY BOARD_COMMENT_DATE ASC;

SELECT LPAD(1, 5 * (level - 1), ' ') || board_comment_content FROM BOARD_COMMENT START WITH BOARD_COMMENT_LEVEL = 1 CONNECT BY PRIOR BOARD_COMMENT_NO = BOARD_COMMENT_REF ORDER SIBLINGS BY BOARD_COMMENT_DATE ASC;
SELECT LPAD(' ', 5 * (level - 1), ' ') || board_comment_content, A.* FROM BOARD_COMMENT A START WITH BOARD_COMMENT_LEVEL = 1 CONNECT BY PRIOR BOARD_COMMENT_NO = BOARD_COMMENT_REF ORDER SIBLINGS BY BOARD_COMMENT_DATE ASC;
