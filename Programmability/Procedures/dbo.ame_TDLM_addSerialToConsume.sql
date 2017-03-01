SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_TDLM_addSerialToConsume]
	@Serial char(20)=NULL,
	@Material char(20)=NULL,
	@ProdOrder nchar(20)=NULL
 AS
	set nocount on
	if not exists (select TDLM_SerialNumber from TDLM_SerialNumbers where TDLM_ProdOrder=@ProdOrder and TDLM_SerialNumber=@Serial)
	begin
		insert into TDLM_SerialNumbers (TDLM_ProdOrder, TDLM_SerialNumber, TDLM_Material)
		values(@ProdOrder, @Serial,@Material)
	end
select 'OK'
GO