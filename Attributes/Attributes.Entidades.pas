unit Attributes.Entidades;

interface

uses
  System.Rtti;

type
  Campo = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(aName: string);
    property Name: string read FName;
  end;

  Tabela = class(TCustomAttribute)
  private
    FName: string;
  public
    constructor Create(aName: string);
    property Name: string read FName;
  end;

  PK = class(TCustomAttribute)
  end;

  FK = class(TCustomAttribute)
  end;

implementation

{ Campo }

constructor Campo.Create(aName: string);
begin
  FName := aName;
end;

{ Tabela }

constructor Tabela.Create(aName: string);
begin
  FName := aName;
end;

end.

