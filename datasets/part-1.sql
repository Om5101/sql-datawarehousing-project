/*
 You cannot drop a database while you are connected to it
 master is a system database, always exists
*/

USE master;
GO

/*
 Checking If database exist already and If exist then
 altering it by removing all other users/connections
 Cancels any running queries AND then Rolls back uncommitted transactions instantly
 Because SQL Server won’t allow dropping a database if someone is using it
*/

IF EXISTS (SELECT 1 FROM sys.databases WHERE name = 'DataWarehouse')
BEGIN
	ALTER DATABASE DataWarehouse
	SET SINGLE_USER
	WITH ROLLBACK IMMEDIATE
END
GO

-- Now we can safely create a DB (CREATE IF NOT EXISTS - won't work)
CREATE DATABASE DataWarehouse;
USE DataWarehouse;
GO

-- Verify
SELECT * FROM sys.databases;

-- CREATING SCHEMA
CREATE SCHEMA bronze
GO

CREATE SCHEMA silver
GO

CREATE SCHEMA gold
GO












