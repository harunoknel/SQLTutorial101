select 
	SCHEMA_NAME(o.schema_id) as SchemaName,
	o.name  as TableName,
	ps.row_count
from 
	sys.dm_db_partition_stats ps
JOIN 
	sys.objects o on o.object_id=ps.object_id
where 
	o.type='U'  and ps.index_id in (0,1)
order by 
	ps.row_count desc