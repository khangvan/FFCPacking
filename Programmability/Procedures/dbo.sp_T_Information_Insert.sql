SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- ==========================================================================================
-- Entity Name:	sp_T_Information_Insert
-- Author:	Mehdi Keramati
-- Create date:	1/13/2014 11:48:21 PM
-- Description:	This stored procedure is intended for inserting values to T_Information table
-- ==========================================================================================
Create Procedure [dbo].[sp_T_Information_Insert]
	@T_ProdOrder nchar(20),
	@T_ProductMap nchar(20),
	@T_Material nchar(20),
	@T_Revision char(10),
	@T_Quantity int,
	@T_Packed int
As
Begin
	Insert Into T_Information
		([T_ProdOrder],[T_ProductMap],[T_Material],[T_Revision],[T_Quantity],[T_Packed])
	Values
		(@T_ProdOrder,@T_ProductMap,@T_Material,@T_Revision,@T_Quantity,@T_Packed)

End

GO