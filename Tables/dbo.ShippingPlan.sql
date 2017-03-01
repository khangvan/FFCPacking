CREATE TABLE [dbo].[ShippingPlan] (
  [ID] [int] IDENTITY,
  [Order] [nchar](20) NOT NULL,
  [ShipDate] [datetime] NULL,
  [ShipTo] [nchar](30) NULL,
  PRIMARY KEY CLUSTERED ([ID]),
  UNIQUE ([ID])
)
ON [PRIMARY]
GO