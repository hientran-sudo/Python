DROP TABLE #Fact_Orders_Sanitized;
CREATE TABLE #Fact_Orders_Sanitized(
	DateKey			INT,
	CustomerKey		INT,
	OrderTotal		MONEY
);
GO

DROP TABLE #Fact_Orders_Unsanitized;
CREATE TABLE #Fact_Orders_Unsanitized(
	DateKey			INT,
	CustomerKey		INT,
	OrderTotal		MONEY,
	Reason			VARCHAR(255)
);
GO

BEGIN TRY
	-- Only transform non-empty data.  
	INSERT INTO 
		#Fact_Orders_Sanitized
	SELECT
		DateKey,
		CustomerKey,
		OrderTotal
	FROM
		FairfieldUDW_Stage.Fact.Orders
	WHERE
		DateKey IS NOT NULL AND
		LTRIM(RTRIM(DateKey)) <> '' AND
		CustomerKey IS NOT NULL AND
		LTRIM(RTRIM(CustomerKey)) <> '' AND
		OrderTotal IS NOT NULL AND
		LTRIM(RTRIM(OrderTotal)) <> '' 
	
	-- Log all records with empty data in their cells.
	INSERT INTO 
		#Fact_Orders_Unsanitized
	SELECT
		DateKey,
		CustomerKey,
		OrderTotal,
		'Empty value detected'
	FROM
		FairfieldUDW_Stage.Fact.Orders
	WHERE
		DateKey IS NULL OR
		LTRIM(RTRIM(DateKey)) = '' OR
		CustomerKey IS NULL OR
		LTRIM(RTRIM(CustomerKey)) = '' OR
		OrderTotal IS NULL OR
		LTRIM(RTRIM(OrderTotal)) = '' 
END TRY
BEGIN CATCH
	SELECT 'There was an error detecting empty values in the staging database'
END CATCH

BEGIN TRY
	-- Only transform foreign keys.  
	DELETE FROM 
		#Fact_Orders_Sanitized
	WHERE
		LTRIM(RTRIM(DateKey)) NOT IN (SELECT LTRIM(RTRIM(DateKey)) FROM FairfieldUDW_Stage.Dimension.Date) OR
		LTRIM(RTRIM(CustomerKey)) NOT IN (SELECT LTRIM(RTRIM(CustomerKey)) FROM FairfieldUDW_Stage.Dimension.Customer)
	-- see if it exists
	-- Log all records that can't be converted to a foreign key.  
	INSERT INTO 
		#Fact_Orders_Unsanitized
	SELECT
		DateKey,
		CustomerKey,
		OrderTotal,
		'Non-foreign key detected'
	FROM
		FairfieldUDW_Stage.Fact.Orders
	WHERE
		DateKey NOT IN (SELECT DateKey FROM FairfieldUDW_Stage.Dimension.Date) OR
		CustomerKey NOT IN (SELECT CustomerKey FROM FairfieldUDW_Stage.Dimension.Customer)
END TRY
BEGIN CATCH
	SELECT 'There was an error validating foreign keys in the staging database'
END CATCH

SELECT * FROM #Fact_Orders_Sanitized
SELECT * FROM #Fact_Orders_Unsanitized