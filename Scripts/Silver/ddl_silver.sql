/*
===============================================================================
DDL Script: Create Silver Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'silver' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/

IF OBJECT_ID ('silver.erp_customers','U') IS NOT NULL
   DROP TABLE silver.erp_customers;
GO

CREATE TABLE silver.erp_customers(
	CUSTOMER NVARCHAR(50),
	ADDRESSID NVARCHAR(50),
	__index_level_0__ INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID ('silver.erp_addresses','U') IS NOT NULL
   DROP TABLE silver.erp_addresses;
GO

CREATE TABLE silver.erp_addresses(
	ADDRESSID NVARCHAR(50),
	ADDRESSREPRESENTATIONCODE NVARCHAR(50),
	COUNTRY NVARCHAR(100),
	REGION NVARCHAR(100),
	__index_level_0__ NVARCHAR(100),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID ('silver.erp_salesdocuments','U') IS NOT NULL
   DROP TABLE silver.erp_salesdocuments;
GO

CREATE TABLE silver.erp_salesdocuments(
	SALESDOCUMENT NVARCHAR(50),
	SALESOFFICE NVARCHAR(50),
	SALESGROUP NVARCHAR(50),
	CUSTOMERPAYMENTTERMS NVARCHAR(50),
	SHIPPINGCONDITION NVARCHAR(50),
	SALESDOCUMENTTYPE NVARCHAR(50),
	SALESORGANIZATION NVARCHAR(50),
	DISTRIBUTIONCHANNEL NVARCHAR(50),
	ORGANIZATIONDIVISION NVARCHAR(50),
	BILLINGCOMPANYCODE NVARCHAR(50),
	TRANSACTIONCURRENCY NVARCHAR(50),
	INCOTERMSCLASSIFICATION NVARCHAR(50),
	CREATIONDATE DATE,
	CREATIONTIME VARCHAR(20),
	__index_level_0__ INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID ('silver.erp_salesdocument_items','U') IS NOT NULL
   DROP TABLE silver.erp_salesdocument_items;
GO

CREATE TABLE silver.erp_salesdocument_items(
	SALESDOCUMENT NVARCHAR(50),
	SALESDOCUMENTITEM NVARCHAR(50),
	PLANT NVARCHAR(50),
	SHIPPINGPOINT NVARCHAR(50),
	SALESDOCUMENTITEMCATEGORY NVARCHAR(50),
	PRODUCT NVARCHAR(50),
	SOLDTOPARTY NVARCHAR(50),
	SHIPTOPARTY NVARCHAR(50),
	BILLTOPARTY NVARCHAR(50),
	PAYERPARTY NVARCHAR(50),
	INCOTERMSCLASSIFICATION NVARCHAR(50),
	__index_level_0__ NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID ('silver.erp_region_code_mapping','U') IS NOT NULL
   DROP TABLE silver.erp_region_code_mapping;
GO

CREATE TABLE silver.erp_region_code_mapping(
	Country_Code NVARCHAR(50),
	Region_ID NVARCHAR(50),
	Region_Name NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
