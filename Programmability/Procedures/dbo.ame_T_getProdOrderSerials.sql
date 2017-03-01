SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_T_getProdOrderSerials]
	@ProductMap char(20)=NULL,
	@ProdOrder char(20)=NULL
 AS
	set nocount on
	if (ltrim(rtrim(@ProductMap))='FFC')
	begin
		if exists (select TFFC_ProdOrder from TFFC_SerialNumbers where TFFC_ProdOrder = @ProdOrder)
		begin
			select 'OK'
			select TFFC_SerialNumber,TFFC_Material from TFFC_SerialNumbers where TFFC_ProdOrder = @ProdOrder
		end
		else
		begin
			select 'NONE'
		end
	end
	else if (ltrim(rtrim(@ProductMap))='DLM')
	begin
		if exists (select TDLM_ProdOrder from TDLM_SerialNumbers where TDLM_ProdOrder = @ProdOrder)
		begin
			select 'OK'
			select TDLM_SerialNumber,TDLM_Material from TDLM_SerialNumbers where TDLM_ProdOrder = @ProdOrder
		end
		else
		begin
			select 'NONE'
		end
	end
	else if (ltrim(rtrim(@ProductMap))='BASE')
	begin
		if exists (select TBASE_ProdOrder from TBASE_SerialNumbers where TBASE_ProdOrder = @ProdOrder)
		begin
			select 'OK'
			select TBASE_SerialNumber,TBASE_Material from TBASE_SerialNumbers where TBASE_ProdOrder = @ProdOrder
		end
		else
		begin
			select 'NONE'
		end
	end
	
	return
GO