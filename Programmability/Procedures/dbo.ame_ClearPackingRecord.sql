SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_ClearPackingRecord] 
@PONumber nchar ( 20 ) = NULL , 
@BoxNumber nchar ( 20 ) = NULL 
-- Define code
AS 
SET NOCOUNT ON 
DELETE FROM tmpPackingRecord WHERE PONumber = @PONumber AND BoxNumber = @BoxNumber 

EXEC ame_ClearBoxRework @BoxNumber 
RETURN 


GO