--  Copyright (c) sumneva 2010. All Rights Reserved.
--
--    NAME
--      create_user.sql
--
--    DESCRIPTION
--
--    NOTES
--      Assumes the SYS user is connected.
--
--    Arguments:
--
--    MODIFIED   (MM/DD/YYYY)
--      dgault    1/7/09 7:19 PM - Created   

set termout on
set define '^'
set concat on
set concat .
set verify off
--
--
PROMPT
PROMPT ==================================================================================
PROMPT = CREATING SV_SERT_050102 USER 
PROMPT ==================================================================================
PROMPT
PROMPT Listing all available tablespaces...
PROMPT
select tablespace_name "Tablespace Name" from dba_tablespaces ORDER BY 1;
--
PROMPT
ACCEPT dflt CHAR DEFAULT 'USERS' PROMPT 'Please enter the default tablespace to be used for SV_SERT_050102 [USERS] : '
ACCEPT temp CHAR DEFAULT 'TEMP'  PROMPT 'Please enter the temporary tablespace to be used for SV_SERT_050102 [TEMP] : '
--
set feedback on

create user sv_sert_050102 identified by "^schema_password" default tablespace "^dflt" quota unlimited on "^dflt" temporary tablespace "^temp";
grant connect, resource, create any job to sv_sert_050102;

set feedback off;
set termout off;