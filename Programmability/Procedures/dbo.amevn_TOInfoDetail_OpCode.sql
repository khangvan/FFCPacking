SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		/*Author*/
-- Create date: /*Create Date*/
-- Description:	/*Description*/
-- [amevn_TOInfoDetail_OpCode] 'CheckOrInsert','2548892','199464100',''

-- =============================================
CREATE PROCEDURE [dbo].[amevn_TOInfoDetail_OpCode] @OperationType nchar(30)
,                                                 @ToNum nchar(30)         =''
,                                                 @ToPart nchar(30)       = ''
,                                                 @Opcode nchar(30)       = 0
AS
BEGIN /**********| Begin SP |07/30/2016|10:46:25 | kvan*****************************/

	SET NOCOUNT ON;

	--/***| test para  |07/30/2016|11:55:31 | kvan*****************************/
	--	-- exec amevn_TOInfoDetail_Process 'viewall', '2548892'
	--	-- select * from  TOInfoDetail

	--/**********| delete |07/30/2016|10:39:30 | kvan*****************************/
	--	IF (@OperationType = 'DELETE')
	--	BEGIN


	--TRUNCATE TABLE TOInfoDeTailUpdate

	--END
	--/**********| Merge |07/30/2016|10:44:20 | kvan*****************************/
	--IF (@OperationType = 'MERGE')
	--	BEGIN

	-- MERGE FFCPacking.dbo.TOInfoDeTail AS TARGET
	-- uSING (SELECT td.TOInfoDetail_Number,td.TOInfoDetail_Partnumber,td.TOInfoDetail_Description, td.TOInfoDetail_Qty, getdate() AS TOInfoDetail_LoadDate, 0 AS TOStatus_ID FROM dbo.TOInfoDeTailUpdate td) AS SOURCE
	-- ON (TARGET.TOInfoDeTail_Number= SOURCE.TOInfoDeTail_Number
	-- AND TARGET.TOInfoDeTail_ParTnumber=SOURCE.TOInfoDeTail_ParTnumber
	-- AND TARGET.TOInfoDeTail_DeScripTion=SOURCE.TOInfoDeTail_DeScripTion)
	-- WHEN MATCHED
	-- THEN UPDATE SET TARGET.TOInfoDeTail_QTy= SOURCE.TOInfoDeTail_QTy
	-- WHEN NOT MATCHED BY TARGET
	-- THEN INSERT (TOInfoDeTail_Number ,TOInfoDeTail_ParTnumber,TOInfoDeTail_DeScripTion,TOInfoDeTail_QTy, TOInfoDetail_LoadDate, TOStatus_ID ) valueS
	-- (SOURCE.TOInfoDeTail_Number,SOURCE.TOInfoDeTail_ParTnumber,SOURCE.TOInfoDeTail_DeScripTion,SOURCE.TOInfoDeTail_QTy, SOURCE.TOInfoDetail_LoadDate, SOURCE.TOStatus_ID)
	-- --WHEN NOT MATCHED BY SOURCE THEN
	-- --DELETE
	-- ;

	-- TRUNCATE TABLE dbo.TOInfoDetailUpdate
	-- RETURN;
	-- END

	/**********| Update TO-Part |07/30/2016|10:44:20 | kvan*****************************/
	IF (@OperationType = 'Update')
	BEGIN
		UPDATE dbo.TOInfoDetail
		SET dbo.TOInfoDetail.TOStatus_ID             = 2
		, -- nvarchar
		    dbo.TOInfoDetail.TOInfoDetail_PickedDate = getdate()
		,   dbo.TOInfoDetail.Opcode_ID               = @Opcode -- int

		WHERE
			--TOInfoDetail_ID - this column value is auto-generated
			dbo.TOInfoDetail.TOInfoDetail_Number = @ToNum AND -- nvarchar
			dbo.TOInfoDetail.TOInfoDetail_Partnumber = @ToPart and-- nvarchar
			dbo.TOInfoDetail.TOStatus_ID = 0 -- nvarchar

	end

	--- check PArt ext to uinssert
	IF (@OperationType = 'CheckOrInsert')
	BEGIN
		--DECLARE @ToPart  varchar(20)
		--DECLARE @tonum varchar(20)
		--SET @ToPart ='199464100' --temp
		--SET @tonum ='2548892' --temp

		DECLARE @icount int

		SET @icount =0

		SELECT @icount=max(td.TOInfoDetail_OrderNum)
		FROM dbo.TOInfoDetail td
		WHERE TOInfoDetail_Number = @ToNum -- nvarchar

		IF EXISTS (
			SELECT *
			FROM dbo.TOInfoDetail td
			WHERE td.TOStatus_ID =2
				AND td.TOInfoDetail_Partnumber =@ToPart) 
			--	AND NOT EXISTS (SELECT *
			--FROM dbo.TOInfoDetail td
			--WHERE td.TOStatus_ID =0
			--	AND td.TOInfoDetail_Partnumber =@ToPart)

		BEGIN -- do insert

			insert INTO dbo.TOInfoDetail ( 
			TOInfoDetail_Number, TOInfoDetail_Partnumber, 
			TOInfoDetail_Description, TOStatus_ID, TOInfoDetail_Qty, 
			TOInfoDetail_PickedDate, Opcode_ID, TOInfoDetail_LoadDate, 
			TOInfoDetail_OrderNum )
			SELECT
			--TOInfoDetail_ID
			  TOInfoDetail_Number
			, TOInfoDetail_Partnumber
			, TOInfoDetail_Description
			, 0 as TOStatus_ID
			, TOInfoDetail_Qty
			, TOInfoDetail_PickedDate
			, Opcode_ID
			, GETDATE() as TOInfoDetail_LoadDate
			, @icount+1 as TOInfoDetail_OrderNum

			FROM dbo.TOInfoDetail td
			WHERE td.TOStatus_ID =2
				AND td.TOInfoDetail_Partnumber =@ToPart


		end
	end

	--  /**********| View TO-All |07/30/2016|10:44:20 | kvan*****************************/
	--IF (@OperationType = 'CheckExist')
	--	BEGIN

	--	SELECT *
	----	td.TOInfoDetail_Number
	----,      td.TOInfoDetail_Partnumber
	----,      td.TOInfoDetail_Description
	----,      td.TOInfoDetail_Qty
	--	FROM dbo.TOInfoDetail td
	--	WHERE td.TOInfoDetail_Number= @ToNum
	--	END


	-- -- exec amevn_TOInfoDetail_Process 'CheckExist','2548899'
	--  /**********| View TO-All |07/30/2016|10:44:20 | kvan*****************************/
	--IF (@OperationType = 'ViewAll')
	--	BEGIN

	--	SELECT
	--	td.TOInfoDetail_Number AS TO_Number
	--,      td.TOInfoDetail_Partnumber AS Part_PP
	--,      td.TOInfoDetail_Description AS Part_Description
	--,      td.TOInfoDetail_Qty AS Qty
	--,td.TOInfoDetail_LoadDate AS StartAt_PP
	--,td.TOInfoDetail_PickedDate AS CompleteAt_PP
	--,td.Opcode_ID AS Operator

	--	FROM dbo.TOInfoDetail td
	--	WHERE td.TOInfoDetail_Number= @ToNum

	--	SELECT 'NoData' AS Result
	--	END

	--/**********| View TO-All |07/30/2016|10:44:20 | kvan*****************************/
	--IF (@OperationType = 'ToDo')
	--	BEGIN

	--SELECT td.TOInfoDetail_Number
	--,      td.TOInfoDetail_Partnumber
	--,      td.TOInfoDetail_Description
	--,      td.TOInfoDetail_Qty
	--FROM dbo.TOInfoDetail td
	--WHERE td.TOInfoDetail_Number= @ToNum AND (td.TOStatus_ID =0 OR td.TOStatus_ID IS NULL OR TOStatus_ID='')
	--SELECT 'NoData' AS Result
	--	end
	/***| Done all Here |07/30/2016|11:52:58 | kvan*****************************/

END /**********| Endof SP |07/30/2016|10:46:06 | kvan*****************************/

	/***|test start  |07/30/2016|11:08:28 | kvan*****************************/

	/***|test end  |07/30/2016|11:08:32 | kvan*****************************/
	/**********| Code below for Innitial  |07/30/2016|10:45:02 | kvan*****************************/
	RETURN;
	/**********| Create updatetbale |07/30/2016|10:38:55 | kvan*****************************/

	--DROP TABLE TOInfoDeTailUpdate
	--DROP TABLE TOInfoDeTailUpdate

	TRUNCATE TABLE TOInfoDeTail
	TRUNCATE TABLE TOInfoDeTailUpdate

	SELECT top 0 td.TOInfoDetail_Number
	,            td.TOInfoDetail_Partnumber
	,            td.TOInfoDetail_Description
	,            td.TOInfoDetail_Qty
		INTO TOInfoDeTailUpdate
	FROM FFCPacking.dbo.TOInfoDetail td
	SELECT *
	FROM TOInfoDeTailUpdate

	SELECT td.TOInfoDetail_Number
	,      td.TOInfoDetail_Partnumber
	,      td.TOInfoDetail_Description
	,      td.TOInfoDetail_Qty
	,      getdate() AS TOInfoDetail_LoadDate
	FROM dbo.TOInfoDeTailUpdate td

	TRUNCATE TABLE TOInfoDeTail
	SELECT *
	FROM TOInfoDeTail
GO