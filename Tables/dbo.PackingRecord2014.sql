CREATE TABLE [dbo].[PackingRecord2014] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NOT NULL,
  [BoxNumber] [nchar](10) NULL,
  [PackingDateTime] [datetime] NULL,
  [PYear] [char](10) NULL,
  [ID] [int] IDENTITY
)
ON [PRIMARY]
GO