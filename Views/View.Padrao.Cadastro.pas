unit View.Padrao.Cadastro;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao, Vcl.ExtCtrls, Vcl.StdCtrls, System.ImageList,
  Vcl.ImgList, System.UITypes;

type
  TViewPadraoCadastro = class(TViewPadrao)
    btnGravar: TButton;
    btnCancelar: TButton;
    btnExcluir: TButton;
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
  protected
    FID: Integer;
    function InsereRegistro: boolean;
  public
    { Public declarations }
  end;

var
  ViewPadraoCadastro: TViewPadraoCadastro;

implementation

uses
  Conexao.unConection;

{$R *.dfm}

procedure TViewPadraoCadastro.btnCancelarClick(Sender: TObject);
begin
  inherited;
  TConexao.New.Rollback;
end;

procedure TViewPadraoCadastro.btnExcluirClick(Sender: TObject);
begin
  inherited;
  var lConfirma := TMsgDlgBtn(MessageDlg('Deseja excluir o registro?', mtConfirmation, [mbYes, mbNo], 0));
  if lConfirma = mbNo then
    Exit;
end;

procedure TViewPadraoCadastro.FormCreate(Sender: TObject);
begin
  inherited;
  btnExcluir.Enabled := False;
end;

function TViewPadraoCadastro.InsereRegistro: boolean;
begin
  Result := FID = 0;
end;

end.
