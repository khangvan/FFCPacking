CREATE TABLE [dbo].[TDLM_SerialNumbers] (
  [TDLM_ProdOrder] [nchar](20) NULL,
  [TDLM_SerialNumber] [nchar](20) NOT NULL,
  [TDLM_Material] [char](20) NULL,
  CONSTRAINT [PK_TDLM_SerialNumbers] PRIMARY KEY CLUSTERED ([TDLM_SerialNumber])
)
ON [PRIMARY]
GO