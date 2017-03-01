SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

CREATE PROCEDURE [dbo].[ame_CheckBoxNumber]
-- Define code
AS
	declare @result  nchar(30)
	declare @dt datetime
	declare @pYear char(2)
	declare @tmpYear char(2)
	declare @tmpMonth char(1)
	declare @tmpDay char(1)
	declare @tmpMonth1 char(2)
	declare @tmpDay1 char(2)
	declare @prefix char(4)
	declare @tmpPrefix char(4)
	declare @box char(3)
	declare @boxNumber char(7)
	declare @i int
	declare @rowID int
	declare @checkboxnumber char(8)
	set nocount on
	set @i=1

	--~ get curretn date ----
	set @dt=getdate()
	set @pYear=left(convert(char(4),year(@dt)),2)
	set @tmpYear=right(convert(char(4),year(@dt)),2)
	set @tmpMonth1=convert(char(2),month(@dt))

	select @tmpMonth=strMonth from MonthTable where intMonth=@tmpMonth1
	set @tmpDay1=convert(char(2),day(@dt))
	select @tmpDay=strDay from DayTable where intDay=@tmpDay1
--	set @prefix=@tmpYear+ '_'+@tmpMonth+@tmpDay
	set @prefix=@tmpYear+@tmpMonth+@tmpDay
	select @tmpPrefix=Prefix from BoxNumber

	--checkboxnumber
	select @rowID=min(rowID) from tmpBoxNumber where IsUsing='0' and Packed='0'
	select @checkboxnumber=BoxNumber from tmpBoxNumber where rowID=@rowID
	--checkboxnumber

	if (@tmpPrefix<>@prefix) or (@checkboxnumber IS NULL OR @checkboxnumber ='') --time to udate 1000 box
		begin
			set @box=0
			update BoxNumber set Prefix=@prefix,Number=@box,PYear=@pYear
			delete from tmpBoxNumber where IsUsing='0'
			begin transaction
			while (@i<1000)
				begin
					set @boxNumber=@prefix+right(('000'+rtrim(ltrim(@i))),3)
					if not exists (select BoxNumber from tmpBoxNumber where BoxNumber=@boxNumber)
					begin
						insert into tmpBoxNumber (BoxNumber,IsUsing,Packed) values (@boxNumber,0,0)
					end
					set @i=@i+1
				end
			commit transaction
		end
	select @box=count(*) from tmpBoxNumber where IsUsing='0' and Packed='1'
	update BoxNumber set Number=@box
	set @result='OK'
	if (rtrim(ltrim(@box))='999')
		begin
			set @result='Over 1000'
		end
	
	select @result as Result
	select @pYear as PYear
	return

	/*
	exec ame_getboxnumber
	exec ame_checkboxnumber

		--checkboxnumber
	
	select BoxNumber from tmpBoxNumber where rowID in
	(select min(rowID) from tmpBoxNumber where IsUsing='0' and Packed='0')
	--checkboxnumber
	*/
GO