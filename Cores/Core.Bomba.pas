unit Core.Bomba;

interface

uses
  System.Classes, Interfaces.Core, Entidade.Bomba, System.SysUtils, Data.DB;

type
  TCoreBomba = class(TInterfacedObject, ICore)
  private
    FBomba: IBomba;
    constructor Create(ATanque: IBomba); overload;
    function TanqueEstaAssociadoADuasBombas: Boolean;
    function NumeroDaBombaJaUtilizado: Boolean;
  public
    procedure Validacao;

    class function New(ATanque: IBomba): ICore;
  end;

implementation

uses
  Utils.Messages,
  DAO.Generico;

{ TCoreBomba }

constructor TCoreBomba.Create(ATanque: IBomba);
begin
  FBomba := ATanque;
end;

class function TCoreBomba.New(ATanque: IBomba): ICore;
begin
  Result := Self.Create(ATanque);
end;

procedure TCoreBomba.Validacao;
begin
  if FBomba.GetNumero = 0 then
    TUtilsMessages.ShowMessageExcept('Informar o número da bomba.');

  if NumeroDaBombaJaUtilizado then
    TUtilsMessages.ShowMessageExcept('Número informado para a bomba já está em uso, escolha outro.');

  if FBomba.GetPreco <= 0 then
    TUtilsMessages.ShowMessageExcept('Informar um preço válido para a bomba.');

  if FBomba.GetIDTanque = 0 then
    TUtilsMessages.ShowMessageExcept('Associe um tanque a bomba.');

  if TanqueEstaAssociadoADuasBombas then
    TUtilsMessages.ShowMessageExcept('Tanque já associado a 2 bombas, escolha outro.');
end;

function TCoreBomba.NumeroDaBombaJaUtilizado: Boolean;
begin
  var lDataSet := TDAO.New(FBomba)
                      .ListarPor
                      .ToDataSet;
  try
    Result := not lDataSet.IsEmpty;
  finally
    lDataSet.DisposeOf;
  end;
end;

function TCoreBomba.TanqueEstaAssociadoADuasBombas: Boolean;
begin
  var lDataSet := TDAO.New(FBomba)
                      .ListarPor
                      .ToDataSet;
  try
    Result := lDataSet.RecordCount >= 2;
  finally
    lDataSet.DisposeOf;
  end;
end;

end.

