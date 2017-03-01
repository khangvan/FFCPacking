CREATE TABLE [dbo].[ProductMap_NOUSE] (
  [SAPModel] [char](30) NOT NULL,
  [ProductMap] [char](30) NOT NULL,
  [Description] [char](200) NULL,
  [ProductLine] [varchar](30) NULL,
  [MPN] [nchar](20) NULL,
  [SNProfile] [varchar](10) NULL,
  [COO] [varchar](20) NULL,
  [LoadDate] [datetime] NULL,
  [ChangeDate] [datetime] NULL,
  CONSTRAINT [PK_ProductMap] PRIMARY KEY CLUSTERED ([SAPModel])
)
ON [PRIMARY]
GO