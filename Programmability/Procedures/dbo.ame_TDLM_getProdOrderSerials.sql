SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_TDLM_getProdOrderSerials]
	@ProdOrder char(20)=NULL
 AS
	set nocount on
	if exists (select TDLM_Material from TDLM_SerialNumbers where TDLM_ProdOrder = @ProdOrder)
	begin
		select 'OK'
		select TDLM_ProdOrder, TDLM_SerialNumber,TDLM_Material from TDLM_SerialNumbers where TDLM_ProdOrder = @ProdOrder
	end
	else
	begin
		select 'NONE'
	end
	return
GO