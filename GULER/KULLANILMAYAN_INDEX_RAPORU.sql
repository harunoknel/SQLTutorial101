Select object_name (i.object_id) as objectName,
i.name as indexname,
i.index_id
from sys.indexes i 
join sys.objects o on i.object_id = o.object_id
where objectproperty (o.object_id, 'IsUserTable')=1
and index_id NOT IN (select s.index_id
from sys.dm_db_index_usage_stats s
where s.object_id=i.object_id
and i.index_id=s.index_id and database_id = DB_ID('BACKUPTESTDB'))
order by objectname, i.index_id, indexname asc
                                                                                                                                                