SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[amevn_rpt_AllPacking]
(@mode int, @PO VARCHAR(30), @boxorserial VARCHAR(30))
AS
 
BEGIN

--- ame

IF OBJECT_ID('tempdb.dbo.#tmptb') IS NOT NULL
    	DROP TABLE #tmptb
  
    ; WITH cte AS 
    (
    SELECT  tsn.TFFC_Material SAPModel ,tsn.TFFC_SerialNumber PrintPackSAPSerial, ISNULL(pr.BoxNumber,'-NotPack-') BoxNumber 
  --,pr.PackingDateTime
  from TFFC_SerialNumbers tsn
   LEFT JOIN (SELECT Serial, BoxNumber, PackingDateTime from PackingRecord
            ) pr
  ON pr.Serial =tsn.TFFC_SerialNumber

  WHERE tsn.TFFC_ProdOrder =@PO--'000100905936'
    )
    
 SELECT cte.*, cast ('-' AS varchar(30)) SerialNotPack INTO #tmptb FROM cte

 ----



 IF (@mode =0) -- for planner
  ( 
 SELECT * FROM tmpnewSerialOrder ns
 LEFT JOIN 
 (SELECT * FROM #tmptb) tb
 ON ns.SERNR =tb.PrintPackSAPSerial
-- làm tiếp mode này
);
  IF (@mode =1) 
  ( 
  SELECT * FROM (

  SELECT tsn.TFFC_Material Model, tsn.TFFC_SerialNumber PrintPackSAPSerial, ISNULL(pr.BoxNumber,'-NotPack-') BoxNumber 
  ,pr.PackingDateTime
  from TFFC_SerialNumbers tsn
   LEFT JOIN (SELECT Serial, BoxNumber, PackingDateTime from PackingRecord
            ) pr
  ON pr.Serial =tsn.TFFC_SerialNumber

  WHERE tsn.TFFC_ProdOrder =@PO--'000100905936' )
  )y
    
  );

  IF (@mode =2) 
  
  begin


  

 
 --   IF OBJECT_ID('tempdb.dbo.#tmptb') IS NOT NULL
 --   	DROP TABLE #tmptb
  
 --   ; WITH cte AS 
 --   (
 --   SELECT  tsn.TFFC_Material SAPModel ,tsn.TFFC_SerialNumber PrintPackSAPSerial, ISNULL(pr.BoxNumber,'-NotPack-') BoxNumber 
 -- --,pr.PackingDateTime
 -- from TFFC_SerialNumbers tsn
 --  LEFT JOIN (SELECT Serial, BoxNumber, PackingDateTime from PackingRecord
 --           ) pr
 -- ON pr.Serial =tsn.TFFC_SerialNumber

 -- WHERE tsn.TFFC_ProdOrder =@PO--'000100905936'
 --   )
    
 --SELECT cte.*, cast ('-' AS varchar(30)) SerialNotPack INTO #tmptb FROM cte
 

 
     SELECT x.SapModel,x.BoxNumber, COUNT(x.PrintPackSAPSerial)PackedQty, 
        PackedDate=(
        SELECT MAX(PackingDateTime) FROM PackingRecord pr
        WHERE pr.BoxNumber =x.BoxNumber
        )
          from	#tmptb x

     
        GROUP BY sapmodel, BoxNumber

  end
  

---
  END
GO