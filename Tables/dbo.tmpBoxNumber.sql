CREATE TABLE [dbo].[tmpBoxNumber] (
  [BoxNumber] [char](10) NULL,
  [IsUsing] [char](1) NULL,
  [Packed] [char](1) NULL,
  [rowID] [int] IDENTITY,
  CONSTRAINT [PK_tmpBoxNumber] PRIMARY KEY CLUSTERED ([rowID])
)
ON [PRIMARY]
GO