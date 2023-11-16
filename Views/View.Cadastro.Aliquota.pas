unit View.Cadastro.Aliquota;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Mask, View.Padrao,
  System.ImageList, Vcl.ImgList;

type
  TViewCadastroAliquota = class(TViewPadrao)
    btnGravar: TButton;
    edtPercentual: TEdit;
    btnFechar: TButton;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure edtPercentualEnter(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
  private
    FIDAliquota: Integer;
    function InsereRegistro: boolean;
    procedure CarregarAliquota;
    procedure Gravar;
    procedure Atualizar;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewCadastroAliquota: TViewCadastroAliquota;

implementation

uses
  Controller.Entidades,
  Conexao.unConection,
  Utils.Form;

{$R *.dfm}

procedure TViewCadastroAliquota.CarregarAliquota;
begin
  var lDataset := TControllerEntidades.New
                    .Imposto
                    .DAO
                      .Listar
                      .ToDataSet;
  try
    FIDAliquota := lDataset.FieldByName('ID').AsInteger;
    edtPercentual.Text := lDataset.FieldByName('PERCENTUAL').AsFloat.ToString;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroAliquota.Atualizar;
begin
  TControllerEntidades.New
    .Imposto
      .SetID(FIDAliquota)
      .SetPercentual(StrToFloat(edtPercentual.Text))
    .DAO
      .Atualizar;

  TConexao.New.Commit;
end;

procedure TViewCadastroAliquota.Gravar;
begin
  TControllerEntidades.New
    .Imposto
      .SetPercentual(StrToFloat(edtPercentual.Text))
    .DAO
      .Inserir;

  TConexao.New.Commit;
end;

procedure TViewCadastroAliquota.btnFecharClick(Sender: TObject);
begin
  inherited;
  TConexao.New.Rollback;
  Self.Close;
end;

procedure TViewCadastroAliquota.btnGravarClick(Sender: TObject);
begin
  inherited;
  if InsereRegistro  then
    Gravar
  else
    Atualizar;

  Self.Close;
end;

procedure TViewCadastroAliquota.edtPercentualEnter(Sender: TObject);
begin
  inherited;
  edtPercentual.SelectAll;
end;

procedure TViewCadastroAliquota.FormShow(Sender: TObject);
begin
  inherited;
  CarregarAliquota;
  edtPercentual.SetFocus;
end;

function TViewCadastroAliquota.InsereRegistro: boolean;
begin
  Result := FIDAliquota = 0;
end;

procedure TViewCadastroAliquota.Panel2Resize(Sender: TObject);
begin
  inherited;
  TUtilsForm.CentralizarComponenteHorinzontal(edtPercentual);
end;

end.
