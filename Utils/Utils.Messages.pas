unit Utils.Messages;

interface

uses
  System.Classes, System.SysUtils, Winapi.Windows, Vcl.Dialogs, Vcl.Forms;

type
  EMessage = Class(Exception);

  TUtilsMessages = class
  private
  public
    class procedure ShowMessage(const AMensagem: string); static;
    class procedure ShowMessageExcept(const AMensagem: string); static; static;
    class function ShowMensagemConfirmacao(const AMessage: String): Boolean; static;
  end;

implementation

{ TUtilsMessages }

class procedure TUtilsMessages.ShowMessageExcept(const AMensagem: string);
begin
  raise EMessage.Create(AMensagem);
end;

class procedure TUtilsMessages.ShowMessage(const AMensagem: string);
begin
  ShowMessageFmt('%s', [AMensagem]);
end;

class function TUtilsMessages.ShowMensagemConfirmacao(const AMessage: String): Boolean;
begin
  Result := False;
end;

end.
