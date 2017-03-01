CREATE TABLE [dbo].[LabelcodeFruPP] (
  [Family] [char](15) NOT NULL,
  [Model] [char](30) NOT NULL,
  [Des] [char](99) NOT NULL,
  [Characteristic] [char](5) NOT NULL,
  [PPorBuild] [char](5) NULL,
  [Irregular] [nchar](50) NULL,
  CONSTRAINT [PK_LabelcodeFruPP] PRIMARY KEY CLUSTERED ([Model])
)
ON [PRIMARY]
GO