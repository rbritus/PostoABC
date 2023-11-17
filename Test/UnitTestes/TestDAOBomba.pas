unit TestDAOBomba;

interface

uses
  TestFramework, System.Generics.Collections, Data.DB, DAO.Generico, Entidade.Padrao,
  Script.CriacaoTabelas, Script.ExclusaoTabelas, Entidade.Bomba, Utils.Enumerators,
  System.SysUtils, Utils.Validacoes;

type
  TestTDAOBomba = class(TTestCase)
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

procedure TestTDAOBomba.SetUp;
begin
  TScriptCriacaoTabela.New.Executar;
end;

procedure TestTDAOBomba.TearDown;
begin
  TScriptExclusaoTabela.New.Executar;
end;

procedure TestTDAOBomba.TestNew;
var
  ReturnValue: IDAO;
  AObject: IBomba;
begin
  AObject := TBomba.New;
  ReturnValue := TDAO.New(AObject);
  CheckNotNull(ReturnValue);
end;

procedure TestTDAOBomba.TestListar;
var
  ReturnValue: TDataSet;
  AObject: IBomba;
const
  INSERT_BOMBA1 = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
  INSERT_BOMBA2 = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (2, 1, 4.99, 1)';
  INSERT_BOMBA3 = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (3, 1, 5.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA1);
  TConexao.New.EnviarComando(INSERT_BOMBA2);
  TConexao.New.EnviarComando(INSERT_BOMBA3);
  AObject := TBomba.New;
  ReturnValue := TDAO.New(AObject)
                  .Listar
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 3);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestListarPorId;
var
  ReturnValue: TDataSet;
  AObject: IBomba;
const
  INSERT_BOMBA = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TBomba.New
              .SetID(1);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 1);
  CheckEquals(ReturnValue.Fields[0].AsInteger, 1);
  CheckEquals(ReturnValue.Fields[1].AsInteger, 1);
  CheckEquals(TUtilsValidacoes.RoundX(ReturnValue.Fields[2].AsFloat,2), 3.99);
  CheckEquals(ReturnValue.Fields[3].AsInteger, 1);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestListarPor;
var
  ReturnValue: TDataSet;
  AObject: IBomba;
const
  INSERT_BOMBA1 = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
  INSERT_BOMBA2 = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (2, 1, 4.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA1);
  TConexao.New.EnviarComando(INSERT_BOMBA2);
  AObject := TBomba.New
              .SetIDTanque(1);
  ReturnValue := TDAO.New(AObject)
                  .ListarPor
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 2);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestExcluir;
var
  ReturnValue: IBomba;
  AObject: IBomba;
const
  INSERT_BOMBA = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TBomba.New
              .SetID(1);

  TDAO.New(AObject).Excluir;

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IBomba;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID, 0);
  CheckEquals(ReturnValue.GetNumero, 0);
  CheckEquals(ReturnValue.GetPreco, 0);
  CheckEquals(ReturnValue.GetIDTanque, 0);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestAtualizar;
var
  ReturnValue: IBomba;
  AObject: IBomba;
const
  INSERT_BOMBA = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TBomba.New
              .SetID(1)
              .SetNumero(1)
              .SetPreco(3.99)
              .SetIDTanque(1);

  TDAO.New(AObject).Atualizar;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IBomba;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID,1);
  CheckEquals(ReturnValue.GetNumero, 1);
  CheckEquals(ReturnValue.GetPreco, 3.99);
  CheckEquals(ReturnValue.GetIDTanque, 1);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestInserir;
var
  ReturnValue: IBomba;
  AObject: IBomba;
begin
  AObject := TBomba.New
              .SetID(1)
              .SetNumero(1)
              .SetPreco(3.99)
              .SetIDTanque(1);

  TDAO.New(AObject).Inserir;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IBomba;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetNumero, ReturnValue.GetNumero);
  CheckEquals(AObject.GetPreco, ReturnValue.GetPreco);
  CheckEquals(AObject.GetIDTanque, ReturnValue.GetIDTanque);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestToDataSet;
var
  ReturnValue: TDataSet;
  AObject: IBomba;
const
  INSERT_BOMBA = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TBomba.New
              .SetID(1)
              .SetNumero(1)
              .SetPreco(3.99)
              .SetIDTanque(1);

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.Fields[0].AsInteger);
  CheckEquals(AObject.GetNumero, ReturnValue.Fields[1].AsInteger);
  CheckEquals(AObject.GetPreco, TUtilsValidacoes.RoundX(ReturnValue.Fields[2].AsFloat,2));
  CheckEquals(AObject.GetIDTanque, ReturnValue.Fields[3].AsInteger);
  TConexao.New.Rollback;
end;

procedure TestTDAOBomba.TestToObject;
var
  ReturnValue: IBomba;
  AObject: IBomba;
const
  INSERT_BOMBA = 'INSERT INTO BOMBA (ID, NUMERO, PRECO, ID_TANQUE) VALUES (1, 1, 3.99, 1)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TBomba.New
              .SetID(1)
              .SetNumero(1)
              .SetPreco(3.99)
              .SetIDTanque(1);

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IBomba;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetNumero, ReturnValue.GetNumero);
  CheckEquals(AObject.GetPreco, ReturnValue.GetPreco);
  CheckEquals(AObject.GetIDTanque, ReturnValue.GetIDTanque);
  TConexao.New.Rollback;
end;

initialization
  RegisterTest(TestTDAOBomba.Suite);

end.


