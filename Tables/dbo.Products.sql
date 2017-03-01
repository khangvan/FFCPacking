﻿CREATE TABLE [dbo].[Products] (
  [ProductID] [int] NOT NULL,
  [ProductName] [varchar](100) NULL,
  [Rate] [money] NULL,
  PRIMARY KEY CLUSTERED ([ProductID])
)
ON [PRIMARY]
GO