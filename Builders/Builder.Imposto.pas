unit Builder.Imposto;

interface

uses
  DAO.Generico,
  Entidade.Imposto;

type
  IBuilderImposto = interface
  ['{8BAB276F-CF19-4B19-8944-21F59A098962}']
    function SetID(const Value: Integer): IBuilderImposto;
    function GetID: Integer;
    function SetPercentual(const Value: Double): IBuilderImposto;
    function GetPercentual: Double;
    function DAO: IDAO;
  end;

  TBuilderImposto = class(TInterfacedObject, IBuilderImposto)
  private
    FImposto: IImposto;

    constructor Create;
  public
    function SetID(const Value: Integer): IBuilderImposto;
    function GetID: Integer;
    function SetPercentual(const Value: Double): IBuilderImposto;
    function GetPercentual: Double;
    function DAO: IDAO;

    class function New: IBuilderImposto;
  end;

implementation

{ TBuilderImposto }

constructor TBuilderImposto.Create;
begin
  FImposto := TImposto.New;
end;

function TBuilderImposto.DAO: IDAO;
begin
  Result := TDAO.New(FImposto);
end;

function TBuilderImposto.GetID: Integer;
begin
  Result := FImposto.GetID;
end;

function TBuilderImposto.GetPercentual: Double;
begin
  Result := FImposto.GetPercentual;
end;

class function TBuilderImposto.New: IBuilderImposto;
begin
  Result := Self.Create;
end;

function TBuilderImposto.SetID(const Value: Integer): IBuilderImposto;
begin
  Result := Self;
  FImposto.SetID(Value);
end;

function TBuilderImposto.SetPercentual(const Value: Double): IBuilderImposto;
begin
  Result := Self;
  FImposto.SetPercentual(Value);
end;

end.
