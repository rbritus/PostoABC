unit Script.CriacaoTabelas;

interface

uses
  System.Classes;

type
  IScriptCriacaoTabela = interface
  ['{4F22ACF4-079B-4BA4-A238-DF59CF0C0D11}']
    function GetSqlTabelaTanque: string;
    function GetSqlTabelaBomba: string;
    function GetSqlTabelaImposto: string;
    function GetSqlTabelaAbastecimento: string;
    procedure Executar;
  end;

  TScriptCriacaoTabela = class(TInterfacedObject, IScriptCriacaoTabela)
  private
    function GetSqlTabelaTanque: string;
    function GetSqlTabelaBomba: string;
    function GetSqlTabelaImposto: string;
    function GetSqlTabelaAbastecimento: string;
  public
    class function New: IScriptCriacaoTabela;
    procedure Executar;
  end;

implementation

uses
  Conexao.unConection;

{ TScriptCriacaoTabela }

procedure TScriptCriacaoTabela.Executar;
begin
  TConexao.New.EnviarComando(GetSqlTabelaTanque);
  TConexao.New.EnviarComando(GetSqlTabelaBomba);
  TConexao.New.EnviarComando(GetSqlTabelaImposto);
  TConexao.New.EnviarComando(GetSqlTabelaAbastecimento);
  TConexao.New.Commit;
end;

function TScriptCriacaoTabela.GetSqlTabelaAbastecimento: string;
begin
  Result := 'CREATE TABLE IF NOT EXISTS ABASTECIMENTO (ID INTEGER, DATA DATE NOT NULL, ID_BOMBA INTEGER NOT NULL, ' +
            'QUANTIDADE_LITROS NUMERIC, PRECO NUMERIC, PERCENTUAL_IMPOSTO NUMERIC, VALOR NUMERIC);';
end;

function TScriptCriacaoTabela.GetSqlTabelaBomba: string;
begin
  Result := 'CREATE TABLE IF NOT EXISTS BOMBA (ID INTEGER NOT NULL, NUMERO INTEGER NOT NULL, PRECO NUMERIC, ' +
            'ID_TANQUE  INTEGER NOT NULL);';
end;

function TScriptCriacaoTabela.GetSqlTabelaImposto: string;
begin
  Result := 'CREATE TABLE IF NOT EXISTS IMPOSTO ( ID INTEGER NOT NULL, PERCENTUAL NUMERIC NOT NULL);';
end;

function TScriptCriacaoTabela.GetSqlTabelaTanque: string;
begin
  Result := 'CREATE TABLE IF NOT EXISTS TANQUE (ID INTEGER NOT NULL, DESCRICAO VARCHAR(100), COMBUSTIVEL INTEGER);';
end;

class function TScriptCriacaoTabela.New: IScriptCriacaoTabela;
begin
  Result := Self.Create;
end;

end.
