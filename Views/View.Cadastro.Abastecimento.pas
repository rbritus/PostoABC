unit View.Cadastro.Abastecimento;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, View.Padrao.Cadastro, System.ImageList, Vcl.ImgList,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Mask, Vcl.Buttons, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TViewCadastroAbastecimento = class(TViewPadraoCadastro)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    edtCodigo: TEdit;
    btnPesquisarBombas: TBitBtn;
    edtData: TMaskEdit;
    edtNumeroBomba: TEdit;
    btnPesquisarTanques: TBitBtn;
    Label5: TLabel;
    edtQuantidadeLitros: TEdit;
    edtCombustivel: TEdit;
    Label6: TLabel;
    Label7: TLabel;
    edtValor: TEdit;
    Label8: TLabel;
    edtPreco: TEdit;
    edtAliquota: TEdit;
    DBGrid1: TDBGrid;
    Panel4: TPanel;
    DataSource1: TDataSource;
    procedure FormShow(Sender: TObject);
    procedure edtQuantidadeLitrosKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnPesquisarBombasClick(Sender: TObject);
    procedure btnPesquisarTanquesClick(Sender: TObject);
    procedure edtQuantidadeLitrosExit(Sender: TObject);
  private
    FDataSet: TDataSet;
    procedure Atualizar;
    procedure ConsultarRegistro;
    procedure Gravar;
    procedure LimparTela;
    function ObterIDDaBomba: Integer;
    procedure CarregarCampoNumeroBomba(AIDBomba: Integer);
    procedure CarregarCampoTipoCombustive(AIDTanque: Integer);
    procedure ConsultarRegistroBomba;
    procedure CarregarAliquota;
    procedure CalcularValorTotal;
    function ConsultaBomba(ADataSet: TDataSet): Boolean;
    function ConsultaAbastecimento(ADataSet: TDataSet): Boolean;
    procedure CarregarConsultaDeLancamentosDoDia;
  public
    { Public declarations }
  end;

var
  ViewCadastroAbastecimento: TViewCadastroAbastecimento;

implementation

uses
  Utils.Constants,
  Utils.Form,
  Utils.Validacoes,
  Controller.Entidades,
  Conexao.unConection,
  View.Consulta.Generica,
  Utils.Enumerators,
  Repository.Abastecimento,
  System.Generics.Collections,
  Core.Abastecimento;

{$R *.dfm}

procedure TViewCadastroAbastecimento.CarregarConsultaDeLancamentosDoDia;
begin
  var lSQL := TRepositoryAbastecimento.GetSqlAbastecimentosDoDia;
  var Parametros := TDictionary<String, Variant>.Create;
  try
    Parametros.Add('DATA', Date);
    if Assigned(FDataSet) then
      FDataSet.DisposeOf;

    FDataSet := TConexao.New.GetQueryConsulta(lSQL,Parametros);
    DataSource1.DataSet := FDataSet;
    TUtilsForm.AjustarColunasDBGrid(DBGrid1);
  finally
    Parametros.DisposeOf;
  end;
end;

procedure TViewCadastroAbastecimento.Atualizar;
begin
  var lIDBomba := ObterIDDaBomba;

  TControllerEntidades.New
    .Abastecimentos
      .SetID(FID)
      .SetData(StrToDate(edtData.Text))
      .SetIDBomba(lIDBomba)
      .SetQuantidadeLitros(StrToFloat(edtQuantidadeLitros.Text))
      .SetPreco(StrToFloatDef(edtPreco.Text,0))
      .SetPercentualImposto(StrToFloatDef(edtAliquota.Text,0))
      .SetValor(StrToFloatDef(edtValor.Text,0))
    .Validacao
    .DAO
      .Atualizar;

  TConexao.New.Commit;
end;

procedure TViewCadastroAbastecimento.Gravar;
begin
  var lIDBomba := ObterIDDaBomba;

  TControllerEntidades.New
    .Abastecimentos
      .SetData(StrToDate(edtData.Text))
      .SetIDBomba(lIDBomba)
      .SetQuantidadeLitros(StrToFloat(edtQuantidadeLitros.Text))
      .SetPreco(StrToFloatDef(edtPreco.Text,0))
      .SetPercentualImposto(StrToFloatDef(edtAliquota.Text,0))
      .SetValor(StrToFloatDef(edtValor.Text,0))
    .Validacao
    .DAO
      .Inserir;

  TConexao.New.Commit;
end;

procedure TViewCadastroAbastecimento.btnCancelarClick(Sender: TObject);
begin
  inherited;
  LimparTela;
end;

procedure TViewCadastroAbastecimento.btnExcluirClick(Sender: TObject);
begin
  inherited;
  TControllerEntidades.New
    .Abastecimentos
      .SetID(FID)
    .DAO
      .Excluir;

  TConexao.New.Commit;
  LimparTela;
end;

procedure TViewCadastroAbastecimento.btnGravarClick(Sender: TObject);
begin
  inherited;
  if InsereRegistro  then
    Gravar
  else
    Atualizar;

  TConexao.New.Commit;
  LimparTela;
end;

procedure TViewCadastroAbastecimento.btnPesquisarBombasClick(Sender: TObject);
begin
  inherited;
  ConsultarRegistro;
end;

procedure TViewCadastroAbastecimento.btnPesquisarTanquesClick(Sender: TObject);
begin
  inherited;
  ConsultarRegistroBomba;
end;

function TViewCadastroAbastecimento.ConsultaBomba(ADataSet: TDataSet): Boolean;
begin
  Result := TViewConsultaGenerica.New
              .InformarCaption('Pequisa de Bombas')
              .SetDataSetPesquisa(ADataSet)
              .ShowConsulta;
end;

procedure TViewCadastroAbastecimento.ConsultarRegistroBomba;
begin
  var lDataset := TControllerEntidades.New
                    .Bombas
                    .DAO
                      .Listar
                      .ToDataSet;
  try
    if not ConsultaBomba(lDataset) then
      Exit;

    edtNumeroBomba.Text := lDataset.FieldByName('NUMERO').AsInteger.ToString;
    edtPreco.Text := lDataset.FieldByName('PRECO').AsFloat.ToString;
    CarregarCampoTipoCombustive(lDataset.FieldByName('ID_TANQUE').AsInteger);
    CalcularValorTotal;
  finally
    lDataset.DisposeOf;
  end;
end;

function TViewCadastroAbastecimento.ConsultaAbastecimento(ADataSet: TDataSet): Boolean;
begin
  Result := TViewConsultaGenerica.New
              .InformarCaption('Pequisa de Abastecimentos')
              .SetDataSetPesquisa(ADataSet)
              .ShowConsulta;
end;

procedure TViewCadastroAbastecimento.ConsultarRegistro;
begin
  var lDataset := TControllerEntidades.New
                    .Abastecimentos
                    .DAO
                      .Listar
                      .ToDataSet;
  try
    if not ConsultaAbastecimento(lDataset) then
      Exit;

    FID := lDataset.FieldByName('ID').AsInteger;
    edtCodigo.Text := FID.ToString;
    edtData.Text := DateToStr(lDataset.FieldByName('DATA').AsDateTime);
    edtAliquota.Text := lDataset.FieldByName('PERCENTUAL_IMPOSTO').AsFloat.ToString;
    edtQuantidadeLitros.Text := lDataset.FieldByName('QUANTIDADE_LITROS').AsFloat.ToString;
    edtPreco.Text := lDataset.FieldByName('PRECO').AsFloat.ToString;
    edtValor.Text := lDataset.FieldByName('VALOR').AsFloat.ToString;
    CarregarCampoNumeroBomba(lDataset.FieldByName('ID_BOMBA').AsInteger);
    btnExcluir.Enabled := True;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroAbastecimento.CarregarCampoNumeroBomba(AIDBomba: Integer);
begin
  var lDataset := TControllerEntidades.New
                    .Bombas
                      .SetID(AIDBomba)
                    .DAO
                      .ListarPorId
                      .ToDataSet;
  try
    edtNumeroBomba.Text := lDataset.FieldByName('NUMERO').AsInteger.ToString;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroAbastecimento.CarregarCampoTipoCombustive(AIDTanque: Integer);
begin
  var lDataset := TControllerEntidades.New
                    .Tanques
                      .SetID(AIDTanque)
                    .DAO
                      .ListarPorId
                      .ToDataSet;
  try
    edtCombustivel.Text := TUtilsEnumerator<TTipoCombustivel>.GetCaption(lDataset.FieldByName('COMBUSTIVEL').AsInteger);
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroAbastecimento.edtQuantidadeLitrosExit(Sender: TObject);
begin
  inherited;
  CalcularValorTotal;
end;

procedure TViewCadastroAbastecimento.CalcularValorTotal;
begin
  edtValor.Text := TCoreAbastecimento.CalcularValorTotal(StrToFloatDef(edtQuantidadeLitros.Text,0),
    StrToFloatDef(edtPreco.Text,0), StrToFloatDef(edtAliquota.Text,0)).ToString;
end;

procedure TViewCadastroAbastecimento.edtQuantidadeLitrosKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if not TUtilsValidacoes.SomenteNumerosEVirgula(Key) then
    Key := #0;
end;

procedure TViewCadastroAbastecimento.FormShow(Sender: TObject);
begin
  inherited;
  edtData.EditMask := TConstantsMasks.DATA_COMPLETA;
  edtData.Text := DateToStr(Now);
  edtQuantidadeLitros.SetFocus;
  CarregarAliquota;
  CarregarConsultaDeLancamentosDoDia;
end;

procedure TViewCadastroAbastecimento.CarregarAliquota;
begin
  var lDataset := TControllerEntidades.New
                    .Imposto
                    .DAO
                      .Listar
                      .ToDataSet;
  try
    edtAliquota.Text := lDataset.FieldByName('PERCENTUAL').AsFloat.ToString;
  finally
    lDataset.DisposeOf;
  end;
end;

procedure TViewCadastroAbastecimento.LimparTela;
begin
  edtCodigo.Clear;
  edtData.Text := DateToStr(Now);
  edtNumeroBomba.Clear;
  edtQuantidadeLitros.Clear;
  edtValor.Clear;
  edtPreco.Clear;
  edtAliquota.Clear;
  edtCombustivel.Clear;
  btnExcluir.Enabled := False;
  CarregarAliquota;
  CarregarConsultaDeLancamentosDoDia;
  edtQuantidadeLitros.SetFocus;
end;

function TViewCadastroAbastecimento.ObterIDDaBomba: Integer;
begin
  var lDataset := TControllerEntidades.New
                    .Bombas
                      .SetNumero(StrToInt(edtNumeroBomba.Text))
                    .DAO
                      .ListarPor
                      .ToDataSet;
  try
    Result := lDataset.FieldByName('ID').AsInteger;
  finally
    lDataset.DisposeOf
  end;
end;

end.
