unit Core.Tanque;

interface

uses
  System.Classes, Interfaces.Core, Entidade.Tanque, System.SysUtils;

type
  TCoreTanque = class(TInterfacedObject, ICore)
  private
    FTanque: ITanque;
    constructor Create(ATanque: ITanque); overload;
  public
    procedure Validacao;

    class function New(ATanque: ITanque): ICore;
  end;

implementation

uses
  Utils.Messages;

{ TCoreTanque }

constructor TCoreTanque.Create(ATanque: ITanque);
begin
  FTanque := ATanque;
end;

class function TCoreTanque.New(ATanque: ITanque): ICore;
begin
  Result := Self.Create(ATanque);
end;

procedure TCoreTanque.Validacao;
begin
  if FTanque.GetDescricao.Trim.IsEmpty then
    TUtilsMessages.ShowMessageExcept('Informar a descrição do tanque.');
end;

end.
