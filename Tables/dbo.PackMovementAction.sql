CREATE TABLE [dbo].[PackMovementAction] (
  [PONumber] [nchar](30) NULL,
  [Model] [nchar](30) NULL,
  [Serial] [nchar](30) NOT NULL,
  [BoxNumber] [nchar](10) NULL,
  [PackingDateTime] [datetime] NULL,
  [ActionDate] [datetime] NOT NULL,
  [ActionType] [varchar](6) NOT NULL,
  [ActionBy] [varchar](30) NULL
)
ON [PRIMARY]
GO