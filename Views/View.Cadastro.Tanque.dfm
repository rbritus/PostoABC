inherited ViewCadastroTanque: TViewCadastroTanque
  Caption = 'ViewCadastroTanque'
  ClientHeight = 375
  OnShow = FormShow
  ExplicitHeight = 375
  TextHeight = 15
  inherited Panel1: TPanel
    Caption = 'Cadastrar Tanque'
  end
  inherited Panel2: TPanel
    Height = 279
    ExplicitHeight = 279
    object Label1: TLabel
      Left = 97
      Top = 34
      Width = 106
      Height = 40
      Caption = 'C'#243'digo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label2: TLabel
      Left = 63
      Top = 122
      Width = 140
      Height = 40
      Caption = 'Descri'#231#227'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 24
      Top = 210
      Width = 179
      Height = 40
      Caption = 'Combust'#237'vel:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 209
      Top = 31
      Width = 100
      Height = 48
      BorderStyle = bsNone
      Color = 14408667
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      StyleElements = [seFont, seBorder]
    end
    object edtDescricao: TEdit
      Left = 209
      Top = 119
      Width = 392
      Height = 48
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 2
    end
    object cmbCombustivel: TComboBox
      Left = 209
      Top = 207
      Width = 392
      Height = 48
      Style = csDropDownList
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      StyleElements = []
    end
    object btnPesquisarTanques: TBitBtn
      Left = 315
      Top = 31
      Width = 48
      Height = 48
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 1
      TabStop = False
      OnClick = btnPesquisarTanquesClick
    end
  end
  inherited Panel3: TPanel
    Top = 327
    ExplicitTop = 327
    inherited btnGravar: TButton
      OnClick = btnGravarClick
    end
  end
end
