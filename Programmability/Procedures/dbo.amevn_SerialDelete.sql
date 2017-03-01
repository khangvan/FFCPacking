SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
 --EXEC [amevn_SerialDelete] 'G15G06188' , '20100156', 'TEST'
 --SELECT * FROM FFCPacking.dbo.PackingRecordHistory
-- =============================================
CREATE PROCEDURE [dbo].[amevn_SerialDelete] @Serial nchar(30), @Opcode nchar(20), @Reason nchar(30)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

-- SP Packing processing
-- Serial
-- Opcode
-- Reason

--DECLARE @Serial nchar(30)
DECLARE @Box nchar(10)
DECLARE @packingDatetime datetime
DECLARE @PO nchar(20)
DECLARE @Model nchar(20)
 DECLARE @OKtoDelete bit

--SELECT @PO=PONumber, @Model= Model, @Serial=Serial,@Box= BoxNumber FROM  ffcpacking.dbo.packingrecord WHERE Serial = @Serial
--SELECT @PO=PONumber, @Model= Model, @Serial=Serial,@Box= BoxNumber FROM  ffcpacking.dbo.packingrecord WHERE Serial = @Serial
IF (EXISTS (SELECT * FROM  ffcpacking.dbo.packingrecord WHERE Serial = @Serial))
BEGIN
SELECT @PO=PONumber, @Model= Model, @Serial=Serial,@Box= BoxNumber FROM  ffcpacking.dbo.packingrecord WHERE Serial = @Serial
SET @OKtoDelete =1
END


--------------G15G06188                     

if(@OKtoDelete=1)
BEGIN
-- move here by insert 
INSERT INTO packingrecordhistory
SELECT  PONumber, Model, Serial, BoxNumber, PackingDateTime, @Opcode, @Reason, getdate()
FROM dbo.PackingRecord pr WHERE pr.Serial=@Serial
-- then delete

DELETE FROM dbo.PackingRecord  WHERE Serial=@Serial
end
END
GO