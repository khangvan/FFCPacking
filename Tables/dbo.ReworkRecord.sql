CREATE TABLE [dbo].[ReworkRecord] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NULL,
  [BoxNumber] [nchar](30) NULL,
  [PackingDateTime] [datetime] NULL,
  [PYear] [char](10) NULL,
  [ReworkNo] [int] NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IX_ReworkRecord]
  ON [dbo].[ReworkRecord] ([BoxNumber], [PONumber])
  ON [PRIMARY]
GO