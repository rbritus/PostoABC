inherited ViewPadraoCadastro: TViewPadraoCadastro
  Caption = 'ViewPadraoCadastro'
  WindowState = wsMaximized
  OnCreate = FormCreate
  TextHeight = 15
  inherited Panel1: TPanel
    inherited btnFechaForm: TButton
      ExplicitLeft = 594
      ExplicitTop = 6
      ExplicitHeight = 36
    end
  end
  inherited Panel2: TPanel
    ExplicitTop = 48
  end
  inherited Panel3: TPanel
    OnResize = Panel3Resize
    object btnGravar: TButton
      Left = 88
      Top = 8
      Width = 137
      Height = 33
      Caption = 'Gravar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object btnCancelar: TButton
      Left = 253
      Top = 8
      Width = 137
      Height = 33
      Caption = 'Cancelar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnCancelarClick
    end
    object btnExcluir: TButton
      Left = 418
      Top = 8
      Width = 137
      Height = 33
      Anchors = [akTop, akRight]
      Caption = 'Excluir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Segoe UI'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnExcluirClick
    end
  end
end
