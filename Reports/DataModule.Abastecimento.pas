unit DataModule.Abastecimento;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Param,
  FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async,
  FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet, FireDAC.Comp.Client;

type
  TDMAbastecimento = class(TDataModule)
    dscAbastecimentoEntreDatas: TDataSource;
    qryAbastecimentoEntreDatas: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    procedure SetarConexoes;
  public
    procedure AbrirQryAbastecimentoEntreDatas(DataInicial, DataFinal: TDate);
    class function New: TDMAbastecimento;
  end;

var
  DMAbastecimento: TDMAbastecimento;

implementation

uses
  Conexao.unConection,
  Repository.Abastecimento;

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMAbastecimento.SetarConexoes;
begin
  for var Indice := 0 to Pred(Self.ComponentCount) do
    if Self.Components[Indice].ClassType = TFDQuery then
      TFDQuery(Self.Components[Indice]).Connection := TConexao.New.GetConection;
end;

procedure TDMAbastecimento.AbrirQryAbastecimentoEntreDatas(DataInicial, DataFinal: TDate);
begin
  qryAbastecimentoEntreDatas.Close;
  qryAbastecimentoEntreDatas.SQL.Clear;
  qryAbastecimentoEntreDatas.SQL.Add(TRepositoryAbastecimento.GetSqlEntreDatasParaRelatorio);
  qryAbastecimentoEntreDatas.ParamByName('DATA_INICIAL').AsDate := DataInicial;
  qryAbastecimentoEntreDatas.ParamByName('DATA_FINAL').AsDate := DataFinal;
  qryAbastecimentoEntreDatas.Open;
end;

procedure TDMAbastecimento.DataModuleCreate(Sender: TObject);
begin
  SetarConexoes;
end;

class function TDMAbastecimento.New: TDMAbastecimento;
begin
  if not Assigned(DMAbastecimento) then
    DMAbastecimento := TDMAbastecimento.Create(nil);

  Result := DMAbastecimento;
end;

end.
