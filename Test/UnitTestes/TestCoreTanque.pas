unit TestCoreTanque;

interface

uses
  TestFramework, Core.Tanque, System.SysUtils, Interfaces.Core, Entidade.Tanque,
  System.Classes, Utils.Messages;

type
  TestTCoreTanque = class(TTestCase)
  published
    procedure TestNew;
    procedure TestValidacao;
    procedure TestExcecaoValidacao;
  end;

implementation

procedure TestTCoreTanque.TestValidacao;
var
  ReturnValue: ICore;
  ATanque: ITanque;
begin
  ATanque := TTanque.New
              .SetDescricao('Teste');
  CheckNotNull(ATanque);

  ReturnValue := TCoreTanque.New(ATanque);
  CheckNotNull(ReturnValue);

  ReturnValue.Validacao;
  Check(True);
end;

procedure TestTCoreTanque.TestExcecaoValidacao;
var
  ReturnValue: ICore;
  ATanque: ITanque;
begin
  ATanque := TTanque.New;
  CheckNotNull(ATanque);

  ReturnValue := TCoreTanque.New(ATanque);
  CheckNotNull(ReturnValue);

  StartExpectingException(EMessage);
  ReturnValue.Validacao;
  StopExpectingException();
end;

procedure TestTCoreTanque.TestNew;
var
  ReturnValue: ICore;
  ATanque: ITanque;
begin
  ReturnValue := TCoreTanque.New(ATanque);
  CheckNotNull(ReturnValue);
end;

initialization
  RegisterTest(TestTCoreTanque.Suite);

end.

