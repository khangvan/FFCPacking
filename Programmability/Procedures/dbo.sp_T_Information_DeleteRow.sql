SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- ==========================================================================================
-- Entity Name:	sp_T_Information_DeleteRow
-- Author:	Mehdi Keramati
-- Create date:	1/13/2014 11:48:21 PM
-- Description:	This stored procedure is intended for deleting a specific row from T_Information table
-- ==========================================================================================
Create Procedure [dbo].[sp_T_Information_DeleteRow]
	@T_ProdOrder nchar(20)
As
Begin
	Delete T_Information
	Where
		[T_ProdOrder] = @T_ProdOrder

End

GO