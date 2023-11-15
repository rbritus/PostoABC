unit Entidade.Imposto;

interface

uses
  System.Classes, Entidade.Padrao, Attributes.Entidades;

type
  IImposto = interface
  ['{85040C67-956D-4224-9E91-9E34A3A7AC36}']
    function SetID(const Value: Integer): IImposto;
    function GetID: Integer;
    function SetPercentual(const Value: Double): IImposto;
    function GetPercentual: Double;
  end;

  [Tabela('IMPOSTO')]
  TImposto = class(TEntidade, IImposto)
  private
    [Campo('ID'), PK]
    FID: Integer;
    [Campo('PERCENTUAL')]
    FPercentual: Double;
  public
    function SetID(const Value: Integer): IImposto;
    function GetID: Integer;
    function SetPercentual(const Value: Double): IImposto;
    function GetPercentual: Double;

    class function New: IImposto;
  end;

implementation

{ TImposto }

function TImposto.GetID: Integer;
begin
  Result := FID;
end;

function TImposto.GetPercentual: Double;
begin
  Result := FPercentual;
end;

class function TImposto.New: IImposto;
begin
  Result := Self.Create;
end;

function TImposto.SetID(const Value: Integer): IImposto;
begin
  Result := Self;
  FID := Value;
end;

function TImposto.SetPercentual(const Value: Double): IImposto;
begin
  Result := Self;
  FPercentual := Value;
end;

initialization
  RegisterClass(TImposto);

end.
