unit Controller.Entidades;

interface

uses
  Builder.Tanque,
  Builder.Abastecimento,
  Builder.Bomba,
  Builder.Imposto;

type
  IControllerEntidades = interface
    function Tanques: IBuilderTanque;
    function Bombas: IBuilderBomba;
    function Imposto: IBuilderImposto;
    function Abastecimentos: IBuilderAbastecimento;
  end;

  TControllerEntidades = class(TInterfacedObject, IControllerEntidades)
  private
    FTanques: IBuilderTanque;
    FBombas: IBuilderBomba;
    FImposto: IBuilderImposto;
    FAbastecimentos: IBuilderAbastecimento;
  public
    function Tanques: IBuilderTanque;
    function Bombas: IBuilderBomba;
    function Imposto: IBuilderImposto;
    function Abastecimentos: IBuilderAbastecimento;

    class function New: IControllerEntidades;
  end;

implementation

{ TControllerEntidades }

function TControllerEntidades.Abastecimentos: IBuilderAbastecimento;
begin
  if not Assigned(FAbastecimentos) then
    FAbastecimentos := TBuilderAbastecimento.New;

  Result := FAbastecimentos;
end;

function TControllerEntidades.Bombas: IBuilderBomba;
begin
  if not Assigned(FBombas) then
    FBombas := TBuilderBomba.New;

  Result := FBombas;
end;

function TControllerEntidades.Imposto: IBuilderImposto;
begin
  if not Assigned(FImposto) then
    FImposto := TBuilderImposto.New;

  Result := FImposto;
end;

class function TControllerEntidades.New: IControllerEntidades;
begin
  Result := Self.Create;
end;

function TControllerEntidades.Tanques: IBuilderTanque;
begin
  if not Assigned(FTanques) then
    FTanques := TBuilderTanque.New;

  Result := FTanques;
end;

end.
