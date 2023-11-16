unit Builder.Tanque;

interface

uses
  DAO.Generico,
  Entidade.Tanque,
  Utils.Enumerators,
  Core.Tanque;

type
  IBuilderTanque = interface
  ['{4B91AD2C-8C1B-4F64-806B-140FC13FE096}']
    function SetID(const Value: Integer): IBuilderTanque;
    function GetID: Integer;
    function SetDescricao(const Value: String): IBuilderTanque;
    function GetDescricao: String;
    function SetCombustivel(const Value: TTipoCombustivel): IBuilderTanque;
    function GetCombustivel: TTipoCombustivel;
    function Validacao: IBuilderTanque;
    function DAO: IDAO;
  end;

  TBuilderTanque = class(TInterfacedObject, IBuilderTanque)
  private
    FTanque: ITanque;

    constructor Create;
  public
    function SetID(const Value: Integer): IBuilderTanque;
    function GetID: Integer;
    function SetDescricao(const Value: String): IBuilderTanque;
    function GetDescricao: String;
    function SetCombustivel(const Value: TTipoCombustivel): IBuilderTanque;
    function GetCombustivel: TTipoCombustivel;
    function Validacao: IBuilderTanque;
    function DAO: IDAO;

    class function New: IBuilderTanque;
  end;

implementation

{ TBuilderTanque }

constructor TBuilderTanque.Create;
begin
  FTanque := TTanque.New;
end;

function TBuilderTanque.DAO: IDAO;
begin
  Result := TDAO.New(FTanque);
end;

function TBuilderTanque.GetCombustivel: TTipoCombustivel;
begin
  Result := FTanque.GetCombustivel;
end;

function TBuilderTanque.GetDescricao: String;
begin
  Result := FTanque.GetDescricao;
end;

function TBuilderTanque.GetID: Integer;
begin
  Result := FTanque.GetID;
end;

class function TBuilderTanque.New: IBuilderTanque;
begin
  Result := Self.Create;
end;

function TBuilderTanque.SetCombustivel(const Value: TTipoCombustivel): IBuilderTanque;
begin
  Result := Self;
  FTanque.SetCombustivel(Value);
end;

function TBuilderTanque.SetDescricao(const Value: String): IBuilderTanque;
begin
  Result := Self;
  FTanque.SetDescricao(Value);
end;

function TBuilderTanque.SetID(const Value: Integer): IBuilderTanque;
begin
  Result := Self;
  FTanque.SetID(Value);
end;

function TBuilderTanque.Validacao: IBuilderTanque;
begin
  Result := Self;
  TCoreTanque.New(FTanque).Validacao;
end;

end.
