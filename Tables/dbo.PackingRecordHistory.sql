CREATE TABLE [dbo].[PackingRecordHistory] (
  [ID] [int] IDENTITY,
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NOT NULL,
  [BoxNumber] [nchar](10) NULL,
  [PackingDateTime] [datetime] NULL,
  [Opcode] [nchar](10) NULL,
  [Reason] [nchar](20) NULL,
  [RemoveDateTime] [datetime] NULL
)
ON [PRIMARY]
GO