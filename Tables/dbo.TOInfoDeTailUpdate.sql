CREATE TABLE [dbo].[TOInfoDeTailUpdate] (
  [TOInfoDetail_Number] [nvarchar](max) NOT NULL,
  [TOInfoDetail_Partnumber] [nvarchar](max) NOT NULL,
  [TOInfoDetail_Description] [nvarchar](max) NOT NULL,
  [TOInfoDetail_Qty] [int] NOT NULL
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO