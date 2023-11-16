unit View.Cadastro.Bomba;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastro, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons, Vcl.Mask;

type
  TViewCadastroBomba = class(TViewPadraoCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    edtCodigo: TEdit;
    edtNumero: TEdit;
    btnPesquisarBombas: TBitBtn;
    edtPreco: TMaskEdit;
    Label4: TLabel;
    edtCodigoTanque: TEdit;
    btnPesquisarTanques: TBitBtn;
    edtDescricaoTanque: TEdit;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPesquisarBombasClick(Sender: TObject);
    procedure btnPesquisarTanquesClick(Sender: TObject);
    procedure edtPrecoKeyPress(Sender: TObject; var Key: Char);
  private
    procedure Atualizar;
    procedure ConsultarRegistro;
    procedure ConsultarRegistroTanque;
    procedure Gravar;
    procedure LimparTela;
    procedure CarregarDescricaoTanque;
  public
  end;

var
  ViewCadastroBomba: TViewCadastroBomba;

implementation

uses
  Conexao.unConection,
  Controller.Entidades,
  View.Consulta.Generica,
  Utils.Constants,
  Utils.Validacoes;

{$R *.dfm}

{ TViewPadraoCadastro1 }

procedure TViewCadastroBomba.Atualizar;
begin
  TControllerEntidades.New
    .Bombas
      .SetID(FID)
      .SetNumero(StrToIntDef(edtNumero.Text,0))
      .SetPreco(StrToCurrDef(edtPreco.Text,0))
      .SetIDTanque(StrToIntDef(edtCodigoTanque.Text,0))
    .Validacao
    .DAO
      .Atualizar;

  TConexao.New.Commit;
end;

procedure TViewCadastroBomba.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparTela;
end;

procedure TViewCadastroBomba.btnExcluirClick(Sender: TObject);
begin
  inherited;
  TControllerEntidades.New
    .Bombas
      .SetID(FID)
    .DAO
      .Excluir;

  TConexao.New.Commit;
  LimparTela;
end;

procedure TViewCadastroBomba.btnGravarClick(Sender: TObject);
begin
  inherited;
  if InsereRegistro  then
    Gravar
  else
    Atualizar;

  TConexao.New.Commit;
  LimparTela;
end;

procedure TViewCadastroBomba.btnPesquisarBombasClick(Sender: TObject);
begin
  inherited;
  ConsultarRegistro;
end;

procedure TViewCadastroBomba.btnPesquisarTanquesClick(Sender: TObject);
begin
  inherited;
  ConsultarRegistroTanque;
end;

procedure TViewCadastroBomba.CarregarDescricaoTanque;
begin
  var lDataset := TControllerEntidades.New
                    .Tanques
                      .SetID(StrToIntDef(edtCodigoTanque.Text,0))
                    .DAO
                      .ListarPorId
                      .ToDataSet;
  try
    edtDescricaoTanque.Text := lDataset.FieldByName('DESCRICAO').AsString;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroBomba.ConsultarRegistro;
begin
  var lDataset := TControllerEntidades.New
                    .Bombas
                    .DAO
                      .Listar
                      .ToDataSet;
  try
    var lSelecionado := TViewConsultaGenerica.New
                          .InformarCaption('Pequisa de Bombas')
                          .SetDataSetPesquisa(lDataset)
                          .ShowConsulta;

    if not lSelecionado then
      Exit;

    FID := lDataset.FieldByName('ID').AsInteger;
    edtCodigo.Text := FID.ToString;
    edtNumero.Text := lDataset.FieldByName('NUMERO').AsInteger.ToString;
    edtPreco.Text := lDataset.FieldByName('PRECO').AsFloat.ToString;
    edtCodigoTanque.Text := lDataset.FieldByName('ID_TANQUE').AsInteger.ToString;
    CarregarDescricaoTanque;
    btnExcluir.Enabled := True;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroBomba.ConsultarRegistroTanque;
begin
  var lDataset := TControllerEntidades.New
                    .Tanques
                    .DAO
                      .Listar
                      .ToDataSet;
  try
    var lSelecionado := TViewConsultaGenerica.New
                          .InformarCaption('Pequisa de Tanques')
                          .SetDataSetPesquisa(lDataset)
                          .ShowConsulta;

    if not lSelecionado then
      Exit;

    edtCodigoTanque.Text := lDataset.FieldByName('ID').AsInteger.ToString;
    edtDescricaoTanque.Text := lDataset.FieldByName('DESCRICAO').AsString;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroBomba.edtPrecoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not TUtilsValidacoes.SomenteNumerosEVirgula(Key) then
    Key := #0;
end;

procedure TViewCadastroBomba.FormShow(Sender: TObject);
begin
  inherited;
  edtNumero.SetFocus;
end;

procedure TViewCadastroBomba.Gravar;
begin
  TControllerEntidades.New
    .Bombas
      .SetNumero(StrToIntDef(edtNumero.Text,0))
      .SetPreco(StrToCurrDef(edtPreco.Text,0))
      .SetIDTanque(StrToIntDef(edtCodigoTanque.Text,0))
    .Validacao
    .DAO
      .Inserir;

  TConexao.New.Commit;
end;

procedure TViewCadastroBomba.LimparTela;
begin
  edtCodigo.Clear;
  edtNumero.Clear;
  edtPreco.Clear;
  edtCodigoTanque.Clear;
  edtDescricaoTanque.Clear;
  btnExcluir.Enabled := False;
  edtNumero.SetFocus;
end;

end.
