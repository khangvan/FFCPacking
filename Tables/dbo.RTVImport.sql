CREATE TABLE [dbo].[RTVImport] (
  [RTVID] [int] IDENTITY,
  [RTVLot] [nchar](10) NULL,
  [ProdOrder] [nchar](10) NULL,
  [Model] [nchar](10) NULL,
  [SN] [nchar](10) NULL,
  [CheckDate] [datetime] NULL,
  [Status] [nchar](10) NULL,
  PRIMARY KEY CLUSTERED ([RTVID])
)
ON [PRIMARY]
GO