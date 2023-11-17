unit TestDAOTanque;

interface

uses
  TestFramework, System.Generics.Collections, Data.DB, DAO.Generico, Entidade.Padrao,
  Script.CriacaoTabelas, Script.ExclusaoTabelas, Entidade.Tanque, Utils.Enumerators,
  System.SysUtils;

type
  TestTDAOTanque = class(TTestCase)
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestNew;
    procedure TestListar;
    procedure TestListarPorId;
    procedure TestListarPor;
    procedure TestExcluir;
    procedure TestAtualizar;
    procedure TestInserir;
    procedure TestToDataSet;
    procedure TestToObject;
  end;

implementation

uses
  Conexao.unConection;

procedure TestTDAOTanque.SetUp;
begin
  TScriptCriacaoTabela.New.Executar;
end;

procedure TestTDAOTanque.TearDown;
begin
  TScriptExclusaoTabela.New.Executar;
end;

procedure TestTDAOTanque.TestNew;
var
  ReturnValue: IDAO;
  AObject: ITanque;
begin
  AObject := TTanque.New;
  ReturnValue := TDAO.New(AObject);
  CheckNotNull(ReturnValue);
end;

procedure TestTDAOTanque.TestListar;
var
  ReturnValue: TDataSet;
  AObject: ITanque;
const
  INSERT_TANQUE1 = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
  INSERT_TANQUE2 = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (2,''TANQUE 2'',1)';
  INSERT_TANQUE3 = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (3,''TANQUE 3'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE1);
  TConexao.New.EnviarComando(INSERT_TANQUE2);
  TConexao.New.EnviarComando(INSERT_TANQUE3);
  AObject := TTanque.New;
  ReturnValue := TDAO.New(AObject)
                  .Listar
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 3);
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestListarPorId;
var
  ReturnValue: TDataSet;
  AObject: ITanque;
const
  INSERT_TANQUE = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE);
  AObject := TTanque.New
              .SetID(1);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 1);
  CheckEquals(ReturnValue.Fields[0].AsInteger, 1);
  CheckEquals(ReturnValue.Fields[1].AsString, 'TANQUE 1');
  CheckEquals(ReturnValue.Fields[2].AsInteger, 0);
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestListarPor;
var
  ReturnValue: TDataSet;
  AObject: ITanque;
const
  INSERT_TANQUE1 = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
  INSERT_TANQUE2 = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (2,''TANQUE 2'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE1);
  TConexao.New.EnviarComando(INSERT_TANQUE2);
  AObject := TTanque.New
              .SetCombustivel(TTipoCombustivel(0));
  ReturnValue := TDAO.New(AObject)
                  .ListarPor
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 2);
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestExcluir;
var
  ReturnValue: ITanque;
  AObject: ITanque;
const
  INSERT_TANQUE = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE);
  AObject := TTanque.New
              .SetID(1);

  TDAO.New(AObject).Excluir;

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as ITanque;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID, 0);
  CheckEquals(ReturnValue.GetDescricao, EmptyStr);
  Check(ReturnValue.GetCombustivel = tcGasolina);
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestAtualizar;
var
  ReturnValue: ITanque;
  AObject: ITanque;
const
  INSERT_TANQUE = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE);
  AObject := TTanque.New
              .SetID(1)
              .SetDescricao('TANQUE 2')
              .SetCombustivel(tcOleoDiesel);

  TDAO.New(AObject).Atualizar;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as ITanque;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID, 1);
  CheckEquals(ReturnValue.GetDescricao, 'TANQUE 2');
  Check(ReturnValue.GetCombustivel = tcOleoDiesel);
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestInserir;
var
  ReturnValue: ITanque;
  AObject: ITanque;
begin
  AObject := TTanque.New
              .SetID(1)
              .SetDescricao('TANQUE 1')
              .SetCombustivel(tcGasolina);

  TDAO.New(AObject).Inserir;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as ITanque;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetDescricao, ReturnValue.GetDescricao);
  CheckEquals(Ord(AObject.GetCombustivel), Ord(ReturnValue.GetCombustivel));
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestToDataSet;
var
  ReturnValue: TDataSet;
  AObject: ITanque;
const
  INSERT_TANQUE = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE);
  AObject := TTanque.New
              .SetID(1)
              .SetDescricao('TANQUE 1')
              .SetCombustivel(tcGasolina);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.Fields[0].AsInteger);
  CheckEquals(AObject.GetDescricao, ReturnValue.Fields[1].AsString);
  CheckEquals(Ord(AObject.GetCombustivel), ReturnValue.Fields[2].AsInteger);
  TConexao.New.Rollback;
end;

procedure TestTDAOTanque.TestToObject;
var
  ReturnValue: ITanque;
  AObject: ITanque;
const
  INSERT_TANQUE = 'INSERT INTO TANQUE (ID, DESCRICAO, COMBUSTIVEL) VALUES (1,''TANQUE 1'',0)';
begin
  TConexao.New.EnviarComando(INSERT_TANQUE);
  AObject := TTanque.New
              .SetID(1)
              .SetDescricao('TANQUE 1')
              .SetCombustivel(tcGasolina);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as ITanque;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetDescricao, ReturnValue.GetDescricao);
  CheckEquals(Ord(AObject.GetCombustivel), Ord(ReturnValue.GetCombustivel));
  TConexao.New.Rollback;
end;

initialization
  RegisterTest(TestTDAOTanque.Suite);

end.


