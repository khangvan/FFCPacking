SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[dlsvn_POQtyPackaged] 
	@iPONumber nchar(30),
	@result int OUT
AS
--Declare	
	set nocount on
begin
	
	if((SELECT datepart(hh,CONVERT (time, SYSDATETIME()))) = '23')
		begin
			DELETE FROM [FFCPacking].[dbo].[T_Information] WHERE DATEDIFF(DAY,StartPackAt,GETDATE()-30) >= '0'
		end
	
	set @result = '0'
	SELECT @result = T_Packed FROM T_Information
					WHERE T_ProdOrder = @iPONumber
					
	select @result as Result
	return
end
GO