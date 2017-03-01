SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_ClearPackingRecordNUpdateTInformation] 
@PONumber nchar ( 20 ) = NULL , 
@BoxNumber nchar ( 20 ) = NULL 
-- Define code
AS 
SET NOCOUNT ON 


-- do backup
insert into PackMovementAction
(PONumber, Model, Serial, BoxNumber, PackingDateTime, ActionDate, ActionType, ActionBy)
select  PONumber, Model, Serial, BoxNumber, PackingDateTime , getdate() ActionDate,'Delete' ActionType, cast('' as varchar(30)) ActionBy
--into PackMovementAction
from PackingRecord 
WHERE PONumber = @PONumber AND BoxNumber = @BoxNumber 

-- delete
DELETE FROM PackingRecord WHERE PONumber = @PONumber AND BoxNumber = @BoxNumber 

--EXEC ame_ClearBoxRework @BoxNumber 

EXEC ame_UpdatePartRun @PONumber 

RETURN 


GO