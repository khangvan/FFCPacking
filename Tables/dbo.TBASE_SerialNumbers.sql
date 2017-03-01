CREATE TABLE [dbo].[TBASE_SerialNumbers] (
  [TBASE_ProdOrder] [nchar](20) NULL,
  [TBASE_Material] [nchar](20) NULL,
  [TBASE_SerialNumber] [nchar](20) NOT NULL,
  CONSTRAINT [PK_TBASE_SerialNumbers] PRIMARY KEY CLUSTERED ([TBASE_SerialNumber])
)
ON [PRIMARY]
GO