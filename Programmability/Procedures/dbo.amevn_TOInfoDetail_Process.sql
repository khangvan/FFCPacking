SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		/*Author*/
-- Create date: /*Create Date*/
-- Description:	/*Description*/
-- =============================================
CREATE PROCEDURE  [dbo].[amevn_TOInfoDetail_Process]
@OperationType nchar(30), @ToNum nchar(30) ='', @ToPart nchar(30)=''
AS
BEGIN /**********| Begin SP |07/30/2016|10:46:25 | kvan*****************************/
	
	SET NOCOUNT ON;

/***| test para  |07/30/2016|11:55:31 | kvan*****************************/
	-- exec amevn_TOInfoDetail_Process 'viewall', '2548892'
	-- select * from  TOInfoDetail
	 
/**********| delete |07/30/2016|10:39:30 | kvan*****************************/
	IF (@OperationType = 'DELETE')
	BEGIN
	

TRUNCATE TABLE TOInfoDeTailUpdate

END
/**********| Merge |07/30/2016|10:44:20 | kvan*****************************/
IF (@OperationType = 'MERGE')
	BEGIN

 MERGE FFCPacking.dbo.TOInfoDeTail AS TARGET
 uSING (SELECT td.TOInfoDetail_Number
,      td.TOInfoDetail_Partnumber
,      td.TOInfoDetail_Description
,      td.TOInfoDetail_Qty
,      getdate() AS TOInfoDetail_LoadDate
,      0 AS TOStatus_ID
, ROW_NUMBER()OVER( ORDER BY TOInfoDetail_Number )As TOinfoDetail_OrderNum
FROM dbo.TOInfoDeTailUpdate td) AS SOURCE 
 ON (TARGET.TOInfoDeTail_Number= SOURCE.TOInfoDeTail_Number
 AND TARGET.TOInfoDeTail_ParTnumber=SOURCE.TOInfoDeTail_ParTnumber
 AND TARGET.TOInfoDeTail_DeScripTion=SOURCE.TOInfoDeTail_DeScripTion)
 WHEN MATCHED 
 THEN UPDATE SET TARGET.TOInfoDeTail_QTy= SOURCE.TOInfoDeTail_QTy
 WHEN NOT MATCHED BY TARGET
 THEN INSERT (TOInfoDeTail_Number ,TOInfoDeTail_ParTnumber,TOInfoDeTail_DeScripTion,TOInfoDeTail_QTy, TOInfoDetail_LoadDate, TOStatus_ID,TOinfoDetail_OrderNum  ) valueS 
 (SOURCE.TOInfoDeTail_Number,SOURCE.TOInfoDeTail_ParTnumber,SOURCE.TOInfoDeTail_DeScripTion,SOURCE.TOInfoDeTail_QTy, SOURCE.TOInfoDetail_LoadDate, SOURCE.TOStatus_ID, SOURCE.TOinfoDetail_OrderNum)
 --WHEN NOT MATCHED BY SOURCE THEN
 --DELETE  
 ;

 TRUNCATE TABLE dbo.TOInfoDetailUpdate
 RETURN;
 END

 /**********| Update TO-Part |07/30/2016|10:44:20 | kvan*****************************/
IF (@OperationType = 'Update')
	BEGIN
	UPDATE dbo.TOInfoDetail
	SET
	   
	    
	    dbo.TOInfoDetail.TOStatus_ID = 2, -- nvarchar
	    dbo.TOInfoDetail.TOInfoDetail_PickedDate = getdate(),
	    dbo.TOInfoDetail.Opcode_ID = 0 -- int
	    
	    WHERE 
	     --TOInfoDetail_ID - this column value is auto-generated
	    dbo.TOInfoDetail.TOInfoDetail_Number = @ToNum AND -- nvarchar
	    dbo.TOInfoDetail.TOInfoDetail_Partnumber = @ToPart -- nvarchar
	end

  /**********| View TO-All |07/30/2016|10:44:20 | kvan*****************************/
IF (@OperationType = 'CheckExist')
	BEGIN
	
	SELECT *
--	td.TOInfoDetail_Number
--,      td.TOInfoDetail_Partnumber
--,      td.TOInfoDetail_Description
--,      td.TOInfoDetail_Qty
	FROM dbo.TOInfoDetail td
	WHERE td.TOInfoDetail_Number= @ToNum 
	END

	
 -- exec amevn_TOInfoDetail_Process 'CheckExist','2548899'
  /**********| View TO-All |07/30/2016|10:44:20 | kvan*****************************/
IF (@OperationType = 'ViewAll')
	BEGIN

	SELECT 
	td.TOInfoDetail_Number AS TO_Number
,      td.TOInfoDetail_Partnumber AS Part_Number
,      td.TOInfoDetail_Description AS Part_Description
,      td.TOInfoDetail_Qty AS Qty
,td.TOInfoDetail_OrderNum AS Number#
,td.TOInfoDetail_LoadDate AS StartAt_PP
,td.TOInfoDetail_PickedDate AS CompleteAt_PP
,td.Opcode_ID AS OperatorCode
--,op.opname AS OperatorName
	FROM dbo.TOInfoDetail td
	--, PTR.dbo.ADC_Opcode op
	WHERE td.TOInfoDetail_Number= @ToNum 
	--AND cast(td.Opcode_ID AS nchar(12)) = cast(op.opcode AS nchar(12))
	
	
	SELECT 'NoData' AS Result
	END

/**********| View TO-All |07/30/2016|10:44:20 | kvan*****************************/
IF (@OperationType = 'ToDo')
	BEGIN
	
SELECT td.TOInfoDetail_Number AS TO_Number
,      td.TOInfoDetail_Partnumber AS Part_Number
,      td.TOInfoDetail_Description AS Part_Description
,      td.TOInfoDetail_Qty AS Qty
,td.TOInfoDetail_OrderNum AS Number#
FROM dbo.TOInfoDetail td
WHERE td.TOInfoDetail_Number= @ToNum AND (td.TOStatus_ID =0 OR td.TOStatus_ID IS NULL OR TOStatus_ID='')
ORDER BY td.TOInfoDetail_OrderNum asc
SELECT 'NoData' AS Result
	end
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

SELECT top 0 td.TOInfoDetail_Number, td.TOInfoDetail_Partnumber, td.TOInfoDetail_Description, td.TOInfoDetail_Qty
INTO TOInfoDeTailUpdate
FROM FFCPacking.dbo.TOInfoDetail td
SELECT * FROM TOInfoDeTailUpdate 

SELECT td.TOInfoDetail_Number
,      td.TOInfoDetail_Partnumber
,      td.TOInfoDetail_Description
,      td.TOInfoDetail_Qty
,      getdate() AS TOInfoDetail_LoadDate
FROM dbo.TOInfoDeTailUpdate td

TRUNCATE TABLE TOInfoDeTail
SELECT * FROM TOInfoDeTail
 
GO