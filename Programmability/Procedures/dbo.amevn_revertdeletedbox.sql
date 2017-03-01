SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[amevn_revertdeletedbox]
@PONumber nchar ( 20 ) = NULL , 
@BoxNumber nchar ( 20 ) = NULL 
AS
BEGIN
	
-- do revert deleted box
insert into PackingRecord
(PONumber, Model, Serial, BoxNumber, PackingDateTime)
select  PONumber, Model, Serial, BoxNumber, PackingDateTime
from PackMovementAction
WHERE PONumber = @PONumber AND BoxNumber = @BoxNumber 
--cal culate po serial
EXEC ame_UpdatePartRun @PONumber
END
GO