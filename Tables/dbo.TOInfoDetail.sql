CREATE TABLE [dbo].[TOInfoDetail] (
  [TOInfoDetail_ID] [int] IDENTITY,
  [TOInfoDetail_Number] [nvarchar](max) NOT NULL,
  [TOInfoDetail_Partnumber] [nvarchar](max) NOT NULL,
  [TOInfoDetail_Description] [nvarchar](max) NOT NULL,
  [TOStatus_ID] [nvarchar](max) NULL,
  [TOInfoDetail_Qty] [int] NOT NULL,
  [TOInfoDetail_PickedDate] [datetime] NULL,
  [Opcode_ID] [int] NULL,
  [TOInfoDetail_LoadDate] [datetime] NULL,
  [TOInfoDetail_OrderNum] [int] NOT NULL,
  CONSTRAINT [PK_TOInfoDetail] PRIMARY KEY CLUSTERED ([TOInfoDetail_ID])
)
ON [PRIMARY]
TEXTIMAGE_ON [PRIMARY]
GO