SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_TFFC_SerialNumbersUpdate] 
    @idSN int,
    @TFFC_ProdOrder nchar(20) = NULL,
    @TFFC_Material nchar(20) = NULL,
    @TFFC_SerialNumber nchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN

	UPDATE [dbo].[TFFC_SerialNumbers]
	SET    [TFFC_ProdOrder] = @TFFC_ProdOrder, [TFFC_Material] = @TFFC_Material, [TFFC_SerialNumber] = @TFFC_SerialNumber
	WHERE  [idSN] = @idSN
	
	-- Begin Return Select <- do not remove
	SELECT [idSN], [TFFC_ProdOrder], [TFFC_Material], [TFFC_SerialNumber]
	FROM   [dbo].[TFFC_SerialNumbers]
	WHERE  [idSN] = @idSN	
	-- End Return Select <- do not remove

	COMMIT
GO