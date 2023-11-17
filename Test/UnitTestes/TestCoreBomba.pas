unit TestCoreBomba;

interface

uses
  TestFramework, Entidade.Bomba, Data.DB, System.SysUtils, Interfaces.Core, Core.Bomba,
  System.Classes, Utils.Messages, Script.CriacaoTabelas, Conexao.unConection, Script.ExclusaoTabelas;

type
  TestTCoreBomba = class(TTestCase)
   public
     procedure SetUp; override;
     procedure TearDown; override;
  published
    procedure TestNew;
    procedure TestValidacao;
    procedure TestExcecaoValidacao;
  end;

implementation

procedure TestTCoreBomba.SetUp;
const
  INSERT_TANQUE = 'INSERT INTO TANQUE (ID, DESCRICAO) VALUES (1,''TAQNUE TESTE'')';
begin
  inherited;
  TScriptCriacaoTabela.New.Executar;
  TConexao.New.EnviarComando(INSERT_TANQUE);
  TConexao.New.Commit;
end;

procedure TestTCoreBomba.TearDown;
begin
  TScriptExclusaoTabela.New.Executar;
end;

procedure TestTCoreBomba.TestExcecaoValidacao;
var
  ReturnValue: ICore;
  ABomba: IBomba;
begin
  ABomba := TBomba.New;
  CheckNotNull(ABomba);

  ReturnValue := TCoreBomba.New(ABomba);
  CheckNotNull(ReturnValue);

  StartExpectingException(EMessage);
  ReturnValue.Validacao;
  StopExpectingException();
end;

procedure TestTCoreBomba.TestValidacao;
var
  ReturnValue: ICore;
  ABomba: IBomba;
const
  ID_TANQUE = 1;
begin
  ABomba := TBomba.New
              .SetNumero(1)
              .SetPreco(10)
              .SetIDTanque(ID_TANQUE);
  CheckNotNull(ABomba);

  ReturnValue := TCoreBomba.New(ABomba);
  CheckNotNull(ReturnValue);

  ReturnValue.Validacao;
  Check(True);
end;

procedure TestTCoreBomba.TestNew;
var
  ReturnValue: ICore;
  ABomba: IBomba;
begin
  ReturnValue := TCoreBomba.New(ABomba);
  CheckNotNull(ReturnValue);
end;

initialization
  RegisterTest(TestTCoreBomba.Suite);

end.

