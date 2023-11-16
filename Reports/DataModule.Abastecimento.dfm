object DMAbastecimento: TDMAbastecimento
  OnCreate = DataModuleCreate
  Height = 480
  Width = 640
  object dscAbastecimentoEntreDatas: TDataSource
    DataSet = qryAbastecimentoEntreDatas
    Left = 72
    Top = 16
  end
  object qryAbastecimentoEntreDatas: TFDQuery
    Left = 72
    Top = 80
  end
end
