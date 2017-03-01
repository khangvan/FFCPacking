SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[dlsvn_GetLastPOPackaged] 
	@ModelNum nchar(30),
	@result nchar(30) OUT
AS
--Declare
	set nocount on
begin
	if exists (SELECT TOP 1 PONumber FROM [FFCPacking].[dbo].[PackingRecord] WHERE Model=@ModelNum AND PONumber LIKE '000100%')
		begin
			SELECT TOP 1 @result = PONumber FROM [FFCPacking].[dbo].[PackingRecord] WHERE Model=@ModelNum AND PONumber LIKE '000100%' ORDER BY PackingDateTime DESC
		end
	else
		if exists (SELECT TOP 1 FRUPONumber FROM [DLMDB].[dbo].[FRUPackagingRecord] WHERE FRUModel=@ModelNum AND FRUPONumber LIKE '100%')
			begin
				SELECT TOP 1 @result = FRUPONumber FROM [DLMDB].[dbo].[FRUPackagingRecord] WHERE FRUModel=@ModelNum AND FRUPONumber LIKE '100%' ORDER BY FRUPackagingDateTime DESC
			end
		else
			begin
				set @result='None'
			end
	
	select @result as Result
	return
end
GO