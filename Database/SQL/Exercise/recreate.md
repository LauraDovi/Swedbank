# Recreate

*Purpose: the following script will make it easy to remove and recreate a database*

Script to remove Demo and create a new database named Demo

	-- Jump to "master" database
	USE master

	-- Prepare the Demo database to be removed
	ALTER DATABASE Demo
	SET SINGLE_USER WITH ROLLBACK IMMEDIATE

	-- Remove the database and create a new blank
	DROP DATABASE Demo
	CREATE DATABASE Demo

	-- Jump to the newly created database
	USE Demo
