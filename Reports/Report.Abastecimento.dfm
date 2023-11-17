object ReportAbastecimento: TReportAbastecimento
  Left = 0
  Top = 0
  Caption = 'ReportAbastecimento'
  ClientHeight = 571
  ClientWidth = 877
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  TextHeight = 15
  object RelatorioAbastecimento: TRLReport
    Left = 56
    Top = 0
    Width = 794
    Height = 1123
    DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlack
    Font.Height = -13
    Font.Name = 'Arial'
    Font.Style = []
    Transparent = False
    object RLBand1: TRLBand
      Left = 38
      Top = 38
      Width = 718
      Height = 75
      BandType = btHeader
      Transparent = False
      object lblPeriodoPesquisa: TRLLabel
        Left = 1
        Top = 56
        Width = 78
        Height = 16
        Caption = 'Per'#237'odo de:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLPanel1: TRLPanel
        Left = 0
        Top = 0
        Width = 718
        Height = 50
        Align = faTop
        Color = 8404992
        ParentColor = False
        Transparent = False
        object RLLabel1: TRLLabel
          Left = 211
          Top = 17
          Width = 297
          Height = 24
          Caption = 'Relat'#243'rio de Abastecimentos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -21
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = False
        end
      end
      object RLSystemInfo1: TRLSystemInfo
        Left = 679
        Top = 56
        Width = 39
        Height = 16
        Alignment = taRightJustify
        Text = ''
        Transparent = False
      end
    end
    object RLBand2: TRLBand
      Left = 38
      Top = 113
      Width = 718
      Height = 35
      BandType = btColumnHeader
      Color = 8404992
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Arial'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Transparent = False
      object RLLabel4: TRLLabel
        Left = 16
        Top = 11
        Width = 25
        Height = 16
        Caption = 'Dia'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel5: TRLLabel
        Left = 96
        Top = 11
        Width = 52
        Height = 16
        Caption = 'Tanque'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel6: TRLLabel
        Left = 200
        Top = 11
        Width = 49
        Height = 16
        Caption = 'Bomba'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel7: TRLLabel
        Left = 410
        Top = 11
        Width = 39
        Height = 16
        Caption = 'Litros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel8: TRLLabel
        Left = 480
        Top = 11
        Width = 41
        Height = 16
        Caption = 'Pre'#231'o'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel9: TRLLabel
        Left = 554
        Top = 11
        Width = 57
        Height = 16
        Caption = 'Al'#237'quota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel10: TRLLabel
        Left = 664
        Top = 11
        Width = 38
        Height = 16
        Caption = 'Valor'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
      object RLLabel11: TRLLabel
        Left = 264
        Top = 11
        Width = 82
        Height = 16
        Caption = 'Combust'#237'vel'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Transparent = False
      end
    end
    object RLBand3: TRLBand
      Left = 38
      Top = 148
      Width = 718
      Height = 40
      object RLDBText1: TRLDBText
        Left = 16
        Top = 16
        Width = 38
        Height = 16
        DataField = 'DATA'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        Text = ''
      end
      object RLDBText2: TRLDBText
        Left = 96
        Top = 16
        Width = 80
        Height = 16
        DataField = 'DESCRICAO'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        Text = ''
      end
      object RLDBText3: TRLDBText
        Left = 194
        Top = 16
        Width = 62
        Height = 16
        Alignment = taCenter
        DataField = 'NUMERO'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        Text = ''
      end
      object RLDBText4: TRLDBText
        Left = 392
        Top = 16
        Width = 57
        Height = 16
        Alignment = taRightJustify
        AutoSize = False
        DataField = 'QUANTIDADE_LITROS'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        DisplayMask = '#.## (L)'
        Text = ''
      end
      object RLDBText5: TRLDBText
        Left = 479
        Top = 16
        Width = 50
        Height = 16
        Alignment = taRightJustify
        DataField = 'PRECO'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        DisplayMask = 'R$ #,##0.00'
        Text = ''
      end
      object RLDBText6: TRLDBText
        Left = 554
        Top = 16
        Width = 58
        Height = 16
        Alignment = taCenter
        AutoSize = False
        DataField = 'PERCENTUAL_IMPOSTO'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        DisplayMask = '#.##%'
        Text = ''
      end
      object RLDBText7: TRLDBText
        Left = 657
        Top = 16
        Width = 48
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        DisplayMask = 'R$ #,##0.00'
        Text = ''
      end
      object RLDBText8: TRLDBText
        Left = 264
        Top = 16
        Width = 113
        Height = 16
        AutoSize = False
        DataField = 'COMBUSTIVEL'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        Text = ''
      end
    end
    object RLBand4: TRLBand
      Left = 38
      Top = 188
      Width = 718
      Height = 35
      BandType = btColumnFooter
      Color = 8404992
      ParentColor = False
      Transparent = False
      object RLDBResult1: TRLDBResult
        Left = 618
        Top = 9
        Width = 90
        Height = 16
        Alignment = taRightJustify
        DataField = 'VALOR'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        DisplayMask = 'R$ #,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
      object RLDBResult2: TRLDBResult
        Left = 267
        Top = 9
        Width = 184
        Height = 16
        Alignment = taRightJustify
        DataField = 'QUANTIDADE_LITROS'
        DataSource = DMAbastecimento.dscAbastecimentoEntreDatas
        DisplayMask = '#.## (L)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        Info = riSum
        ParentFont = False
        Text = ''
        Transparent = False
      end
    end
  end
end
