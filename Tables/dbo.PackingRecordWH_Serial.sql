CREATE TABLE [dbo].[PackingRecordWH_Serial] (
  [OPName] [varchar](20) NOT NULL,
  [Model] [varchar](30) NOT NULL,
  [SerialNumber] [varchar](50) NOT NULL,
  [DeliveryNumber] [varchar](30) NOT NULL,
  [QtyDel] [int] NULL,
  [Packaging_Date] [datetime] NULL
)
ON [PRIMARY]
GO