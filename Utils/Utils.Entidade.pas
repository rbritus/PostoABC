unit Utils.Entidade;

interface

uses
  Generics.Collections, Rtti, Classes, Entidade.Padrao, Data.DB, Attributes.Entidades,
  System.SysUtils, Helper.Attributes, System.TypInfo;

type
  TUtilsEntidade = class
  private
    class function ObterWhereDosCamposPreenchidos(AObject: TEntidade): string;
    class function ObterWhereID(AObject: TEntidade): string; static;
    class function ObterSqlFieldsInsert(AObject: TEntidade): String; static;
    class function ObterSqlParamsInsert(AObject: TEntidade): String; static;
    class function ObterSqlFieldsUpdate(AObject: TEntidade): String; static;
  public
    class function ObterNomeTabela(AObject: TEntidade): string;
    class function ObterSelecPorWhereID(AObject: TEntidade): string;
    class function ObterSelecComWhere(AObject: TEntidade): string;
    class function ObterSelecSemWhere(AObject: TEntidade): string;
    class function ObterInsertSQL(AObject: TEntidade): string;
    class function ObterUpdateSQL(AObject: TEntidade): string;
    class function ObterDeleteSQL(AObject: TEntidade): string;
    class procedure ObterListaDeParameter(var Value: TDictionary<String, Variant>; AObject: TEntidade);
  end;

implementation

uses
  Attributes.Enumerators;

{ TUtilsEntidade }

class function TUtilsEntidade.ObterNomeTabela(AObject: TEntidade): string;
var
  vCtxRtti: TRttiContext;
  vTypRtti: TRttiType;
begin
  vCtxRtti := TRttiContext.Create;
  try
    vTypRtti := vCtxRtti.GetType(AObject.ClassInfo);
    if vTypRtti.TemAtributo<Tabela> then
      Result := vTypRtti.GetAttribute<Tabela>.Name;
  finally
    vCtxRtti.Free;
  end;
end;

class function TUtilsEntidade.ObterSelecComWhere(AObject: TEntidade): string;
begin
  Result := 'SELECT * FROM ' + TUtilsEntidade.ObterNomeTabela(AObject);
  Result := Result + TUtilsEntidade.ObterWhereDosCamposPreenchidos(AObject);
end;

class function TUtilsEntidade.ObterSelecPorWhereID(AObject: TEntidade): string;
begin
  Result := 'SELECT * FROM ' + TUtilsEntidade.ObterNomeTabela(AObject);
  Result := Result + TUtilsEntidade.ObterWhereID(AObject);
end;

class function TUtilsEntidade.ObterSelecSemWhere(AObject: TEntidade): string;
begin
  Result := 'SELECT * FROM ' + TUtilsEntidade.ObterNomeTabela(AObject);
end;

class function TUtilsEntidade.ObterDeleteSQL(AObject: TEntidade): string;
begin
  Result := 'DELETE FROM ' + TUtilsEntidade.ObterNomeTabela(AObject);
  Result := Result + TUtilsEntidade.ObterWhereID(AObject);
end;

class function TUtilsEntidade.ObterInsertSQL(AObject: TEntidade): string;
begin
  Result := 'INSERT INTO ' + TUtilsEntidade.ObterNomeTabela(AObject);
  Result := Result + '('+ TUtilsEntidade.ObterSqlFieldsInsert(AObject) + ') ';
  Result := Result + ' VALUES (' + TUtilsEntidade.ObterSqlParamsInsert(AObject) + ');';
end;

class function TUtilsEntidade.ObterUpdateSQL(AObject: TEntidade): string;
begin
  Result := 'UPDATE ' + TUtilsEntidade.ObterNomeTabela(AObject);
  Result := Result + ' SET ' + TUtilsEntidade.ObterSqlFieldsUpdate(AObject);
  Result := Result + TUtilsEntidade.ObterWhereID(AObject);
end;

class function TUtilsEntidade.ObterSqlFieldsUpdate(AObject: TEntidade): String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  Result := '';
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(AObject.ClassInfo);
    for var I in lTipo.GetFields do
    begin
      if I.TemAtributo<PK> then
        Continue;

      if not I.TemAtributo<Campo> then
        Break;

      case I.GetValue(AObject).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(AObject).AsInteger <= 0) then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
          end;
        tkFloat:
          begin
            if I.GetValue(AObject).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Currency) then
              if not (I.GetValue(AObject).AsCurrency = 0) then
                Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Double) then
              if not (I.GetValue(AObject).AsExtended = 0) then
                Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
          end;
        tkLString, tkWString, tkUString, tkString:
          begin
            if not I.GetValue(AObject).AsString.IsEmpty then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
          end;
      else
        Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    lContexto.Free;
  end;
end;

class function TUtilsEntidade.ObterSqlFieldsInsert(AObject: TEntidade): String;
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(AObject.ClassInfo);
    for var I in lTipo.GetFields do
    begin
      if I.TemAtributo<PK> then
        Continue;

      if not I.TemAtributo<Campo>then
        Break;

      case I.GetValue(AObject).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(AObject).AsInteger <= 0) then
              Result := Result + I.GetAttribute<Campo>.Name + ', ';
          end;
        tkFloat:
          begin
            if I.GetValue(AObject).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ', ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Currency) then
              if not (I.GetValue(AObject).AsCurrency = 0) then
                Result := Result + I.GetAttribute<Campo>.Name + ', ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Double) then
              if not (I.GetValue(AObject).AsExtended = 0) then
                Result := Result + I.GetAttribute<Campo>.Name + ', ';
          end;
        tkLString, tkWString, tkUString, tkString:
          begin
            if not I.GetValue(AObject).AsString.IsEmpty then
              Result := Result + I.GetAttribute<Campo>.Name + ', ';
          end;
      else
        Result := Result + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Result.Length-2);
    lContexto.Free;
  end;
end;

class function TUtilsEntidade.ObterSqlParamsInsert(AObject: TEntidade): String;
var
  ctxRtti   : TRttiContext;
  typRtti   : TRttiType;
begin
  ctxRtti := TRttiContext.Create;
  try
    typRtti := ctxRtti.GetType(AObject.ClassInfo);
    for var I in typRtti.GetFields do
    begin
      if I.TemAtributo<PK> then
        Continue;

      if not I.TemAtributo<Campo>then
        Break;

      case I.GetValue(AObject).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(AObject).AsInteger <= 0) then
              Result := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
          end;
        tkFloat:
          begin
            if I.GetValue(AObject).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + ':' + I.GetAttribute<Campo>.Name + ', ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Currency) then
              if not (I.GetValue(AObject).AsCurrency = 0) then
                Result := Result + ':' + I.GetAttribute<Campo>.Name + ', ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Double) then
              if not (I.GetValue(AObject).AsExtended = 0) then
                Result := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
          end;
        tkLString, tkWString, tkUString, tkString:
          begin
            if not I.GetValue(AObject).AsString.IsEmpty then
              Result := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
          end;
      else
        Result := Result + ':' + I.GetAttribute<Campo>.Name + ', ';
      end;
    end;
  finally
    Result := Copy(Result, 0, Length(Result) - 2) + ' ';
    ctxRtti.Free;
  end;
end;

class function TUtilsEntidade.ObterWhereDosCamposPreenchidos(AObject: TEntidade): string;
var
  lCtxRtti: TRttiContext;
  lTipo: TRttiType;
begin
  Result := '';
  lCtxRtti := TRttiContext.Create;
  try
    lTipo := lCtxRtti.GetType(AObject.ClassInfo);
    for var I in lTipo.GetFields do
    begin
      if not I.TemAtributo<Campo>then
        Break;

      case I.GetValue(AObject).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(AObject).AsInteger <= 0) then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';
          end;
        tkFloat:
          begin
            if I.GetValue(AObject).TypeInfo = TypeInfo(TDateTime) then
              Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Currency) then
              if not (I.GetValue(AObject).AsCurrency = 0) then
                Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';

            if I.GetValue(AObject).TypeInfo = TypeInfo(Double) then
              if not (I.GetValue(AObject).AsExtended = 0) then
                Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';
          end;
        tkLString, tkWString, tkUString, tkString:
          begin
            if not I.GetValue(AObject).AsString.IsEmpty then
              Result := Result + I.GetAttribute<Campo>.Name + ' LIKE %:' + I.GetAttribute<Campo>.Name + '% AND ';
          end;
      else
        Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';
      end;
    end;
  finally
    Result := ' WHERE ' + Copy(Result, 0, Length(Result) - 4) + ' ';
    lCtxRtti.Free;
  end;
end;

class function TUtilsEntidade.ObterWhereID(AObject: TEntidade): string;
var
  lCtxRtti: TRttiContext;
  lTipo: TRttiType;
begin
  Result := '';
  lCtxRtti := TRttiContext.Create;
  try
    lTipo := lCtxRtti.GetType(AObject.ClassInfo);
    for var I in lTipo.GetFields do
    begin
      if not I.TemAtributo<PK> then
        Continue;

      Result := Result + I.GetAttribute<Campo>.Name + ' = :' + I.GetAttribute<Campo>.Name + ' AND ';
    end;
  finally
    Result := ' WHERE ' + Copy(Result, 0, Length(Result) - 4) + ' ';
    lCtxRtti.Free;
  end;
end;

class procedure TUtilsEntidade.ObterListaDeParameter(var Value: TDictionary<String, Variant>; AObject: TEntidade);
var
  lContexto: TRttiContext;
  lTipo: TRttiType;
begin
  lContexto := TRttiContext.Create;
  try
    lTipo := lContexto.GetType(AObject.ClassInfo);
    for var I in lTipo.GetFields do
    begin
      if not I.TemAtributo<Campo>then
        Break;

      case I.GetValue(AObject).TypeInfo.Kind of
        tkInteger, tkInt64:
          begin
            if not (I.GetValue(AObject).AsInteger <= 0) then
              Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(AObject).AsInteger);
          end;
        tkFloat:
          begin
            if I.GetValue(AObject).TypeInfo = TypeInfo(TDateTime) then
              Value.Add(I.GetAttribute<Campo>.Name, StrToDateTime(I.GetValue(AObject).ToString));

            if I.GetValue(AObject).TypeInfo = TypeInfo(Currency) then
              if not (I.GetValue(AObject).AsCurrency = 0) then
                Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(AObject).AsCurrency);

            if I.GetValue(AObject).TypeInfo = TypeInfo(Double) then
              if not (I.GetValue(AObject).AsExtended = 0) then
                Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(AObject).AsCurrency);
          end;
        tkLString, tkWString, tkUString, tkString:
          begin
            if not I.GetValue(AObject).AsString.IsEmpty then
              Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(AObject).AsString);
          end;
        tkEnumeration:
          begin
            Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(AObject).AsOrdinal);
          end
      else
        Value.Add(I.GetAttribute<Campo>.Name, I.GetValue(AObject).AsString);
      end;
    end;
  finally
    lContexto.Free;
  end;
end;

end.
