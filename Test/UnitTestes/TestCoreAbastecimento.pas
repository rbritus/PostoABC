unit TestCoreAbastecimento;

interface

uses
  TestFramework, Entidade.Abastecimento, Data.DB, System.SysUtils, Interfaces.Core,
  Core.Abastecimento, System.Math, System.Classes, Script.CriacaoTabelas, Conexao.unConection,
  Script.ExclusaoTabelas, Utils.Messages;

type
  TestTCoreAbastecimento = class(TTestCase)
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNew;
    procedure TestValidacao;
    procedure TestExcecaoValidacao;
    procedure TestCalcularValorTotal;
  end;

implementation

procedure TestTCoreAbastecimento.SetUp;
const
  INSERT_BOMBA = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1,1,3.99,1)';
begin
  inherited;
  TScriptCriacaoTabela.New.Executar;
  TConexao.New.EnviarComando(INSERT_BOMBA);
  TConexao.New.Commit;
end;

procedure TestTCoreAbastecimento.TearDown;
begin
  TScriptExclusaoTabela.New.Executar;
end;

procedure TestTCoreAbastecimento.TestExcecaoValidacao;
var
  ReturnValue: ICore;
  AAbastecimento: IAbastecimento;
begin
  AAbastecimento := TAbastecimento.New;
  CheckNotNull(AAbastecimento);

  ReturnValue := TCoreAbastecimento.New(AAbastecimento);
  CheckNotNull(ReturnValue);

  StartExpectingException(EMessage);
  ReturnValue.Validacao;
  StopExpectingException();
end;

procedure TestTCoreAbastecimento.TestValidacao;
var
  ReturnValue: ICore;
  ABomba: IAbastecimento;
const
  ID_BOMBA = 1;
begin
  ABomba := TAbastecimento.New
              .SetData(Date)
              .SetIDBomba(1)
              .SetQuantidadeLitros(10)
              .SetPreco(3.99);
  CheckNotNull(ABomba);

  ReturnValue := TCoreAbastecimento.New(ABomba);
  CheckNotNull(ReturnValue);

  ReturnValue.Validacao;
  Check(True);
end;

procedure TestTCoreAbastecimento.TestNew;
var
  ReturnValue: ICore;
  ATanque: IAbastecimento;
begin
  ReturnValue := TCoreAbastecimento.New(ATanque);
  CheckNotNull(ReturnValue);
end;

procedure TestTCoreAbastecimento.TestCalcularValorTotal;
var
  ReturnValue: Double;
  AImposto: Double;
  APreco: Double;
  AQuantidadeListro: Double;
  AValorTotal: Double;
begin
  AImposto := 13;
  APreco := 3.99;
  AQuantidadeListro := 10;
  AValorTotal := 34.71;
  ReturnValue := TCoreAbastecimento.CalcularValorTotal(AQuantidadeListro, APreco, AImposto);
  CheckEquals(AValorTotal, ReturnValue);
end;

initialization
  RegisterTest(TestTCoreAbastecimento.Suite);

end.

