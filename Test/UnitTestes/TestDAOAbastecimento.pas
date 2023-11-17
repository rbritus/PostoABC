unit TestDAOAbastecimento;

interface

uses
  TestFramework, System.Generics.Collections, Data.DB, DAO.Generico, Entidade.Padrao,
  Script.CriacaoTabelas, Script.ExclusaoTabelas, Entidade.Abastecimento, Utils.Enumerators,
  System.SysUtils, Utils.Validacoes;

type
  TestTDAOAbastecimento = class(TTestCase)
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

procedure TestTDAOAbastecimento.SetUp;
begin
  TScriptCriacaoTabela.New.Executar;
end;

procedure TestTDAOAbastecimento.TearDown;
begin
  TScriptExclusaoTabela.New.Executar;
end;

procedure TestTDAOAbastecimento.TestNew;
var
  ReturnValue: IDAO;
  AObject: IAbastecimento;
begin
  AObject := TAbastecimento.New;
  ReturnValue := TDAO.New(AObject);
  CheckNotNull(ReturnValue);
end;

procedure TestTDAOAbastecimento.TestListar;
var
  ReturnValue: TDataSet;
  AObject: IAbastecimento;
const
  INSERT_BOMBA1 = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
  INSERT_BOMBA2 = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 20, 5.99, 13, 104.23)';
  INSERT_BOMBA3 = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 30, 4.99, 13, 130.24)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA1);
  TConexao.New.EnviarComando(INSERT_BOMBA2);
  TConexao.New.EnviarComando(INSERT_BOMBA3);
  AObject := TAbastecimento.New;
  ReturnValue := TDAO.New(AObject)
                  .Listar
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 3);
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestListarPorId;
var
  ReturnValue: TDataSet;
  AObject: IAbastecimento;
const
  INSERT_BOMBA = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TAbastecimento.New
              .SetID(1);
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 1);
  CheckEquals(ReturnValue.Fields[0].AsInteger, 1);
  CheckEquals(ReturnValue.Fields[1].AsDateTime, Date);
  CheckEquals(ReturnValue.Fields[2].AsInteger, 1);
  CheckEquals(TUtilsValidacoes.RoundX(ReturnValue.Fields[3].AsFloat,2), 10);
  CheckEquals(TUtilsValidacoes.RoundX(ReturnValue.Fields[4].AsFloat,2), 3.99);
  CheckEquals(TUtilsValidacoes.RoundX(ReturnValue.Fields[5].AsFloat,2), 13);
  CheckEquals(TUtilsValidacoes.RoundX(ReturnValue.Fields[6].AsFloat,2), 34.71);
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestListarPor;
var
  ReturnValue: TDataSet;
  AObject: IAbastecimento;
const
  INSERT_BOMBA1 = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
  INSERT_BOMBA2 = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 20, 5.99, 13, 104.23)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA1);
  TConexao.New.EnviarComando(INSERT_BOMBA2);
  AObject := TAbastecimento.New
              .SetIDBomba(1);
  ReturnValue := TDAO.New(AObject)
                  .ListarPor
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  Check(ReturnValue.RecordCount = 2);
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestExcluir;
var
  ReturnValue: IAbastecimento;
  AObject: IAbastecimento;
const
  INSERT_BOMBA = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TAbastecimento.New
              .SetID(1);

  TDAO.New(AObject).Excluir;

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IAbastecimento;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID, 0);
  CheckEquals(ReturnValue.GetData, 0);
  CheckEquals(ReturnValue.GetIDBomba, 0);
  CheckEquals(ReturnValue.GetQuantidadeLitros, 0);
  CheckEquals(ReturnValue.GetPreco, 0);
  CheckEquals(ReturnValue.GetPercentualImposto, 0);
  CheckEquals(ReturnValue.GetValor, 0);
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestAtualizar;
var
  ReturnValue: IAbastecimento;
  AObject: IAbastecimento;
const
  INSERT_BOMBA = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TAbastecimento.New
              .SetID(1)
              .SetData(Date)
              .SetIDBomba(1)
              .SetQuantidadeLitros(10)
              .SetPreco(3.99)
              .SetPercentualImposto(13)
              .SetValor(34.71);

  TDAO.New(AObject).Atualizar;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IAbastecimento;

  CheckNotNull(ReturnValue);
  CheckEquals(ReturnValue.GetID,1);
  CheckEquals(ReturnValue.GetData, Date);
  CheckEquals(ReturnValue.GetIDBomba, 1);
  CheckEquals(ReturnValue.GetQuantidadeLitros, 10);
  CheckEquals(ReturnValue.GetPreco, 3.99);
  CheckEquals(ReturnValue.GetPercentualImposto, 13);
  CheckEquals(ReturnValue.GetValor, 34.71);
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestInserir;
var
  ReturnValue: IAbastecimento;
  AObject: IAbastecimento;
begin
  AObject := TAbastecimento.New
              .SetID(1)
              .SetData(Date)
              .SetIDBomba(1)
              .SetQuantidadeLitros(10)
              .SetPreco(3.99)
              .SetPercentualImposto(13)
              .SetValor(34.71);

  TDAO.New(AObject).Inserir;
  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IAbastecimento;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetData, ReturnValue.GetData);
  CheckEquals(AObject.GetIDBomba, ReturnValue.GetIDBomba);
  CheckEquals(AObject.GetQuantidadeLitros, ReturnValue.GetQuantidadeLitros);
  CheckEquals(AObject.GetPreco, ReturnValue.GetPreco);
  CheckEquals(AObject.GetPercentualImposto, ReturnValue.GetPercentualImposto);
  CheckEquals(AObject.GetValor, ReturnValue.GetValor);
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestToDataSet;
var
  ReturnValue: TDataSet;
  AObject: IAbastecimento;
const
  INSERT_BOMBA = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TAbastecimento.New
              .SetID(1)
              .SetData(Date)
              .SetIDBomba(1)
              .SetQuantidadeLitros(10)
              .SetPreco(3.99)
              .SetPercentualImposto(13)
              .SetValor(34.71);

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToDataSet;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.Fields[0].AsInteger);
  CheckEquals(AObject.GetData, ReturnValue.Fields[1].AsDateTime);
  CheckEquals(AObject.GetIDBomba, ReturnValue.Fields[2].AsInteger);
  CheckEquals(AObject.GetQuantidadeLitros, TUtilsValidacoes.RoundX(ReturnValue.Fields[3].AsFloat,2));
  CheckEquals(AObject.GetPreco, TUtilsValidacoes.RoundX(ReturnValue.Fields[4].AsFloat,2));
  CheckEquals(AObject.GetPercentualImposto, TUtilsValidacoes.RoundX(ReturnValue.Fields[5].AsFloat,2));
  CheckEquals(AObject.GetValor, TUtilsValidacoes.RoundX(ReturnValue.Fields[6].AsFloat,2));
  TConexao.New.Rollback;
end;

procedure TestTDAOAbastecimento.TestToObject;
var
  ReturnValue: IAbastecimento;
  AObject: IAbastecimento;
const
  INSERT_BOMBA = 'INSERT INTO ABASTECIMENTO (ID, DATA, ID_BOMBA, QUANTIDADE_LITROS, PRECO, PERCENTUAL_IMPOSTO, VALOR) VALUES (1, CURRENT_TIMESTAMP, 1, 10, 3.99, 13, 34.71)';
begin
  TConexao.New.EnviarComando(INSERT_BOMBA);
  AObject := TAbastecimento.New
              .SetID(1)
              .SetData(Date)
              .SetIDBomba(1)
              .SetQuantidadeLitros(10)
              .SetPreco(3.99)
              .SetPercentualImposto(13)
              .SetValor(34.71);

  ReturnValue := TDAO.New(AObject)
                  .ListarPorId
                    .ToObject as IAbastecimento;

  CheckNotNull(ReturnValue);
  CheckEquals(AObject.GetID, ReturnValue.GetID);
  CheckEquals(AObject.GetData, ReturnValue.GetData);
  CheckEquals(AObject.GetIDBomba, ReturnValue.GetIDBomba);
  CheckEquals(AObject.GetQuantidadeLitros, ReturnValue.GetQuantidadeLitros);
  CheckEquals(AObject.GetPreco, ReturnValue.GetPreco);
  CheckEquals(AObject.GetPercentualImposto, ReturnValue.GetPercentualImposto);
  CheckEquals(AObject.GetValor, ReturnValue.GetValor);
  TConexao.New.Rollback;
end;

initialization
  RegisterTest(TestTDAOAbastecimento.Suite);

end.


