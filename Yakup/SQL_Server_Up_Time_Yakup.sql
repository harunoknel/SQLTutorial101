--SQL Server UpTime - 1. Yöntem
select DATEDIFF(MINUTE,
	sqlserver_start_time,
	CURRENT_TIMESTAMP) as SQLServerUpTime_minute
from sys.dm_os_sys_info

--SQL Server UpTime _ 2. Yöntem

select (ms_ticks-sqlserver_start_time_ms_ticks)/1000/60 as SQLserverUpTime_minute
from sys.dm_os_sys_info