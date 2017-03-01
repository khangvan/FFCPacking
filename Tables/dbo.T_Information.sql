CREATE TABLE [dbo].[T_Information] (
  [T_ProdOrder] [nchar](20) NOT NULL,
  [T_ProductMap] [nchar](20) NULL,
  [T_Material] [nchar](20) NULL,
  [T_Revision] [char](10) NULL,
  [T_Quantity] [int] NULL,
  [T_Packed] [int] NULL,
  [ShipDate] [datetime] NULL,
  [IDOrder] [int] IDENTITY,
  [StartPackAt] [datetime2] NULL,
  [TestRequireDate] [datetime] NULL,
  PRIMARY KEY CLUSTERED ([T_ProdOrder]),
  UNIQUE ([T_ProdOrder])
)
ON [PRIMARY]
GO

CREATE INDEX [idxT_ProdOrder]
  ON [dbo].[T_Information] ([T_ProdOrder])
  ON [PRIMARY]
GO

CREATE INDEX [NonClusteredIndex-20150817-140705]
  ON [dbo].[T_Information] ([T_ProdOrder])
  ON [PRIMARY]
GO