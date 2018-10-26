create tablespace AVS_DATA  
logging  
datafile 'D:\app\Administrator\oradata\avs\AVS_DATA.DBF' 
size 10m  
autoextend on   
next 10m maxsize 100m  
extent management local;

create tablespace AVS_INDEX  
logging  
datafile 'D:\app\Administrator\oradata\avs\AVS_INDEX.DBF' 
size 10m  
autoextend on   
next 10m maxsize 100m  
extent management local;

create temporary tablespace AVS_TEMP
tempfile 'D:\app\Administrator\oradata\avs\AVS_TEMP.DBF' 
size 10m  
autoextend on   
next 10m maxsize 100m  
extent management local;

CREATE USER avs IDENTIFIED BY avs DEFAULT TABLESPACE AVS_DATA TEMPORARY TABLESPACE AVS_TEMP;

grant connect,resource,dba to avs;