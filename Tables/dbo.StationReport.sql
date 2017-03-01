CREATE TABLE [dbo].[StationReport] (
  [IDRPT] [int] IDENTITY,
  [StationName] [nchar](30) NULL,
  [IP] [nchar](20) NULL,
  [PPVersion] [nchar](20) NULL,
  [StartUpPath] [nchar](500) NULL,
  [StartUpTime] [date] NOT NULL,
  [Status] [nchar](20) NULL,
  [IDKey] [int] NULL,
  PRIMARY KEY CLUSTERED ([IDRPT]),
  UNIQUE ([IDRPT])
)
ON [PRIMARY]
GO