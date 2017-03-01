CREATE TABLE [dbo].[MonthTable] (
  [intMonth] [int] NOT NULL,
  [strMonth] [char](10) NULL,
  CONSTRAINT [PK_MonthTable] PRIMARY KEY CLUSTERED ([intMonth])
)
ON [PRIMARY]
GO