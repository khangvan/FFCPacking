CREATE TABLE [dbo].[ProdPackingRecord] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NULL,
  [BoxNumber] [nchar](10) NULL,
  [PackingDateTime] [datetime] NULL,
  [Series] [nchar](15) NULL,
  [Line] [nchar](15) NULL
)
ON [PRIMARY]
GO