
Here is a comprehensive list of SQL Server trace flags and their functions, formatted as a Markdown table:

source: 
- [senior dba](https://seniordba.wordpress.com/2016/04/23/sql-server-trace-flag-listing/)
- [microsoft](https://learn.microsoft.com/en-us/sql/t-sql/database-console-commands/dbcc-traceon-trace-flags-transact-sql?view=sql-server-ver16)

| **Trace Flag** | **Function**                                                                                   |
|----------------|-----------------------------------------------------------------------------------------------|
| 101            | Verbose Merge Replication logging output for troubleshooting Merge replication performance.   |
| 102            | Verbose Merge Replication logging to `msmerge_history` table for troubleshooting Merge replication performance. |
| 105            | Allows joining more than 16 tables in SQL Server 6.5.                                         |
| 106            | Enables viewing messages sent to and from the Publisher during Web Synchronization.           |
| 107            | Alters input rules for decimal numbers.                                                       |
| 168            | Bug fix in `ORDER BY` clause.                                                                 |
| 205            | Logs usage of AutoStat/Auto Update Statistics.                                                |
| 253            | Prevents ad-hoc query plans from staying in cache (SQL 2005).                                 |
| 260            | Prints extended stored procedure DLL versioning information.                                  |
| 272            | Generates a log record per identity increment; reverts SQL Server 2012 to old-style identity behavior. |
| 302            | Outputs Index Selection information.                                                          |
| 310            | Outputs information about actual join order.                                                  |
| 323            | Outputs detailed information about updates.                                                   |
| 345            | Changes join order selection logic in SQL Server 6.5.                                         |
| 610            | Enables minimally logged inserts to indexed tables.                                           |
| 652            | Disables page pre-fetching scans.                                                            |
| 661            | Disables the ghost record removal process.                                                    |
| 806            | Turns on Page Audit functionality to verify page validity.                                    |
| 818            | Enables ring buffer to store information about I/O write operations; used to troubleshoot I/O problems. |
| 834            | Enables large page allocations.                                                              |
| 836            | Uses the max server memory option for the buffer pool.                                        |
| 845            | Enables Lock Pages in Memory on Standard Edition.                                             |
| 902            | Bypasses upgrade scripts.                                                                     |
| 1117           | Enables simultaneous autogrowth in multiple-file databases.                                   |
| 1118           | Forces uniform extent allocation.                                                            |
| 1119           | Turns off mixed extent allocation (similar to 1118).                                          |
| 1140           | Fixes for growing tempdb in special cases.                                                    |
| 1200           | Prints detailed lock information.                                                            |
| 1204           | Returns information about deadlocks.                                                         |
| 1211           | Disables lock escalation caused by memory pressure.                                           |
| 1222           | Returns deadlock information in XML format.                                                   |
| 1224           | Disables lock escalation based on the number of locks.                                        |
| 1236           | Fixes performance problems in scenarios with high lock activity in SQL Server 2012 and 2014.  |
| 1264           | Collects process names in non-yielding scenario memory dumps.                                 |
| 1448           | Alters replication log reader functionality.                                                  |
| 1462           | Disables mirroring log compression.                                                          |
| 1717           | Automatically sets the `MSShipped` bit at creation time when creating stored procedures.      |
| 2312           | Forces the use of the new cardinality estimator in SQL Server 2014 and later versions.        |
| 2330           | Disables the auto-stats update for temporary tables.                                          |
| 2371           | Lowers the threshold for automatic statistics update as the table grows.                      |
| 2389           | Enables tracking of columns with ascending keys.                                              |
| 2390           | Enables tracking of columns with ascending keys and updates statistics when the column value increases. |
| 2453           | Improves performance of queries that use filtered indexes by avoiding unnecessary scans.      |
| 2467           | Enables the use of indirect checkpoints for tempdb.                                           |
| 2528           | Disables parallel checking of objects by DBCC CHECKDB.                                        |
| 2549           | Enhances performance of DBCC CHECKDB for large databases by reducing memory usage.            |
| 2562           | Reduces the memory requirements for DBCC CHECKDB operations.                                  |
| 2566           | Allows DBCC CHECKDB to skip checks on disabled indexes.                                       |
| 2601           | Logs duplicate key errors in the error log instead of failing the entire batch.               |
| 2626           | Enables detailed logging for replication agents.                                              |
| 2701           | Converts certain warnings into errors during query execution.                                 |
| 2722           | Disables the generation of warning messages for certain deprecated features.                  |
| 2861           | Caches the plans for ad-hoc queries to improve performance.                                   |
| 3023           | Enables the use of backup compression by default.                                             |
| 3042           | Increases the maximum size of a backup device to 4TB.                                         |
| 3205           | Disables hardware compression for tape drivers.                                               |
| 3226           | Suppresses successful backup completion messages in the error log.                            |
| 3231           | Disables the use of VSS Writer for backups.                                                   |
| 3422           | Enables auditing of page checksum failures.                                                   |
| 3505           | Disables automatic checkpoints.                                                              |
| 3604           | Sends DBCC output to the client.                                                             |
| 3605           | Sends DBCC output to the error log.                                                          |
| 3625           | Limits the amount of information returned in error messages to prevent information disclosure. |
| 3640           | Disables batch mode processing for columnstore indexes.                                       |
| 3654           | Enables the use of the NOEXPAND hint for indexed views.                                       |
| 3660           | Allows the use of the FORCESCAN hint to force a table scan.                                   |
| 3689           | Logs detailed information about query optimization decisions.                                 |
| 4199           | Enables query optimizer hotfixes that are off by default.                                     |
| 4616           | Changes the permission requirements for certain system views.                                 |
| 4618           | Limits the number of query plan cache entries to improve performance.                         |
| 4621           | Improves performance of queries that use the LIKE operator with a leading wildcard.           |
| 4631           | Disables the generation of extended event session scripts in the error log.                   |
| 4640           | Enables the use of the NO_PERFORMANCE_SPOOL hint to improve query performance.                |
| 7300           | Provides detailed error messages for OLE DB provider errors.                                  |
| 7505           | Enables the use of the BULK INSERT command for importing data.                                |
| 7806           | Prevents the SQL Server Browser service from starting automatically.                          |
| 8002           | Enables the use of large CLR types in SQL Server.                                             |
| 8032           | Increases the size of the plan cache to improve performance.                                  |
| 8207           | Enables the use of multiple threads for DBCC CHECKDB operations.                              |

