CREATE TABLE [dbo].[tmpBTFileMapping] (
  [ID] [int] IDENTITY,
  [Filemap] [nchar](20) NULL,
  [FileName] [nchar](20) NULL,
  [LocalFile] [nchar](70) NULL,
  [ServerFile] [nchar](100) NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID])
)
ON [PRIMARY]
GO