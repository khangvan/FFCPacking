CREATE TABLE [dbo].[tmpPackingRecord] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NOT NULL,
  [BoxNumber] [nchar](30) NULL,
  [PackingDateTime] [datetime] NULL,
  [PYear] [char](10) NULL,
  CONSTRAINT [PK_tmpPackingRecord] PRIMARY KEY CLUSTERED ([Serial])
)
ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER OFF

SET ANSI_NULLS ON
GO
CREATE TRIGGER [SetSeries] ON [dbo].[tmpPackingRecord] 
FOR INSERT
AS
	declare @iModel nchar(30)
	declare @iSerial nchar(30)
	declare @iSeries nchar(30)
	declare @iLine nchar(30)
	set nocount on

	select @iModel=Model from inserted
	select @iSerial=Serial from inserted

	begin
		if exists(select distinct Model from DLMDB.dbo.KANBANModelSeries where Model=@iModel)
		begin
			select @iSeries=Series,@iLine=Sect from DLMDB.dbo.KANBANModelSeries where Model=@iModel
			update tmpPackingRecord set Series=@iSeries,Line=@iLine where Serial=@iSerial
		end
		else
		begin
			update tmpPackingRecord set Series='None' where Serial=@iSerial
		end
	end
GO

DISABLE TRIGGER [dbo].[SetSeries] ON [dbo].[tmpPackingRecord]
GO