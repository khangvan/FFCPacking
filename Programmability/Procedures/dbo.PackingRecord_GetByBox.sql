﻿SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE PROC [dbo].[PackingRecord_GetByBox]
 ( 
@BoxNumber nchar ( 10 ) ) 
AS 



BEGIN 
SELECT * FROM PackingRecord WHERE BoxNumber = @BoxNumber 
END 



GO