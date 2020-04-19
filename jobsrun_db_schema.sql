--------------------------------------------------------
--  파일이 생성됨 - 일요일-4월-19-2020   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence BOARD_BNUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_BNUM_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1001 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence BOARD_UPLOAD_FILE_FID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "BOARD_UPLOAD_FILE_FID_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 41 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CONTRACT_CONTNUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CONTRACT_CONTNUM_SEQ"  MINVALUE 1 MAXVALUE 10000 INCREMENT BY 1 START WITH 6144 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence CSBOARD_CSBNUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "CSBOARD_CSBNUM_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 1001 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence DEBITCREDIT_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "DEBITCREDIT_NUM_SEQ"  MINVALUE 1 MAXVALUE 999999 INCREMENT BY 1 START WITH 4941 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Sequence RATES_NUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "RATES_NUM_SEQ"  MINVALUE 1 MAXVALUE 99999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE ;
--------------------------------------------------------
--  DDL for Table BOARD
--------------------------------------------------------

  CREATE TABLE "BOARD" 
   (	"BNUM" NUMBER(10,0), 
	"BBCID" NUMBER(10,0), 
	"BLOCATION" VARCHAR2(100 BYTE), 
	"BID" VARCHAR2(100 BYTE), 
	"BNICKNAME" VARCHAR2(30 BYTE), 
	"BCONTENT" CLOB, 
	"BCDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"BUDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"SDATETIME" TIMESTAMP (6), 
	"JOB" VARCHAR2(30 BYTE), 
	"DURATION" NUMBER(10,0), 
	"PAYMENT" NUMBER(10,0), 
	"BHIT" NUMBER(10,0) DEFAULT 0, 
	"BTITLE" VARCHAR2(100 BYTE), 
	"BSTATUS" NUMBER(10,0) DEFAULT 0, 
	"BAPPLICATION" VARCHAR2(100 BYTE), 
	"LATITUDE" VARCHAR2(100 BYTE), 
	"LONGITUDE" VARCHAR2(100 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("BCONTENT") STORE AS BASICFILE "SYS_LOB0000020873C00006$$"(
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "BOARD"."BNUM" IS '글번호';
   COMMENT ON COLUMN "BOARD"."BBCID" IS '게시판 카테고리 아이디';
   COMMENT ON COLUMN "BOARD"."BLOCATION" IS '위치';
   COMMENT ON COLUMN "BOARD"."BID" IS '회원ID';
   COMMENT ON COLUMN "BOARD"."BNICKNAME" IS '작성자 별칭';
   COMMENT ON COLUMN "BOARD"."BCONTENT" IS '글내용';
   COMMENT ON COLUMN "BOARD"."BCDATE" IS '게시글 작성일';
   COMMENT ON COLUMN "BOARD"."BUDATE" IS '게시글 수정일';
   COMMENT ON COLUMN "BOARD"."SDATETIME" IS '시작 시간';
   COMMENT ON COLUMN "BOARD"."JOB" IS '일감 종류 이름';
   COMMENT ON COLUMN "BOARD"."DURATION" IS '시간 종류 이름';
   COMMENT ON COLUMN "BOARD"."PAYMENT" IS '보수 종류 이름';
   COMMENT ON COLUMN "BOARD"."BHIT" IS '조회수';
   COMMENT ON COLUMN "BOARD"."BTITLE" IS '글제목';
   COMMENT ON COLUMN "BOARD"."BSTATUS" IS '계약상태 ''0''=초기 ''1''=지원 ''2''=승낙';
   COMMENT ON COLUMN "BOARD"."BAPPLICATION" IS '지원자ID';
   COMMENT ON COLUMN "BOARD"."LATITUDE" IS '위도';
   COMMENT ON COLUMN "BOARD"."LONGITUDE" IS '경도
';
--------------------------------------------------------
--  DDL for Table BOARDCATEGORY
--------------------------------------------------------

  CREATE TABLE "BOARDCATEGORY" 
   (	"BCID" NUMBER(10,0), 
	"BCNAME" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "BOARDCATEGORY"."BCID" IS '게시판 카테고리 아이디';
   COMMENT ON COLUMN "BOARDCATEGORY"."BCNAME" IS '게시판 카테고리 이름';
--------------------------------------------------------
--  DDL for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  CREATE TABLE "BOARD_UPLOAD_FILE" 
   (	"FID" NUMBER(10,0), 
	"BNUM" NUMBER(10,0), 
	"FNAME" VARCHAR2(150 BYTE), 
	"FSIZE" VARCHAR2(45 BYTE), 
	"FTYPE" VARCHAR2(50 BYTE), 
	"FDATA" BLOB, 
	"CDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"UDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"COL1" VARCHAR2(30 BYTE), 
	"COL2" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" 
 LOB ("FDATA") STORE AS BASICFILE "SYS_LOB0000020877C00006$$"(
  TABLESPACE "USERS" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FID" IS '파일아이디';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."BNUM" IS '게시글번호';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FNAME" IS '파일명';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FSIZE" IS '파일크기';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FTYPE" IS '파일유형';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FDATA" IS '첨부파일';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."CDATE" IS '작성일';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."UDATE" IS '수정일';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."COL1" IS '임시1';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."COL2" IS '임시2';
--------------------------------------------------------
--  DDL for Table CONTRACT
--------------------------------------------------------

  CREATE TABLE "CONTRACT" 
   (	"CONTNUM" NUMBER(10,0), 
	"CBNUM" NUMBER(10,0), 
	"CLIENTID" VARCHAR2(100 BYTE), 
	"SHOOTERID" VARCHAR2(100 BYTE), 
	"CAMOUNT" NUMBER(10,0), 
	"CSTATUS" NUMBER(10,0) DEFAULT 0, 
	"CCDATE" TIMESTAMP (6) DEFAULT systimestamp
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;

   COMMENT ON COLUMN "CONTRACT"."CONTNUM" IS '계약번호';
   COMMENT ON COLUMN "CONTRACT"."CBNUM" IS '글번호';
   COMMENT ON COLUMN "CONTRACT"."CLIENTID" IS '의뢰자';
   COMMENT ON COLUMN "CONTRACT"."SHOOTERID" IS '해결사';
   COMMENT ON COLUMN "CONTRACT"."CAMOUNT" IS '보수';
   COMMENT ON COLUMN "CONTRACT"."CSTATUS" IS '계약상태';
--------------------------------------------------------
--  DDL for Table CSBOARD
--------------------------------------------------------

  CREATE TABLE "CSBOARD" 
   (	"CSBNUM" NUMBER(5,0), 
	"CSBID" VARCHAR2(100 BYTE), 
	"CSBCONTENT" CLOB, 
	"CSBCDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"CSBUDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"CSBTITLE" VARCHAR2(100 BYTE), 
	"CSBGROUP" NUMBER(5,0) DEFAULT 0, 
	"CSBSTEP" NUMBER(5,0) DEFAULT 0, 
	"CSBINDENT" NUMBER(5,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("CSBCONTENT") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;
--------------------------------------------------------
--  DDL for Table DEBITCREDIT
--------------------------------------------------------

  CREATE TABLE "DEBITCREDIT" 
   (	"NUM" NUMBER(10,0), 
	"ID" VARCHAR2(30 BYTE), 
	"AMOUNT" NUMBER(10,0), 
	"VIA" VARCHAR2(30 BYTE), 
	"DETAIL" VARCHAR2(30 BYTE), 
	"TDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"CONTNUM" NUMBER(10,0), 
	"COLUMN2" VARCHAR2(30 BYTE), 
	"COLUMN3" VARCHAR2(30 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "MEMBER" 
   (	"ID" VARCHAR2(100 BYTE), 
	"PW" VARCHAR2(30 BYTE), 
	"TEL" VARCHAR2(30 BYTE), 
	"NICKNAME" VARCHAR2(30 BYTE), 
	"GENDER" VARCHAR2(30 BYTE), 
	"BIRTH" DATE, 
	"REGION" VARCHAR2(100 BYTE), 
	"CDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"UDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"BALANCE" NUMBER(10,0) DEFAULT 0, 
	"PIC" BLOB, 
	"FNAME" VARCHAR2(100 BYTE), 
	"FSIZE" VARCHAR2(30 BYTE), 
	"MONEYRECOMMEND" NUMBER(10,0) DEFAULT 0, 
	"EMAILCHECK" NUMBER(10,0) DEFAULT 0
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("PIC") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "MEMBER"."ID" IS '회원 ID';
   COMMENT ON COLUMN "MEMBER"."PW" IS '비밀번호';
   COMMENT ON COLUMN "MEMBER"."TEL" IS '연락처';
   COMMENT ON COLUMN "MEMBER"."NICKNAME" IS '회원 별칭';
   COMMENT ON COLUMN "MEMBER"."GENDER" IS '성별(''남'',''여'')';
   COMMENT ON COLUMN "MEMBER"."BIRTH" IS '생년월일(''yyyymmdd'')';
   COMMENT ON COLUMN "MEMBER"."REGION" IS '거주지';
   COMMENT ON COLUMN "MEMBER"."CDATE" IS '가입일';
   COMMENT ON COLUMN "MEMBER"."UDATE" IS '회원정보 수정일';
   COMMENT ON COLUMN "MEMBER"."BALANCE" IS '잔고';
   COMMENT ON COLUMN "MEMBER"."PIC" IS '회원 사진';
   COMMENT ON COLUMN "MEMBER"."FNAME" IS '파일이름';
   COMMENT ON COLUMN "MEMBER"."FSIZE" IS '파일크기';
   COMMENT ON COLUMN "MEMBER"."MONEYRECOMMEND" IS '고액추천여부';
   COMMENT ON COLUMN "MEMBER"."EMAILCHECK" IS '이메일 인증 여부';
--------------------------------------------------------
--  DDL for Table RATES
--------------------------------------------------------

  CREATE TABLE "RATES" 
   (	"NUM" NUMBER(10,0), 
	"RATER" VARCHAR2(30 BYTE), 
	"RATEE" VARCHAR2(30 BYTE), 
	"RATES" NUMBER(10,0), 
	"DETAIL" CLOB, 
	"RDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, 
	"BNUM" NUMBER(10,0), 
	"COLUMN2" VARCHAR2(20 BYTE), 
	"COLUMN3" VARCHAR2(20 BYTE)
   ) SEGMENT CREATION IMMEDIATE 
  PCTFREE 10 PCTUSED 40 INITRANS 1 MAXTRANS 255 NOCOMPRESS LOGGING
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" 
 LOB ("DETAIL") STORE AS BASICFILE (
  TABLESPACE "SYSTEM" ENABLE STORAGE IN ROW CHUNK 8192 RETENTION 
  NOCACHE LOGGING 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)) ;

   COMMENT ON COLUMN "RATES"."RATER" IS '평가하는사람';
   COMMENT ON COLUMN "RATES"."RATEE" IS '평가받는사람';
   COMMENT ON COLUMN "RATES"."RATES" IS '평점';
   COMMENT ON COLUMN "RATES"."DETAIL" IS '평가내용';
--------------------------------------------------------
--  DDL for Index BALANCE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BALANCE_PK" ON "DEBITCREDIT" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOARDCATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARDCATEGORY_PK" ON "BOARDCATEGORY" ("BCID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index BOARDVO_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "BOARDVO_PK" ON "BOARD" ("BNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CONTRACT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CONTRACT_PK" ON "CONTRACT" ("CONTNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index CSBOARD_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CSBOARD_PK" ON "CSBOARD" ("CSBNUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "MEMBER_PK" ON "MEMBER" ("ID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index RATES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "RATES_PK" ON "RATES" ("NUM") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM" ;
--------------------------------------------------------
--  DDL for Index TABLE1_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "TABLE1_PK" ON "BOARD_UPLOAD_FILE" ("FID") 
  PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS" ;
--------------------------------------------------------
--  DDL for Procedure BOARD_SAMPLE_DATA_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "BOARD_SAMPLE_DATA_PROC" 
(
    recordcnt in number default 50 -- 샘플 데이터 개수
)
AS 

        type va_type is varray(27) of varchar(100);
    regionSample va_type := va_type(
'울산 남구 공업탑',
'울산 남구 현대백화점',
'울산 북구 화봉시장',
'울산 북구 문화예술회관',
'울산 동구 보건소',
'울산 동구청 사거',
'울산 중구 보건소',
'울산 중구 병영2동 GS편의점',
'부산 남구 도서관',
'부산 남구 국민체육센터',
'부산 동구 초량3동 중앙대로',
'부산 동구 할로망고',
'부산 북구 보건소',
'부산 북구 구민운동',
'대구 서구 평리동 국채보상로',
'대구 서구 문화회관',
'대구 서구 구민 운동장',
'대구 동구 보건소',
'대구 동구 국제공항',
'대전 서구 문화원',
'대전 서구 노인복지관',
'광주 남구청',
'광주 남구청소년 수련관',
'광주 북구청',
'광주 동구보건',
'포항 남구청',
'포항 북구 포엠입시학원'
	);
    latSample va_type := va_type(
'35.5230169',
'35.5395162',
'35.5908526',
'35.5814055',
'35.5063877',
'35.5041658',
'35.5694901',
'35.5722074',
'35.1377029',
'35.1035884',
'35.1152294',
'35.1163993',
'35.2392452',
'35.2404116',
'35.8717449',
'35.8723001',
'35.8735777',
'35.8881058',
'35.8994914',
'36.3467775',
'36.3455004',
'35.1327406',
'35.1221387',
'35.1742202',
'35.1456082',
'36.0085492',
'36.0671674'
);
    lonSample va_type := va_type(
'129.328936',
'129.3335843',
'129.3641215',
'129.3592205',
'129.4157729',
'129.4148563',
'129.3481941',
'129.3475801',
'129.0923943',
'129.1057493',
'129.0400543',
'129.0391156',
'129.0125958',
'129.0047631',
'128.5569821',
'128.5433865',
'128.5401226',
'128.6490285',
'128.6361979',
'127.3726367',
'127.394413',
'126.9002435',
'126.9153794',
'126.9098353',
'126.9210172',
'129.3572084',
'129.3709313'
);

    v_randomNum number;
    v_category number;
    v_content varchar(100);
    v_title varchar(100);
    v_id member.id%type;
    v_application member.id%type;
    v_bstatus board.bstatus%type;
    V_CNT INT;
BEGIN

    
    --BOARD_BNUM_SEQ 존재 확인
    SELECT COUNT(*) INTO V_CNT
              FROM user_sequences 
            WHERE sequence_name = 'BOARD_BNUM_SEQ';
    --BOARD_BNUM_SEQ 가 존재하면 삭제하고 생성, 없으면 생성(글번호와 제목 번호 일치를 위해서)
    IF (V_CNT = 1)THEN
        execute immediate 'DROP SEQUENCE BOARD_BNUM_SEQ';
        execute immediate
        'CREATE SEQUENCE BOARD_BNUM_SEQ 
                        INCREMENT BY 1 
                        START WITH 1
                        MINVALUE 1 
                        MAXVALUE 99999 
                        NOCYCLE';
    ELSIF(V_CNT = 0) THEN
        execute immediate
        'CREATE SEQUENCE BOARD_BNUM_SEQ 
                        INCREMENT BY 1 
                        START WITH 1
                        MINVALUE 1 
                        MAXVALUE 99999 
                        NOCYCLE';
    END IF;
    
    for i in 1..recordcnt loop
        
        v_application:= null;--지원자
        v_randomNum := trunc(dbms_random.value(1,26));--배열 사이즈 범위의 인덱스 랜덤 생성
        v_category := trunc(dbms_random.value(1,3));--글 카테고리 랜덤 생성(1,2)
        --회원 아이디 1개 랜덤 선택
        select id into v_id from (select id  from member order by dbms_random.value) where rownum = 1;
        --게시글 STATUS 0~2 랜덤 생성
        v_bstatus := trunc(dbms_random.value(0,3));
        --게시글 STATUS가 0이 아닌 경우에만 지원자 존재,지원자는 글쓴이와 다른 회원 테이블에서 랜덤 선택
        if v_bstatus not in (0) then
            select id into v_application from (select id from member where id not in (v_id) order by dbms_random.value) where rownum = 1;
        end if;
        
        --카테고리가 1,2에 따라서 제목 결정 
        if v_category = 1 then
            v_content := '해결사 구합니다.'||i ;
        elsif v_category = 2 then
            v_content  := '일감 구합니다.'||i;
        end if;
        
        --카테고리가 1,2에 따라서 내용 결정
        if v_category = 1 then
            v_title:= '해결사 구합니다.'||i ;
        elsif v_category = 2 then
            v_title:= '일감 구합니다.'||i;
        end if;



        INSERT INTO board (
            bnum,
            bbcid,
            blocation,
            latitude,
            longitude,
            bid,
            bnickname,
            bcontent,
            sdatetime,
            job,
            duration,
            payment,
            btitle,
            bstatus,
            BAPPLICATION
    ) VALUES (
            board_bnum_seq.nextval,

            --카테고리 시작 ------------------
            v_category,
            --카테고리 끝 ------------------

            --지역 시작 ------------------
            regionSample(v_randomNum),
            --지역 끝 ------------------
            
            --latitude 시작 ------------------
             lonSample(v_randomNum),
            --latitude 끝 ------------------
            
            --longitude 시작 ------------------
           
            latSample(v_randomNum),
            --longitude 끝 ------------------


            --아이디 시작 ------------------
            v_id,
            --아이디 끝 ------------------

            --닉네임 시작 ------------------
            ((SELECT DBMS_RANDOM.STRING('L', 5) STR FROM DUAL)),
            --닉네임 끝 ------------------
            
            --내용 시작 ------------------
            v_content,
            --내용 끝 ------------------

            --bcdate,
            --budate,
            --sdatetime 시작 ------------------
            (select to_date('2018-01-01','yyyy-MM-dd HH24:MI:SS') 
                    +dbms_random.value(0,1000) 
             from dual),
            --sdatetime 시작 ------------------

            --일 종류 시작 ------------------
            (select a from(
                select a from(
                    select '청소' a from dual union all
                    select '이삿짐' a from dual union all
                    select '경비' a from dual union all
                    select '카운터' a from dual)
                    order by dbms_random.value)
                where rownum = 1),
            --일 종류 끝 ------------------

            --일 기간 시작 ------------------
            (select a from(
                select a from(
                    select 30 a from dual union all
                    select 60 a from dual union all
                    select 90 a from dual union all
                    select 120 a from dual
                ) order by dbms_random.value)
            where rownum = 1),
            --일 기간 끝 ------------------

            --일 보수 시작 ------------------
            (select a from(
                select a from(
                    select 5000 a from dual union all
                    select 10000 a from dual union all
                    select 15000 a from dual union all
                    select 20000 a from dual)
                    order by dbms_random.value)
            where rownum = 1),
            --일 보수 끝 ------------------

            --제목 시작 ------------------    
            v_title,
            --제목 끝 ------------------

            --지원 여부 시작 ------------------    
            v_bstatus,
            --지원 여부 끝 ------------------

            --지원자 ID 시작 ------------------
            v_application            
            --지원자 ID 끝 ------------------

);



    end loop;
    commit;
END BOARD_SAMPLE_DATA_PROC;

/
--------------------------------------------------------
--  DDL for Procedure CLEANANDCREATE
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CLEANANDCREATE" AS 

v_cnt1 int;
v_cnt2 int;
v_cnt3 int;

BEGIN
    delete from member;
    
    select count(*) into v_cnt1 from USER_PROCEDURES where object_name='MEMBER_SAMPLE_DATA_PROC';  
    if(v_cnt1 = 1) then
--        execute immediate 
--        'grant execute on jobsrun3.member_sample_data_proc to  jobsrun3';

         member_sample_data_proc(50);
    end if;
    
    select count(*) into v_cnt2 from user_procedures where object_name=upper('board_sample_data_proc');
    if(v_cnt2=1) then
--        execute immediate 
--        'grant execute on jobsrun3.board_sample_data_proc to  jobsrun3';

        
         board_sample_data_proc(2000);
    end if;
    
    select count(*) into v_cnt3 from user_procedures where object_name=upper('contract_sample_data_proc');
    if(v_cnt3=1) then
        
        contract_sample_data_proc();
    end if;
    commit;
END CLEANANDCREATE;

/
--------------------------------------------------------
--  DDL for Procedure CONTRACT_SAMPLE_DATA_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CONTRACT_SAMPLE_DATA_PROC" 
AS 

v_bnum board.bnum%type;
v_bbcid board.bbcid%type;
v_bid board.bid%type;
v_bapplication board.bapplication%type;
v_payment board.payment%type;
v_cstatus contract.cstatus%type;

v_clientid contract.clientid%type;
v_shooterid contract.shooterid%type;

--board에서 지원, 승낙된 글 검색
CURSOR cu1 is
    select bnum,bbcid, bid, bapplication, payment
        from board
        where bstatus = 2;

BEGIN
open cu1;
    loop
        fetch cu1 into v_bnum,v_bbcid,v_bid, v_bapplication, v_payment;
        exit when cu1%notFound;
        
        --계약 상태 0,1 랜덤 생성
        select trunc(dbms_random.value(0,2)) into v_cstatus from dual;
        
        --카테고리가 1이면
        if (v_bbcid=1) then
            v_clientid := v_bid; -- 글쓴이가 의뢰자
            v_shooterid := v_bapplication; --지원자가 해결사
        --카테고리가 2이면
        elsif (v_bbcid=2) then
            v_clientid := v_bapplication; --지원자가 의뢰인
            v_shooterid := v_bid; --글쓴이가 해결사

        end if;
        
        insert into contract(
                            contnum, 
                            cbnum, 
                            clientid, 
                            shooterid, 
                            camount,
                            cstatus
                            )
                values(
                            contract_contnum_seq.nextval,
                            v_bnum,
                            v_clientid,
                            v_shooterid,
                            v_payment,
                            v_cstatus
        );
        if(v_cstatus=1) then
            insert into debitcredit(
                                                num,
                                                id,
                                                amount, 
                                                contnum
                                                ) values(
                                                debitcredit_num_seq.nextval,
                                                v_clientid,
                                                v_payment*-1,
                                                contract_contnum_seq.currval
            );
            insert into debitcredit(
                                                num,
                                                id,
                                                amount, 
                                                contnum
                                                ) values(
                                                debitcredit_num_seq.nextval,
                                                v_shooterid,
                                                v_payment,
                                                contract_contnum_seq.currval
            );
            update board set bstatus = 3 where bnum = v_bnum;
        end if;
    end loop;
close cu1;
END contract_sample_data_proc;

/
--------------------------------------------------------
--  DDL for Procedure CSBOARD_SAMPLE_DATA_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "CSBOARD_SAMPLE_DATA_PROC" 
(
  RECORDCNT IN number DEFAULT 959 
) AS 
BEGIN
  for i in 1..recordcnt loop
    insert into csboard(
      csbnum,
      csbtitle,
      csbid,
      csbcontent,
      csbgroup
    )values(
       csboard_csbnum_seq.nextval,
      '제목-' || i,  
      'test@naver.com',
      '질문있습니다-' || i,
      csboard_csbnum_seq.currval);
      end loop;
      commit;
      end csboard_sample_data_proc;


/
--------------------------------------------------------
--  DDL for Procedure MEMBER_SAMPLE_DATA_PROC
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "MEMBER_SAMPLE_DATA_PROC" 
(
recordcnt in number default 10 --샘플 데이터 개수
)as
v_randomstring member.id%type;
v_id member.id%type;

v_emailcheck member.emailcheck%type;

BEGIN
  for i in 1..recordcnt loop
        SELECT trunc(DBMS_RANDOM.VALUE(0, 2))into v_emailcheck  FROM DUAL;
        SELECT DBMS_RANDOM.STRING('L', 5) into v_randomstring FROM DUAL;
        v_id := v_randomstring||'@naver.com';
        INSERT INTO member (
            id,
            pw,
            tel,
            nickname,
            gender,
            birth,
            region,
            cdate,
            --udate,
            --balance,
            --pic,
            --fname,
            --fsize,
            moneyrecommend,
            emailcheck
        ) VALUES (
            --아이디 시작 ------------------
            v_id,
            --아이디 끝 ------------------

            --비밀번호 시작 ------------------
            --랜덤 비밀번호 생성
            --(SELECT DBMS_RANDOM.STRING('P', 8) STR FROM DUAL),
            '!abcd1234',
            --비밀번호 끝 ------------------

            --전화번호 시작 ------------------
            --'010-xxxx-xxxx',
            '010'||'-'||
            (select trunc(dbms_random.value(1000,10000)) from dual)||'-'||
            (select trunc(dbms_random.value(1000,10000)) from dual),
            --전화번호 끝 ------------------

            '회원'||i,

            -- 성별 시작 ------------------
            (select a from(
                select a from(
                    select '남' a from dual union all
                    select '여' a from dual 
                ) order by dbms_random.value
            ) where rownum = 1),
            --성별 끝 ------------------

            --생일 시작 ------------------
            (select to_date(
                trunc(dbms_random.value
                    (
                    to_char(date '2018-01-01', 'j'), to_char(date '2020-04-04','j')
                    )
                ),'j'
              ) from dual
            ),
            --생일 끝------------------

            --지역 시작 ------------------
            (select a from(
                select a from(
                    select '울산 남구' a from dual union all
                    select '울산 중구' a from dual union all
                    select '울산 동구' a from dual union all
                    select '울산 북구' a from dual union all
                    select '부산 남구' a from dual union all
                    select '부산 동구' a from dual union all
                    select '부산 북구' a from dual union all
                    select '대구 서구' a from dual union all
                    select '대구 동구' a from dual union all
                    select '대전 서구' a from dual union all
                    select '광주 남구' a from dual union all
                    select '광주 북구' a from dual union all
                    select '포항 남구' a from dual union all
                    select '포항 북구' a from dual 
                ) order by dbms_random.value
            ) where rownum = 1),
            --지역 끝 ------------------

            --가입일 시작 ------------------
            (select to_date('2018-01-01','yyyy-MM-dd HH24:MI:SS') 
                    +dbms_random.value(0,1000) 
             from dual),
            --가입일 끝------------------


            --moneyrecommend 시작 ------------------
            --0,1 랜덤 생성
            (SELECT trunc(DBMS_RANDOM.VALUE(0, 2)) rand FROM DUAL),
            --moneyrecommend 끝 ------------------
            
            --emailcheck 시작 ------------------
            --0,1 랜덤 생성
            v_emailcheck
            -- emailcheck 끝 ------------------
        );
    if(v_emailcheck = 1) then
        insert into debitcredit(
                                            num,
                                            id,
                                            amount,
                                            via
                                            )values(
                                            debitcredit_num_seq.nextval,
                                            v_id,
                                            5000,
                                            '이메일 인증'
        );
    end if;
                                            
        
        
    end loop;
    commit;
END MEMBER_SAMPLE_DATA_PROC;

/
--------------------------------------------------------
--  DDL for Procedure PROCEDURE1
--------------------------------------------------------
set define off;

  CREATE OR REPLACE PROCEDURE "PROCEDURE1" AS 
v_cnt1 int;

BEGIN

    delete from member;
    select count(*) into v_cnt1 from USER_PROCEDURES where object_name='MEMBER_SAMPLE_DATA_PROC';  
    if(v_cnt1 = 1) then
        execute immediate 'exec MEMBER_SAMPLE_DATA_PROC(50)';
    end if;


END PROCEDURE1;

/
--------------------------------------------------------
--  Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" MODIFY ("BNUM" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BBCID" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BLOCATION" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BID" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BNICKNAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BCDATE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BHIT" NOT NULL ENABLE);
  ALTER TABLE "BOARD" MODIFY ("BTITLE" NOT NULL ENABLE);
  ALTER TABLE "BOARD" ADD CONSTRAINT "BOARD_PK" PRIMARY KEY ("BNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARDCATEGORY
--------------------------------------------------------

  ALTER TABLE "BOARDCATEGORY" MODIFY ("BCID" NOT NULL ENABLE);
  ALTER TABLE "BOARDCATEGORY" MODIFY ("BCNAME" NOT NULL ENABLE);
  ALTER TABLE "BOARDCATEGORY" ADD CONSTRAINT "BOARDCATEGORY_PK" PRIMARY KEY ("BCID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "BOARD_UPLOAD_FILE" MODIFY ("FID" NOT NULL ENABLE);
  ALTER TABLE "BOARD_UPLOAD_FILE" MODIFY ("BNUM" NOT NULL ENABLE);
  ALTER TABLE "BOARD_UPLOAD_FILE" MODIFY ("FNAME" NOT NULL ENABLE);
  ALTER TABLE "BOARD_UPLOAD_FILE" MODIFY ("FSIZE" NOT NULL ENABLE);
  ALTER TABLE "BOARD_UPLOAD_FILE" MODIFY ("FTYPE" NOT NULL ENABLE);
  ALTER TABLE "BOARD_UPLOAD_FILE" MODIFY ("CDATE" NOT NULL ENABLE);
  ALTER TABLE "BOARD_UPLOAD_FILE" ADD CONSTRAINT "BOARD_UPLOAD_FILE_PK" PRIMARY KEY ("FID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "USERS"  ENABLE;
--------------------------------------------------------
--  Constraints for Table CONTRACT
--------------------------------------------------------

  ALTER TABLE "CONTRACT" MODIFY ("CONTNUM" NOT NULL ENABLE);
  ALTER TABLE "CONTRACT" MODIFY ("CBNUM" NOT NULL ENABLE);
  ALTER TABLE "CONTRACT" MODIFY ("CLIENTID" NOT NULL ENABLE);
  ALTER TABLE "CONTRACT" MODIFY ("SHOOTERID" NOT NULL ENABLE);
  ALTER TABLE "CONTRACT" MODIFY ("CAMOUNT" NOT NULL ENABLE);
  ALTER TABLE "CONTRACT" MODIFY ("CSTATUS" NOT NULL ENABLE);
  ALTER TABLE "CONTRACT" ADD CONSTRAINT "CONTRACT_PK" PRIMARY KEY ("CONTNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CONTRACT" MODIFY ("CCDATE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table CSBOARD
--------------------------------------------------------

  ALTER TABLE "CSBOARD" MODIFY ("CSBNUM" NOT NULL ENABLE);
  ALTER TABLE "CSBOARD" MODIFY ("CSBID" NOT NULL ENABLE);
  ALTER TABLE "CSBOARD" ADD CONSTRAINT "CSBOARD_PK" PRIMARY KEY ("CSBNUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "CSBOARD" MODIFY ("CSBCDATE" NOT NULL ENABLE);
  ALTER TABLE "CSBOARD" MODIFY ("CSBTITLE" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table DEBITCREDIT
--------------------------------------------------------

  ALTER TABLE "DEBITCREDIT" MODIFY ("NUM" NOT NULL ENABLE);
  ALTER TABLE "DEBITCREDIT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "DEBITCREDIT" MODIFY ("AMOUNT" NOT NULL ENABLE);
  ALTER TABLE "DEBITCREDIT" MODIFY ("TDATE" NOT NULL ENABLE);
  ALTER TABLE "DEBITCREDIT" ADD CONSTRAINT "BALANCE_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "MEMBER" MODIFY ("MONEYRECOMMEND" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("ID")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
  ALTER TABLE "MEMBER" MODIFY ("BALANCE" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("CDATE" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("REGION" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("BIRTH" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("GENDER" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("NICKNAME" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("TEL" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("PW" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "MEMBER" MODIFY ("EMAILCHECK" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table RATES
--------------------------------------------------------

  ALTER TABLE "RATES" MODIFY ("NUM" NOT NULL ENABLE);
  ALTER TABLE "RATES" MODIFY ("RATER" NOT NULL ENABLE);
  ALTER TABLE "RATES" MODIFY ("RATEE" NOT NULL ENABLE);
  ALTER TABLE "RATES" MODIFY ("RATES" NOT NULL ENABLE);
  ALTER TABLE "RATES" MODIFY ("RDATE" NOT NULL ENABLE);
  ALTER TABLE "RATES" ADD CONSTRAINT "RATES_PK" PRIMARY KEY ("NUM")
  USING INDEX PCTFREE 10 INITRANS 2 MAXTRANS 255 COMPUTE STATISTICS 
  STORAGE(INITIAL 65536 NEXT 1048576 MINEXTENTS 1 MAXEXTENTS 2147483645
  PCTINCREASE 0 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT FLASH_CACHE DEFAULT CELL_FLASH_CACHE DEFAULT)
  TABLESPACE "SYSTEM"  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD
--------------------------------------------------------

  ALTER TABLE "BOARD" ADD CONSTRAINT "BOARDVO_FK1" FOREIGN KEY ("BBCID")
	  REFERENCES "BOARDCATEGORY" ("BCID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "BOARD" ADD CONSTRAINT "BOARDVO_FK3" FOREIGN KEY ("BID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table BOARD_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "BOARD_UPLOAD_FILE" ADD CONSTRAINT "BOARD_UPLOAD_FILE_FK1" FOREIGN KEY ("BNUM")
	  REFERENCES "BOARD" ("BNUM") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CONTRACT
--------------------------------------------------------

  ALTER TABLE "CONTRACT" ADD CONSTRAINT "CONTRACT_FK1" FOREIGN KEY ("CBNUM")
	  REFERENCES "BOARD" ("BNUM") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CONTRACT" ADD CONSTRAINT "CONTRACT_FK2" FOREIGN KEY ("CLIENTID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "CONTRACT" ADD CONSTRAINT "CONTRACT_FK3" FOREIGN KEY ("SHOOTERID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CSBOARD
--------------------------------------------------------

  ALTER TABLE "CSBOARD" ADD CONSTRAINT "CSBOARD_FK1" FOREIGN KEY ("CSBID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table DEBITCREDIT
--------------------------------------------------------

  ALTER TABLE "DEBITCREDIT" ADD CONSTRAINT "BALANCE_FK1" FOREIGN KEY ("ID")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE;
  ALTER TABLE "DEBITCREDIT" ADD CONSTRAINT "DEBITCREDIT_FK1" FOREIGN KEY ("CONTNUM")
	  REFERENCES "CONTRACT" ("CONTNUM") ON DELETE CASCADE ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table RATES
--------------------------------------------------------

  ALTER TABLE "RATES" ADD CONSTRAINT "RATES_FK1" FOREIGN KEY ("RATER")
	  REFERENCES "MEMBER" ("ID") ON DELETE CASCADE ENABLE;
