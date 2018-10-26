-------------------------------------------------------
-- Export file for user AVS@172.16.210.179:1521/ORCL --
-- Created by Administrator on 2017/7/13, 9:48:40 -----
-------------------------------------------------------

set define off
spool table.log

prompt
prompt Creating table APPOINTMENT_MEETING
prompt ==================================
prompt
create table APPOINTMENT_MEETING
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
comment on table APPOINTMENT_MEETING
  is '预约会议信息';
comment on column APPOINTMENT_MEETING.meeting_id
  is '会议ID';
comment on column APPOINTMENT_MEETING.meeting_subject
  is '会议主题';
comment on column APPOINTMENT_MEETING.appointment_pwd
  is '预约密码';
comment on column APPOINTMENT_MEETING.start_time
  is '预约的开始时间';
comment on column APPOINTMENT_MEETING.end_time
  is '预约的结束时间';

prompt
prompt Creating table ATTENDENCE_LIST
prompt ==============================
prompt
create table ATTENDENCE_LIST
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
comment on table ATTENDENCE_LIST
  is '参加者列表';
comment on column ATTENDENCE_LIST.meeting_id
  is '会议ID';
comment on column ATTENDENCE_LIST.clerk_id
  is '职员ID';
comment on column ATTENDENCE_LIST.is_invited
  is '是否被邀请（0：被邀请，1：未被邀请）';
comment on column ATTENDENCE_LIST.evalution
  is '1：一星，2：二星，3：三星，4：四星，5：五星';
comment on column ATTENDENCE_LIST.description
  is '评语';
comment on column ATTENDENCE_LIST.is_evaluted
  is '是否被评价（0：被评价，1：未被评价）';
comment on column ATTENDENCE_LIST.is_attended
  is '是否参加会议（0：参加了会议，1：未参加会议）';

prompt
prompt Creating table ATTEND_TIME_DETAIL
prompt =================================
prompt
create table ATTEND_TIME_DETAIL
(
  clerk_id   NUMBER(8) not null,
  join_time  TIMESTAMP(3),
  leave_time TIMESTAMP(3),
  meeting_id NUMBER(8),
  time_diff  NUMBER(8),
  device_id  NUMBER(8)
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
comment on table ATTEND_TIME_DETAIL
  is '参与时间明细表';
comment on column ATTEND_TIME_DETAIL.clerk_id
  is '职员ID';
comment on column ATTEND_TIME_DETAIL.join_time
  is '加入会议时间';
comment on column ATTEND_TIME_DETAIL.leave_time
  is '退出会议时间';
comment on column ATTEND_TIME_DETAIL.meeting_id
  is '会议ID';
comment on column ATTEND_TIME_DETAIL.time_diff
  is '时间差（分钟）';
comment on column ATTEND_TIME_DETAIL.device_id
  is '设备ID';

prompt
prompt Creating table CLERK
prompt ====================
prompt
create table CLERK
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
comment on table CLERK
  is '职员表';
comment on column CLERK.clerk_id
  is '职员id';
comment on column CLERK.clerk_no
  is '职员编号';
comment on column CLERK.clerk_type
  is '0：专家；1：普通员工';
comment on column CLERK.org_id
  is '机构ID';
comment on column CLERK.clerk_name
  is '职员姓名';
comment on column CLERK.clerk_pwd
  is '职员密码';
comment on column CLERK.email
  is '邮箱';
comment on column CLERK.sex
  is '性别（0：男，1：女）';
comment on column CLERK.phonenumber
  is '手机号码';
comment on column CLERK.address
  is '地址';
comment on column CLERK.create_by
  is '创建人';
comment on column CLERK.create_date
  is '创建日期';
comment on column CLERK.last_update_date
  is '最近修改日期';
comment on column CLERK.last_update_by
  is '最近修改人';
comment on column CLERK.locked
  is '状态';
comment on column CLERK.deleted
  is '逻辑删除';
comment on column CLERK.remark
  is '备注';
comment on column CLERK.login_status
  is '登入状态(0:未登入，1：已登入)';
comment on column CLERK.last_heartbeat_date
  is '最后心跳时间';
alter table CLERK
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
create table CUSTOMER
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
comment on table CUSTOMER
  is '客户表';
comment on column CUSTOMER.customer_no
  is '客户编号';
comment on column CUSTOMER.customer_name
  is '客户名称';
comment on column CUSTOMER.customer_rank
  is '客户等级';
comment on column CUSTOMER.customer_rank_name
  is '客户等级名称';
comment on column CUSTOMER.customer_sex
  is '客户性别（0：男，1：女）';
comment on column CUSTOMER.customer_birthday
  is '客户生日';
comment on column CUSTOMER.customer_phone
  is '客户电话';
comment on column CUSTOMER.customer_address
  is '客户地址';
comment on column CUSTOMER.customer_remark
  is '客户备注';
comment on column CUSTOMER.customer_mobile_phone
  is '客户手机号码';
alter table CUSTOMER
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
create table CUSTOMER_MEETING_FLOW
(
  meeting_flow_id NUMBER(8) not null,
  customer_no     NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table CUSTOMER_MEETING_FLOW
  is '客户会议流水表';
comment on column CUSTOMER_MEETING_FLOW.meeting_flow_id
  is '会议流水ID';
comment on column CUSTOMER_MEETING_FLOW.customer_no
  is '客户编号';

prompt
prompt Creating table EXPERT_BUSINESS
prompt ==============================
prompt
create table EXPERT_BUSINESS
(
  clerk_no    NUMBER(8) not null,
  business_id NUMBER(8) not null
)
tablespace AVS_DATA
  pctfree 10
  initrans 1
  maxtrans 255;
comment on table EXPERT_BUSINESS
  is '专家对应的业务';
comment on column EXPERT_BUSINESS.clerk_no
  is '职员编号';
comment on column EXPERT_BUSINESS.business_id
  is '业务id（在数据字典里记载）';

prompt
prompt Creating table MEETING
prompt ======================
prompt
create table MEETING
(
  meeting_id          NUMBER(8) not null,
  meeting_no          NUMBER(8) not null,
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
comment on table MEETING
  is '会议表';
comment on column MEETING.meeting_id
  is '会议ID，主键';
comment on column MEETING.meeting_no
  is '会议号';
comment on column MEETING.meeting_subject
  is '会议主题';
comment on column MEETING.module
  is '0：远程视频会议 1：远程培训 2：远程协助';
comment on column MEETING.meeting_type
  is '0：预约会议 1：即时会议 2：固定会议 3：周期会议';
comment on column MEETING.meeting_pwd
  is '会议密码';
comment on column MEETING.attendee_amount
  is '参加人数';
comment on column MEETING.host_account
  is '主持人账号';
comment on column MEETING.open_type
  is '会议是否公开，不公开代表必须登录系统才可进入会议0：不公开；1：公开';
comment on column MEETING.meeting_pattern
  is '0：主持人模式，1：自由模式，默认为0';
comment on column MEETING.meeting_description
  is '会议描述';
comment on column MEETING.mail_template_local
  is 'zh_CN：简体中文；zh_TW：繁体中文；en_US：英文，默认为zh_CN';
comment on column MEETING.status
  is '会议状态（0：未开始；1：已开始；2：已结束；3：已过期）';
comment on column MEETING.before_hand_time
  is '允许参加者提前进入时间';
comment on column MEETING.host_account_id
  is '主持人ID';
alter table MEETING
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
create table MEETING_FILES
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
comment on table MEETING_FILES
  is '会议文件表';
comment on column MEETING_FILES.file_id
  is '文件ID';
comment on column MEETING_FILES.file_name
  is '文件名称';
comment on column MEETING_FILES.file_type
  is '文件类型(0：录像文件，1：共享文件，2：投票文件，3：签到表)';
comment on column MEETING_FILES.file_suffix
  is '文件名的后缀';
comment on column MEETING_FILES.file_size
  is '文件大小';
comment on column MEETING_FILES.file_path_url
  is '文件路径url';
comment on column MEETING_FILES.file_upload_time
  is '文件上传时间';
comment on column MEETING_FILES.meeting_id
  is '所属会议';
comment on column MEETING_FILES.create_by
  is '创建人';
comment on column MEETING_FILES.last_update_date
  is '最近更新时间';
comment on column MEETING_FILES.last_update_by
  is '最近更新人';
comment on column MEETING_FILES.file_description
  is '文件描述';
alter table MEETING_FILES
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
prompt Creating table MEETING_FLOW
prompt ===========================
prompt
create table AVS.MEETING_FLOW
(
  meeting_flow_id NUMBER(8) not null,
  meeting_id      NUMBER(8) not null,
  start_time      TIMESTAMP(3),
  end_time        TIMESTAMP(3)
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
comment on table AVS.MEETING_FLOW
  is '������ˮ��';
comment on column AVS.MEETING_FLOW.meeting_flow_id
  is '������ˮid';
comment on column AVS.MEETING_FLOW.meeting_id
  is '����id';
comment on column AVS.MEETING_FLOW.start_time
  is '��ʼʱ��';
comment on column AVS.MEETING_FLOW.end_time
  is '����ʱ��';
alter table AVS.MEETING_FLOW
  add constraint PK_MEETING_FLOW primary key (MEETING_FLOW_ID)
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
create table TML_DEVICE
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
comment on table TML_DEVICE
  is '设备表';
comment on column TML_DEVICE.device_id
  is '主键，自增';
comment on column TML_DEVICE.device_no
  is '设备号';
comment on column TML_DEVICE.device_name
  is '设备名称';
comment on column TML_DEVICE.device_ip
  is '设备ip';
comment on column TML_DEVICE.device_port
  is '设备端口';
comment on column TML_DEVICE.device_mac
  is '设备MAC地址';
comment on column TML_DEVICE.supplier_id
  is '供应商';
comment on column TML_DEVICE.device_type_id
  is '设备类型id';
comment on column TML_DEVICE.org_id
  is '机构id';
comment on column TML_DEVICE.device_content
  is '设备描述';
comment on column TML_DEVICE.created_by
  is '创建者';
comment on column TML_DEVICE.created_date
  is '创建日期';
comment on column TML_DEVICE.last_updated_by
  is '最后更改人';
comment on column TML_DEVICE.last_updated_date
  is '最后更改日期';
comment on column TML_DEVICE.is_online
  is '设备在线 0-不在线，1-在线';
comment on column TML_DEVICE.clerk_id
  is '职员ID';
comment on column TML_DEVICE.volume
  is '音量';
comment on column TML_DEVICE.last_heartbeat_date
  is '最后心跳时间';
comment on column TML_DEVICE.device_command_id
  is '指令';
alter table TML_DEVICE
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
create table TML_DEVICE_CLERK
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
comment on table TML_DEVICE_CLERK
  is '设备职员关联表';
comment on column TML_DEVICE_CLERK.device_id
  is '设备id';
comment on column TML_DEVICE_CLERK.clerk_id
  is '职员id';


prompt 创建设备组表
prompt Creating table TML_DEVICE_GROUP
prompt ===============================
prompt  
create table TML_DEVICE_GROUP
(
  device_group_id   number(8) not null,
  group_name        varchar2(64) not null,
  remark            varchar2(1000),
  org_id            number(16) not null,
  created_by        number(8) not null,
  created_date      timestamp(3) not null,
  last_updated_by   number(8) not null,
  last_updated_date timestamp(3) not null
)
;
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


prompt 创建设备组详情表
prompt Creating table TML_DEVICE_GROUP_DETAIL
prompt ===============================
prompt 
create table TML_DEVICE_GROUP_DETAIL
(
  rel_id          NUMBER(8) not null,
  device_group_id NUMBER(8) not null,
  device_id       NUMBER(8) not null
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
-- Create/Recreate primary, unique and foreign key constraints 
alter table TML_DEVICE_GROUP_DETAIL
  add constraint PK_TML_DEVICE_GROUP_DETAIL primary key (REL_ID)
  using index 
  tablespace AVS_DATA
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
prompt Creating table TML_DEVICE_COMMAND
prompt =================================
prompt
create table TML_DEVICE_COMMAND
(
  device_command_id NUMBER(8) not null,
  device_id         NUMBER(8),
  command_id        NUMBER(8),
  command_result    NUMBER(1),
  created_by        NUMBER(8),
  created_date      TIMESTAMP(3),
  last_updated_date TIMESTAMP(3),
  file_id           NUMBER(8),
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
comment on table TML_DEVICE_COMMAND
  is '设备操作指令表';
comment on column TML_DEVICE_COMMAND.device_command_id
  is '主键，自增长';
comment on column TML_DEVICE_COMMAND.device_id
  is '设备id';
comment on column TML_DEVICE_COMMAND.command_id
  is '指令id';
comment on column TML_DEVICE_COMMAND.command_result
  is '执行的结果';
comment on column TML_DEVICE_COMMAND.created_by
  is '操作人';
comment on column TML_DEVICE_COMMAND.created_date
  is '创建日期';
comment on column TML_DEVICE_COMMAND.last_updated_date
  is '最后更改日期';
comment on column TML_DEVICE_COMMAND.file_id
  is '文件ID';
comment on column TML_DEVICE_COMMAND.device_mac
  is '设备mac';
comment on column TML_DEVICE_COMMAND.state
  is '1-下发中，2-下发成功，3-下发失败，4-执行成功，5-执行失败';
comment on column TML_DEVICE_COMMAND.meeting_id
  is '会议id';
comment on column TML_DEVICE_COMMAND.volume_value
  is '音量值';
alter table TML_DEVICE_COMMAND
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

spool off
