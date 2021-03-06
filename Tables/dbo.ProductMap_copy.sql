﻿CREATE TABLE [dbo].[ProductMap_copy] (
  [SAPModel] [char](30) NOT NULL,
  [ProductMap] [char](30) NOT NULL,
  [Description] [char](200) NULL,
  [ProductLine] [varchar](30) NULL,
  [MPN] [nchar](20) NULL,
  [SNProfile] [varchar](10) NULL,
  [COO] [varchar](20) NULL,
  [LoadDate] [datetime] NULL,
  [ChangeDate] [datetime] NULL,
  PRIMARY KEY CLUSTERED ([SAPModel])
)
ON [PRIMARY]
GO