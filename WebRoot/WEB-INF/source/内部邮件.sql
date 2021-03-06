-- CREATE TABLE
CREATE TABLE B_NBYJ
(
  N_XH    VARCHAR2(8) NOT NULL,
  C_BT    VARCHAR2(200),
  C_YHID  VARCHAR2(30),
  C_YHZID VARCHAR2(30),
  C_NR    CLOB,
  C_FJ    VARCHAR2(200),
  C_FJDX  VARCHAR2(200),
  D_DJ    DATE,
  C_ZT    CHAR(1),
  C_SFSC  CHAR(1),
  C_SFBC  CHAR(1),
  C_IP    VARCHAR2(20),
  C_JSR   VARCHAR2(2000),
  C_CSR   VARCHAR2(2000),
  C_MSR   VARCHAR2(2000) 
)
TABLESPACE DCP
  PCTFREE 10
  INITRANS 1
  MAXTRANS 255
  STORAGE
  (
    INITIAL 16
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );
-- ADD COMMENTS TO THE TABLE 
COMMENT ON TABLE B_NBYJ
  IS '内部邮件';
-- ADD COMMENTS TO THE COLUMNS 
COMMENT ON COLUMN B_NBYJ.N_XH
  IS '序号';
COMMENT ON COLUMN B_NBYJ.C_BT
  IS '标题';
COMMENT ON COLUMN B_NBYJ.C_YHID
  IS '用户';
COMMENT ON COLUMN B_NBYJ.C_YHZID
  IS '用户组';
COMMENT ON COLUMN B_NBYJ.C_NR
  IS '内容';
-- CREATE/RECREATE PRIMARY, UNIQUE AND FOREIGN KEY CONSTRAINTS 
ALTER TABLE B_NBYJ
  ADD CONSTRAINT PK_B_NBYJ PRIMARY KEY (N_XH)
  USING INDEX 
  TABLESPACE DCP
  PCTFREE 10
  INITRANS 2
  MAXTRANS 255
  STORAGE
  (
    INITIAL 64K
    MINEXTENTS 1
    MAXEXTENTS UNLIMITED
  );

  -- CREATE SEQUENCE 
CREATE SEQUENCE SEQ_B_NBYJ
MINVALUE 10000
MAXVALUE 99999
START WITH 10000
INCREMENT BY 1
CACHE 20;