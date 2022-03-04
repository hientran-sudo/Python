/***
    Columnstore indexes are the standard for storing and querying large data warehousing fact tables. 
    This index uses column-based data storage and query processing to achieve gains up to 10 times the query performance in your data warehouse 
    over traditional row-oriented storage.
***/
USE FairfieldUDW;
GO

CREATE COLUMNSTORE INDEX IX_CS_FactOrders
ON Fact.Orders (OrderID, DateKey, CustomerKey, OrderTotal);
GO