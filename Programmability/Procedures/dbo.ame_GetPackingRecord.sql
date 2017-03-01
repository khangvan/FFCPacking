SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetPackingRecord]
	@boxNumber char(7)=NULL
-- Define code
AS
	set nocount on
	select PONumber,Model,Serial from PackingRecord where BoxNumber=@boxNumber
	return
GO