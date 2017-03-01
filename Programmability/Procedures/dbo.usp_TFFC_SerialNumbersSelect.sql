SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[usp_TFFC_SerialNumbersSelect] 
    @idSN int
AS 
	SET NOCOUNT ON 
	SET XACT_ABORT ON  

	BEGIN TRAN

	SELECT [idSN], [TFFC_ProdOrder], [TFFC_Material], [TFFC_SerialNumber] 
	FROM   [dbo].[TFFC_SerialNumbers] 
	WHERE  ([idSN] = @idSN OR @idSN IS NULL) 

	COMMIT
GO