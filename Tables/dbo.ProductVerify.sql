CREATE TABLE [dbo].[ProductVerify] (
  [IDChecking] [int] IDENTITY,
  [IsPacked] [bit] NULL,
  [BelongOrder] [bit] NULL,
  [IsTest] [bit] NULL,
  [IsConfig] [bit] NULL,
  [ProductMap] [nchar](20) NULL,
  PRIMARY KEY CLUSTERED ([IDChecking])
)
ON [PRIMARY]
GO