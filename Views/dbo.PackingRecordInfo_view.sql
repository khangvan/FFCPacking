SET QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
CREATE VIEW [dbo].[PackingRecordInfo_view]
AS
SELECT     dbo.T_Information.T_ProdOrder, dbo.T_Information.T_ProductMap, dbo.T_Information.T_Material, dbo.ProductMap.Description, 
                      dbo.T_Information.T_Revision, dbo.T_Information.T_Quantity, dbo.T_Information.T_Packed, dbo.ProductMap.ProductLine, dbo.PackingRecord.Serial, 
                      dbo.PackingRecord.BoxNumber, dbo.PackingRecord.PackingDateTime, dbo.PackingRecord.PYear, dbo.T_Information.ShipDate
FROM         dbo.PackingRecord INNER JOIN
                      dbo.T_Information ON dbo.PackingRecord.PONumber = dbo.T_Information.T_ProdOrder AND 
                      dbo.PackingRecord.Model = dbo.T_Information.T_Material INNER JOIN
                      dbo.ProductMap ON dbo.T_Information.T_Material = dbo.ProductMap.SAPModel AND dbo.T_Information.T_ProductMap = dbo.ProductMap.ProductMap
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPane1', N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[42] 4[2] 2[40] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "PackingRecord"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 217
               Right = 200
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "T_Information"
            Begin Extent = 
               Top = 6
               Left = 428
               Bottom = 229
               Right = 580
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProductMap"
            Begin Extent = 
               Top = 0
               Left = 818
               Bottom = 183
               Right = 970
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 15
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
', 'SCHEMA', N'dbo', 'VIEW', N'PackingRecordInfo_view'
GO

EXEC sys.sp_addextendedproperty N'MS_DiagramPaneCount', 1, 'SCHEMA', N'dbo', 'VIEW', N'PackingRecordInfo_view'
GO