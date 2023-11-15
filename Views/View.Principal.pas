unit View.Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ToolWin,
  Vcl.ActnMan, Vcl.ActnCtrls, Vcl.ActnMenus, Vcl.PlatformDefaultStyleActnCtrls, System.Actions,
  Vcl.ActnList, Vcl.Menus, Vcl.ActnPopup, Vcl.CategoryButtons, Vcl.ExtCtrls;

type
  TViewPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    Panel4: TPanel;
    btnLancamentoAbastecimento: TButton;
    Panel5: TPanel;
    Panel6: TPanel;
    btnCadastroTanques: TButton;
    btnCadastroBombas: TButton;
    btnCadastroAliquota: TButton;
    Panel7: TPanel;
    Panel8: TPanel;
    Button1: TButton;
    Label1: TLabel;
    pnlForm: TPanel;
    procedure btnCadastroAliquotaClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnCadastroTanquesClick(Sender: TObject);
    procedure btnCadastroBombasClick(Sender: TObject);
  private
  public

  end;

var
  ViewPrincipal: TViewPrincipal;

implementation

uses
  Utils.Messages,
  Controller.Views,
  View.Cadastro.Aliquota,
  View.Cadastro.Tanque,
  View.Cadastro.Bomba;

{$R *.dfm}

procedure TViewPrincipal.btnCadastroAliquotaClick(Sender: TObject);
begin
  ControllerView.ShowForm(TViewCadastroAliquota);
end;

procedure TViewPrincipal.btnCadastroBombasClick(Sender: TObject);
begin
  ControllerView.ShowForm(TViewCadastroBomba);
end;

procedure TViewPrincipal.btnCadastroTanquesClick(Sender: TObject);
begin
  ControllerView.ShowForm(TViewCadastroTanque);
end;

procedure TViewPrincipal.FormShow(Sender: TObject);
begin
  ControllerView.SetParentForm(pnlForm);
end;

end.
