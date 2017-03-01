SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_GetUnPackingParts]
-- Define code
AS
	set nocount on
	select PONumber,Model,Serial from UnPackingParts
	return
GO