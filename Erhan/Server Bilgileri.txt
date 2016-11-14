select 
	sqlserver_start_time,
	ms_ticks,
	sqlserver_start_time_ms_ticks,
	cpu_count,
	physical_memory_kb / 1024 / 1024 as physical_memory_MB,
	virtual_memory_kb / 1024 / 1024 as virtual_Memory_MB,
	max_workers_count,
	scheduler_count,
	scheduler_total_count
from 
	sys.dm_os_sys_info