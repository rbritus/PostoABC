inherited ViewCadastroAbastecimento: TViewCadastroAbastecimento
  Caption = 'ViewCadastroAbastecimento'
  ClientHeight = 702
  ClientWidth = 1120
  OnShow = FormShow
  ExplicitWidth = 1120
  ExplicitHeight = 702
  TextHeight = 15
  inherited Panel1: TPanel
    Width = 1120
    Caption = 'Cadastrar Abastecimento'
    ExplicitWidth = 1120
    inherited btnFechaForm: TButton
      Left = 1074
      ExplicitLeft = 1074
    end
  end
  inherited Panel2: TPanel
    Width = 1120
    Height = 258
    Align = alTop
    ExplicitWidth = 1120
    ExplicitHeight = 258
    object Label1: TLabel
      Left = 82
      Top = 27
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
      Left = 379
      Top = 27
      Width = 72
      Height = 40
      Caption = 'Data:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 819
      Top = 142
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
      Left = 38
      Top = 142
      Width = 150
      Height = 40
      Caption = 'Bomba N'#186':'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 20
      Top = 85
      Width = 168
      Height = 40
      Caption = 'Qtde. Litros:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 382
      Top = 142
      Width = 69
      Height = 40
      Caption = 'Tipo:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 297
      Top = 201
      Width = 154
      Height = 40
      Caption = 'Valor Total:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 780
      Top = 27
      Width = 125
      Height = 40
      Caption = 'Al'#237'quota:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtCodigo: TEdit
      Left = 194
      Top = 23
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
    object btnPesquisarBombas: TBitBtn
      Left = 300
      Top = 23
      Width = 48
      Height = 48
      ImageIndex = 0
      Images = ImageList1
      TabOrder = 1
      TabStop = False
      OnClick = btnPesquisarBombasClick
    end
    object edtData: TMaskEdit
      Left = 457
      Top = 23
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
      TabOrder = 2
      Text = ''
    end
    object edtNumeroBomba: TEdit
      Left = 194
      Top = 139
      Width = 100
      Height = 48
      BorderStyle = bsNone
      CharCase = ecUpperCase
      Color = 14408667
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      TabOrder = 5
      StyleElements = [seFont, seBorder]
    end
    object btnPesquisarTanques: TBitBtn
      Left = 300
      Top = 139
      Width = 48
      Height = 48
      BiDiMode = bdLeftToRight
      ImageIndex = 0
      Images = ImageList1
      ParentBiDiMode = False
      TabOrder = 6
      TabStop = False
      OnClick = btnPesquisarTanquesClick
    end
    object edtQuantidadeLitros: TEdit
      Left = 194
      Top = 81
      Width = 154
      Height = 48
      BorderStyle = bsNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      OnExit = edtQuantidadeLitrosExit
      OnKeyPress = edtQuantidadeLitrosKeyPress
    end
    object edtCombustivel: TEdit
      Left = 457
      Top = 139
      Width = 304
      Height = 48
      TabStop = False
      BorderStyle = bsNone
      Color = 14408667
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      StyleElements = [seFont, seBorder]
    end
    object edtValor: TEdit
      Left = 457
      Top = 197
      Width = 220
      Height = 48
      TabStop = False
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14408667
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 9
      StyleElements = [seFont, seBorder]
    end
    object edtPreco: TEdit
      Left = 911
      Top = 139
      Width = 178
      Height = 48
      TabStop = False
      Alignment = taCenter
      BorderStyle = bsNone
      Color = 14408667
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      ParentFont = False
      TabOrder = 8
      StyleElements = [seFont, seBorder]
    end
    object edtAliquota: TEdit
      Left = 911
      Top = 23
      Width = 178
      Height = 48
      TabStop = False
      BorderStyle = bsNone
      Color = 14408667
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -29
      Font.Name = 'Segoe UI'
      Font.Style = []
      NumbersOnly = True
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      StyleElements = [seFont, seBorder]
    end
  end
  inherited Panel3: TPanel
    Top = 306
    Width = 1120
    Align = alTop
    ExplicitTop = 306
    ExplicitWidth = 1120
    inherited btnGravar: TButton
      OnClick = btnGravarClick
    end
    inherited btnCancelar: TButton
      Left = 499
      ExplicitLeft = 499
    end
    inherited btnExcluir: TButton
      Left = 895
      ExplicitLeft = 895
    end
  end
  object DBGrid1: TDBGrid [3]
    Left = 0
    Top = 394
    Width = 1120
    Height = 308
    Align = alClient
    DataSource = DataSource1
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
    TabOrder = 4
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -12
    TitleFont.Name = 'Segoe UI'
    TitleFont.Style = []
  end
  object Panel4: TPanel [4]
    Left = 0
    Top = 354
    Width = 1120
    Height = 40
    Align = alTop
    Caption = 'Lan'#231'amentos do dia'
    Color = clWhite
    Font.Charset = DEFAULT_CHARSET
    Font.Color = 8404992
    Font.Height = -21
    Font.Name = 'Segoe UI'
    Font.Style = [fsBold]
    ParentBackground = False
    ParentFont = False
    TabOrder = 3
    StyleElements = [seBorder]
  end
  object DataSource1: TDataSource
    Left = 352
    Top = 472
  end
end
