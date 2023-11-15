inherited ViewConsultaGenerica: TViewConsultaGenerica
  Caption = 'ViewConsultaGenerica'
  ClientHeight = 517
  OnCreate = FormCreate
  ExplicitHeight = 517
  TextHeight = 15
  inherited Panel1: TPanel
    inherited btnFechaForm: TButton
      ExplicitLeft = 594
      ExplicitTop = 6
      ExplicitHeight = 36
    end
  end
  inherited Panel2: TPanel
    Top = 134
    Height = 335
    ExplicitTop = 272
    ExplicitHeight = 160
    object DBGrid1: TDBGrid
      Left = 1
      Top = 1
      Width = 638
      Height = 333
      Align = alClient
      DataSource = DataSource1
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgCancelOnExit, dgTitleClick, dgTitleHotTrack]
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -12
      TitleFont.Name = 'Segoe UI'
      TitleFont.Style = []
      OnDblClick = DBGrid1DblClick
    end
  end
  inherited Panel3: TPanel
    Top = 469
    object btnSelecionar: TButton
      Left = 252
      Top = 8
      Width = 137
      Height = 33
      Caption = 'Selecionar'
      TabOrder = 0
      OnClick = btnSelecionarClick
    end
  end
  inline FrameFiltroPesquisa1: TFrameFiltroPesquisa [3]
    Left = 0
    Top = 48
    Width = 640
    Height = 86
    Align = alTop
    TabOrder = 3
    ExplicitLeft = -200
    ExplicitTop = 144
    inherited pnlFundo: TPanel
      Width = 640
      inherited pnlConteudo: TPanel
        Width = 640
        inherited pnlFiltros: TPanel
          Width = 640
        end
      end
      inherited pnlPesquisa: TPanel
        Width = 636
        inherited edtPesquisa: TEdit
          Width = 570
          ExplicitWidth = 570
        end
      end
    end
  end
  object DataSource1: TDataSource
    Left = 288
    Top = 222
  end
end
