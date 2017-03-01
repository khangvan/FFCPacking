SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_CheckSNvsTFFCCONTROL]
	-- Add the parameters for the stored procedure here
	@SN nchar(20),
	@PO nchar(20)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	declare @result nchar(20)
	declare @counting int
    -- Insert statements for procedure here
	set @counting=0
	set @result= 'NG-CheckSNbelongloadedSNlist'
	select @counting = count (*) from TFFC_SerialNumbers where TFFC_SerialNumber= @SN and  TFFC_ProdOrder = @PO

	if(@counting>0)
		begin
		set @result='OK'
		end
	else
		begin
		set @result='NG'
		end
	end
	
	select @result as Result

GO