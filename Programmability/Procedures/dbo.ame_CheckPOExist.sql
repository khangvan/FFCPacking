SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_CheckPOExist]
	@PONumber nchar(20)=NULL,
	@Station nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result nchar(100)
	declare @rev nchar(20)
	declare @po nchar(20)
	if (ltrim(rtrim(@Station))='PO')
	begin
		if exists(select distinct PONumber from PackingRecord where PONumber=@PONumber)
		begin
			set @result='OK'
		end
		else
		begin
			if exists(select distinct PONumber from PackingRecordwoACS where PONumber=@PONumber)
			begin
				set @result='OK'
			end
			else
			begin
				set @result='NG'
			end
		end
	end
	else if (ltrim(rtrim(@Station))='SAP')
	begin
		if exists(select distinct Model from PackingRecord where Model=@PONumber)
		begin
			set @result='OK'
			select distinct @po=PONumber from PackingRecord where Model=@PONumber
			set @rev=substring(ltrim(rtrim(@po)),6,len(ltrim(rtrim(@po)))-5)
		end
		else
		begin
			set @result='NG'
		end
	end
	select @result as Result
	select @po as PONumber,@rev as Revision
	return
GO