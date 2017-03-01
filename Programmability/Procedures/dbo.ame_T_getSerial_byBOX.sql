SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[ame_T_getSerial_byBOX]
@BoxNumber char ( 20 ) = NULL 
AS 
SET NOCOUNT ON 

BEGIN 
    IF EXISTS 
    ( 
        SELECT        TOP (1) PONumber, Model, Serial, BoxNumber, PackingDateTime, PYear, ID
        FROM            PackingRecord
        WHERE        (BoxNumber = @BoxNumber) 
    ) 
    BEGIN 
        SELECT 'OK' 

        SELECT        PONumber, Model, Serial, BoxNumber, PackingDateTime
        FROM            PackingRecord
        WHERE        (BoxNumber = @BoxNumber) 

    END 
    ELSE 
    BEGIN 
        SELECT ' NONE ' 

    END 
END 

RETURN 



GO