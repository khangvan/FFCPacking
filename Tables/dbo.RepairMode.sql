CREATE TABLE [dbo].[RepairMode] (
  [RepairID] [nchar](10) NOT NULL,
  [Description] [nchar](1000) NULL,
  CONSTRAINT [pk_RepairID] PRIMARY KEY CLUSTERED ([RepairID])
)
ON [PRIMARY]
GO