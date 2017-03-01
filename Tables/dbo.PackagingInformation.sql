CREATE TABLE [dbo].[PackagingInformation] (
  [Model] [varchar](50) NULL,
  [Description] [varchar](50) NULL,
  [SingleBoxNumber] [varchar](20) NULL,
  [OverpackBoxNumber] [varchar](20) NULL,
  [PalletNumber] [varchar](20) NOT NULL,
  [ShippingType] [varchar](10) NULL,
  [MaxOverpackBoxperLayer] [varchar](20) NULL,
  [MaxLayerperPallet] [varchar](20) NULL,
  [MaxScannerperOverpackBox] [varchar](20) NULL,
  [PkgProductFamily] [varchar](50) NULL,
  [LineID] [varchar](20) NULL
)
ON [PRIMARY]
GO