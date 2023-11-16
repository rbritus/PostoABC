object ViewPrincipal: TViewPrincipal
  Left = 0
  Top = 0
  Caption = 'Posto ABC'
  ClientHeight = 555
  ClientWidth = 921
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  WindowState = wsMaximized
  OnShow = FormShow
  TextHeight = 15
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 921
    Height = 73
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alTop
    Caption = 'Panel1'
    Color = 8404992
    ParentBackground = False
    ShowCaption = False
    TabOrder = 0
    StyleElements = []
    ExplicitWidth = 917
    object Label1: TLabel
      Left = 1
      Top = 1
      Width = 919
      Height = 71
      Align = alClient
      Alignment = taCenter
      AutoSize = False
      Caption = 'POSTO ABC'
      Color = 8404992
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -43
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      StyleElements = []
      ExplicitLeft = 384
      ExplicitTop = 16
      ExplicitWidth = 69
      ExplicitHeight = 32
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 73
    Width = 153
    Height = 482
    Margins.Left = 0
    Margins.Top = 0
    Margins.Right = 0
    Margins.Bottom = 0
    Align = alLeft
    Caption = 'Panel1'
    Color = 8404992
    ParentBackground = False
    ShowCaption = False
    TabOrder = 1
    StyleElements = []
    ExplicitHeight = 481
    object Panel3: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 4
      Width = 145
      Height = 98
      Align = alTop
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 0
      StyleElements = []
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 143
        Height = 40
        Align = alTop
        Caption = 'Lan'#231'amentos'
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        StyleElements = []
        StyleName = 'Windows'
      end
      object btnLancamentoAbastecimento: TButton
        AlignWithMargins = True
        Left = 4
        Top = 44
        Width = 137
        Height = 50
        Align = alTop
        Caption = 'Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnLancamentoAbastecimentoClick
      end
    end
    object Panel5: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 108
      Width = 145
      Height = 210
      Align = alTop
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 1
      StyleElements = []
      object Panel6: TPanel
        Left = 1
        Top = 1
        Width = 143
        Height = 40
        Align = alTop
        Caption = 'Cadastros'
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        StyleElements = []
        StyleName = 'Windows'
      end
      object btnCadastroTanques: TButton
        AlignWithMargins = True
        Left = 4
        Top = 44
        Width = 137
        Height = 50
        Align = alTop
        Caption = 'Tanques'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnCadastroTanquesClick
      end
      object btnCadastroBombas: TButton
        AlignWithMargins = True
        Left = 4
        Top = 100
        Width = 137
        Height = 50
        Align = alTop
        Caption = 'Bombas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnCadastroBombasClick
      end
      object btnCadastroAliquota: TButton
        AlignWithMargins = True
        Left = 4
        Top = 156
        Width = 137
        Height = 50
        Align = alTop
        Caption = 'Al'#237'quota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnCadastroAliquotaClick
      end
    end
    object Panel7: TPanel
      AlignWithMargins = True
      Left = 4
      Top = 324
      Width = 145
      Height = 98
      Align = alTop
      Color = clWhite
      ParentBackground = False
      ShowCaption = False
      TabOrder = 2
      StyleElements = []
      object Panel8: TPanel
        Left = 1
        Top = 1
        Width = 143
        Height = 40
        Align = alTop
        Caption = 'Relat'#243'rios'
        Color = 8404992
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentBackground = False
        ParentFont = False
        TabOrder = 0
        StyleElements = []
        StyleName = 'Windows'
      end
      object Button1: TButton
        AlignWithMargins = True
        Left = 4
        Top = 44
        Width = 137
        Height = 50
        Align = alTop
        Caption = 'Abastecimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -16
        Font.Name = 'Segoe UI'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = Button1Click
      end
    end
  end
  object pnlForm: TPanel
    Left = 153
    Top = 73
    Width = 768
    Height = 482
    Align = alClient
    AutoSize = True
    TabOrder = 2
    ExplicitWidth = 764
    ExplicitHeight = 481
  end
end
