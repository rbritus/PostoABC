unit Builder.Abastecimento;

interface

uses
  DAO.Generico,
  Entidade.Abastecimento,
  Utils.Enumerators;

type
  IBuilderAbastecimento = interface
  ['{73045839-DB31-47A7-9EA0-7BEF8E9D8E2A}']
    function SetID(const Value: Integer): IBuilderAbastecimento;
    function GetID: Integer;
    function SetData(const Value: TDate): IBuilderAbastecimento;
    function GetData: TDate;
    function SetIDBomba(const Value: Integer): IBuilderAbastecimento;
    function GetIDBomba: Integer;
    function SetQuantidadeLitros(const Value: Double): IBuilderAbastecimento;
    function GetQuantidadeLitros: Double;
    function SetPreco(const Value: Currency): IBuilderAbastecimento;
    function GetPreco: Currency;
    function SetPercentualImposto(const Value: Double): IBuilderAbastecimento;
    function GetPercentualImposto: Double;
    function SetValor(const Value: Currency): IBuilderAbastecimento;
    function GetValor: Currency;
    function Validacao: IBuilderAbastecimento;
    function DAO: IDAO;
  end;

  TBuilderAbastecimento = class(TInterfacedObject, IBuilderAbastecimento)
  private
    FAbastecimento: IAbastecimento;

    constructor Create;
  public
    function SetID(const Value: Integer): IBuilderAbastecimento;
    function GetID: Integer;
    function SetData(const Value: TDate): IBuilderAbastecimento;
    function GetData: TDate;
    function SetIDBomba(const Value: Integer): IBuilderAbastecimento;
    function GetIDBomba: Integer;
    function SetQuantidadeLitros(const Value: Double): IBuilderAbastecimento;
    function GetQuantidadeLitros: Double;
    function SetPreco(const Value: Currency): IBuilderAbastecimento;
    function GetPreco: Currency;
    function SetPercentualImposto(const Value: Double): IBuilderAbastecimento;
    function GetPercentualImposto: Double;
    function SetValor(const Value: Currency): IBuilderAbastecimento;
    function GetValor: Currency;
    function Validacao: IBuilderAbastecimento;
    function DAO: IDAO;

    class function New: IBuilderAbastecimento;
  end;

implementation

uses
  Core.Abastecimento;

{ TBuilderAbastecimento }

constructor TBuilderAbastecimento.Create;
begin
  FAbastecimento := TAbastecimento.New;
end;

function TBuilderAbastecimento.DAO: IDAO;
begin
  Result := TDAO.New(FAbastecimento);
end;

function TBuilderAbastecimento.GetData: TDate;
begin
  Result := FAbastecimento.GetData;
end;

function TBuilderAbastecimento.GetID: Integer;
begin
  Result := FAbastecimento.GetID;
end;

function TBuilderAbastecimento.GetIDBomba: Integer;
begin
  Result := FAbastecimento.GetIDBomba;
end;

function TBuilderAbastecimento.GetPercentualImposto: Double;
begin
  Result := FAbastecimento.GetPercentualImposto;
end;

function TBuilderAbastecimento.GetPreco: Currency;
begin
  Result := FAbastecimento.GetPreco;
end;

function TBuilderAbastecimento.GetQuantidadeLitros: Double;
begin
  Result := FAbastecimento.GetQuantidadeLitros;
end;

function TBuilderAbastecimento.GetValor: Currency;
begin
  Result := FAbastecimento.GetValor;
end;

class function TBuilderAbastecimento.New: IBuilderAbastecimento;
begin
  Result := Self.Create;
end;

function TBuilderAbastecimento.SetData(const Value: TDate): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetData(Value);
end;

function TBuilderAbastecimento.SetID(const Value: Integer): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetID(Value);
end;

function TBuilderAbastecimento.SetIDBomba(const Value: Integer): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetIDBomba(Value);
end;

function TBuilderAbastecimento.SetPercentualImposto(const Value: Double): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetPercentualImposto(Value);
end;

function TBuilderAbastecimento.SetPreco(const Value: Currency): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetPreco(Value);
end;

function TBuilderAbastecimento.SetQuantidadeLitros(const Value: Double): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetQuantidadeLitros(Value);
end;

function TBuilderAbastecimento.SetValor(const Value: Currency): IBuilderAbastecimento;
begin
  Result := Self;
  FAbastecimento.SetValor(Value);
end;

function TBuilderAbastecimento.Validacao: IBuilderAbastecimento;
begin
  Result := Self;
  TCoreAbastecimento.New(FAbastecimento).Validacao;
end;

end.
