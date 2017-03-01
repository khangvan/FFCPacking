CREATE TABLE [dbo].[TFFC_SerialNumbers] (
  [TFFC_ProdOrder] [nchar](20) NULL,
  [TFFC_Material] [nchar](20) NULL,
  [TFFC_SerialNumber] [nchar](20) NOT NULL,
  [idSN] [int] IDENTITY,
  [TFFC_Baselink] [nchar](20) NULL,
  [PrintCount] [int] NOT NULL DEFAULT (0),
  [Pr_StartDate] [datetime] NULL,
  [Pr_LastDate] [datetime] NULL,
  [Pr_OpStart] [nchar](30) NULL,
  [Pr_OpLast] [nchar](30) NULL,
  PRIMARY KEY CLUSTERED ([idSN])
)
ON [PRIMARY]
GO

CREATE INDEX [NonClusteredIndex-20151123-084913]
  ON [dbo].[TFFC_SerialNumbers] ([TFFC_ProdOrder], [TFFC_SerialNumber])
  ON [PRIMARY]
GO