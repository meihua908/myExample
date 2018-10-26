declare
job number;
begin
  sys.dbms_job.submit(job,
                      'update tml_device set is_online = 0 where sysdate > (last_heartbeat_date + 2 / 1440);',
                      to_date('06-07-2016 08:57:46', 'dd-mm-yyyy hh24:mi:ss'),
                      'sysdate+1/1440');
  commit;
end;
/

declare
job number;
begin
  sys.dbms_job.submit(job,
                      'update clerk set login_status = 0 where sysdate > (last_heartbeat_date + 2 / 1440);',
                      to_date('06-07-2016 08:57:46', 'dd-mm-yyyy hh24:mi:ss'),
                      'sysdate+1/1440');
  commit;
end;
/

declare
job number;
begin
  sys.dbms_job.submit(job,
                      what => 'update meeting set status = 3 where sysdate > end_time and status = 0;',
                      next_date => to_date('23-08-2017 11:50:11', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/1440');
  commit;
end;
/

declare
job number;
begin
  sys.dbms_job.submit(job,
                      what => 'update ATTEND_TIME_DETAIL a set a.leave_time = sysdate,a.time_diff = round(to_number(sysdate-Cast(a.join_time As Date))*1440) where sysdate > ((select c.last_heartbeat_date from clerk c where a.clerk_id =c.clerk_id) + 5 / 1440) and a.leave_time is null;',
                      next_date => to_date('01-09-2017 10:04:21', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/1440');
  commit;
end;
/

declare
job number;
begin
  sys.dbms_job.submit(job,
                      what => 'update meeting m set m.status =2 where m.host_account in (select c.clerk_name from clerk c where sysdate>(c.last_heartbeat_date +5 / 1440)) and  m.status = 1;',
                      next_date => to_date('01-09-2017 10:06:21', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/1440');
  commit;
end;
/

declare
job number;
begin
  sys.dbms_job.change(job,
                      what => 'update tml_device_command c set c.state = 4 where sysdate > (select m.end_time from meeting m where m.meeting_id = c.meeting_id) and c.state = 0 and c.command_id = 10;',
                      next_date => to_date('05-09-2017 15:48:14', 'dd-mm-yyyy hh24:mi:ss'),
                      interval => 'sysdate+1/1440');
  commit;
end;
/