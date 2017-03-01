SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO








-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_tffc_serialnumbers_checkALV_getnextSerial]
	-- Add the parameters for the stored procedure here
	@PO nchar(20)
	--@iCountAVL int OUTPUT ,
	--@ALVSerial nchar(20) OUTPUT
	as
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.

	
declare	@iCountAVL int  
declare	@ALVSerial nchar(20) 
DECLARE @result nchar(20) 

SET @iCountAVL=0
SET @result='NG'
    -- Insert statements for procedure here
	SELECT @iCountAVL= count(tsn.TFFC_SerialNumber) FROM dbo.TFFC_SerialNumbers tsn WHERE tsn.TFFC_ProdOrder =@PO 
	AND tsn.TFFC_Baselink IS NULL

	IF (@iCountAVL > 0) 
	BEGIN
	set @result ='OK' 
	--get next serialnumber
	SELECT  top 1 @ALVSerial= (TFFC_SerialNumber) FROM dbo.TFFC_SerialNumbers tsn WHERE tsn.TFFC_ProdOrder =@PO AND tsn.TFFC_Baselink IS NULL
	SELECT @result AS Result
	select @iCountAVL AS qtyALV
	select @ALVSerial AS snALV

	SELECT  TFFC_SerialNumber FROM dbo.TFFC_SerialNumbers tsn WHERE tsn.TFFC_ProdOrder = @PO AND tsn.TFFC_Baselink IS NULL
	
	END
	ELSE
	BEGIN
	SET @iCountAVL=0
SET @result='NG'
SELECT @result AS Result
	select @iCountAVL AS qtyALV
	end


END


--	SELECT  * FROM dbo.TFFC_SerialNumbers tsn WHERE 
--	--tsn.TFFC_Baselink IS NULL and
--tsn.TFFC_ProdOrder ='000100778921' 
GO