select 
	SCHEMA_NAME(o.schema_id) as SchemaName,
	o.name  as TableName,
	sum(ps.reserved_page_count)*8 as TableSize_KB
from 
	sys.dm_db_partition_stats ps
	join sys.objects o on o.object_id=ps.object_id
where 
	o.type='U'
group by 
	o.schema_id, o.name
order by 
	sum(ps.reserved_page_count) desc