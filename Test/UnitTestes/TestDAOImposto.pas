unit TestDAOImposto;

interface

uses
  TestFramework, System.Generics.Collections, Data.DB, DAO.Generico, Entidade.Padrao,
  Script.CriacaoTabelas, Script.ExclusaoTabelas, Entidade.Imposto;

type
  TestTDAOImposto = class(TTestCase)
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

procedure TestTDAOImposto.SetUp;
begin
  TScriptCriacaoTabela.New.Executar;
end;

procedure TestTDAOImposto.TearDown;
begin
  TScriptExclusaoTabela.New.Executar;
end;

procedure TestTDAOImposto.TestNew;
var
  ReturnValue: IDAO;
  AObject: IImposto;
begin
  AObject := TImposto.New;
  ReturnValue := TDAO.New(AObject);
  CheckNotNull(ReturnValue);
end;

procedure TestTDAOImposto.TestListar;
var
  ReturnValue: TDataSet;
  AObject: IImposto;
const
  INSERT_IMPOSTO1 = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
  INSERT_IMPOSTO2 = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (2,10)';
  INSERT_IMPOSTO3 = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (3,12)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO1);
  TConexao.New.EnviarComando(INSERT_IMPOSTO2);
  TConexao.New.EnviarComando(INSERT_IMPOSTO3);
  AObject := TImposto.New;
  ReturnValue := TDAO.New(AObject)
                  .Listar
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 3);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestListarPorId;
var
  ReturnValue: TDataSet;
  AObject: IImposto;
const
  INSERT_IMPOSTO = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO);
  AObject := TImposto.New
              .SetID(1);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 1);
  CheckEquals(ReturnValue.Fields[0].AsInteger, 1);
  CheckEquals(ReturnValue.Fields[1].AsFloat, 10);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestListarPor;
var
  ReturnValue: TDataSet;
  AObject: IImposto;
const
  INSERT_IMPOSTO1 = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
  INSERT_IMPOSTO2 = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (2,10)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO1);
  TConexao.New.EnviarComando(INSERT_IMPOSTO2);
  AObject := TImposto.New
              .SetPercentual(10);
  ReturnValue := TDAO.New(AObject)
                  .ListarPor
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 2);
  CheckEquals(ReturnValue.Fields[0].AsInteger, 1);
  CheckEquals(ReturnValue.Fields[1].AsFloat, 10);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestExcluir;
var
  ReturnValue: IImposto;
  AObject: IImposto;
const
  INSERT_IMPOSTO = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO);
  AObject := TImposto.New
              .SetID(1)
              .SetPercentual(10);

  TDAO.New(AObject).Excluir;

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IImposto;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID, 0);
  CheckEquals(ReturnValue.GetPercentual, 0);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestAtualizar;
var
  ReturnValue: IImposto;
  AObject: IImposto;
const
  INSERT_IMPOSTO = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO);
  AObject := TImposto.New
              .SetID(1)
              .SetPercentual(12);

  TDAO.New(AObject).Atualizar;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IImposto;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID, 1);
  CheckEquals(ReturnValue.GetPercentual, 12);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestInserir;
var
  ReturnValue: IImposto;
  AObject: IImposto;
begin
  AObject := TImposto.New
              .SetID(1)
              .SetPercentual(10);

  TDAO.New(AObject).Inserir;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IImposto;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetPercentual, ReturnValue.GetPercentual);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestToDataSet;
var
  ReturnValue: TDataSet;
  AObject: IImposto;
const
  INSERT_IMPOSTO = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO);
  AObject := TImposto.New
              .SetID(1)
              .SetPercentual(10);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.Fields[0].AsInteger);
  CheckEquals(AObject.GetPercentual, ReturnValue.Fields[1].AsFloat);
  TConexao.New.Rollback;
end;

procedure TestTDAOImposto.TestToObject;
var
  ReturnValue: IImposto;
  AObject: IImposto;
const
  INSERT_IMPOSTO = 'INSERT INTO IMPOSTO (ID, PERCENTUAL) VALUES (1,10)';
begin
  TConexao.New.EnviarComando(INSERT_IMPOSTO);
  AObject := TImposto.New
              .SetID(1)
              .SetPercentual(10);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IImposto;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetPercentual, ReturnValue.GetPercentual);
  TConexao.New.Rollback;
end;

initialization
  RegisterTest(TestTDAOImposto.Suite);

end.

