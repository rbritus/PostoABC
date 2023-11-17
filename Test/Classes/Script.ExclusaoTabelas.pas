unit Script.ExclusaoTabelas;

interface

uses
  System.Classes;

type
  IScriptExclusaoTabela = interface
  ['{E173B764-BE24-45ED-9D49-7A90C712FFE8}']
    function GetSqlTabelaTanque: string;
    function GetSqlTabelaBomba: string;
    function GetSqlTabelaImposto: string;
    function GetSqlTabelaAbastecimento: string;
    procedure Executar;
  end;

  TScriptExclusaoTabela = class(TInterfacedObject, IScriptExclusaoTabela)
  private
    function GetSqlTabelaTanque: string;
    function GetSqlTabelaBomba: string;
    function GetSqlTabelaImposto: string;
    function GetSqlTabelaAbastecimento: string;
  public
    class function New: IScriptExclusaoTabela;
    procedure Executar;
  end;

implementation

uses
  Conexao.unConection;

{ TScriptCriacaoTabela }

procedure TScriptExclusaoTabela.Executar;
begin
  TConexao.New.EnviarComando(GetSqlTabelaTanque);
  TConexao.New.EnviarComando(GetSqlTabelaBomba);
  TConexao.New.EnviarComando(GetSqlTabelaImposto);
  TConexao.New.EnviarComando(GetSqlTabelaAbastecimento);
end;

function TScriptExclusaoTabela.GetSqlTabelaAbastecimento: string;
begin
  Result := 'DROP TABLE IF EXISTS ABASTECIMENTO;';
end;

function TScriptExclusaoTabela.GetSqlTabelaBomba: string;
begin
  Result := 'DROP TABLE IF EXISTS BOMBA;';
end;

function TScriptExclusaoTabela.GetSqlTabelaImposto: string;
begin
  Result := 'DROP TABLE IF EXISTS IMPOSTO;';
end;

function TScriptExclusaoTabela.GetSqlTabelaTanque: string;
begin
  Result := 'DROP TABLE IF EXISTS TANQUE;';
end;

class function TScriptExclusaoTabela.New: IScriptExclusaoTabela;
begin
  Result := Self.Create;
end;

end.

