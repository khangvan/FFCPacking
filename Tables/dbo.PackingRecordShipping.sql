CREATE TABLE [dbo].[PackingRecordShipping] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NOT NULL,
  [BoxNumber] [nchar](10) NULL,
  [PackingDateTime] [datetime] NULL,
  [PYear] [char](10) NULL,
  [ID] [int] NOT NULL,
  [Station] [varchar](20) NULL,
  PRIMARY KEY CLUSTERED ([ID])
)
ON [PRIMARY]
GO