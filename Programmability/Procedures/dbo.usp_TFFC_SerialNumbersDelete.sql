SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_TFFC_SerialNumbersDelete] 
    @PO nchar(12)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	DELETE
	FROM   [dbo].[TFFC_SerialNumbers]
	WHERE  [TFFC_ProdOrder] = @PO

	COMMIT
GO