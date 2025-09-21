/*
===============================================================================
Stored Procedure: Load Bronze Layer (Source -> Bronze)
===============================================================================
Script Purpose:
    This stored procedure loads data into the 'bronze' schema from external CSV files. 
    It performs the following actions:
    - Truncates the bronze tables before loading data.
    - Uses the `BULK INSERT` command to load data from csv Files to bronze tables.

Parameters:
    None. 
	  This stored procedure does not accept any parameters or return any values.

Usage Example:
    EXEC bronze.load_bronze;
===============================================================================
*/



CREATE OR ALTER PROCEDURE bronze.load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME,@batch_start_time DATETIME,@batch_end_time DATETIME;
	BEGIN TRY
		SET @batch_start_time = GETDATE();
		PRINT '=================================================================================';
		PRINT 'LOADING BRONZE LAYER';
		PRINT '=================================================================================';

		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_customers';
		TRUNCATE TABLE bronze.erp_customers;

		PRINT '>> INSERTING DATA INTO: bronze.erp_customers';
		BULK INSERT bronze.erp_customers
		FROM 'C:\Users\gizem\Desktop\Erp-Sql-Data-Warehouse-Project\ErpCustomerChurn\Datasets\customers.csv'
		WITH (
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_addresses';
		TRUNCATE TABLE bronze.erp_addresses;

		PRINT '>> INSERTING DATA INTO: bronze.erp_addresses';
		BULK INSERT bronze.erp_addresses
		FROM 'C:\Users\gizem\Desktop\Erp-Sql-Data-Warehouse-Project\ErpCustomerChurn\Datasets\addresses.csv'
		WITH (
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_salesdocuments';
		TRUNCATE TABLE bronze.erp_salesdocuments;

		PRINT '>> INSERTING DATA INTO: bronze.erp_salesdocuments';
		BULK INSERT bronze.erp_salesdocuments
		FROM 'C:\Users\gizem\Desktop\Erp-Sql-Data-Warehouse-Project\ErpCustomerChurn\Datasets\salesdocuments.csv'
		WITH (
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_salesdocument_items';
		TRUNCATE TABLE bronze.erp_salesdocument_items;

		PRINT '>> INSERTING DATA INTO: bronze.erp_salesdocument_items';
		BULK INSERT bronze.erp_salesdocument_items
		FROM 'C:\Users\gizem\Desktop\Erp-Sql-Data-Warehouse-Project\ErpCustomerChurn\Datasets\salesdocument_items.csv'
		WITH (
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------------------------';


		SET @start_time = GETDATE();
		PRINT '>> TRUNCATING TABLE: bronze.erp_region_code_mapping';
		TRUNCATE TABLE bronze.erp_region_code_mapping;

		PRINT '>> INSERTING DATA INTO: bronze.erp_region_code_mapping';
		BULK INSERT bronze.erp_region_code_mapping
		FROM 'C:\Users\gizem\Desktop\region_code_mapping.csv'
		WITH (
		  FIRSTROW = 2,
		  FIELDTERMINATOR = ',',
		  TABLOCK
		);
		SET @end_time = GETDATE();
		PRINT '>> LOAD DURATION: ' + CAST(DATEDIFF(second,@start_time,@end_time) AS NVARCHAR) + ' seconds';
		PRINT '----------------------------------------------------------------------';


		SET @batch_end_time = GETDATE();
		PRINT '==================================================================';
		PRINT 'LOADING BRONZE LATER IS COMPLETED';
		PRINT ' - TOTAL LOAD DURATION: ' + CAST(DATEDIFF(second,@batch_start_time,@batch_end_time) AS NVARCHAR) + ' seconds';
		PRINT '==================================================================';


	END TRY
	BEGIN CATCH
		PRINT '==================================================================';
		PRINT 'ERROR OCCURED DURING BRONZE LAYER';
		PRINT 'ERROR MESSAGE' + ERROR_MESSAGE();
		PRINT 'ERROR MESSAGE' + CAST(ERROR_NUMBER() AS NVARCHAR);
		PRINT 'ERROR MESSAGE' + CAST(ERROR_STATE() AS NVARCHAR);
		PRINT '==================================================================';
	END CATCH

END
