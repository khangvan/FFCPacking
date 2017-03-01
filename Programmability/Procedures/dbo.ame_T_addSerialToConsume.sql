SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_T_addSerialToConsume]
	@ProductMap char(20)=NULL,
	@Serial char(20)=NULL,
	@Material char(20)=NULL,
	@ProdOrder nchar(20)=NULL
 AS
	set nocount on
	if (ltrim(rtrim(@ProductMap))='FFC')
	begin
		if not exists (select TFFC_SerialNumber from TFFC_SerialNumbers where TFFC_ProdOrder=@ProdOrder and TFFC_SerialNumber=@Serial)
		begin
			insert into TFFC_SerialNumbers (TFFC_ProdOrder, TFFC_SerialNumber, TFFC_Material)
				values(@ProdOrder, @Serial,@Material)
		end
	end
	else if (ltrim(rtrim(@ProductMap))='DLM')
	begin
		if not exists (select TDLM_SerialNumber from TDLM_SerialNumbers where TDLM_ProdOrder=@ProdOrder and TDLM_SerialNumber=@Serial)
		begin
			insert into TDLM_SerialNumbers (TDLM_ProdOrder, TDLM_SerialNumber, TDLM_Material)
				values(@ProdOrder, @Serial,@Material)
		end
	end
	else if (ltrim(rtrim(@ProductMap))='BASE')
	begin
		if not exists (select TBASE_SerialNumber from TBASE_SerialNumbers where TBASE_ProdOrder=@ProdOrder and TBASE_SerialNumber=@Serial)
		begin
			insert into TBASE_SerialNumbers (TBASE_ProdOrder, TBASE_SerialNumber, TBASE_Material)
				values(@ProdOrder, @Serial,@Material)
		end
	end
select 'OK'
GO