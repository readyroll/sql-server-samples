﻿IF OBJECT_ID('[Website].[SearchForStockItemsByTags]') IS NOT NULL
	DROP PROCEDURE [Website].[SearchForStockItemsByTags];

GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [Website].[SearchForStockItemsByTags]
@SearchText nvarchar(1000),
@MaximumRowsToReturn int
WITH EXECUTE AS OWNER
AS
BEGIN
    SELECT TOP(@MaximumRowsToReturn)
           si.StockItemID,
           si.StockItemName
    FROM Warehouse.StockItems AS si
    WHERE si.Tags LIKE N'%' + @SearchText + N'%'
    ORDER BY si.StockItemName
    FOR JSON AUTO, ROOT(N'StockItems');
END;
GO
