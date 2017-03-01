SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_tmpUnPackingRecord]
	@PONumber nchar(20)=NULL,
	@BoxNumber nchar(20)=NULL
-- Define code
AS
	set nocount on
	insert into tmpBoxUnPack (PONumber,BoxNumber) values (@PONumber,@BoxNumber)
	return
GO