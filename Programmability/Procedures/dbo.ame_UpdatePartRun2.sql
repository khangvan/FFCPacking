SET QUOTED_IDENTIFIER ON

SET ANSI_NULLS OFF
GO
CREATE PROCEDURE [dbo].[ame_UpdatePartRun2]
	@ProdOrder nchar(20)=NULL
-- Define code
AS
	set nocount on
	declare @result int
	select @result=sum(Qty) from PackingRecordwoACS where PONumber=@ProdOrder
	update T_Information set T_Packed=@result where T_ProdOrder=@ProdOrder
	return
GO