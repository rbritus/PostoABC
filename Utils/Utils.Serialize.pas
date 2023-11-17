unit Utils.Serialize;

interface

uses
  System.Classes, Data.DB, Entidade.Padrao, Generics.Collections, Rtti,
  Attributes.Entidades, Utils.Entidade;

type
  TUtilsSerialize = class
    class function DataSetToEntidade(DataSet: TDataSet; var AObjInterface: IInterface): IInterface; static;
  end;

implementation

{ TUtilsSerialize }

class function TUtilsSerialize.DataSetToEntidade(DataSet: TDataSet; var AObjInterface: IInterface): IInterface;
var
  lObj: TObject;
begin
  lObj := TObject(AObjInterface);
  TUtilsEntidade.PreencherEntidade(lObj,DataSet);
end;

end.
