SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO






-- Batch submitted through debugger: SQLQuery14.sql|4|0|C:\Users\kvan\AppData\Local\Temp\~vsFADA.sql


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_CheckSNDLSS]
	-- Add the parameters for the stored procedure here
	@PO nchar(20)
	
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @result nchar(100)
	declare @POqty nchar(20)
	declare @SNqty nchar(20)

	set @POqty = 0
	set @SNqty = 0
	set @result ='NG- Nodata'

	set @POqty= (select count (*)  from tffc_serialnumbers where tffc_prodorder =@PO )
	set @SNqty =(select T_Quantity from T_Information where t_prodorder =@PO)
    -- Insert statements for procedure here
	--select @PO = right('00000000000'+convert(varchar(12), @PO), 12)
	if (@POqty = 0 ) or ( @SNqty = 0)
	begin
		set @result ='NG- Nodata'
		SELECT @result AS Result
	end

	if (@POqty = @SNqty)
		--if ((select count (*)  from tffc_serialnumbers where tffc_prodorder =@PO ) =(select T_Quantity from T_Information where t_prodorder =@PO))

			begin
			SET @result = 'OK' 
			SELECT @result AS Result 
			end

		else begin
			
			if (@POqty >  @SNqty)
			begin 
			SET @result = 'NG- PrintPack load SN is not enough' 
			SELECT @result AS Result
			end
			if (@POqty <  @SNqty)
			 begin
			SET @result = 'NG- load over qty require' 
			SELECT @result AS Result
			end



			
			end
		
	
	
	--SELECT @result AS Result
	
END
GO