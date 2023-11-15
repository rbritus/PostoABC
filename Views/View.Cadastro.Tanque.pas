unit View.Cadastro.Tanque;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastro, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Buttons, System.ImageList, Vcl.ImgList;

type
  TViewCadastroTanque = class(TViewPadraoCadastro)
    edtCodigo: TEdit;
    Label1: TLabel;
    edtDescricao: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    cmbCombustivel: TComboBox;
    btnPesquisarTanques: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarTanquesClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
  private
    procedure PrepararCombBoxCombustivel;
    procedure Atualizar;
    procedure ConsultarRegistro;
    procedure Gravar;
    procedure LimparTela;
  public
    { Public declarations }
  end;

var
  ViewCadastroTanque: TViewCadastroTanque;

implementation

uses
  Utils.Enumerators,
  Conexao.unConection,
  Controller.Entidades,
  View.Consulta.Generica;

{$R *.dfm}

procedure TViewCadastroTanque.ConsultarRegistro;
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

    FID := lDataset.FieldByName('ID').AsInteger;
    edtCodigo.Text := FID.ToString;
    edtDescricao.Text := lDataset.FieldByName('DESCRICAO').AsString;
    cmbCombustivel.ItemIndex := lDataset.FieldByName('COMBUSTIVEL').AsInteger;
    btnExcluir.Enabled := True;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroTanque.Atualizar;
begin
  var lTipoCombustivel := TTipoCombustivel(cmbCombustivel.ItemIndex);
  TControllerEntidades.New
    .Tanques
      .SetID(FID)
      .SetDescricao(edtDescricao.Text)
      .SetCombustivel(lTipoCombustivel)
    .DAO
      .Atualizar;

  TConexao.New.Commit;
end;

procedure TViewCadastroTanque.Gravar;
begin
  var lTipoCombustivel := TTipoCombustivel(cmbCombustivel.ItemIndex);
  TControllerEntidades.New
    .Tanques
      .SetDescricao(edtDescricao.Text)
      .SetCombustivel(lTipoCombustivel)
    .DAO
      .Inserir;

  TConexao.New.Commit;
end;

procedure TViewCadastroTanque.btnPesquisarTanquesClick(Sender: TObject);
begin
  inherited;
  ConsultarRegistro;
end;

procedure TViewCadastroTanque.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparTela;
end;

procedure TViewCadastroTanque.btnExcluirClick(Sender: TObject);
begin
  inherited;
  TControllerEntidades.New
    .Tanques
      .SetID(FID)
    .DAO
      .Excluir;

  TConexao.New.Commit;
  LimparTela;
end;

procedure TViewCadastroTanque.btnGravarClick(Sender: TObject);
begin
  inherited;       
  if InsereRegistro  then
    Gravar
  else
    Atualizar;
    
  TConexao.New.Commit;
  LimparTela;
end;

procedure TViewCadastroTanque.LimparTela;
begin
  edtCodigo.Clear;
  edtDescricao.Clear;
  cmbCombustivel.ItemIndex := 0;
  btnExcluir.Enabled := False;
  edtDescricao.SetFocus;
end;

procedure TViewCadastroTanque.FormShow(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
  PrepararCombBoxCombustivel;
end;

procedure TViewCadastroTanque.PrepararCombBoxCombustivel;
begin
  TEnumerator<TTipoCombustivel>.PopulateList(cmbCombustivel);
  cmbCombustivel.ItemIndex := 0;
end;

end.
