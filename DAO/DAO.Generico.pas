unit DAO.Generico;

interface

uses
  System.Generics.Collections,
  Data.DB,
  Entidade.Padrao;
type
  IDAO = interface
  ['{A371A7F2-9CEB-4067-9DA5-3233E0F760FE}']
    function Listar: IDAO;
    function ListarPorId: IDAO;
    function ListarPor: IDAO;
    function Excluir: IDAO;
    function Atualizar: IDAO;
    function Inserir: IDAO;
    function ToDataSet: TDataSet;
  end;

  TDAO = class(TInterfacedObject, IDAO)
  private
    FDataSet: TDataSet;
    FObject: IInterface;
    FLista: TDictionary<String, Variant>;
    constructor Create(AObject: IInterface);
  public
    destructor Destroy; override;
    class function New(AObject: IInterface): IDAO;
    function Listar: IDAO;
    function ListarPorId: IDAO;
    function ListarPor: IDAO;
    function Excluir: IDAO;
    function Atualizar: IDAO;
    function Inserir: IDAO;
    function ToDataSet: TDataSet;
  end;

implementation

uses
  Utils.Entidade, Conexao.unConection;

{ TDAO }

function TDAO.Atualizar: IDAO;
begin
  Result := Self;
  var lSql := TUtilsEntidade.ObterUpdateSQL(FObject as TEntidade);
  TConexao.New.EnviarComando(lSql, FLista);
end;

constructor TDAO.Create(AObject: IInterface);
begin
  FObject := AObject;
  FLista:= TDictionary<String, Variant>.Create;
  TUtilsEntidade.ObterListaDeParameter(FLista, FObject as TEntidade);
end;

function TDAO.ToDataSet: TDataSet;
begin
  Result := FDataSet;
end;

destructor TDAO.Destroy;
begin

  inherited;
end;

function TDAO.Excluir: IDAO;
begin
  Result := Self;
  var lSql := TUtilsEntidade.ObterDeleteSQL(FObject as TEntidade);
  TConexao.New.EnviarComando(lSql, FLista);
end;

function TDAO.Inserir: IDAO;
begin
  Result := Self;
  var lSql := TUtilsEntidade.ObterInsertSQL(FObject as TEntidade);
  TConexao.New.EnviarComando(lSql, FLista);
end;

function TDAO.Listar: IDAO;
begin
  Result := Self;
  var lSql := TUtilsEntidade.ObterSelecSemWhere(FObject as TEntidade);
  FDataSet := TConexao.New.GetQueryConsulta(lSql);
end;

function TDAO.ListarPor: IDAO;
begin
  Result := Self;
  var lSql := TUtilsEntidade.ObterSelecComWhere(FObject as TEntidade);
  FDataSet := TConexao.New.GetQueryConsulta(lSql, FLista);
end;

function TDAO.ListarPorId: IDAO;
begin
  Result := Self;
  var lSql := TUtilsEntidade.ObterSelecPorWhereID(FObject as TEntidade);
  FDataSet := TConexao.New.GetQueryConsulta(lSql, FLista);
end;

class function TDAO.New(AObject: IInterface): IDAO;
begin
  Result := Self.Create(AObject);
end;

end.
