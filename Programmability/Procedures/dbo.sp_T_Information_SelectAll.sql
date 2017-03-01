SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- ==========================================================================================
-- Entity Name:	sp_T_Information_SelectAll
-- Author:	Mehdi Keramati
-- Create date:	1/13/2014 11:48:20 PM
-- Description:	This stored procedure is intended for selecting all rows from T_Information table
-- ==========================================================================================
Create Procedure [dbo].[sp_T_Information_SelectAll]
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
End

GO