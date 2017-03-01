SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_tffc_serialnumbers_consume_Serial]
	-- Add the parameters for the stored procedure here
	@PO nchar(20), 
	@Serial nchar(20),
	@BaseSerial nchar(20)
	--@iCountAVL int OUTPUT ,
	--@ALVSerial nchar(20) OUTPUT
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	IF EXISTS (SELECT * FROM dbo.TFFC_SerialNumbers tsn WHERE tsn.TFFC_ProdOrder=@PO AND tsn.TFFC_SerialNumber = @Serial)

	BEGIN
	UPDATE TFFC_SerialNumbers SET TFFC_SerialNumbers.TFFC_Baselink = @BaseSerial WHERE TFFC_ProdOrder=@PO AND TFFC_SerialNumber = @Serial
	end


END
GO