SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetPOUnPack]
	
-- Define code
AS
	set nocount on
	declare @maxPO int
	declare @PONo int
	if exists (select PONumber from tmpBoxUnPack)
	begin
		select @maxPO=max(PONumber) from tmpBoxUnPack
	end
	else
	begin
		set @maxPO=0
	end
	set @PONo=@maxPO+1
	select @PONo as Result
	return
GO