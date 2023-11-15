unit Entidade.Abastecimento;

interface

uses
  System.Classes, Entidade.Padrao, Attributes.Entidades;

type
  IAbastecimento = interface
  ['{8B66D75B-6AB7-4F26-BDC7-299BED3FDD6E}']
    function SetID(const Value: Integer): IAbastecimento;
    function GetID: Integer;
    function SetDataHora(const Value: TDateTime): IAbastecimento;
    function GetDataHora: TDateTime;
    function SetIDBomba(const Value: Integer): IAbastecimento;
    function GetIDBomba: Integer;
    function SetQuantidadeLitros(const Value: Double): IAbastecimento;
    function GetQuantidadeLitros: Double;
    function SetPreco(const Value: Currency): IAbastecimento;
    function GetPreco: Currency;
    function SetPercentualImposto(const Value: Double): IAbastecimento;
    function GetPercentualImposto: Double;
    function SetValor(const Value: Currency): IAbastecimento;
    function GetValor: Currency;
  end;

  [Tabela('ABASTECIMENTO')]
  TAbastecimento = class(TEntidade, IAbastecimento)
  private
    [Campo('ID'), PK]
    FID: Integer;
    [Campo('DATAHORA')]
    FDataHora: TDateTime;
    [Campo('ID_BOMBA'),FK]
    FIDBomba: Integer;
    [Campo('QUANTIDADE_LITROS')]
    FQuantidadeLitros: Double;
    [Campo('PRECO')]
    FPreco: Currency;
    [Campo('PERCENTUAL_IMPOSTO')]
    FPercentualImposto: Double;
    [Campo('VALOR')]
    FValor: Currency;
  public
    function SetID(const Value: Integer): IAbastecimento;
    function GetID: Integer;
    function SetDataHora(const Value: TDateTime): IAbastecimento;
    function GetDataHora: TDateTime;
    function SetIDBomba(const Value: Integer): IAbastecimento;
    function GetIDBomba: Integer;
    function SetQuantidadeLitros(const Value: Double): IAbastecimento;
    function GetQuantidadeLitros: Double;
    function SetPreco(const Value: Currency): IAbastecimento;
    function GetPreco: Currency;
    function SetPercentualImposto(const Value: Double): IAbastecimento;
    function GetPercentualImposto: Double;
    function SetValor(const Value: Currency): IAbastecimento;
    function GetValor: Currency;

    class function New: IAbastecimento;
  end;

implementation

{ TAbastecimento }

function TAbastecimento.GetDataHora: TDateTime;
begin
  Result := FDataHora;
end;

function TAbastecimento.GetID: Integer;
begin
  Result := FID;
end;

function TAbastecimento.GetIDBomba: Integer;
begin
  Result := FIDBomba;
end;

function TAbastecimento.GetPercentualImposto: Double;
begin
  Result := FPercentualImposto;
end;

function TAbastecimento.GetPreco: Currency;
begin
  Result := FPreco;
end;

function TAbastecimento.GetQuantidadeLitros: Double;
begin
  Result := FQuantidadeLitros;
end;

function TAbastecimento.GetValor: Currency;
begin
  Result := FValor;
end;

class function TAbastecimento.New: IAbastecimento;
begin
  Result := Self.Create;
end;

function TAbastecimento.SetDataHora(const Value: TDateTime): IAbastecimento;
begin
  Result := Self;
  FDataHora := Value;
end;

function TAbastecimento.SetID(const Value: Integer): IAbastecimento;
begin
  Result := Self;
  FID := Value;
end;

function TAbastecimento.SetIDBomba(const Value: Integer): IAbastecimento;
begin
  Result := Self;
  FIDBomba := Value;
end;

function TAbastecimento.SetPercentualImposto(const Value: Double): IAbastecimento;
begin
  Result := Self;
  FPercentualImposto := Value;
end;

function TAbastecimento.SetPreco(const Value: Currency): IAbastecimento;
begin
  Result := Self;
  FPreco := Value;
end;

function TAbastecimento.SetQuantidadeLitros(const Value: Double): IAbastecimento;
begin
  Result := Self;
  FQuantidadeLitros := Value;
end;

function TAbastecimento.SetValor(const Value: Currency): IAbastecimento;
begin
  Result := Self;
  FValor := Value;
end;

initialization
  RegisterClass(TAbastecimento);

end.
