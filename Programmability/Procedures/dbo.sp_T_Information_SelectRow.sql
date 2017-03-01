SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- ==========================================================================================
-- Entity Name:	sp_T_Information_SelectRow
-- Author:	Mehdi Keramati
-- Create date:	1/13/2014 11:48:20 PM
-- Description:	This stored procedure is intended for selecting a specific row from T_Information table
-- ==========================================================================================
Create Procedure [dbo].[sp_T_Information_SelectRow]
	@T_ProdOrder nchar(20)
As
Begin
	Select 
		[T_ProdOrder],
		[T_ProductMap],
		[T_Material],
		[T_Revision],
		[T_Quantity],
		[T_Packed]
	From T_Information
	Where
		[T_ProdOrder] = @T_ProdOrder
End

GO