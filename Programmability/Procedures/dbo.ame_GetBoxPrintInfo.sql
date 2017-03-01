SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetBoxPrintInfo]
	@BoxNumber char(7)=NULL
-- Define code
AS
	set nocount on
	select count( distinct PONumber) as Qty from PackingRecord where BoxNumber=@BoxNumber
	select distinct PONumber from PackingRecord where BoxNumber=@BoxNumber
	return
GO