SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


CREATE PROCEDURE [dbo].[ame_T_getProdOrderInfoDetail]
	@ProdOrder char(20)=NULL
 AS
	set nocount on
	if exists (select T_ProdOrder from T_Information where T_ProdOrder = @ProdOrder)
	begin
		
		select * from T_Information where T_ProdOrder = @ProdOrder
	end
	
	return
GO