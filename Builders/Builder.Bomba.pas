unit Builder.Bomba;

interface

uses
  DAO.Generico,
  Entidade.Bomba,
  Utils.Enumerators;

type
  IBuilderBomba = interface
  ['{427B093B-D58C-4E8D-A0CF-BD1FDB825152}']
    function SetID(const Value: Integer): IBuilderBomba;
    function GetID: Integer;
    function SetNumero(const Value: Integer): IBuilderBomba;
    function GetNumero: Integer;
    function SetPreco(const Value: Currency): IBuilderBomba;
    function GetPreco: Currency;
    function SetIDTanque(const Value: Integer): IBuilderBomba;
    function GetIDTanque: Integer;
    function DAO: IDAO;
  end;

  TBuilderBomba = class(TInterfacedObject, IBuilderBomba)
  private
    FBomba: IBomba;

    constructor Create;
  public
    function SetID(const Value: Integer): IBuilderBomba;
    function GetID: Integer;
    function SetNumero(const Value: Integer): IBuilderBomba;
    function GetNumero: Integer;
    function SetPreco(const Value: Currency): IBuilderBomba;
    function GetPreco: Currency;
    function SetIDTanque(const Value: Integer): IBuilderBomba;
    function GetIDTanque: Integer;
    function DAO: IDAO;

    class function New: IBuilderBomba;
  end;

implementation

{ TBuilderBomba }

constructor TBuilderBomba.Create;
begin
  FBomba := TBomba.New;
end;

function TBuilderBomba.DAO: IDAO;
begin
  Result := TDAO.New(FBomba);
end;

function TBuilderBomba.GetID: Integer;
begin
  Result := FBomba.GetID;
end;

function TBuilderBomba.GetIDTanque: Integer;
begin
  Result := FBomba.GetIDTanque;
end;

function TBuilderBomba.GetNumero: Integer;
begin
  Result := FBomba.GetNumero;
end;

function TBuilderBomba.GetPreco: Currency;
begin
  Result := FBomba.GetPreco;
end;

class function TBuilderBomba.New: IBuilderBomba;
begin
  Result := Self.Create;
end;

function TBuilderBomba.SetID(const Value: Integer): IBuilderBomba;
begin
  Result := Self;
  FBomba.SetID(Value);
end;

function TBuilderBomba.SetIDTanque(const Value: Integer): IBuilderBomba;
begin
  Result := Self;
  FBomba.SetIDTanque(Value);
end;

function TBuilderBomba.SetNumero(const Value: Integer): IBuilderBomba;
begin
  Result := Self;
  FBomba.SetNumero(Value);
end;

function TBuilderBomba.SetPreco(const Value: Currency): IBuilderBomba;
begin
  Result := Self;
  FBomba.SetPreco(Value);
end;

end.
