-------------------------------------------------------
-- Export file for user AVS@172.16.210.179:1521/ORCL --
-- Created by Administrator on 2017/7/13, 9:50:43 -----
-------------------------------------------------------

set define off
spool function.log

prompt
prompt Creating function GET_CLERK_NAME
prompt ================================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_CLERK_NAME(P_CLERK_ID IN NUMBER) RETURN VARCHAR2 IS
  V_CLERK_NAME VARCHAR2(64);
BEGIN

  SELECT CLERK_NAME INTO V_CLERK_NAME FROM CLERK WHERE CLERK_ID = P_CLERK_ID AND DELETED = 0;

  RETURN(V_CLERK_NAME);

END GET_CLERK_NAME;
/

prompt
prompt Creating function GET_DIC_VALUE
prompt ===============================
prompt
create or replace function avs.GET_DIC_VALUE(P_DIC_TYPE IN VARCHAR2,P_DIC_KEY IN VARCHAR2)
return varchar2
is
   V_DIC_VALUE VARCHAR2(64);
begin
  SELECT DIC_VALUE INTO V_DIC_VALUE FROM SYS_DIC WHERE P_DIC_TYPE = DIC_TYPE AND P_DIC_KEY = DIC_KEY;
  return(V_DIC_VALUE);
end GET_DIC_VALUE;
/

prompt
prompt Creating function GET_FUN_NAME
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_FUN_NAME(P_FUN_ID IN NUMBER) RETURN VARCHAR2 IS
  V_FUN_NAME VARCHAR2(64);
BEGIN
  SELECT FUN_NAME INTO V_FUN_NAME FROM SYS_FUN WHERE FUN_ID = P_FUN_ID;
  RETURN(V_FUN_NAME);
END GET_FUN_NAME;
/

prompt
prompt Creating function GET_ORG_INHERITEDNAME
prompt =======================================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_ORG_INHERITEDNAME(P_ORG_ID IN NUMBER) RETURN VARCHAR2 IS
  V_ORG_INHERITEDNAME VARCHAR2(512);
BEGIN

  SELECT INHERITED_NAME INTO V_ORG_INHERITEDNAME FROM SYS_ORG WHERE ORG_ID = P_ORG_ID;

  RETURN(V_ORG_INHERITEDNAME);

END GET_ORG_INHERITEDNAME;
/

prompt
prompt Creating function GET_ORG_NAME
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_ORG_NAME(P_ORG_ID IN NUMBER) RETURN VARCHAR2 IS
  V_ORG_NAME VARCHAR2(64);
BEGIN

  SELECT ORG_NAME INTO V_ORG_NAME FROM SYS_ORG WHERE ORG_ID = P_ORG_ID;

  RETURN(V_ORG_NAME);

END GET_ORG_NAME;
/

prompt
prompt Creating function GET_ORG_PARENTNAME
prompt ====================================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_ORG_PARENTNAME(P_PARENT_ID IN NUMBER) RETURN VARCHAR2 IS
  V_PARENT_NAME VARCHAR2(64);
BEGIN

  SELECT ORG_NAME INTO V_PARENT_NAME FROM SYS_ORG WHERE ORG_ID = P_PARENT_ID;

  RETURN(V_PARENT_NAME);

END GET_ORG_PARENTNAME;
/

prompt
prompt Creating function GET_REAL_NAME
prompt ===============================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_REAL_NAME(P_USER_ID IN NUMBER) RETURN VARCHAR2 IS
  V_REAL_NAME VARCHAR2(64);
BEGIN

  SELECT REAL_NAME INTO V_REAL_NAME FROM SYS_USER WHERE USER_ID = P_USER_ID;

  RETURN(V_REAL_NAME);

END GET_REAL_NAME;
/

prompt
prompt Creating function GET_USERNAME
prompt ==============================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_USERNAME(P_USER_ID IN NUMBER) RETURN VARCHAR2 IS
  V_USERNAME VARCHAR2(64);
BEGIN

  SELECT USERNAME INTO V_USERNAME FROM SYS_USER WHERE USER_ID = P_USER_ID;

  RETURN(V_USERNAME);

END GET_USERNAME;
/

prompt
prompt Creating function Get_StrArrayStrOfIndex
prompt ==============================
prompt
create or replace function Get_StrArrayStrOfIndex
(
  av_str varchar2,  --要分割的字符串
  av_split varchar2,  --分隔符号
  av_index number --取第几个元素
)
return varchar2
is
  lv_str varchar2(1024);
  lv_strOfIndex varchar2(1024);
  lv_length number;
begin
  lv_str:=ltrim(rtrim(av_str));
  lv_str:=concat(lv_str,av_split);
  lv_length:=av_index;
  if lv_length=0 then
      lv_strOfIndex:=substr(lv_str,1,instr(lv_str,av_split)-length(av_split));
  else
      lv_length:=av_index+1;
     lv_strOfIndex:=substr(lv_str,instr(lv_str,av_split,1,av_index)+length(av_split),instr(lv_str,av_split,1,lv_length)-instr(lv_str,av_split,1,av_index)-length(av_split));
  end if;
  return  lv_strOfIndex;
end Get_StrArrayStrOfIndex;

prompt
prompt Creating function split
prompt ==============================
prompt
CREATE OR REPLACE TYPE type_split IS TABLE OF VARCHAR2 (4000);
create or replace function split(p_list varchar2,p_sep varchar2 := ’,’)
return type_split pipelined
IS
l_idx pls_integer;
v_list varchar2(50) := p_list;
begin
 loop
   l_idx := instr(v_list,p_sep);
   if l_idx = 0 then
     pipe row(substr(v_list,1,l_idx-1));
     v_list := substr(v_list,l_idx+length(p_sep));
   else
     pipe row(v_list);
    exit;
   end if;
  end loop;
end split;

prompt
prompt Creating function Get_StrArrayStrOfIndex
prompt ==============================
prompt
create or replace function Get_StrArrayStrOfIndex
(
  av_str varchar2,  --要分割的字符串
  av_split varchar2,  --分隔符号
  av_index number --取第几个元素
)
return varchar2
is
  lv_str varchar2(1024);
  lv_strOfIndex varchar2(1024);
  lv_length number;
begin
  lv_str:=ltrim(rtrim(av_str));
  lv_str:=concat(lv_str,av_split);
  lv_length:=av_index;
  if lv_length=0 then
      lv_strOfIndex:=substr(lv_str,1,instr(lv_str,av_split)-length(av_split));
  else
      lv_length:=av_index+1;
     lv_strOfIndex:=substr(lv_str,instr(lv_str,av_split,1,av_index)+length(av_split),instr(lv_str,av_split,1,lv_length)-instr(lv_str,av_split,1,av_index)-length(av_split));
  end if;
  return  lv_strOfIndex;
end Get_StrArrayStrOfIndex;

spool off
