SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_T_addProdOrderInfo]
	@ProdOrder nchar(20)=NULL,
	@ProductMap char(20)=NULL,
	@Material char(20)=NULL,
	@Revision char(20)=NULL,
	@Quantity int=0,
	@Packed int=0
 AS
	set nocount on

	declare @StartPAck datetime
	declare @TestRequestDate datetime
	

	declare @DayFromTest2Pack int 
	set @DayFromTest2Pack = 7
	
	select @StartPAck = GETDATE()

	select @TestRequestDate= [dbo].[SUBTRACT_DAYS](@StartPAck, @DayFromTest2Pack)
	 
	if not exists (select T_ProdOrder from T_Information where T_ProdOrder=@ProdOrder)
	begin
		insert into T_Information (T_ProdOrder, T_ProductMap,T_Material,T_Revision,T_Quantity,T_Packed, StartPackat, TestRequireDate)
			values(@ProdOrder, @ProductMap,@Material,@Revision,abs(@Quantity),@Packed,@StartPAck, @TestRequestDate )
	end
	
select 'OK'
GO