SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROCEDURE [dbo].[Sample_Procedure] 
    @param1 int = 0,
    @param2 int  
AS
    SELECT @param1,@param2 
RETURN 0 
GO