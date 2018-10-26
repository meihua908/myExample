---------------------------------------------
-- Export file for user AVS                --
-- Created by hekm on 2017/10/10, 13:38:59 --
---------------------------------------------

set define off
spool avs.log

prompt
prompt Creating table APPOINTMENT_MEETING
prompt ==================================
prompt
create table AVS.APPOINTMENT_MEETING
(
  meeting_id      NUMBER(8) not null,
  meeting_subject VARCHAR2(30) not null,
  appointment_pwd VARCHAR2(32),
  start_time      TIMESTAMP(3) not null,
  end_time        TIMESTAMP(3) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.APPOINTMENT_MEETING
  is 'ԤԼ������Ϣ';
comment on column AVS.APPOINTMENT_MEETING.meeting_id
  is '����ID';
comment on column AVS.APPOINTMENT_MEETING.meeting_subject
  is '��������';
comment on column AVS.APPOINTMENT_MEETING.appointment_pwd
  is 'ԤԼ����';
comment on column AVS.APPOINTMENT_MEETING.start_time
  is 'ԤԼ�Ŀ�ʼʱ��';
comment on column AVS.APPOINTMENT_MEETING.end_time
  is 'ԤԼ�Ľ���ʱ��';

prompt
prompt Creating table ATTENDENCE_LIST
prompt ==============================
prompt
create table AVS.ATTENDENCE_LIST
(
  meeting_id  NUMBER(8) not null,
  clerk_id    NUMBER(8) not null,
  is_invited  NUMBER(1),
  evalution   VARCHAR2(100),
  description VARCHAR2(200),
  is_evaluted NUMBER(1),
  is_attended NUMBER(1)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.ATTENDENCE_LIST
  is '�μ����б�';
comment on column AVS.ATTENDENCE_LIST.meeting_id
  is '����ID';
comment on column AVS.ATTENDENCE_LIST.clerk_id
  is 'ְԱID';
comment on column AVS.ATTENDENCE_LIST.is_invited
  is '�Ƿ����루0�������룬1��δ�����룩';
comment on column AVS.ATTENDENCE_LIST.evalution
  is '1��һ�ǣ�2�����ǣ�3�����ǣ�4�����ǣ�5������';
comment on column AVS.ATTENDENCE_LIST.description
  is '����';
comment on column AVS.ATTENDENCE_LIST.is_evaluted
  is '�Ƿ����ۣ�0�������ۣ�1��δ�����ۣ�';
comment on column AVS.ATTENDENCE_LIST.is_attended
  is '�Ƿ�μӻ��飨0���μ��˻��飬1��δ�μӻ��飩';

prompt
prompt Creating table ATTEND_TIME_DETAIL
prompt =================================
prompt
create table AVS.ATTEND_TIME_DETAIL
(
  clerk_id   NUMBER(8) not null,
  join_time  TIMESTAMP(3),
  leave_time TIMESTAMP(3),
  meeting_id NUMBER(8),
  time_diff  NUMBER(8)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.ATTEND_TIME_DETAIL
  is '����ʱ����ϸ��';
comment on column AVS.ATTEND_TIME_DETAIL.clerk_id
  is 'ְԱID';
comment on column AVS.ATTEND_TIME_DETAIL.join_time
  is '�������ʱ��';
comment on column AVS.ATTEND_TIME_DETAIL.leave_time
  is '�˳�����ʱ��';
comment on column AVS.ATTEND_TIME_DETAIL.meeting_id
  is '����ID';
comment on column AVS.ATTEND_TIME_DETAIL.time_diff
  is 'ʱ�����ӣ�';

prompt
prompt Creating table CLERK
prompt ====================
prompt
create table AVS.CLERK
(
  clerk_id            NUMBER(8) not null,
  clerk_no            VARCHAR2(32) not null,
  clerk_type          NUMBER(1),
  org_id              NUMBER(8) not null,
  clerk_name          VARCHAR2(32) not null,
  clerk_pwd           CHAR(32) not null,
  email               VARCHAR2(32),
  sex                 NUMBER(1),
  phonenumber         NUMBER(13),
  address             VARCHAR2(50),
  create_by           VARCHAR2(30),
  create_date         TIMESTAMP(3),
  last_update_date    TIMESTAMP(3),
  last_update_by      VARCHAR2(30),
  locked              NUMBER(1) not null,
  deleted             NUMBER(1) not null,
  remark              VARCHAR2(120),
  login_status        NUMBER(1),
  last_heartbeat_date TIMESTAMP(3)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.CLERK
  is 'ְԱ��';
comment on column AVS.CLERK.clerk_id
  is 'ְԱid';
comment on column AVS.CLERK.clerk_no
  is 'ְԱ���';
comment on column AVS.CLERK.clerk_type
  is '0��ר�ң�1����ͨԱ��';
comment on column AVS.CLERK.org_id
  is '����ID';
comment on column AVS.CLERK.clerk_name
  is 'ְԱ����';
comment on column AVS.CLERK.clerk_pwd
  is 'ְԱ����';
comment on column AVS.CLERK.email
  is '����';
comment on column AVS.CLERK.sex
  is '�Ա�0���У�1��Ů��';
comment on column AVS.CLERK.phonenumber
  is '�ֻ�����';
comment on column AVS.CLERK.address
  is '��ַ';
comment on column AVS.CLERK.create_by
  is '������';
comment on column AVS.CLERK.create_date
  is '��������';
comment on column AVS.CLERK.last_update_date
  is '����޸�����';
comment on column AVS.CLERK.last_update_by
  is '����޸���';
comment on column AVS.CLERK.locked
  is '״̬';
comment on column AVS.CLERK.deleted
  is '�߼�ɾ��';
comment on column AVS.CLERK.remark
  is '��ע';
comment on column AVS.CLERK.login_status
  is '����״̬(0:δ���룬1���ѵ���)';
comment on column AVS.CLERK.last_heartbeat_date
  is '�������ʱ��';
alter table AVS.CLERK
  add constraint PK_CLERK primary key (CLERK_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUSTOMER
prompt =======================
prompt
create table AVS.CUSTOMER
(
  customer_no           NUMBER(8) not null,
  customer_name         VARCHAR2(10) not null,
  customer_rank         NUMBER(1),
  customer_rank_name    VARCHAR2(10),
  customer_sex          NUMBER(1) not null,
  customer_birthday     TIMESTAMP(3),
  customer_phone        NUMBER(13),
  customer_address      VARCHAR2(50),
  customer_remark       VARCHAR2(100),
  customer_mobile_phone NUMBER(13)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table AVS.CUSTOMER
  is '�ͻ���';
comment on column AVS.CUSTOMER.customer_no
  is '�ͻ����';
comment on column AVS.CUSTOMER.customer_name
  is '�ͻ�����';
comment on column AVS.CUSTOMER.customer_rank
  is '�ͻ��ȼ�';
comment on column AVS.CUSTOMER.customer_rank_name
  is '�ͻ��ȼ�����';
comment on column AVS.CUSTOMER.customer_sex
  is '�ͻ��Ա�0���У�1��Ů��';
comment on column AVS.CUSTOMER.customer_birthday
  is '�ͻ�����';
comment on column AVS.CUSTOMER.customer_phone
  is '�ͻ��绰';
comment on column AVS.CUSTOMER.customer_address
  is '�ͻ���ַ';
comment on column AVS.CUSTOMER.customer_remark
  is '�ͻ���ע';
comment on column AVS.CUSTOMER.customer_mobile_phone
  is '�ͻ��ֻ�����';
alter table AVS.CUSTOMER
  add constraint PK_CUSTOMER primary key (CUSTOMER_NO)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table CUSTOMER_MEETING_FLOW
prompt ====================================
prompt
create table AVS.CUSTOMER_MEETING_FLOW
(
  meeting_flow_id NUMBER(8) not null,
  customer_no     NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table AVS.CUSTOMER_MEETING_FLOW
  is '�ͻ�������ˮ��';
comment on column AVS.CUSTOMER_MEETING_FLOW.meeting_flow_id
  is '������ˮID';
comment on column AVS.CUSTOMER_MEETING_FLOW.customer_no
  is '�ͻ����';

prompt
prompt Creating table EXPERT_BUSINESS
prompt ==============================
prompt
create table AVS.EXPERT_BUSINESS
(
  clerk_no    NUMBER(8) not null,
  business_id NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table AVS.EXPERT_BUSINESS
  is 'ר�Ҷ�Ӧ��ҵ��';
comment on column AVS.EXPERT_BUSINESS.clerk_no
  is 'ְԱ���';
comment on column AVS.EXPERT_BUSINESS.business_id
  is 'ҵ��id���������ֵ�����أ�';

prompt
prompt Creating table MEETING
prompt ======================
prompt
create table AVS.MEETING
(
  meeting_id          NUMBER(8) not null,
  meeting_no          VARCHAR2(16) not null,
  meeting_subject     VARCHAR2(50) not null,
  module              NUMBER(1) not null,
  meeting_type        NUMBER(1) default 2 not null,
  meeting_pwd         VARCHAR2(32),
  attendee_amount     NUMBER(2) not null,
  host_account        VARCHAR2(30) not null,
  open_type           NUMBER(1) default 0 not null,
  meeting_pattern     NUMBER(1) default 0 not null,
  meeting_description VARCHAR2(100),
  mail_template_local VARCHAR2(10),
  status              NUMBER(1) not null,
  before_hand_time    NUMBER(3),
  host_account_id     NUMBER(8),
  start_time          TIMESTAMP(3),
  end_time            TIMESTAMP(3)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.MEETING
  is '�����';
comment on column AVS.MEETING.meeting_id
  is '����ID������';
comment on column AVS.MEETING.meeting_no
  is '�����';
comment on column AVS.MEETING.meeting_subject
  is '��������';
comment on column AVS.MEETING.module
  is '0��Զ����Ƶ���� 1��Զ����ѵ 2��Զ��Э��';
comment on column AVS.MEETING.meeting_type
  is '0��ԤԼ���� 1����ʱ���� 2���̶����� 3�����ڻ���';
comment on column AVS.MEETING.meeting_pwd
  is '��������';
comment on column AVS.MEETING.attendee_amount
  is '�μ�����';
comment on column AVS.MEETING.host_account
  is '�������˺�';
comment on column AVS.MEETING.open_type
  is '�����Ƿ񹫿�����������������¼ϵͳ�ſɽ������0����������1������';
comment on column AVS.MEETING.meeting_pattern
  is '0��������ģʽ��1������ģʽ��Ĭ��Ϊ0';
comment on column AVS.MEETING.meeting_description
  is '��������';
comment on column AVS.MEETING.mail_template_local
  is 'zh_CN���������ģ�zh_TW���������ģ�en_US��Ӣ�ģ�Ĭ��Ϊzh_CN';
comment on column AVS.MEETING.status
  is '����״̬��0��δ��ʼ��1���ѿ�ʼ��2���ѽ�����3���ѹ��ڣ�';
comment on column AVS.MEETING.before_hand_time
  is '����μ�����ǰ����ʱ��';
comment on column AVS.MEETING.host_account_id
  is '������ID';
alter table AVS.MEETING
  add constraint PK_MEETING primary key (MEETING_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table MEETING_FILES
prompt ============================
prompt
create table AVS.MEETING_FILES
(
  file_id          NUMBER(8) not null,
  file_name        VARCHAR2(100) not null,
  file_type        NUMBER(1) not null,
  file_suffix      VARCHAR2(10) not null,
  file_size        NUMBER(8) not null,
  file_path_url    VARCHAR2(200) not null,
  file_upload_time TIMESTAMP(3),
  meeting_id       NUMBER(8),
  create_by        NUMBER(8) not null,
  last_update_date TIMESTAMP(3),
  last_update_by   NUMBER(8),
  file_description VARCHAR2(100)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.MEETING_FILES
  is '�����ļ���';
comment on column AVS.MEETING_FILES.file_id
  is '�ļ�ID';
comment on column AVS.MEETING_FILES.file_name
  is '�ļ�����';
comment on column AVS.MEETING_FILES.file_type
  is '�ļ�����(0��¼���ļ���1�������ļ���2��ͶƱ�ļ���3��ǩ����)';
comment on column AVS.MEETING_FILES.file_suffix
  is '�ļ����ĺ�׺';
comment on column AVS.MEETING_FILES.file_size
  is '�ļ���С';
comment on column AVS.MEETING_FILES.file_path_url
  is '�ļ�·��url';
comment on column AVS.MEETING_FILES.file_upload_time
  is '�ļ��ϴ�ʱ��';
comment on column AVS.MEETING_FILES.meeting_id
  is '��������';
comment on column AVS.MEETING_FILES.create_by
  is '������';
comment on column AVS.MEETING_FILES.last_update_date
  is '�������ʱ��';
comment on column AVS.MEETING_FILES.last_update_by
  is '���������';
comment on column AVS.MEETING_FILES.file_description
  is '�ļ�����';
alter table AVS.MEETING_FILES
  add constraint PK_MEETING_FILES primary key (FILE_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_BEHAVIOR_LOG
prompt ===============================
prompt
create table AVS.SYS_BEHAVIOR_LOG
(
  behavior_id  NUMBER(8) not null,
  session_id   VARCHAR2(32) not null,
  logged_date  TIMESTAMP(3) not null,
  action       VARCHAR2(128),
  data_changed NUMBER(1) not null
)
partition by range (LOGGED_DATE)
(
  partition P1 values less than (TIMESTAMP' 2017-12-31 23:59:59.999000000')
    tablespace AVS_DATA
    pctfree 10
    initrans 1
    maxtrans 255
    storage
    (
      initial 64K
      next 1M
      minextents 1
      maxextents unlimited
    )
);
alter table AVS.SYS_BEHAVIOR_LOG
  add constraint PK_SYS_BEHAVIOR_LOG primary key (BEHAVIOR_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_DATA_LOG
prompt ===========================
prompt
create table AVS.SYS_DATA_LOG
(
  behavior_id NUMBER(8) not null,
  logged_date TIMESTAMP(3) not null,
  table_name  VARCHAR2(32) not null,
  column_name VARCHAR2(32) not null,
  key_value   NUMBER(8) not null,
  old_value   VARCHAR2(512),
  new_value   VARCHAR2(512)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_DIC
prompt ======================
prompt
create table AVS.SYS_DIC
(
  dic_id            NUMBER(8) not null,
  dic_name          VARCHAR2(64) not null,
  dic_key           VARCHAR2(32) not null,
  dic_value         VARCHAR2(128) not null,
  dic_type          VARCHAR2(32) not null,
  dic_symbol        VARCHAR2(128),
  created_by        NUMBER(8) not null,
  created_date      TIMESTAMP(3) not null,
  last_updated_by   NUMBER(8) not null,
  last_updated_date TIMESTAMP(3) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_DIC
  add constraint PK_SYS_DIC primary key (DIC_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_FUN
prompt ======================
prompt
create table AVS.SYS_FUN
(
  fun_id            NUMBER(8) not null,
  fun_name          VARCHAR2(64) not null,
  parent_id         NUMBER(8) not null,
  sort_num          NUMBER(3) not null,
  level_num         NUMBER(1) not null,
  deleted           NUMBER(1) not null,
  created_by        NUMBER(8),
  created_date      TIMESTAMP(3),
  last_updated_by   NUMBER(8),
  last_updated_date TIMESTAMP(3)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_FUN
  add constraint PK_SYS_FUN primary key (FUN_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_FUN_URL
prompt ==========================
prompt
create table AVS.SYS_FUN_URL
(
  fun_id NUMBER(8) not null,
  url_id NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_LOGIN_LOG
prompt ============================
prompt
create table AVS.SYS_LOGIN_LOG
(
  session_id     VARCHAR2(32) not null,
  user_id        NUMBER(8) not null,
  username       VARCHAR2(32) not null,
  real_name      VARCHAR2(32) not null,
  ip             VARCHAR2(16) not null,
  org_id         NUMBER(8) not null,
  org_name       VARCHAR2(64) not null,
  inherited_name VARCHAR2(512) not null,
  login_date     TIMESTAMP(3) not null,
  logout_date    TIMESTAMP(3),
  os             VARCHAR2(32),
  browser        VARCHAR2(32),
  user_agent     VARCHAR2(256)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_LOGIN_LOG
  add constraint SYS_LOGIN_LOG primary key (SESSION_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_MENU
prompt =======================
prompt
create table AVS.SYS_MENU
(
  menu_id           NUMBER(8) not null,
  menu_name         VARCHAR2(64) not null,
  menu_url          VARCHAR2(64),
  icon              VARCHAR2(16),
  parent_id         NUMBER(8) not null,
  fun_id            NUMBER(8) not null,
  sort_num          NUMBER(3) not null,
  level_num         NUMBER(1) not null,
  deleted           NUMBER(1) not null,
  created_by        NUMBER(8),
  created_date      TIMESTAMP(3),
  last_updated_by   NUMBER(8),
  last_updated_date TIMESTAMP(3)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_MENU
  add constraint PK_SYS_MENU primary key (MENU_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ORG
prompt ======================
prompt
create table AVS.SYS_ORG
(
  org_id            NUMBER(8) not null,
  org_code          VARCHAR2(16) not null,
  org_name          VARCHAR2(64) not null,
  parent_id         NUMBER(8) not null,
  inherited_id      VARCHAR2(128) not null,
  inherited_name    VARCHAR2(512) not null,
  sort_num          NUMBER(4) not null,
  level_num         NUMBER(2) not null,
  tel               VARCHAR2(16),
  address           VARCHAR2(128),
  remark            VARCHAR2(128),
  deleted           NUMBER(1) not null,
  created_by        NUMBER(8) not null,
  created_date      TIMESTAMP(3) not null,
  last_updated_by   NUMBER(8) not null,
  last_updated_date TIMESTAMP(3) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_ORG
  add constraint PK_SYS_ORG primary key (ORG_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE
prompt =======================
prompt
create table AVS.SYS_ROLE
(
  role_id           NUMBER(8) not null,
  role_name         VARCHAR2(64) not null,
  role_type         NUMBER(1) not null,
  org_id            NUMBER(8),
  remark            VARCHAR2(128),
  deleted           NUMBER(1) not null,
  created_by        NUMBER(8) not null,
  created_date      TIMESTAMP(3) not null,
  last_updated_by   NUMBER(8) not null,
  last_updated_date TIMESTAMP(3) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_ROLE
  add constraint PK_SYS_ROLE primary key (ROLE_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_ROLE
  add constraint UK_SYS_ROLE unique (ROLE_NAME, ORG_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE_FUN
prompt ===========================
prompt
create table AVS.SYS_ROLE_FUN
(
  role_id NUMBER(8) not null,
  fun_id  NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_ROLE_USER
prompt ============================
prompt
create table AVS.SYS_ROLE_USER
(
  role_id NUMBER(8) not null,
  user_id NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_URL
prompt ======================
prompt
create table AVS.SYS_URL
(
  url_id              NUMBER(8) not null,
  url_name            VARCHAR2(64),
  url_pattern         VARCHAR2(64) not null,
  http_method         VARCHAR2(8) not null,
  action_code         VARCHAR2(32),
  args_code           VARCHAR2(64),
  logged_data_changed NUMBER(1) not null,
  created_by          NUMBER(8),
  created_date        TIMESTAMP(3),
  last_updated_by     NUMBER(8),
  last_updated_date   TIMESTAMP(3)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_URL
  add constraint PK_SYS_URL primary key (URL_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table SYS_USER
prompt =======================
prompt
create table AVS.SYS_USER
(
  user_id           NUMBER(8) not null,
  username          VARCHAR2(32) not null,
  real_name         VARCHAR2(64) not null,
  pwd               CHAR(32) not null,
  org_id            NUMBER(8) not null,
  locked            NUMBER(1) not null,
  error_time        NUMBER(2),
  age               NUMBER(3),
  birthday          TIMESTAMP(3),
  phone             VARCHAR2(16),
  mobile            VARCHAR2(16),
  email             VARCHAR2(64),
  address           VARCHAR2(128),
  remark            VARCHAR2(128),
  user_pic_data     BLOB,
  user_pic_suffix   VARCHAR2(16),
  about             CLOB,
  last_login_date   TIMESTAMP(3),
  last_login_ip     VARCHAR2(16),
  deleted           NUMBER(1) not null,
  created_by        NUMBER(8) not null,
  created_date      TIMESTAMP(3) not null,
  last_updated_by   NUMBER(8) not null,
  last_updated_date TIMESTAMP(3) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_USER
  add constraint PK_SYS_USER primary key (USER_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
alter table AVS.SYS_USER
  add constraint UK_SYS_USER unique (USERNAME)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TML_DEVICE
prompt =========================
prompt
create table AVS.TML_DEVICE
(
  device_id           NUMBER(8) not null,
  device_no           VARCHAR2(32) not null,
  device_name         VARCHAR2(64) not null,
  device_ip           VARCHAR2(32),
  device_port         NUMBER(5),
  device_mac          VARCHAR2(32) not null,
  supplier_id         NUMBER(2),
  device_type_id      NUMBER(2),
  org_id              NUMBER(8) not null,
  device_content      VARCHAR2(128),
  created_by          NUMBER(8) not null,
  created_date        TIMESTAMP(3) not null,
  last_updated_by     NUMBER(8) not null,
  last_updated_date   TIMESTAMP(3),
  is_online           NUMBER(1),
  clerk_id            NUMBER(8),
  volume              NUMBER(8),
  last_heartbeat_date TIMESTAMP(3),
  device_command_id   NUMBER(8)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 8K
    minextents 1
    maxextents unlimited
  );
comment on table AVS.TML_DEVICE
  is '�豸��';
comment on column AVS.TML_DEVICE.device_id
  is '����������';
comment on column AVS.TML_DEVICE.device_no
  is '�豸��';
comment on column AVS.TML_DEVICE.device_name
  is '�豸����';
comment on column AVS.TML_DEVICE.device_ip
  is '�豸ip';
comment on column AVS.TML_DEVICE.device_port
  is '�豸�˿�';
comment on column AVS.TML_DEVICE.device_mac
  is '�豸MAC��ַ';
comment on column AVS.TML_DEVICE.supplier_id
  is '��Ӧ��';
comment on column AVS.TML_DEVICE.device_type_id
  is '�豸����id';
comment on column AVS.TML_DEVICE.org_id
  is '����id';
comment on column AVS.TML_DEVICE.device_content
  is '�豸����';
comment on column AVS.TML_DEVICE.created_by
  is '������';
comment on column AVS.TML_DEVICE.created_date
  is '��������';
comment on column AVS.TML_DEVICE.last_updated_by
  is '��������';
comment on column AVS.TML_DEVICE.last_updated_date
  is '����������';
comment on column AVS.TML_DEVICE.is_online
  is '�豸���� 0-�����ߣ�1-����';
comment on column AVS.TML_DEVICE.clerk_id
  is 'ְԱID';
comment on column AVS.TML_DEVICE.volume
  is '����';
comment on column AVS.TML_DEVICE.last_heartbeat_date
  is '�������ʱ��';
comment on column AVS.TML_DEVICE.device_command_id
  is 'ָ��';
alter table AVS.TML_DEVICE
  add constraint PK_TML_DEVICE primary key (DEVICE_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating table TML_DEVICE_CLERK
prompt ===============================
prompt
create table AVS.TML_DEVICE_CLERK
(
  device_id NUMBER(8) not null,
  clerk_id  NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.TML_DEVICE_CLERK
  is '�豸ְԱ������';
comment on column AVS.TML_DEVICE_CLERK.device_id
  is '�豸id';
comment on column AVS.TML_DEVICE_CLERK.clerk_id
  is 'ְԱid';

prompt
prompt Creating table TML_DEVICE_COMMAND
prompt =================================
prompt
create table AVS.TML_DEVICE_COMMAND
(
  device_command_id NUMBER(8) not null,
  device_id         NUMBER(8),
  command_id        NUMBER(8),
  command_result    NUMBER(1),
  created_by        NUMBER(8),
  created_date      TIMESTAMP(3),
  last_updated_date TIMESTAMP(3),
  file_name         VARCHAR2(32),
  device_mac        VARCHAR2(32),
  state             NUMBER(1),
  meeting_id        NUMBER(8),
  volume_value      NUMBER(8)
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );
comment on table AVS.TML_DEVICE_COMMAND
  is '�豸����ָ���';
comment on column AVS.TML_DEVICE_COMMAND.device_command_id
  is '������������';
comment on column AVS.TML_DEVICE_COMMAND.device_id
  is '�豸id';
comment on column AVS.TML_DEVICE_COMMAND.command_id
  is 'ָ��id';
comment on column AVS.TML_DEVICE_COMMAND.command_result
  is 'ִ�еĽ��';
comment on column AVS.TML_DEVICE_COMMAND.created_by
  is '������';
comment on column AVS.TML_DEVICE_COMMAND.created_date
  is '��������';
comment on column AVS.TML_DEVICE_COMMAND.last_updated_date
  is '����������';
comment on column AVS.TML_DEVICE_COMMAND.file_name
  is '�ļ�ID';
comment on column AVS.TML_DEVICE_COMMAND.device_mac
  is '�豸mac';
comment on column AVS.TML_DEVICE_COMMAND.state
  is '1-�·��У�2-�·��ɹ���3-�·�ʧ�ܣ�4-ִ�гɹ���5-ִ��ʧ��';
comment on column AVS.TML_DEVICE_COMMAND.meeting_id
  is '����id';
comment on column AVS.TML_DEVICE_COMMAND.volume_value
  is '����ֵ';
alter table AVS.TML_DEVICE_COMMAND
  add constraint PK_TML_DEVICE_COMMAND_ID primary key (DEVICE_COMMAND_ID)
  using index 
  tablespace AVS_INDEX
  pctfree 10
  initrans 2
  maxtrans 255
  storage
  (
    initial 64K
    next 1M
    minextents 1
    maxextents unlimited
  );

prompt
prompt Creating sequence SEQ_CLERK
prompt ===========================
prompt
create sequence AVS.SEQ_CLERK
minvalue 1
maxvalue 9999999999999999999999999999
start with 221
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MEETING
prompt =============================
prompt
create sequence AVS.SEQ_MEETING
minvalue 1
maxvalue 99999999
start with 527
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_MEETING_FILES
prompt ===================================
prompt
create sequence AVS.SEQ_MEETING_FILES
minvalue 1
maxvalue 99999999
start with 301
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_BEHAVIOR_LOG
prompt ======================================
prompt
create sequence AVS.SEQ_SYS_BEHAVIOR_LOG
minvalue 1
maxvalue 9999999999999999999999999999
start with 41801
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_DIC
prompt =============================
prompt
create sequence AVS.SEQ_SYS_DIC
minvalue 1
maxvalue 99999999
start with 1046
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
start with 180
increment by 1
cache 20;

prompt
prompt Creating sequence SEQ_SYS_URL
prompt =============================
prompt
create sequence AVS.SEQ_SYS_URL
minvalue 1
maxvalue 99999999
start with 628
increment by 1
cache 2;

prompt
prompt Creating sequence SEQ_SYS_USER
prompt ==============================
prompt
create sequence AVS.SEQ_SYS_USER
minvalue 1
maxvalue 99999999
start with 1820
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
prompt Creating sequence SEQ_TML_DEVICE_TASK
prompt =====================================
prompt
create sequence AVS.SEQ_TML_DEVICE_TASK
minvalue 1
maxvalue 9999999999999999999999999999
start with 461
increment by 1
cache 20;

prompt
prompt Creating type TYPE_SPLIT
prompt ========================
prompt
CREATE OR REPLACE TYPE AVS.type_split AS TABLE OF VARCHAR2 (4000)
/

prompt
prompt Creating function GET_CLERK_NAME
prompt ================================
prompt
CREATE OR REPLACE FUNCTION AVS.GET_CLERK_NAME(P_CLERK_ID IN NUMBER) RETURN VARCHAR2 IS
  V_CLERK_NAME VARCHAR2(64);
BEGIN

  SELECT CLERK_NAME INTO V_CLERK_NAME FROM CLERK WHERE CLERK_ID = P_CLERK_ID;

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
prompt Creating function GET_STRARRAYSTROFINDEX
prompt ========================================
prompt
create or replace function avs.Get_StrArrayStrOfIndex
(
  av_str varchar2,  --Ҫ�ָ���ַ���
  av_split varchar2,  --�ָ�����
  av_index number --ȡ�ڼ���Ԫ��
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
prompt Creating type body TYPE_SPLIT
prompt =============================
prompt
create or replace type body avs.type_split  is
  
  -- Member procedures and functions
  member procedure <ProcedureName>(<Parameter> <Datatype>) is
  begin
    <Statements>;
  end;
  
end;
/


spool off
