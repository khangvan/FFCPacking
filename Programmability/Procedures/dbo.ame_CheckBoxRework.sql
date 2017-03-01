SET QUOTED_IDENTIFIER, ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_CheckBoxRework]
	@PONumber nchar(20)=NULL,
	@BoxRework nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result nchar(100)
	if exists(select distinct PONumber from tmpBoxRework where PONumber=@PONumber and BoxNumber=@BoxRework)
		begin
			set @result='Box dang rework'
			select @result as Result
			return
		end
	if exists(select distinct PONumber from tmpBoxUnPack where BoxNumber=@BoxRework)
		begin
			set @result='Box dang unpack'
			select @result as Result
			return
		end
	if exists(select distinct PONumber from PackingRecord where PONumber=@PONumber and BoxNumber=@BoxRework)
		begin
			insert into tmpBoxRework (PONumber,BoxNumber) values (@PONumber,@BoxRework)
			set @result='OK'
		end
	/*
	else
		begin
			
			if exists(select distinct PONumber from PackingRecordwoACS where PONumber=@PONumber and BoxNumber=@BoxRework)
			begin
				insert into tmpBoxRework (PONumber,BoxNumber) values (@PONumber,@BoxRework)
				set @result='OK'
			end			
			else
			begin
				set @result='NG'
			end
		end
	*/
	select @result as Result
	return
GO