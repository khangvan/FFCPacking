SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
Create Procedure [dbo].[ame_Insert_ProductMap]
	@SAPModel char(30),
	@ProductMap char(30),
	@Description char(200) = NULL,
	@ProductLine varchar(30) = NULL,
	@MPN nchar(20) = NULL
As
Begin
	Insert Into ProductMap
		([SAPModel],[ProductMap],[Description],[ProductLine],[MPN])
	Values
		(@SAPModel,@ProductMap,@Description,@ProductLine,@MPN)

End
GO