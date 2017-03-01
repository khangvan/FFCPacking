CREATE TABLE [dbo].[PackingRecord] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NOT NULL,
  [BoxNumber] [nchar](10) NULL,
  [PackingDateTime] [datetime] NULL,
  [PYear] [char](10) NULL,
  [ID] [int] IDENTITY,
  CONSTRAINT [PK_PackingRecordNew] PRIMARY KEY CLUSTERED ([ID]) WITH (FILLFACTOR = 60)
)
ON [PRIMARY]
GO

CREATE UNIQUE INDEX [IX_PackingRecord]
  ON [dbo].[PackingRecord] ([Serial])
  WITH (FILLFACTOR = 60)
  ON [PRIMARY]
GO

CREATE INDEX [NonClusteredIndex-20150817-120300]
  ON [dbo].[PackingRecord] ([PONumber], [Serial], [BoxNumber])
  ON [PRIMARY]
GO

CREATE INDEX [Packing_BOX]
  ON [dbo].[PackingRecord] ([BoxNumber])
  ON [PRIMARY]
GO

SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE TRIGGER [dlvn_TriggerRecordPackaging] ON [dbo].[PackingRecord] 
FOR INSERT
AS
	set nocount on
	begin
		DELETE FROM [DLVNDB].[dbo].[PackagingRecord] WHERE DATEDIFF(DAY,PackingDateTime,GETDATE()-3) >= '0'
		INSERT INTO [DLVNDB].[dbo].[PackagingRecord] (PONumber,Model,Serial,PackingDateTime)
				SELECT PONumber,Model,Serial,PackingDateTime FROM inserted
	end
GO