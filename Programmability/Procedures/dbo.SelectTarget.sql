SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/****** Script for SelectTopNRows command from SSMS  ******/
CREATE PROCEDURE [dbo].[SelectTarget]
AS
BEGIN
	SELECT ProductGroup, TargetHRS
	FROM [PTR].[dbo].[CapacityControl]                               
END
GO