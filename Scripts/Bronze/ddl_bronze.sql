/*
===============================================================================
DDL Script: Create Bronze Tables
===============================================================================
Script Purpose:
    This script creates tables in the 'bronze' schema, dropping existing tables 
    if they already exist.
	  Run this script to re-define the DDL structure of 'bronze' Tables
===============================================================================
*/



IF OBJECT_ID ('bronze.erp_customers','U') IS NOT NULL
   DROP TABLE bronze.erp_customers;
GO

CREATE TABLE bronze.erp_customers(
	CUSTOMER NVARCHAR(50),
	ADDRESSID NVARCHAR(50),
	__index_level_0__ INT
);
GO

IF OBJECT_ID ('bronze.erp_addresses','U') IS NOT NULL
   DROP TABLE bronze.erp_addresses;
GO

CREATE TABLE bronze.erp_addresses(
	ADDRESSID NVARCHAR(50),
	ADDRESSREPRESENTATIONCODE NVARCHAR(50),
	COUNTRY NVARCHAR(100),
	REGION NVARCHAR(100),
	__index_level_0__ NVARCHAR(100),
);
GO

IF OBJECT_ID ('bronze.erp_salesdocuments','U') IS NOT NULL
   DROP TABLE bronze.erp_salesdocuments;
GO

CREATE TABLE bronze.erp_salesdocuments(
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
	__index_level_0__ INT
);
GO

IF OBJECT_ID ('bronze.erp_salesdocument_items','U') IS NOT NULL
   DROP TABLE bronze.erp_salesdocument_items;
GO

CREATE TABLE bronze.erp_salesdocument_items(
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
	__index_level_0__ NVARCHAR(50)
);
GO
