SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_PackingInformation]--<Procedure_Name, sysname, ProcedureName> 
	---- Add the parameters for the stored procedure here
	--<@Param1, sysname, @p1> <Datatype_For_Param1, , int> = <Default_Value_For_Param1, , 0>, 
	--<@Param2, sysname, @p2> <Datatype_For_Param2, , int> = <Default_Value_For_Param2, , 0>

AS
declare @Model varchar(50)
declare @Description varchar(50)
declare @SingleBoxNumber varchar(20)
declare @OverpackBoxNumber varchar(20)
declare @PalletNumber varchar(20)
declare @ShippingType varchar(10)
declare @MaxOverpackBoxperLayer varchar(20)
declare @MaxLayerperPallet varchar(20)
declare @MaxScannerperOverpackBox varchar(20)
declare @PkgProductFamily varchar(50)
declare @LineID varchar(20)
declare	@Status VARCHAR(5)=NULL,
	@ErrorMsg VARCHAR(10) = NULL,@Title varchar(MAX)=NULL
BEGIN

		IF NOT EXISTS (SELECT * FROM PackagingInformation WHERE Model=@Model)
	BEGIN
		SET @ErrorMsg =@Title + ' Already Exists'
				RAISERROR (@ErrorMsg,11,1)
				return
		END

	ELSE IF(@Status='I')
	BEGIN
		INSERT INTO dbo.PackagingInformation
	        ( Model, [Description],SingleBoxNumber,OverpackBoxNumber,PalletNumber,ShippingType,
				MaxOverpackBoxperLayer,MaxLayerperPallet,MaxScannerperOverpackBox,PkgProductFamily,LineID  )
		VALUES  ( @Model,@Description,@SingleBoxNumber,@OverpackBoxNumber,@PalletNumber,@ShippingType,
				@MaxOverpackBoxperLayer,@MaxLayerperPallet,@MaxScannerperOverpackBox,@PkgProductFamily,@LineID)
	END
END
GO