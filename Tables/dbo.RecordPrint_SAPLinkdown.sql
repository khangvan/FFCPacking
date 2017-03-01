CREATE TABLE [dbo].[RecordPrint_SAPLinkdown] (
  [POnumber] [varchar](30) NOT NULL,
  [Model] [varchar](50) NULL,
  [QtyperPO] [varchar](20) NULL,
  [StartSN] [varchar](30) NOT NULL,
  [QtyofPrinting] [varchar](20) NOT NULL,
  [DateLog] [datetime] NULL,
  CONSTRAINT [PK_RecordPrint_SAPLinkdown] PRIMARY KEY CLUSTERED ([POnumber])
)
ON [PRIMARY]
GO