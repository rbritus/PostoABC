unit Repository.Abastecimento;

interface

uses
  System.SysUtils;

type
  TRepositoryAbastecimento = class
  public
    class function GetSqlAbastecimentosDoDia: string; static;
  end;

implementation

{ TRepositoryAbastecimento }

class function TRepositoryAbastecimento.GetSqlAbastecimentosDoDia: string;
begin
  var SqlBuild := TStringBuilder.Create;
  SqlBuild.APPEND('SELECT ')
    .APPEND('    ABASTECIMENTO.ID,')
    .APPEND('    ABASTECIMENTO.DATA, ')
    .APPEND('    ABASTECIMENTO.ID_BOMBA, ')
    .APPEND('    ABASTECIMENTO.QUANTIDADE_LITROS, ')
    .APPEND('    ABASTECIMENTO.PRECO, ')
    .APPEND('    ABASTECIMENTO.PERCENTUAL_IMPOSTO, ')
    .APPEND('    ABASTECIMENTO.VALOR, ')
    .APPEND('    BOMBA.NUMERO, ')
    .APPEND('    CASE COMBUSTIVEL ')
    .APPEND('        WHEN 0 THEN ''GASOLINA'' ')
    .APPEND('        WHEN 1 THEN ''ÓLEO DIESEL'' ')
    .APPEND('    ELSE '''' END COMBUSTIVEL ')
    .APPEND('FROM ')
    .APPEND('    ABASTECIMENTO ')
    .APPEND('    INNER JOIN BOMBA ON ( ')
    .APPEND('        BOMBA.ID = ABASTECIMENTO.ID_BOMBA ')
    .APPEND('    ) ')
    .APPEND('    INNER JOIN TANQUE ON ( ')
    .APPEND('        TANQUE.ID = BOMBA.ID_TANQUE ')
    .APPEND('    ) ')
    .APPEND('WHERE ')
    .APPEND('    ABASTECIMENTO.DATA = :DATA ');
  Result := SqlBuild.ToString;
  SqlBuild.DisposeOf;
end;

end.
