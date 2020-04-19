--------------------------------------------------------
--  ������ ������ - �Ͽ���-4��-19-2020   
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

   COMMENT ON COLUMN "BOARD"."BNUM" IS '�۹�ȣ';
   COMMENT ON COLUMN "BOARD"."BBCID" IS '�Խ��� ī�װ� ���̵�';
   COMMENT ON COLUMN "BOARD"."BLOCATION" IS '��ġ';
   COMMENT ON COLUMN "BOARD"."BID" IS 'ȸ��ID';
   COMMENT ON COLUMN "BOARD"."BNICKNAME" IS '�ۼ��� ��Ī';
   COMMENT ON COLUMN "BOARD"."BCONTENT" IS '�۳���';
   COMMENT ON COLUMN "BOARD"."BCDATE" IS '�Խñ� �ۼ���';
   COMMENT ON COLUMN "BOARD"."BUDATE" IS '�Խñ� ������';
   COMMENT ON COLUMN "BOARD"."SDATETIME" IS '���� �ð�';
   COMMENT ON COLUMN "BOARD"."JOB" IS '�ϰ� ���� �̸�';
   COMMENT ON COLUMN "BOARD"."DURATION" IS '�ð� ���� �̸�';
   COMMENT ON COLUMN "BOARD"."PAYMENT" IS '���� ���� �̸�';
   COMMENT ON COLUMN "BOARD"."BHIT" IS '��ȸ��';
   COMMENT ON COLUMN "BOARD"."BTITLE" IS '������';
   COMMENT ON COLUMN "BOARD"."BSTATUS" IS '������ ''0''=�ʱ� ''1''=���� ''2''=�³�';
   COMMENT ON COLUMN "BOARD"."BAPPLICATION" IS '������ID';
   COMMENT ON COLUMN "BOARD"."LATITUDE" IS '����';
   COMMENT ON COLUMN "BOARD"."LONGITUDE" IS '�浵
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

   COMMENT ON COLUMN "BOARDCATEGORY"."BCID" IS '�Խ��� ī�װ� ���̵�';
   COMMENT ON COLUMN "BOARDCATEGORY"."BCNAME" IS '�Խ��� ī�װ� �̸�';
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

   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FID" IS '���Ͼ��̵�';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."BNUM" IS '�Խñ۹�ȣ';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FNAME" IS '���ϸ�';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FSIZE" IS '����ũ��';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FTYPE" IS '��������';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."FDATA" IS '÷������';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."CDATE" IS '�ۼ���';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."UDATE" IS '������';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."COL1" IS '�ӽ�1';
   COMMENT ON COLUMN "BOARD_UPLOAD_FILE"."COL2" IS '�ӽ�2';
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

   COMMENT ON COLUMN "CONTRACT"."CONTNUM" IS '����ȣ';
   COMMENT ON COLUMN "CONTRACT"."CBNUM" IS '�۹�ȣ';
   COMMENT ON COLUMN "CONTRACT"."CLIENTID" IS '�Ƿ���';
   COMMENT ON COLUMN "CONTRACT"."SHOOTERID" IS '�ذ��';
   COMMENT ON COLUMN "CONTRACT"."CAMOUNT" IS '����';
   COMMENT ON COLUMN "CONTRACT"."CSTATUS" IS '������';
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

   COMMENT ON COLUMN "MEMBER"."ID" IS 'ȸ�� ID';
   COMMENT ON COLUMN "MEMBER"."PW" IS '��й�ȣ';
   COMMENT ON COLUMN "MEMBER"."TEL" IS '����ó';
   COMMENT ON COLUMN "MEMBER"."NICKNAME" IS 'ȸ�� ��Ī';
   COMMENT ON COLUMN "MEMBER"."GENDER" IS '����(''��'',''��'')';
   COMMENT ON COLUMN "MEMBER"."BIRTH" IS '�������(''yyyymmdd'')';
   COMMENT ON COLUMN "MEMBER"."REGION" IS '������';
   COMMENT ON COLUMN "MEMBER"."CDATE" IS '������';
   COMMENT ON COLUMN "MEMBER"."UDATE" IS 'ȸ������ ������';
   COMMENT ON COLUMN "MEMBER"."BALANCE" IS '�ܰ�';
   COMMENT ON COLUMN "MEMBER"."PIC" IS 'ȸ�� ����';
   COMMENT ON COLUMN "MEMBER"."FNAME" IS '�����̸�';
   COMMENT ON COLUMN "MEMBER"."FSIZE" IS '����ũ��';
   COMMENT ON COLUMN "MEMBER"."MONEYRECOMMEND" IS '�����õ����';
   COMMENT ON COLUMN "MEMBER"."EMAILCHECK" IS '�̸��� ���� ����';
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

   COMMENT ON COLUMN "RATES"."RATER" IS '���ϴ»��';
   COMMENT ON COLUMN "RATES"."RATEE" IS '�򰡹޴»��';
   COMMENT ON COLUMN "RATES"."RATES" IS '����';
   COMMENT ON COLUMN "RATES"."DETAIL" IS '�򰡳���';
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
    recordcnt in number default 50 -- ���� ������ ����
)
AS 

        type va_type is varray(27) of varchar(100);
    regionSample va_type := va_type(
'��� ���� ����ž',
'��� ���� �����ȭ��',
'��� �ϱ� ȭ������',
'��� �ϱ� ��ȭ����ȸ��',
'��� ���� ���Ǽ�',
'��� ����û ���',
'��� �߱� ���Ǽ�',
'��� �߱� ����2�� GS������',
'�λ� ���� ������',
'�λ� ���� ����ü������',
'�λ� ���� �ʷ�3�� �߾Ӵ��',
'�λ� ���� �ҷθ���',
'�λ� �ϱ� ���Ǽ�',
'�λ� �ϱ� ���ο',
'�뱸 ���� �򸮵� ��ä�����',
'�뱸 ���� ��ȭȸ��',
'�뱸 ���� ���� ���',
'�뱸 ���� ���Ǽ�',
'�뱸 ���� ��������',
'���� ���� ��ȭ��',
'���� ���� ���κ�����',
'���� ����û',
'���� ����û�ҳ� ���ð�',
'���� �ϱ�û',
'���� ��������',
'���� ����û',
'���� �ϱ� �����Խ��п�'
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

    
    --BOARD_BNUM_SEQ ���� Ȯ��
    SELECT COUNT(*) INTO V_CNT
              FROM user_sequences 
            WHERE sequence_name = 'BOARD_BNUM_SEQ';
    --BOARD_BNUM_SEQ �� �����ϸ� �����ϰ� ����, ������ ����(�۹�ȣ�� ���� ��ȣ ��ġ�� ���ؼ�)
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
        
        v_application:= null;--������
        v_randomNum := trunc(dbms_random.value(1,26));--�迭 ������ ������ �ε��� ���� ����
        v_category := trunc(dbms_random.value(1,3));--�� ī�װ� ���� ����(1,2)
        --ȸ�� ���̵� 1�� ���� ����
        select id into v_id from (select id  from member order by dbms_random.value) where rownum = 1;
        --�Խñ� STATUS 0~2 ���� ����
        v_bstatus := trunc(dbms_random.value(0,3));
        --�Խñ� STATUS�� 0�� �ƴ� ��쿡�� ������ ����,�����ڴ� �۾��̿� �ٸ� ȸ�� ���̺��� ���� ����
        if v_bstatus not in (0) then
            select id into v_application from (select id from member where id not in (v_id) order by dbms_random.value) where rownum = 1;
        end if;
        
        --ī�װ��� 1,2�� ���� ���� ���� 
        if v_category = 1 then
            v_content := '�ذ�� ���մϴ�.'||i ;
        elsif v_category = 2 then
            v_content  := '�ϰ� ���մϴ�.'||i;
        end if;
        
        --ī�װ��� 1,2�� ���� ���� ����
        if v_category = 1 then
            v_title:= '�ذ�� ���մϴ�.'||i ;
        elsif v_category = 2 then
            v_title:= '�ϰ� ���մϴ�.'||i;
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

            --ī�װ� ���� ------------------
            v_category,
            --ī�װ� �� ------------------

            --���� ���� ------------------
            regionSample(v_randomNum),
            --���� �� ------------------
            
            --latitude ���� ------------------
             lonSample(v_randomNum),
            --latitude �� ------------------
            
            --longitude ���� ------------------
           
            latSample(v_randomNum),
            --longitude �� ------------------


            --���̵� ���� ------------------
            v_id,
            --���̵� �� ------------------

            --�г��� ���� ------------------
            ((SELECT DBMS_RANDOM.STRING('L', 5) STR FROM DUAL)),
            --�г��� �� ------------------
            
            --���� ���� ------------------
            v_content,
            --���� �� ------------------

            --bcdate,
            --budate,
            --sdatetime ���� ------------------
            (select to_date('2018-01-01','yyyy-MM-dd HH24:MI:SS') 
                    +dbms_random.value(0,1000) 
             from dual),
            --sdatetime ���� ------------------

            --�� ���� ���� ------------------
            (select a from(
                select a from(
                    select 'û��' a from dual union all
                    select '�̻���' a from dual union all
                    select '���' a from dual union all
                    select 'ī����' a from dual)
                    order by dbms_random.value)
                where rownum = 1),
            --�� ���� �� ------------------

            --�� �Ⱓ ���� ------------------
            (select a from(
                select a from(
                    select 30 a from dual union all
                    select 60 a from dual union all
                    select 90 a from dual union all
                    select 120 a from dual
                ) order by dbms_random.value)
            where rownum = 1),
            --�� �Ⱓ �� ------------------

            --�� ���� ���� ------------------
            (select a from(
                select a from(
                    select 5000 a from dual union all
                    select 10000 a from dual union all
                    select 15000 a from dual union all
                    select 20000 a from dual)
                    order by dbms_random.value)
            where rownum = 1),
            --�� ���� �� ------------------

            --���� ���� ------------------    
            v_title,
            --���� �� ------------------

            --���� ���� ���� ------------------    
            v_bstatus,
            --���� ���� �� ------------------

            --������ ID ���� ------------------
            v_application            
            --������ ID �� ------------------

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

--board���� ����, �³��� �� �˻�
CURSOR cu1 is
    select bnum,bbcid, bid, bapplication, payment
        from board
        where bstatus = 2;

BEGIN
open cu1;
    loop
        fetch cu1 into v_bnum,v_bbcid,v_bid, v_bapplication, v_payment;
        exit when cu1%notFound;
        
        --��� ���� 0,1 ���� ����
        select trunc(dbms_random.value(0,2)) into v_cstatus from dual;
        
        --ī�װ��� 1�̸�
        if (v_bbcid=1) then
            v_clientid := v_bid; -- �۾��̰� �Ƿ���
            v_shooterid := v_bapplication; --�����ڰ� �ذ��
        --ī�װ��� 2�̸�
        elsif (v_bbcid=2) then
            v_clientid := v_bapplication; --�����ڰ� �Ƿ���
            v_shooterid := v_bid; --�۾��̰� �ذ��

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
      '����-' || i,  
      'test@naver.com',
      '�����ֽ��ϴ�-' || i,
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
recordcnt in number default 10 --���� ������ ����
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
            --���̵� ���� ------------------
            v_id,
            --���̵� �� ------------------

            --��й�ȣ ���� ------------------
            --���� ��й�ȣ ����
            --(SELECT DBMS_RANDOM.STRING('P', 8) STR FROM DUAL),
            '!abcd1234',
            --��й�ȣ �� ------------------

            --��ȭ��ȣ ���� ------------------
            --'010-xxxx-xxxx',
            '010'||'-'||
            (select trunc(dbms_random.value(1000,10000)) from dual)||'-'||
            (select trunc(dbms_random.value(1000,10000)) from dual),
            --��ȭ��ȣ �� ------------------

            'ȸ��'||i,

            -- ���� ���� ------------------
            (select a from(
                select a from(
                    select '��' a from dual union all
                    select '��' a from dual 
                ) order by dbms_random.value
            ) where rownum = 1),
            --���� �� ------------------

            --���� ���� ------------------
            (select to_date(
                trunc(dbms_random.value
                    (
                    to_char(date '2018-01-01', 'j'), to_char(date '2020-04-04','j')
                    )
                ),'j'
              ) from dual
            ),
            --���� ��------------------

            --���� ���� ------------------
            (select a from(
                select a from(
                    select '��� ����' a from dual union all
                    select '��� �߱�' a from dual union all
                    select '��� ����' a from dual union all
                    select '��� �ϱ�' a from dual union all
                    select '�λ� ����' a from dual union all
                    select '�λ� ����' a from dual union all
                    select '�λ� �ϱ�' a from dual union all
                    select '�뱸 ����' a from dual union all
                    select '�뱸 ����' a from dual union all
                    select '���� ����' a from dual union all
                    select '���� ����' a from dual union all
                    select '���� �ϱ�' a from dual union all
                    select '���� ����' a from dual union all
                    select '���� �ϱ�' a from dual 
                ) order by dbms_random.value
            ) where rownum = 1),
            --���� �� ------------------

            --������ ���� ------------------
            (select to_date('2018-01-01','yyyy-MM-dd HH24:MI:SS') 
                    +dbms_random.value(0,1000) 
             from dual),
            --������ ��------------------


            --moneyrecommend ���� ------------------
            --0,1 ���� ����
            (SELECT trunc(DBMS_RANDOM.VALUE(0, 2)) rand FROM DUAL),
            --moneyrecommend �� ------------------
            
            --emailcheck ���� ------------------
            --0,1 ���� ����
            v_emailcheck
            -- emailcheck �� ------------------
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
                                            '�̸��� ����'
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
