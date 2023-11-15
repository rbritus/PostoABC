unit Components.ToastMessage;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TToastNotification = class
  private
    FToastForm: TForm;
    FTimer: TTimer;
    FMessageLabel: TLabel;
    procedure TimerHandler(Sender: TObject);
  public
    constructor Create(const AMessage: string);
    procedure Show;
  end;

implementation

{ TToastNotification }

constructor TToastNotification.Create(const AMessage: string);
begin
  FToastForm := TForm.Create(nil);
  FToastForm.BorderStyle := bsNone;
  FToastForm.Color := clInfoBk;
  FToastForm.Position := poMainFormCenter;

  FMessageLabel := TLabel.Create(FToastForm);
  FMessageLabel.Parent := FToastForm;
  FMessageLabel.Caption := AMessage;
  FMessageLabel.Font.Color := clWhite;
  FMessageLabel.Align := alClient;
  FMessageLabel.Layout := tlCenter;

  FTimer := TTimer.Create(nil);
  FTimer.Interval := 3000; // 3 seconds
  FTimer.OnTimer := TimerHandler;
end;

procedure TToastNotification.Show;
begin
  FToastForm.Show;
  FTimer.Enabled := True;
end;

procedure TToastNotification.TimerHandler(Sender: TObject);
begin
  FTimer.Enabled := False;
  FToastForm.Close;
end;

end.

