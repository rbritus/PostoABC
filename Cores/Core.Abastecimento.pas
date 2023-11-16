unit Core.Abastecimento;

interface

uses
  System.Classes, Interfaces.Core, Entidade.Abastecimento, System.SysUtils, Data.DB, System.Math;

type
  TCoreAbastecimento = class(TInterfacedObject, ICore)
  private
    FAbastecimento: IAbastecimento;
    constructor Create(ATanque: IAbastecimento); overload;
  public
    procedure Validacao;

    class function New(ATanque: IAbastecimento): ICore;
    class function CalcularValorTotal(AQuantidadeListro, APreco, AImposto: Double): Double;
  end;

implementation

uses
  Utils.Messages,
  Utils.Validacoes,
  DAO.Generico;

{ TCoreAbastecimento }

class function TCoreAbastecimento.CalcularValorTotal(AQuantidadeListro, APreco, AImposto: Double): Double;
begin
  Result := TUtilsValidacoes.RoundX(TUtilsValidacoes.RoundX(AQuantidadeListro * APreco,2) * ((100 - AImposto) / 100),2);
end;

constructor TCoreAbastecimento.Create(ATanque: IAbastecimento);
begin
  FAbastecimento := ATanque;
end;

class function TCoreAbastecimento.New(ATanque: IAbastecimento): ICore;
begin
  Result := Self.Create(ATanque);
end;

procedure TCoreAbastecimento.Validacao;
begin
  if FAbastecimento.GetData = 0 then
    TUtilsMessages.ShowMessageExcept('Informar uma data válida.');

  if FAbastecimento.GetQuantidadeLitros <= 0 then
    TUtilsMessages.ShowMessageExcept('Informar a quantidade de litros abastecida.');

  if FAbastecimento.GetIDBomba = 0 then
    TUtilsMessages.ShowMessageExcept('Associe uma bomba para o lançamento.');

  if FAbastecimento.GetPreco <= 0 then
    TUtilsMessages.ShowMessageExcept('Informar o preço da bomba.');

  if FAbastecimento.GetPreco <= 0 then
    TUtilsMessages.ShowMessageExcept('Informar o preço da bomba.');
end;

end.

