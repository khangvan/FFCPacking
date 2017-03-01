SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ame_CheckProductVerify-deleteonendOct2015] 
@ProductMAp nchar(20)
AS

declare @result nchar(20)
declare @bolresult bit

set @result = 'NG-Checking FAil'
set @bolresult = 0

if exists (select count(*)  from ProductVerify where productmap =@ProductMAp)
begin
set @bolresult = 1
set @result = 'OK'
end
--else 
--begin
--set @bolresult = 1
--set @result =  'NG-Checking FAil'

--end

select @result as Result
GO