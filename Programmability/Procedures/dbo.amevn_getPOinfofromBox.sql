SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[amevn_getPOinfofromBox]
	@box char(20)=NULL
 AS
	set nocount ON
	DECLARE @POtemp nchar(20)
	DECLARE @iCount int
	if exists (SELECT top 1 * from packingrecord WHERE dbo.packingrecord.BoxNumber =@box)
	begin
		 SELECT  top 1 @POtemp= POnumber from packingrecord WHERE dbo.packingrecord.BoxNumber =@box
		 SELECT @iCount= COUNT(*) from packingrecord WHERE dbo.packingrecord.BoxNumber =@box
		 select *, @box AS Boxnumber, @iCount AS SL from T_Information where T_ProdOrder = @POtemp
		 SELECT * from packingrecord WHERE dbo.packingrecord.BoxNumber =@box
	end
	
	
	return
GO