inherited ViewRelatorioAbastecimentos: TViewRelatorioAbastecimentos
  Caption = 'ViewRelatorioAbastecimentos'
  ClientHeight = 365
  Position = poScreenCenter
  OnShow = FormShow
  ExplicitHeight = 365
  TextHeight = 15
  inherited Panel1: TPanel
    Caption = 'Relat'#243'rio de Abastecimentos'
  end
  inherited Panel2: TPanel
    Height = 269
    object Label2: TLabel
      Left = 35
      Top = 19
      Width = 160
      Height = 40
      Caption = 'Data inicial:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 54
      Top = 91
      Width = 141
      Height = 40
      Caption = 'Data final:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDataInicial: TMaskEdit
      Left = 201
      Top = 16
      Width = 304
      Height = 48
      Alignment = taCenter
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      Text = ''
    end
    object edtDataFinal: TMaskEdit
      Left = 201
      Top = 88
      Width = 304
      Height = 48
      Alignment = taCenter
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      Text = ''
    end
  end
  inherited Panel3: TPanel
    Top = 317
    OnResize = Panel3Resize
    object btnImprimir: TButton
      Left = 253
      Top = 8
      Width = 137
      Height = 33
      Caption = 'Imprimir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
  end
end
