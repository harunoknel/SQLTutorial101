Select object_name (ps.object_id) as [name],
	Ps.index_id,
Ps.avg_fragmentation_in_percent,
Ps.fragment_count,
Ps.avg_fragment_size_in_pages,
Ps.page_count
From sys.dm_db_index_physical_stats(DB_ID(), null,null,null,null) ps
Where ps.avg_fragmentation_in_percent > 10
Order by ps.avg_fragmentation_in_percent desc
