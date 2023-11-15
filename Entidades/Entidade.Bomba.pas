unit Entidade.Bomba;

interface

uses
  System.Classes, Entidade.Padrao, Attributes.Entidades;

type
  IBomba = interface
  ['{E98A2046-8D77-438E-8808-234C1EF6B83D}']
    function SetID(const Value: Integer): IBomba;
    function GetID: Integer;
    function SetNumero(const Value: Integer): IBomba;
    function GetNumero: Integer;
    function SetPreco(const Value: Currency): IBomba;
    function GetPreco: Currency;
    function SetIDTanque(const Value: Integer): IBomba;
    function GetIDTanque: Integer;
  end;

  [Tabela('BOMBA')]
  TBomba = class(TEntidade, IBomba)
  private
    [Campo('ID'), PK]
    FID: Integer;
    [Campo('NUMERO')]
    FNumero: Integer;
    [Campo('PRECO')]
    FPreco: Currency;
    [Campo('ID_TANQUE'), FK]
    FIDTanque: Integer;
  public
    function SetID(const Value: Integer): IBomba;
    function GetID: Integer;
    function SetNumero(const Value: Integer): IBomba;
    function GetNumero: Integer;
    function SetPreco(const Value: Currency): IBomba;
    function GetPreco: Currency;
    function SetIDTanque(const Value: Integer): IBomba;
    function GetIDTanque: Integer;

    class function New: IBomba;
  end;

implementation

{ TBomba }

function TBomba.GetID: Integer;
begin
  Result := FID;
end;

function TBomba.GetIDTanque: Integer;
begin
  Result := FIDTanque;
end;

function TBomba.GetNumero: Integer;
begin
  Result := FNumero;
end;

function TBomba.GetPreco: Currency;
begin
  Result := FPreco;
end;

class function TBomba.New: IBomba;
begin
  Result := Self.Create;
end;

function TBomba.SetID(const Value: Integer): IBomba;
begin
  Result := Self;
  FID := Value;
end;

function TBomba.SetIDTanque(const Value: Integer): IBomba;
begin
  Result := Self;
  FIDTanque := Value;
end;

function TBomba.SetNumero(const Value: Integer): IBomba;
begin
  Result := Self;
  FNumero := Value;
end;

function TBomba.SetPreco(const Value: Currency): IBomba;
begin
  Result := Self;
  FPreco := Value;
end;

initialization
  RegisterClass(TBomba);

end.
