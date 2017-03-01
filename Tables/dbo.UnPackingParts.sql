CREATE TABLE [dbo].[UnPackingParts] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NULL
)
ON [PRIMARY]
GO

CREATE INDEX [IX_UnPackingParts]
  ON [dbo].[UnPackingParts] ([Serial], [Model])
  ON [PRIMARY]
GO