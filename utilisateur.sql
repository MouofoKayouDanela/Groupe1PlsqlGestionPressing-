SET FEEDBACK 1
SET NUMWIDTH 10
SET LINESIZE 80
SET TRIMSPOOL ON
SET TAB OFF
SET PAGESIZE 100
SET ECHO OFF
SET VERIFY OFF
alter session set container=xepdb1;
DEFINE pass     = op
DEFINE tbs      = users
DEFINE ttbs     = temp
DEFINE pass_sys = op
DEFINE log_path = logs
DEFINE connect_string     = //localhost:1521/xepdb1
DEFINE spool_file = &log_path.OpenPressing.log
SPOOL &spool_file
PROMPT SUPPRESSION D'UTILISATEUR POTENTIELLEMENT EXISTANT
DROP USER OpenPressing CASCADE;
PROMPT*************** Creation utilisateur ***************
CREATE USER OpenPressing IDENTIFIED BY &pass;

ALTER USER OpenPressing DEFAULT TABLESPACE &tbs
              QUOTA UNLIMITED ON &tbs;

ALTER USER OpenPressing TEMPORARY TABLESPACE &ttbs;

GRANT CREATE SESSION, CREATE VIEW, ALTER SESSION, CREATE SEQUENCE TO OpenPressing;
GRANT CREATE SYNONYM, CREATE DATABASE LINK, RESOURCE , UNLIMITED TABLESPACE TO OpenPressing;
PROMPT ***************************************************************************************************
CONNECT sys/&pass_sys@&connect_string  AS SYSDBA;
GRANT execute ON sys.dbms_stats TO OpenPressing;
CONNECT OpenPressing/&pass@&connect_string 