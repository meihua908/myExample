-------------------------------------------------------
-- Export file for user AVS@172.16.210.179:1521/ORCL --
-- Created by Administrator on 2017/7/13, 9:45:52 -----
-------------------------------------------------------

set define off
spool seq.log

prompt
prompt Creating sequence SEQ_CLERK
prompt ===========================
prompt
create sequence AVS.SEQ_CLERK
minvalue 1
maxvalue 9999999999999999999999999999
start with 61
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MEETING
prompt =============================
prompt
create sequence AVS.SEQ_MEETING
minvalue 1
maxvalue 99999999
start with 47
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_BEHAVIOR_LOG
prompt ======================================
prompt
create sequence AVS.SEQ_SYS_BEHAVIOR_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 17241
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_DIC
prompt =============================
prompt
create sequence AVS.SEQ_SYS_DIC
minvalue 1
maxvalue 99999999
start with 1020
increment by 1
cache 2;

prompt
prompt Creating sequence SEQ_SYS_MENU
prompt ==============================
prompt
create sequence AVS.SEQ_SYS_MENU
minvalue 1
maxvalue 99999999
start with 628
increment by 1
cache 2;

prompt
prompt Creating sequence SEQ_SYS_ORG
prompt =============================
prompt
create sequence AVS.SEQ_SYS_ORG
minvalue 1
maxvalue 99999999
start with 70
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_ROLE
prompt ==============================
prompt
create sequence AVS.SEQ_SYS_ROLE
minvalue 1
maxvalue 99999999
start with 160
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_URL
prompt =============================
prompt
create sequence AVS.SEQ_SYS_URL
minvalue 1
maxvalue 99999999
start with 626
increment by 1
cache 2;

prompt
prompt Creating sequence SEQ_SYS_USER
prompt ==============================
prompt
create sequence AVS.SEQ_SYS_USER
minvalue 1
maxvalue 99999999
start with 1800
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TML_DEVICE
prompt ================================
prompt
create sequence AVS.SEQ_TML_DEVICE
minvalue 1
maxvalue 9999999999999999999999999999
start with 1
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MEETING_FILES
prompt ================================
prompt
create sequence SEQ_MEETING_FILES
minvalue 1
maxvalue 99999999
start with 561
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TML_DEVICE_TASK
prompt ================================
prompt
create sequence SEQ_TML_DEVICE_TASK
minvalue 1
maxvalue 9999999999999999999999999999
start with 1141
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TML_DEVICE_GROUP
prompt ================================
prompt
create sequence SEQ_TML_DEVICE_GROUP
minvalue 1
maxvalue 99999999
start with 21
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_TML_DEVICE_GROUP_DETAIL
prompt ================================
prompt
create sequence SEQ_TML_DEVICE_GROUP_DETAIL
minvalue 1
maxvalue 999999999
start with 1
increment by 1
cache 20;
spool off
