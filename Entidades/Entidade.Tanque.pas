unit Entidade.Tanque;

interface

uses
  System.Classes, Entidade.Padrao, Attributes.Entidades, Utils.Enumerators;

type
  ITanque = interface
  ['{85A17C9B-6D40-4A70-93EE-E838504B29AD}']
    function SetID(const Value: Integer): ITanque;
    function GetID: Integer;
    function SetDescricao(const Value: String): ITanque;
    function GetDescricao: String;
    function SetCombustivel(const Value: TTipoCombustivel): ITanque;
    function GetCombustivel: TTipoCombustivel;
  end;

  [Tabela('TANQUE')]
  TTanque = class(TEntidade, ITanque)
  private
    [Campo('ID'), PK]
    FID: Integer;
    [Campo('DESCRICAO')]
    FDescricao: string;
    [Campo('COMBUSTIVEL')]
    FCombustivel: TTipoCombustivel;
  public
    function SetID(const Value: Integer): ITanque;
    function GetID: Integer;
    function SetDescricao(const Value: string): ITanque;
    function GetDescricao: string;
    function SetCombustivel(const Value: TTipoCombustivel): ITanque;
    function GetCombustivel: TTipoCombustivel;

    class function New: ITanque;
  end;

implementation

{ TTanque }

function TTanque.GetCombustivel: TTipoCombustivel;
begin
  Result := FCombustivel;
end;

function TTanque.GetDescricao: String;
begin
  Result := FDescricao;
end;

function TTanque.GetID: Integer;
begin
  Result := FID;
end;

class function TTanque.New: ITanque;
begin
  Result := Self.Create;
end;

function TTanque.SetCombustivel(const Value: TTipoCombustivel): ITanque;
begin
  Result := Self;
  FCombustivel := Value;
end;

function TTanque.SetDescricao(const Value: String): ITanque;
begin
  Result := Self;
  FDescricao := Value;
end;

function TTanque.SetID(const Value: Integer): ITanque;
begin
  Result := Self;
  FID := Value;
end;

initialization
  RegisterClass(TTanque);

end.
