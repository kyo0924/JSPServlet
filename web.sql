create user web identified by web;
grant connect, resource to web;

CREATE TABLE MEMBER(
  USERID VARCHAR2(15) PRIMARY KEY
 ,PASSWORD VARCHAR2(15) NOT NULL
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

INSERT INTO MEMBER VALUES ('abcde','1234','아무개','M',25,'abcde@naver.com','01012345678','서울시 강남구','운동,등산,독서',DEFAULT);
INSERT INTO MEMBER VALUES ('qwerty','asdf','김말년','F',30,'qwerty@naver.com','01098765432','서울시 관악구','운동,등산',DEFAULT);
INSERT INTO MEMBER VALUES ('admin','1234','관리자','F',33,'admin@naver.com','01012345678','서울시 강남구','독서',DEFAULT);
COMMIT;
