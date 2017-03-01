SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_TFFC_SerialNumbersInsert] 
    @TFFC_ProdOrder nchar(20) = NULL,
    @TFFC_Material nchar(20) = NULL,
    @TFFC_SerialNumber nchar(20)
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  
	
	BEGIN TRAN
	
	INSERT INTO [dbo].[TFFC_SerialNumbers] ([TFFC_ProdOrder], [TFFC_Material], [TFFC_SerialNumber])
	SELECT @TFFC_ProdOrder, @TFFC_Material, @TFFC_SerialNumber
	
	-- Begin Return Select <- do not remove
	SELECT [idSN], [TFFC_ProdOrder], [TFFC_Material], [TFFC_SerialNumber]
	FROM   [dbo].[TFFC_SerialNumbers]
	WHERE  [idSN] = SCOPE_IDENTITY()
	-- End Return Select <- do not remove
               
	COMMIT
GO