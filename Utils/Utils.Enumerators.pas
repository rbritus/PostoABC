unit Utils.Enumerators;

interface

uses
  Attributes.Enumerators, System.Rtti, System.Math, System.TypInfo, System.SysUtils,
  System.Variants, System.Classes, Vcl.StdCtrls;

type
  TEnumerator<T:record> = class
  private
    class function EnumTypeInfo: PTypeInfo; static;
    class function EnumParaInteiro(const Index: T): Integer;
    class function ObterValorTratadoParaString(Value: TValue): String;
  public
    class function GetIndex(const Value: Variant): Integer;
    class function GetValue(const Index: T): TValue;
    class function GetValueToString(const Index: T): string;
    class function GetCaption(const Indice: Integer): string;
    class function GetCustomSelect(const FieldName: string): string;
    class function GetNameCustoField(const FieldName: string): string;
    class procedure PopulateList(AList: TCustomCombo);
  end;

  [TEnumAttribute(0,'Gasolina',0)]
  [TEnumAttribute(1,'Óleo diesel',1)]
  TTipoCombustivel = (tcGasolina, tcOleoDiesel);

implementation

{ TEnumerator<T> }

class function TEnumerator<T>.EnumParaInteiro(const Index: T): Integer;
begin
  Result := 0;
  System.Move(Index, Result, System.SizeOf(Index));
end;

class function TEnumerator<T>.EnumTypeInfo: PTypeInfo;
begin
  Result := System.TypeInfo(T);
end;

class function TEnumerator<T>.GetCaption(const Indice: Integer): string;
var
  CustomAttribute: TCustomAttribute;
begin
  Result := EmptyStr;
  var ctx := TRttiContext.Create;
  var rType := ctx.GetType(Self.EnumTypeInfo);

  if not Assigned(rType) then
    Exit;

  for CustomAttribute in rType.GetAttributes do
  begin
    if CustomAttribute is TEnumAttribute then
      if TEnumAttribute(CustomAttribute).Indice = Indice then
      begin
        Result := TEnumAttribute(CustomAttribute).Caption;
        Break;
      end;
  end;
end;

class function TEnumerator<T>.GetCustomSelect(const FieldName: string): string;
var
  CustomAttribute: TCustomAttribute;
begin
  Result := EmptyStr;
  var ctx := TRttiContext.Create;
  var rType := ctx.GetType(Self.EnumTypeInfo);

  if not Assigned(rType) then
    Exit;

  var cSelect := 'CASE ' + FieldName;
  for CustomAttribute in rType.GetAttributes do
  begin
    if CustomAttribute is TEnumAttribute then
      cSelect := cSelect + ' WHEN ' + VarToStr(TEnumAttribute(CustomAttribute).Value).QuotedString +
        ' THEN ' + TEnumAttribute(CustomAttribute).Caption.QuotedString;
  end;
  Result :=  cSelect + ' END AS ' + Self.GetNameCustoField(FieldName);
end;

class function TEnumerator<T>.GetIndex(const Value: Variant): Integer;
var
  CustomAttribute: TCustomAttribute;
begin
  Result := 0;
  var ctx := TRttiContext.Create;
  var rType := ctx.GetType(Self.EnumTypeInfo);

  if not Assigned(rType) then
    Exit;

  for CustomAttribute in rType.GetAttributes do
  begin
    if CustomAttribute is TEnumAttribute then
      if TEnumAttribute(CustomAttribute).Value = Value then
      begin
        Result := TEnumAttribute(CustomAttribute).Indice;
        Break;
      end;
  end;
end;

class function TEnumerator<T>.GetNameCustoField(const FieldName: string): string;
begin
  Result := FieldName + '_CUSTOM';
end;

class function TEnumerator<T>.GetValue(const Index: T): TValue;
var
  CustomAttribute: TCustomAttribute;
begin
  Result := TValue.From(0);
  var ctx := TRttiContext.Create;
  var rType := ctx.GetType(Self.EnumTypeInfo);

  if not Assigned(rType) then
    Exit;

  var Indice := EnumParaInteiro(Index);
  for CustomAttribute in rType.GetAttributes do
  begin
    if CustomAttribute is TEnumAttribute then
      if TEnumAttribute(CustomAttribute).Indice = Indice then
      begin
        Result := TValue.From(TEnumAttribute(CustomAttribute).Value);
        Break;
      end;
  end;
end;

class function TEnumerator<T>.GetValueToString(const Index: T): string;
begin
  var Value := Self.GetValue(Index);
  Result := Self.ObterValorTratadoParaString(Value);
end;

class function TEnumerator<T>.ObterValorTratadoParaString(
  Value: TValue): String;
begin
  case Value.Kind of
    tkInteger: Result := IntToStr(Value.AsInteger);
    tkChar, tkString, tkWChar, tkLString, tkWString, tkUString: Result := Value.AsString;
  else
    Result := Value.AsVariant;
  end;
end;

class procedure TEnumerator<T>.PopulateList(AList: TCustomCombo);
var
  CustomAttribute: TCustomAttribute;
begin
  var ctx := TRttiContext.Create;
  var rType := ctx.GetType(Self.EnumTypeInfo);

  if not Assigned(rType) then
    Exit;

  AList.Items.Clear;
  for CustomAttribute in rType.GetAttributes do
  begin
    if CustomAttribute is TEnumAttribute then
      AList.Items.Add(TEnumAttribute(CustomAttribute).Caption);
  end;
end;

end.
