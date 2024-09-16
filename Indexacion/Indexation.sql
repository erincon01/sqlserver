-- Use the AdventureWorks2019 database
USE AdventureWorks2019;
GO

-- ================================================
-- Indexing Example
-- ================================================

-- Create a non-clustered index on the 'Name' column of the 'Product' table
-- This will help improve performance for queries that filter or sort by 'Name'
CREATE NONCLUSTERED INDEX IX_Product_Name
ON Production.Product (Name);
GO

-- Verify that the index has been created
-- This query retrieves information about the 'IX_Product_Name' index
SELECT * 
FROM sys.indexes 
WHERE object_id = OBJECT_ID('Production.Product') 
AND name = 'IX_Product_Name';
GO

-- View index usage statistics
-- This query shows how often the index is used by looking at statistics
SELECT * 
FROM sys.dm_db_index_usage_stats 
WHERE object_id = OBJECT_ID('Production.Product');
GO

-- ================================================
-- Blocking Example
-- ================================================

-- Display current blocking information
-- This query shows details about sessions that are blocking other sessions
SELECT 
    blocking_session_id AS BlockingSessionID, -- ID of the session causing the block
    session_id AS BlockedSessionID,           -- ID of the session being blocked
    wait_type,                                -- Type of wait for the blocked session
    wait_time,                                -- Time the blocked session has been waiting
    wait_resource                             -- Resource causing the wait
FROM sys.dm_exec_requests
WHERE blocking_session_id <> 0;
GO

-- Investigate details of blocking transactions
-- This query provides more information about sessions and transactions involved in blocking
SELECT 
    r.session_id,
    r.blocking_session_id,
    r.wait_type,
    r.wait_time,
    r.wait_resource,
    s.login_name,
    s.host_name,
    t.transaction_state
FROM sys.dm_exec_requests r
JOIN sys.dm_exec_sessions s ON r.session_id = s.session_id
JOIN sys.dm_tran_session_transactions t ON r.session_id = t.session_id
WHERE r.blocking_session_id <> 0;
GO

-- ================================================
-- Terminate a blocking session (Use with caution!)
-- ================================================

-- To forcefully terminate a blocking session, replace <session_id> with the actual session ID
-- This should be done carefully as it will terminate the session and rollback any uncommitted transactions
-- Example: KILL 55;
KILL <session_id>;
GO
