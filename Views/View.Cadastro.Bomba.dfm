inherited ViewCadastroBomba: TViewCadastroBomba
  Caption = 'ViewCadastroBomba'
  OnShow = FormShow
  TextHeight = 15
  inherited Panel1: TPanel
    Caption = 'Cadastrar Bomba'
  end
  inherited Panel2: TPanel
    object Label1: TLabel
      Left = 33
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
      Left = 17
      Top = 122
      Width = 122
      Height = 40
      Caption = 'N'#250'mero:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 53
      Top = 210
      Width = 86
      Height = 40
      Caption = 'Pre'#231'o:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 33
      Top = 298
      Width = 109
      Height = 40
      Caption = 'Tanque:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 145
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
    object edtNumero: TEdit
      Left = 145
      Top = 119
      Width = 154
      Height = 48
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      TabOrder = 1
    end
    object btnPesquisarBombas: TBitBtn
      Left = 251
      Top = 31
      Width = 48
      Height = 48
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 2
      OnClick = btnPesquisarBombasClick
    end
    object edtPreco: TMaskEdit
      Left = 145
      Top = 207
      Width = 235
      Height = 48
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 3
      Text = ''
    end
    object edtCodigoTanque: TEdit
      Left = 145
      Top = 295
      Width = 100
      Height = 48
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      StyleElements = [seFont, seBorder]
      OnExit = edtCodigoTanqueExit
    end
    object btnPesquisarTanques: TBitBtn
      Left = 251
      Top = 295
      Width = 48
      Height = 48
      BiDiMode = bdLeftToRight
      ImageIndex = 0
      Images = ImageList1
      ParentBiDiMode = False
      TabOrder = 5
      OnClick = btnPesquisarTanquesClick
    end
    object edtDescricaoTanque: TEdit
      Left = 305
      Top = 295
      Width = 296
      Height = 48
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      MaxLength = 6
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
    end
  end
  inherited Panel3: TPanel
    inherited btnGravar: TButton
      OnClick = btnGravarClick
    end
  end
end
