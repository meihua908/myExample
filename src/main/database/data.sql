prompt PL/SQL Developer import file
set feedback off
set define off
prompt Loading SYS_DIC...
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1007, '成员角色', '1', '普通职员', 'clerkTypes', null, -1, to_timestamp('05-06-2017 17:15:13.751', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('07-08-2017 16:28:31.090', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1, '公司名', 'AOTO', '奥拓电子', 'COM', null, -1, to_timestamp('24-02-2016 14:44:40.891', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('12-05-2016 15:16:11.132', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (2, '公司名', 'SUNING', '苏宁', 'COM', null, -1, to_timestamp('24-02-2016 14:44:40.891', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('12-05-2016 15:16:11.132', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1000, '设备类型', '1', 'X86广告机', 'deviceTypes', null, -1, to_timestamp('31-05-2017 16:40:41.453', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 16:40:41.453', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1001, '设备类型', '2', 'Android广告机', 'deviceTypes', null, -1, to_timestamp('31-05-2017 16:40:41.453', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 16:40:41.453', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1002, '供应商', '1', '奥拓电子', 'suppliers', null, -1, to_timestamp('31-05-2017 16:58:23.974', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('18-07-2017 11:47:24.081', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1027, '允许提前', '0', '0分钟', 'beforeHandTime', '安排会议时允许提前进入会议的时间', -1, to_timestamp('08-08-2017 15:04:05.371', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-08-2017 15:14:50.416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1028, '允许提前', '15', '15分钟', 'beforeHandTime', null, -1, to_timestamp('08-08-2017 15:04:05.371', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-08-2017 15:14:50.416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1029, '允许提前', '30', '30分钟', 'beforeHandTime', null, -1, to_timestamp('08-08-2017 15:04:05.371', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-08-2017 15:14:50.416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1030, '允许提前', '45', '45分钟', 'beforeHandTime', null, -1, to_timestamp('08-08-2017 15:04:05.371', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-08-2017 15:14:50.416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1031, '允许提前', '60', '60分钟', 'beforeHandTime', null, -1, to_timestamp('08-08-2017 15:04:05.371', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-08-2017 15:14:50.416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1039, '查询会议状态', '0', '未开始', 'selectMeetingStatus', null, -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1040, '查询会议状态', '1', '已开始', 'selectMeetingStatus', null, -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1041, '查询会议状态', '2', '已结束', 'selectMeetingStatus', null, -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1042, '查询会议状态', '3', '已过期', 'selectMeetingStatus', null, -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1043, '查询会议状态', '4', '全部', 'selectMeetingStatus', null, -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('30-08-2017 10:56:30.250', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1015, '会议类型', '0', '请选择', 'meetingTypes', null, -1, to_timestamp('20-06-2017 10:28:22.797', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 10:28:22.797', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1008, '会议状态', '0', '未开始', 'statusName', null, -1, to_timestamp('19-06-2017 10:16:47.099', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('23-08-2017 15:07:13.647', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1009, '会议状态', '1', '已开始', 'statusName', null, -1, to_timestamp('19-06-2017 10:16:47.099', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('23-08-2017 15:07:13.647', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1010, '会议状态', '2', '已结束', 'statusName', null, -1, to_timestamp('19-06-2017 10:16:47.099', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('23-08-2017 15:07:13.647', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1038, '会议状态', '3', '已过期', 'statusName', null, -1, to_timestamp('23-08-2017 15:07:13.647', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('23-08-2017 15:07:13.647', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1004, '性别', '0', '男', 'sexType', null, -1, to_timestamp('05-06-2017 16:06:37.642', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('05-06-2017 16:06:37.642', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1005, '性别', '1', '女', 'sexType', null, -1, to_timestamp('05-06-2017 16:06:37.642', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('05-06-2017 16:06:37.642', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1011, '会议类型', '1', '预约会议', 'meetingTypes', null, -1, to_timestamp('20-06-2017 10:18:54.983', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 10:28:22.797', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1012, '会议类型', '2', '即时会议', 'meetingTypes', null, -1, to_timestamp('20-06-2017 10:18:54.983', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 10:28:22.797', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1013, '会议类型', '3', '固定会议', 'meetingTypes', null, -1, to_timestamp('20-06-2017 10:18:54.983', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 10:28:22.797', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1014, '会议类型', '4', '周期会议', 'meetingTypes', null, -1, to_timestamp('20-06-2017 10:18:54.983', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 10:28:22.797', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1020, '会议文件类型', '0', '录像文件', 'fileTypeName', null, -1, to_timestamp('26-07-2017 17:25:42.288', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('04-08-2017 15:10:21.698', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1026, '成员角色', '0', '专家', 'clerkTypes', null, -1, to_timestamp('07-08-2017 16:28:31.090', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('07-08-2017 16:28:31.090', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1021, '会议文件类型', '1', '共享文件', 'fileTypeName', null, -1, to_timestamp('26-07-2017 17:25:42.288', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('04-08-2017 15:10:21.698', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1035, '查询文件类型', '1', '共享文件', 'selectFileType', null, -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1036, '查询文件类型', '2', '升级包', 'selectFileType', null, -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1024, '会议文件类型', '2', '升级包', 'fileTypeName', null, -1, to_timestamp('04-08-2017 15:10:21.698', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('04-08-2017 15:10:21.698', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1034, '查询文件类型', '0', '录像文件', 'selectFileType', null, -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1037, '查询文件类型', '3', '全部文件', 'selectFileType', null, -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:32:02.367', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1046, '指令状态', '0', '下发中', 'COMMANDSTATE', null, -1, to_timestamp('14-11-2017 10:19:44.295', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-11-2017 11:10:52.395', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1047, '指令状态', '1', '下发成功', 'COMMANDSTATE', null, -1, to_timestamp('14-11-2017 10:19:44.295', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-11-2017 11:10:52.395', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1048, '指令状态', '2', '执行成功', 'COMMANDSTATE', null, -1, to_timestamp('14-11-2017 10:19:44.295', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-11-2017 11:10:52.395', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1049, '指令状态', '3', '执行失败', 'COMMANDSTATE', null, -1, to_timestamp('14-11-2017 10:19:44.295', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-11-2017 11:10:52.395', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (dic_id, dic_name, dic_key, dic_value, dic_type, dic_symbol, created_by, created_date, last_updated_by, last_updated_date)
values (1050, '指令状态', '4', '下发失败', 'COMMANDSTATE', null, -1, to_timestamp('14-11-2017 10:19:44.295', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-11-2017 11:10:52.395', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_DIC (DIC_ID, DIC_NAME, DIC_KEY, DIC_VALUE, DIC_TYPE, DIC_SYMBOL, CREATED_BY, CREATED_DATE, LAST_UPDATED_BY, LAST_UPDATED_DATE, ROWID)
values (1052, '邀请参加者选择类型', '0', '设备', 'selectType', null, -1, '19-DEC-17 02.54.48.315 PM', -1, '19-DEC-17 02.54.48.315 PM', 'AAAS83AAGAAAACjAAk');
insert into SYS_DIC (DIC_ID, DIC_NAME, DIC_KEY, DIC_VALUE, DIC_TYPE, DIC_SYMBOL, CREATED_BY, CREATED_DATE, LAST_UPDATED_BY, LAST_UPDATED_DATE, ROWID)
values (1053, '邀请参加者选择类型', '1', '设备组', 'selectType', null, -1, '19-DEC-17 02.54.48.315 PM', -1, '19-DEC-17 02.54.48.315 PM', 'AAAS83AAGAAAACjAAl');
commit;
prompt Loading SYS_FUN...
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (19, '设备', 1, 4, 2, 0, -1, to_timestamp('31-05-2017 09:03:51.858', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 09:03:51.858', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (209, '职员管理', 2, 4, 3, 0, -1, to_timestamp('03-06-2017 16:56:12.965', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('03-06-2017 16:56:12.965', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20901, '职员查询', 209, 2, 4, 0, -1, to_timestamp('03-06-2017 16:56:47.132', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('03-06-2017 16:56:47.132', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20902, '职员新增', 209, 3, 4, 0, -1, to_timestamp('05-06-2017 16:27:17.733', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('05-06-2017 16:27:17.733', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20905, '职员详情', 209, 6, 4, 0, -1, to_timestamp('08-06-2017 15:23:10.654', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 15:23:10.654', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20910, '职员导入', 209, 11, 4, 0, -1, to_timestamp('09-06-2017 10:47:05.746', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('09-06-2017 10:47:05.746', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (1, '功能', 0, 0, 1, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (2, '系统', 1, 1, 2, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (301, '用户管理', 2, 1, 3, 0, null, null, -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30101, '用户查询', 301, 1, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30102, '用户新增', 301, 2, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30103, '用户编辑', 301, 3, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30104, '用户删除', 301, 4, 4, 0, null, null, -1, to_timestamp('16-03-2016 08:50:22.964', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30105, '重置密码', 301, 5, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30106, '用户详情', 301, 6, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30107, '用户锁定', 301, 7, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30108, '用户解锁', 301, 8, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:32.207', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (302, '功能管理', 2, 2, 3, 0, -1, to_timestamp('24-02-2016 15:51:37.941', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30201, '功能新增', 302, 1, 4, 0, -1, to_timestamp('24-02-2016 15:51:54.952', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:51:54.952', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30202, '功能编辑', 302, 2, 4, 0, -1, to_timestamp('24-02-2016 15:52:02.321', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:52:02.321', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30203, '功能删除', 302, 3, 4, 0, -1, to_timestamp('24-02-2016 15:52:12.439', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:52:12.439', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30204, '功能详情', 302, 4, 4, 0, -1, to_timestamp('24-02-2016 15:52:17.358', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:52:17.358', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30205, '设置URL', 302, 5, 4, 0, -1, to_timestamp('24-02-2016 15:52:26.088', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:52:26.088', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30206, '功能查询', 302, 6, 4, 0, -1, to_timestamp('02-03-2016 08:58:33.339', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('02-03-2016 08:58:33.339', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (303, '菜单管理', 2, 3, 3, 0, -1, to_timestamp('24-02-2016 16:05:10.152', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30301, '菜单新增', 303, 1, 4, 0, -1, to_timestamp('24-02-2016 16:05:21.426', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 16:05:21.426', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30302, '菜单编辑', 303, 2, 4, 0, -1, to_timestamp('24-02-2016 16:05:25.609', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 16:05:25.609', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30303, '菜单删除', 303, 3, 4, 0, -1, to_timestamp('24-02-2016 16:05:30.721', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 16:05:30.721', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30304, '菜单详情', 303, 4, 4, 0, -1, to_timestamp('24-02-2016 16:05:37.489', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 16:05:37.489', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30305, '菜单查询', 303, 5, 4, 0, -1, to_timestamp('24-02-2016 16:06:13.011', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 16:06:13.011', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (304, '角色管理', 2, 4, 3, 0, null, null, -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30401, '角色查询', 304, 1, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30402, '角色新增', 304, 2, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30403, '角色编辑', 304, 3, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30404, '角色删除', 304, 4, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30405, '角色授权', 304, 5, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30406, '设置成员', 304, 6, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (305, '通用角色管理', 2, 5, 3, 0, null, null, -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30501, '通用角色查询', 305, 1, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30502, '设置成员', 305, 2, 4, 0, null, null, null, null);
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (306, '机构管理', 2, 6, 3, 0, null, null, -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30601, '机构查询', 306, 1, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30602, '机构新增', 306, 2, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30603, '机构编辑', 306, 3, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30604, '机构删除', 306, 4, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30605, '机构详情', 306, 5, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30606, '机构导出', 306, 6, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30607, '机构导入', 306, 7, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:55:43.537', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (307, 'URL管理', 2, 7, 3, 0, -1, to_timestamp('24-02-2016 14:01:11.753', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30701, 'URL查询', 307, 1, 4, 0, -1, to_timestamp('24-02-2016 14:04:09.055', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:04:09.055', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30702, 'URL新增', 307, 2, 4, 0, -1, to_timestamp('24-02-2016 14:04:17.194', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:04:17.194', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30703, 'URL编辑', 307, 3, 4, 0, -1, to_timestamp('24-02-2016 14:04:25.241', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:04:25.241', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30704, 'URL删除', 307, 4, 4, 0, -1, to_timestamp('24-02-2016 14:04:31.443', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:04:31.443', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30705, 'URL详情', 307, 5, 4, 0, -1, to_timestamp('24-02-2016 14:05:01.413', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:05:01.413', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (401, '字典管理', 2, 8, 3, 0, null, null, -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (40101, '字典新增', 401, 1, 4, 0, null, null, -1, to_timestamp('24-02-2016 10:30:40.406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (40102, '字典编辑', 401, 2, 4, 0, null, null, -1, to_timestamp('24-02-2016 10:30:40.406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (40103, '字典删除', 401, 3, 4, 0, null, null, -1, to_timestamp('24-02-2016 10:30:40.406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (40104, '字典详情', 401, 4, 4, 0, null, null, -1, to_timestamp('24-02-2016 10:30:40.406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (40105, '字典查询', 401, 5, 4, 0, null, null, -1, to_timestamp('24-02-2016 10:30:40.406', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (501, '日志管理', 2, 9, 3, 0, null, null, -1, to_timestamp('02-03-2016 16:03:19.912', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (50101, '在线用户', 501, 1, 4, 0, null, null, -1, to_timestamp('23-02-2016 16:24:32.690', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (50201, '登录日志', 501, 2, 4, 0, null, null, -1, to_timestamp('23-02-2016 16:24:32.690', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (50301, '用户行为', 501, 3, 4, 0, null, null, -1, to_timestamp('23-02-2016 16:24:32.690', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (190102, '设备新增', 1901, 3, 4, 0, -1, to_timestamp('31-05-2017 14:04:51.307', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 14:04:51.307', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (190103, '设备编辑', 1901, 4, 4, 0, -1, to_timestamp('31-05-2017 14:47:37.835', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 14:47:37.835', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20903, '职员编辑', 209, 4, 4, 0, -1, to_timestamp('07-06-2017 14:57:08.783', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('07-06-2017 14:57:08.783', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (190106, '职员绑定', 1901, 7, 4, 0, -1, to_timestamp('14-06-2017 17:47:59.416', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-06-2017 17:47:59.416', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (21, '会议', 1, 8, 2, 0, -1, to_timestamp('15-06-2017 11:46:08.260', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-06-2017 11:46:08.260', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (300102, '会议报表导出', 3001, 3, 4, 0, -1, to_timestamp('20-06-2017 17:34:42.900', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 17:34:42.900', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (190104, '设备删除', 1901, 5, 4, 0, -1, to_timestamp('31-05-2017 14:48:09.302', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 14:48:09.302', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (30, '报表', 1, 3, 2, 0, -1, to_timestamp('16-06-2017 16:05:19.649', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('16-06-2017 16:05:19.649', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (3001, '会议报表', 30, 2, 3, 0, -1, to_timestamp('16-06-2017 16:05:57.119', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('16-06-2017 16:05:57.119', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (1901, '设备管理', 19, 2, 3, 0, -1, to_timestamp('31-05-2017 09:04:11.139', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 09:04:11.139', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20907, '职员锁定', 209, 8, 4, 0, -1, to_timestamp('08-06-2017 16:59:45.854', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 16:59:45.854', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20908, '职员解锁', 209, 9, 4, 0, -1, to_timestamp('08-06-2017 17:04:44.462', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 17:04:44.462', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (2101, '会议管理', 21, 2, 3, 0, -1, to_timestamp('15-06-2017 11:46:25.937', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-06-2017 11:46:25.937', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (190101, '设备查询', 1901, 2, 4, 0, -1, to_timestamp('31-05-2017 09:06:27.112', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 09:06:27.112', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (190105, '设备详情', 1901, 6, 4, 0, -1, to_timestamp('31-05-2017 14:48:33.651', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 14:48:33.651', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20904, '职员删除', 209, 5, 4, 0, -1, to_timestamp('08-06-2017 14:13:43.788', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 14:13:43.788', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20906, '职员重置密码', 209, 7, 4, 0, -1, to_timestamp('08-06-2017 16:19:06.423', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 16:19:06.423', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (20909, '职员导出', 209, 10, 4, 0, -1, to_timestamp('09-06-2017 10:46:53.313', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('09-06-2017 10:46:53.313', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (210101, '会议列表', 2101, 2, 4, 0, -1, to_timestamp('15-06-2017 11:46:38.589', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-06-2017 11:46:38.589', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_FUN (fun_id, fun_name, parent_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (300101, '会议报表查询', 3001, 2, 4, 0, -1, to_timestamp('16-06-2017 16:06:39.792', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('16-06-2017 16:06:39.792', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt Loading SYS_FUN_URL...
insert into SYS_FUN_URL (fun_id, url_id)
values (190102, 602);
insert into SYS_FUN_URL (fun_id, url_id)
values (190102, 601);
insert into SYS_FUN_URL (fun_id, url_id)
values (190102, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (20905, 609);
insert into SYS_FUN_URL (fun_id, url_id)
values (20910, 614);
insert into SYS_FUN_URL (fun_id, url_id)
values (20910, 615);
insert into SYS_FUN_URL (fun_id, url_id)
values (30101, 1);
insert into SYS_FUN_URL (fun_id, url_id)
values (30102, 2);
insert into SYS_FUN_URL (fun_id, url_id)
values (30102, 3);
insert into SYS_FUN_URL (fun_id, url_id)
values (30103, 4);
insert into SYS_FUN_URL (fun_id, url_id)
values (30103, 5);
insert into SYS_FUN_URL (fun_id, url_id)
values (30104, 6);
insert into SYS_FUN_URL (fun_id, url_id)
values (30106, 7);
insert into SYS_FUN_URL (fun_id, url_id)
values (30105, 8);
insert into SYS_FUN_URL (fun_id, url_id)
values (30107, 9);
insert into SYS_FUN_URL (fun_id, url_id)
values (30108, 10);
insert into SYS_FUN_URL (fun_id, url_id)
values (30206, 31);
insert into SYS_FUN_URL (fun_id, url_id)
values (30201, 32);
insert into SYS_FUN_URL (fun_id, url_id)
values (30201, 33);
insert into SYS_FUN_URL (fun_id, url_id)
values (30202, 34);
insert into SYS_FUN_URL (fun_id, url_id)
values (30202, 35);
insert into SYS_FUN_URL (fun_id, url_id)
values (30203, 36);
insert into SYS_FUN_URL (fun_id, url_id)
values (30204, 37);
insert into SYS_FUN_URL (fun_id, url_id)
values (30205, 38);
insert into SYS_FUN_URL (fun_id, url_id)
values (30205, 39);
insert into SYS_FUN_URL (fun_id, url_id)
values (30205, 40);
insert into SYS_FUN_URL (fun_id, url_id)
values (30205, 41);
insert into SYS_FUN_URL (fun_id, url_id)
values (30305, 61);
insert into SYS_FUN_URL (fun_id, url_id)
values (30301, 62);
insert into SYS_FUN_URL (fun_id, url_id)
values (30301, 63);
insert into SYS_FUN_URL (fun_id, url_id)
values (30302, 64);
insert into SYS_FUN_URL (fun_id, url_id)
values (30302, 65);
insert into SYS_FUN_URL (fun_id, url_id)
values (30302, 66);
insert into SYS_FUN_URL (fun_id, url_id)
values (30303, 67);
insert into SYS_FUN_URL (fun_id, url_id)
values (30304, 68);
insert into SYS_FUN_URL (fun_id, url_id)
values (30401, 91);
insert into SYS_FUN_URL (fun_id, url_id)
values (30402, 92);
insert into SYS_FUN_URL (fun_id, url_id)
values (30402, 93);
insert into SYS_FUN_URL (fun_id, url_id)
values (30403, 94);
insert into SYS_FUN_URL (fun_id, url_id)
values (30403, 95);
insert into SYS_FUN_URL (fun_id, url_id)
values (30404, 96);
insert into SYS_FUN_URL (fun_id, url_id)
values (30405, 97);
insert into SYS_FUN_URL (fun_id, url_id)
values (30405, 98);
insert into SYS_FUN_URL (fun_id, url_id)
values (30405, 99);
insert into SYS_FUN_URL (fun_id, url_id)
values (30406, 100);
insert into SYS_FUN_URL (fun_id, url_id)
values (30406, 101);
insert into SYS_FUN_URL (fun_id, url_id)
values (30406, 102);
insert into SYS_FUN_URL (fun_id, url_id)
values (30406, 103);
insert into SYS_FUN_URL (fun_id, url_id)
values (30501, 121);
insert into SYS_FUN_URL (fun_id, url_id)
values (30502, 122);
insert into SYS_FUN_URL (fun_id, url_id)
values (30502, 123);
insert into SYS_FUN_URL (fun_id, url_id)
values (30101, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30102, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30103, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30401, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30402, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30403, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30406, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30601, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (50201, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (50301, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (30602, 142);
insert into SYS_FUN_URL (fun_id, url_id)
values (30602, 143);
insert into SYS_FUN_URL (fun_id, url_id)
values (30603, 144);
insert into SYS_FUN_URL (fun_id, url_id)
values (30603, 145);
insert into SYS_FUN_URL (fun_id, url_id)
values (30603, 146);
insert into SYS_FUN_URL (fun_id, url_id)
values (30604, 147);
insert into SYS_FUN_URL (fun_id, url_id)
values (30605, 148);
insert into SYS_FUN_URL (fun_id, url_id)
values (30606, 149);
insert into SYS_FUN_URL (fun_id, url_id)
values (30607, 150);
insert into SYS_FUN_URL (fun_id, url_id)
values (30607, 151);
insert into SYS_FUN_URL (fun_id, url_id)
values (30701, 171);
insert into SYS_FUN_URL (fun_id, url_id)
values (30702, 172);
insert into SYS_FUN_URL (fun_id, url_id)
values (30702, 173);
insert into SYS_FUN_URL (fun_id, url_id)
values (30703, 174);
insert into SYS_FUN_URL (fun_id, url_id)
values (30703, 175);
insert into SYS_FUN_URL (fun_id, url_id)
values (30704, 176);
insert into SYS_FUN_URL (fun_id, url_id)
values (30705, 177);
insert into SYS_FUN_URL (fun_id, url_id)
values (40105, 201);
insert into SYS_FUN_URL (fun_id, url_id)
values (40101, 202);
insert into SYS_FUN_URL (fun_id, url_id)
values (40101, 203);
insert into SYS_FUN_URL (fun_id, url_id)
values (40102, 204);
insert into SYS_FUN_URL (fun_id, url_id)
values (40102, 205);
insert into SYS_FUN_URL (fun_id, url_id)
values (40103, 206);
insert into SYS_FUN_URL (fun_id, url_id)
values (40104, 207);
insert into SYS_FUN_URL (fun_id, url_id)
values (40102, 208);
insert into SYS_FUN_URL (fun_id, url_id)
values (40104, 208);
insert into SYS_FUN_URL (fun_id, url_id)
values (50101, 221);
insert into SYS_FUN_URL (fun_id, url_id)
values (50201, 231);
insert into SYS_FUN_URL (fun_id, url_id)
values (50301, 241);
insert into SYS_FUN_URL (fun_id, url_id)
values (20901, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (20907, 611);
insert into SYS_FUN_URL (fun_id, url_id)
values (20901, 603);
insert into SYS_FUN_URL (fun_id, url_id)
values (20903, 607);
insert into SYS_FUN_URL (fun_id, url_id)
values (20903, 606);
insert into SYS_FUN_URL (fun_id, url_id)
values (20903, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (20904, 608);
insert into SYS_FUN_URL (fun_id, url_id)
values (20909, 613);
insert into SYS_FUN_URL (fun_id, url_id)
values (300101, 621);
insert into SYS_FUN_URL (fun_id, url_id)
values (300101, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (300102, 624);
insert into SYS_FUN_URL (fun_id, url_id)
values (50301, 242);
insert into SYS_FUN_URL (fun_id, url_id)
values (30502, 102);
insert into SYS_FUN_URL (fun_id, url_id)
values (30502, 103);
insert into SYS_FUN_URL (fun_id, url_id)
values (190101, 600);
insert into SYS_FUN_URL (fun_id, url_id)
values (190101, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (190106, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (190106, 619);
insert into SYS_FUN_URL (fun_id, url_id)
values (20902, 604);
insert into SYS_FUN_URL (fun_id, url_id)
values (20902, 141);
insert into SYS_FUN_URL (fun_id, url_id)
values (20902, 605);
insert into SYS_FUN_URL (fun_id, url_id)
values (20906, 610);
insert into SYS_FUN_URL (fun_id, url_id)
values (20908, 612);
insert into SYS_FUN_URL (fun_id, url_id)
values (190106, 618);
insert into SYS_FUN_URL (fun_id, url_id)
values (190106, 617);
insert into SYS_FUN_URL (fun_id, url_id)
values (190106, 616);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 624);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 623);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 622);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 621);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 620);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 619);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 618);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 617);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 616);
insert into SYS_FUN_URL (fun_id, url_id)
values (30207, 613);
commit;
prompt Loading SYS_MENU...
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (620, '会议列表', '/meeting/list', 'icon-bar-chart', 618, 0, 1, 3, 0, -1, to_timestamp('07-06-2017 15:17:33.138', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-08-2017 16:28:39.201', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (618, '会议管理', null, 'icon-keyboard', 1, 1, 5, 2, 0, -1, to_timestamp('05-06-2017 14:20:11.168', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-08-2017 16:47:44.716', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (622, '会议文件', '/meetingFile/list', 'icon-upload-alt', 618, 0, 2, 3, 0, -1, to_timestamp('07-06-2017 15:26:43.376', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-08-2017 16:31:32.817', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (1, '菜单', null, null, 0, -1, 1, 1, 0, null, null, null, null);
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (2, '系统', null, 'icon-laptop', 1, 0, 1, 2, 0, null, null, -1, to_timestamp('14-08-2017 14:49:29.118', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (3, '权限管理', null, 'icon-key', 2, 1, 2, 3, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (301, '用户管理', '/system/users/list', 'icon-user', 3, 30101, 1, 4, 0, null, null, -1, to_timestamp('14-03-2016 16:07:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (302, '功能管理', '/system/funs/list', 'icon-cog', 3, 30206, 2, 4, 0, null, null, -1, to_timestamp('14-03-2016 16:07:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (303, '菜单管理', '/system/menus/list', 'icon-list', 3, 30305, 3, 4, 0, null, null, -1, to_timestamp('14-03-2016 16:07:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (304, '角色管理', '/system/roles/list', 'icon-tag', 3, 30401, 4, 4, 0, null, null, -1, to_timestamp('14-03-2016 16:07:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (305, '通用角色管理', '/system/commroles/list', 'icon-tags', 3, 30501, 4, 4, 0, null, null, -1, to_timestamp('11-05-2017 11:26:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (306, '机构管理', '/system/orgs/list', 'icon-sitemap', 3, 30601, 5, 4, 0, null, null, -1, to_timestamp('14-03-2016 16:07:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (307, 'URL管理', '/system/urls/list', 'icon-paper-clip', 3, 30701, 6, 4, 0, null, null, -1, to_timestamp('14-03-2016 16:07:44.940', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (4, '基础配置', null, 'icon-cogs', 2, 0, 3, 3, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (401, '字典管理', '/system/dics/list', 'icon-book', 4, 40105, 1, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (5, '日志管理', null, 'icon-file-alt', 2, 0, 4, 3, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (501, '在线用户', '/system/users/online', 'icon-user-md', 5, 50101, 1, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (502, '登录日志', '/system/logs/login', 'icon-desktop', 5, 50201, 2, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (503, '用户行为', '/system/logs/behavior', 'icon-hand-right', 5, 50301, 3, 4, 0, null, null, -1, to_timestamp('02-03-2016 15:29:03.697', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (606, '设备管理', null, 'icon-info', 1, 1, 3, 2, 0, -1, to_timestamp('26-05-2017 18:02:00.416', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-08-2017 16:33:34.386', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (626, '会议报表', '/form/meetings/list', 'icon-sitemap', 625, 300101, 2, 3, 0, -1, to_timestamp('16-06-2017 09:50:27.338', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:48:56.477', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (608, '设备监控', '/terminal/device/list', 'icon-user-md', 606, 190101, 2, 3, 0, -1, to_timestamp('31-05-2017 08:59:58.433', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:46:31.144', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (625, '报表统计', null, 'icon-key', 1, 0, 4, 2, 0, -1, to_timestamp('16-06-2017 09:44:43.573', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-08-2017 14:49:53.739', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_MENU (menu_id, menu_name, menu_url, icon, parent_id, fun_id, sort_num, level_num, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (612, '账号管理', '/system/clerk/list', 'icon-user', 618, 20901, 3, 3, 0, -1, to_timestamp('03-06-2017 16:55:12.762', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('15-08-2017 16:16:49.632', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt Loading SYS_ORG...
insert into SYS_ORG (org_id, org_code, org_name, parent_id, inherited_id, inherited_name, sort_num, level_num, tel, address, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (1, '1', '总部', 0, '1', '总部', 1, 1, null, null, null, 0, -1, to_timestamp('26-09-2013 00:00:00.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('09-06-2017 09:48:25.546', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt Loading SYS_ROLE...
insert into SYS_ROLE (role_id, role_name, role_type, org_id, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (1, '日志管理员', 1, 1, null, 0, -1, to_timestamp('03-06-2014 15:20:23.334', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('11-06-2014 17:39:52.806', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_ROLE (role_id, role_name, role_type, org_id, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (2, '角色管理员', 1, 1, null, 0, -1, to_timestamp('06-06-2014 15:08:39.197', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-10-2014 09:13:30.895', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_ROLE (role_id, role_name, role_type, org_id, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (3, '系统管理员', 1, 1, null, 0, -1, to_timestamp('12-02-2014 16:33:41.608', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('12-02-2014 16:33:41.608', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_ROLE (role_id, role_name, role_type, org_id, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (4, '用户管理员', 1, 1, null, 0, -1, to_timestamp('09-06-2014 15:36:12.091', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('11-06-2014 17:30:15.891', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_ROLE (role_id, role_name, role_type, org_id, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (5, '机构管理员', 1, 1, null, 0, -1, to_timestamp('09-06-2014 15:36:55.941', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('11-05-2016 13:46:29.864', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_ROLE (role_id, role_name, role_type, org_id, remark, deleted, created_by, created_date, last_updated_by, last_updated_date)
values (102, '通用角色管理员', 1, 1, null, 0, -1, to_timestamp('19-05-2017 14:37:36.911', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('19-05-2017 14:37:36.911', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt Loading SYS_ROLE_FUN...
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 304);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 30401);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 30402);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 30403);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 30404);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 30405);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (2, 30406);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 301);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30101);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30102);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30103);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30104);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30105);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30106);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30107);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30108);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 304);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30401);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30402);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30403);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30404);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30405);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30406);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 306);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30601);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30602);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30603);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30604);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30605);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30606);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 30607);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 401);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 40101);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 40102);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 40103);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 40104);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 40105);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 501);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 50101);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 50201);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (3, 50301);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 301);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30101);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30102);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30103);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30104);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30105);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30106);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30107);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (4, 30108);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (102, 30501);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (102, 30502);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (1, 501);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (1, 50101);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (1, 50201);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (1, 50301);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 306);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30601);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30602);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30603);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30604);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30605);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30606);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (5, 30607);
insert into SYS_ROLE_FUN (role_id, fun_id)
values (102, 305);
commit;
prompt Loading SYS_URL...
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (601, '设备新增', '^/terminal/devices$', 'POST', null, null, 1, -1, to_timestamp('01-06-2017 19:15:39.232', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('01-06-2017 19:15:39.232', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (602, '设备新增表单', '^/terminal/devices/new.*', 'GET', null, null, 0, -1, to_timestamp('01-06-2017 19:16:08.304', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('01-06-2017 19:16:08.304', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (605, '职员新增', '^/system/clerks$', 'POST', null, null, 1, -1, to_timestamp('05-06-2017 16:39:13.119', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('06-06-2017 09:29:39.793', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (607, '职员编辑表单', '^/system/clerks/edit.*', 'GET', null, null, 0, -1, to_timestamp('07-06-2017 15:00:15.881', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('07-06-2017 15:00:42.414', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (610, '职员重置密码', '^/system/clerks/password.*', 'PUT', 'log.behavior.dialog.ok', 'user.reset', 1, -1, to_timestamp('08-06-2017 16:17:11.153', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 16:22:57.412', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (614, '职员导入表单', '^/system/clerks/import.*', 'GET', null, null, 0, -1, to_timestamp('09-06-2017 10:49:20.063', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('09-06-2017 10:50:38.277', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (1, '用户查询', '^/system/users/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (2, '用户新增', '^/system/users$', 'POST', 'log.behavior.dialog.submit', 'user.new', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (3, '用户新增表单', '^/system/users/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (4, '用户编辑', '^/system/users/\d+.*', 'PUT', 'log.behavior.dialog.submit', 'user.edit', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (5, '用户编辑表单', '^/system/users/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (6, '用户删除', '^/system/users.*', 'DELETE', 'log.behavior.dialog.ok', 'user.remove', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (7, '用户详情表单', '^/system/users/show.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (8, '密码重置', '^/system/users/password.*', 'PUT', 'log.behavior.dialog.ok', 'user.reset', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (9, '用户锁定', '^/system/users/locked.*', 'PUT', 'log.behavior.dialog.ok', 'user.lock', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (10, '用户解锁', '^/system/users/unlocked.*', 'PUT', 'log.behavior.dialog.ok', 'user.unlock', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (31, '功能查询', '^/system/funs/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 15:05:16.440', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:05:16.440', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (32, '功能新增', '^/system/funs$', 'POST', 'log.behavior.dialog.submit', 'fun.new', 1, -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (33, '功能新增表单', '^/system/funs/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (34, '功能编辑', '^/system/funs/\d+.*', 'PUT', 'log.behavior.dialog.submit', 'fun.edit', 1, -1, to_timestamp('24-02-2016 15:06:41.291', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:06:41.291', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (35, '功能编辑表单', '^/system/funs/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (36, '功能删除', '^/system/funs/\d+.*', 'DELETE', 'log.behavior.dialog.ok', 'fun.remove', 1, -1, to_timestamp('24-02-2016 15:07:07.762', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:07:38.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (37, '功能详情表单', '^/system/funs/show.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (38, '新增功能对应的URL', '^/system/funs/\d+/urls$', 'POST', 'log.behavior.dialog.submit', 'fun.edit', 1, -1, to_timestamp('24-02-2016 15:06:41.291', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:06:41.291', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (39, '查询功能对应的URL', '^/system/funs/\d+/urls.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (40, '查询排除的URL', '^/system/urls/excepted.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (41, 'URL选择表单', '^/system/urls/select.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (61, '菜单查询', '^/system/menus/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 15:05:16.440', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:05:16.440', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (62, '菜单新增', '^/system/menus$', 'POST', 'log.behavior.dialog.submit', 'menu.new', 1, -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:05:45.134', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (63, '菜单新增表单', '^/system/menus/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (64, '菜单编辑', '^/system/menus/\d+.*', 'PUT', 'log.behavior.dialog.submit', 'menu.edit', 1, -1, to_timestamp('24-02-2016 15:06:41.291', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 15:28:45.067', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (65, '菜单编辑表单', '^/system/menus/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (66, '菜单移动', '^/system/menus/\d+/parent/\d+/\d+.*', 'PUT', 'log.behavior.menu.act1', null, 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (67, '菜单删除', '^/system/menus/\d+.*', 'DELETE', 'log.behavior.dialog.o', 'menu.remove', 1, -1, to_timestamp('24-02-2016 15:07:07.762', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 16:42:28.458', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (68, '菜单详情表单', '^/system/menus/show.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (91, '角色查询', '^/system/roles/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (92, '角色新增', '^/system/roles$', 'POST', 'log.behavior.dialog.submit', 'role.new', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (93, '角色新增表单', '^/system/roles/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (94, '角色编辑', '^/system/roles/\d+.*', 'PUT', 'log.behavior.dialog.submit', 'role.edit', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (95, '角色编辑表单', '^/system/roles/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (96, '角色删除', '^/system/roles.*', 'DELETE', 'log.behavior.dialog.ok', 'role.remove', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (97, '角色授权展示功能列表', '^/system/roles/\d+/funs.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (98, '角色授权', '^/system/roles/\d+/funs$', 'POST', 'log.behavior.dialog.submit', 'role.authorization', 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (99, '功能平铺选择表单', '^/system/funs/select.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (100, '获取角色成员', '^/system/roles/\d+/users.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (101, '设置角色成员', '^/system/roles/\d+/users.*', 'POST', 'log.behavior.dialog.submit', 'role.setMembership', 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (102, '查询排除ID的用户', '^/system/users/excepted.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (103, '用户选择表单', '^/system/users/select.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (121, '通用角色查询', '^/system/commroles/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (122, '获取通用角色成员', '^/system/commroles/\d+/users.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (123, '设置通用角色成员', '^/system/commroles/\d+/users.*', 'POST', 'log.behavior.dialog.submit', 'commrole.setMembership', 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (141, '机构查询', '^/system/orgs/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (142, '机构新增', '^/system/orgs$', 'POST', 'log.behavior.dialog.submit', 'org.new', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (143, '机构新增表单', '^/system/orgs/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('13-05-2016 15:11:39.085', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (144, '机构编辑', '^/system/orgs/\d+.*', 'PUT', 'log.behavior.dialog.submit', 'org.edit', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (145, '机构编辑表单', '^/system/orgs/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (146, '机构移动', '^/system/orgs/\d+/parent/\d+.*', 'PUT', 'log.behavior.org.action1', null, 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (147, '机构删除', '^/system/orgs/\d+.*', 'DELETE', 'log.behavior.dialog.ok', 'org.remove', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (148, '机构详情表单', '^/system/orgs/show.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (149, '机构导出', '^/system/orgs/export$', 'GET', 'log.behavior.org.export', null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (150, '机构导入', '^/system/orgs/import$', 'POST', 'log.behavior.org.import', null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (151, '机构导入表单', '^/system/orgs/import.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (171, 'URL查询', '^/system/urls/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:34:51.540', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:34:51.540', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (172, 'URL新增', '^/system/urls$', 'POST', 'log.behavior.dialog.submit', 'url.new', 1, -1, to_timestamp('24-02-2016 13:36:14.345', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:36:14.345', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (173, 'URL新增表单', '^/system/urls/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (174, 'URL编辑', '^/system/urls/\d+.*', 'PUT', 'log.behavior.dialog.submit', 'url.edit', 1, -1, to_timestamp('24-02-2016 13:36:55.509', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:15:48.390', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (175, 'URL编辑表单', '^/system/urls/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (176, 'URL删除', '^/system/urls.*', 'DELETE', 'log.behavior.dialog.ok', 'url.remove', 1, -1, to_timestamp('24-02-2016 13:37:29.857', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 14:13:51.080', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (177, 'URL详情表单', '^/system/urls/show.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (201, '字典查询', '^/system/dics/list.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (202, '字典新增', '^/system/dics$', 'POST', 'log.behavior.dialog.submit', 'dic.new', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (203, '字典新增表单', '^/system/dics/new.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (204, '字典编辑', '^/system/dics.*', 'PUT', 'log.behavior.dialog.submit', 'dic.edit', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (205, '字典编辑表单', '^/system/dics/edit.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (206, '字典删除', '^/system/dics.*', 'DELETE', 'log.behavior.dialog.ok', 'dic.remove', 1, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (207, '字典详情表单', '^/system/dics/show.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (208, '字典键值对查询', '^/system/dics/.+', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:24:19.184', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (221, '查询在线用户', '^/system/users/online.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (231, '登录日志查询', '^/system/logs/login.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (241, '行为日志查询', '^/system/logs/behavior.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (600, '设备查询', '^/terminal/devices/list.*', 'GET', null, null, 0, -1, to_timestamp('31-05-2017 09:37:09.124', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('31-05-2017 10:28:48.142', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (603, '职员查询', '^/system/clerk/list.*', 'GET', null, null, 0, -1, to_timestamp('03-06-2017 17:00:09.859', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('03-06-2017 17:00:09.859', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (606, '职员编辑', '^/system/clerks/\d+.*', 'PUT', null, null, 1, -1, to_timestamp('07-06-2017 14:59:40.515', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('07-06-2017 14:59:40.515', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (608, '职员删除', '^/system/clerks.*', 'DELETE', null, null, 1, -1, to_timestamp('08-06-2017 14:15:26.549', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 14:15:26.549', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (612, '职员解锁', '^/system/clerks/unlocked.*', 'PUT', 'log.behavior.dialog.ok', 'user.unlock', 1, -1, to_timestamp('08-06-2017 17:03:34.583', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 17:03:53.511', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (616, '职员选择表单', '^/system/clerks/select.*', 'GET', null, null, 0, -1, to_timestamp('14-06-2017 17:50:59.676', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-06-2017 17:50:59.676', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (622, '会议编辑', '^/meeting/edit/\d+.*', 'PUT', null, null, 1, -1, to_timestamp('20-06-2017 16:32:07.390', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 17:32:00.483', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (242, '数据变更查询', '^/system/logs/data.*', 'GET', null, null, 0, -1, to_timestamp('24-02-2016 13:23:01.000', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('19-05-2017 14:02:26.609', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (613, '职员导出', '^/system/clerks/export$', 'GET', 'log.behavior.clerk.export', null, 0, -1, to_timestamp('09-06-2017 10:48:08.617', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('13-06-2017 15:48:09.060', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (615, '职员导入', '^/system/clerks/import$', 'POST', 'log.behavior.clerk.import', null, 1, -1, to_timestamp('09-06-2017 10:49:48.979', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('09-06-2017 10:50:28.996', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (620, '会议查询', '^/meeting/list.*', 'GET', null, null, 0, -1, to_timestamp('15-06-2017 11:49:06.002', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 16:30:05.417', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (623, '会议编辑表单', '^/meeting/edit.*', 'GET', null, null, 0, -1, to_timestamp('20-06-2017 17:34:05.566', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 17:34:05.566', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (604, '职员新增表单', '^/system/clerks/new.*', 'GET', null, null, 0, -1, to_timestamp('05-06-2017 16:30:26.443', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('05-06-2017 16:37:08.818', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (609, '职员详情表单', '^/system/clerks/show.*', 'GET', null, null, 0, -1, to_timestamp('08-06-2017 15:29:30.628', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 15:30:18.963', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (611, '职员锁定', '^/system/clerks/locked.*', 'PUT', 'log.behavior.dialog.ok', 'user.lock', 1, -1, to_timestamp('08-06-2017 17:01:02.031', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('08-06-2017 17:01:44.847', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (617, '查询排除ID的职员', '^/system/clerks/excepted.*', 'GET', null, null, 0, -1, to_timestamp('14-06-2017 17:52:15.913', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-06-2017 17:52:15.913', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (618, '获取设备职员', '^/system/devices/\d+/clerks.*', 'GET', null, null, 0, -1, to_timestamp('14-06-2017 17:54:00.146', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-06-2017 17:54:00.146', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (619, '设置设备职员', '^/system/devices/\d+/clerks.*', 'POST', 'log.behavior.dialog.submit', null, 1, -1, to_timestamp('14-06-2017 17:55:10.858', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('14-06-2017 17:55:36.316', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (621, '会议报表查询', '^/form/meetings/list.*', 'GET', null, null, 0, -1, to_timestamp('16-06-2017 16:08:25.798', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 16:32:26.945', 'dd-mm-yyyy hh24:mi:ss.ff'));
insert into SYS_URL (url_id, url_name, url_pattern, http_method, action_code, args_code, logged_data_changed, created_by, created_date, last_updated_by, last_updated_date)
values (624, '会议报表导出', '^/form/meetings/export$', 'GET', null, null, 0, -1, to_timestamp('20-06-2017 17:36:18.817', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('20-06-2017 17:36:18.817', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt Loading SYS_USER...
insert into SYS_USER (USER_ID, USERNAME, REAL_NAME, PWD, ORG_ID, LOCKED, ERROR_TIME, PHONE, MOBILE, EMAIL, ADDRESS, REMARK, LAST_LOGIN_DATE, LAST_LOGIN_IP, DELETED, CREATED_BY, CREATED_DATE, LAST_UPDATED_BY, LAST_UPDATED_DATE)
values (-1, 'admin', '管理员', '55fb1e4e8fc23ba1f6a3e549803592cd', 1, 0, 0, null, null, null, null, null, to_timestamp('16-03-2016 11:40:31.291', 'dd-mm-yyyy hh24:mi:ss.ff'), '172.16.210.95', 0, -1, to_timestamp('14-04-2014 15:30:11.341', 'dd-mm-yyyy hh24:mi:ss.ff'), -1, to_timestamp('23-02-2016 11:05:37.302', 'dd-mm-yyyy hh24:mi:ss.ff'));
commit;
prompt 10 records loaded
set feedback on
set define on
prompt Done.