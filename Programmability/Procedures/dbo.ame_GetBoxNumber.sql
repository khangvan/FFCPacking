SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_GetBoxNumber]
--@Boxnumberout nchar(7) output
-- Define code
AS
	declare @boxNumber char(7)
	declare @rowID int
	set nocount on

	begin transaction
	select @rowID=min(rowID) from tmpBoxNumber where IsUsing='0' and Packed='0'
	select @boxNumber=BoxNumber from tmpBoxNumber where rowID=@rowID
	update tmpBoxNumber set IsUsing='1' where rowID=@rowID
	
	select @boxNumber as BoxNumber
	commit transaction
	return

	/*
	exec ame_getboxnumber ''
	
	*/
GO