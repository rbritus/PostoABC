unit View.Padrao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.StdCtrls;

type
  TViewPadrao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    ImageList1: TImageList;
    btnFechaForm: TButton;
    procedure Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure btnFechaFormClick(Sender: TObject);
  private
    procedure MudarFoco;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  ViewPadrao: TViewPadrao;

implementation

{$R *.dfm}

procedure TViewPadrao.btnFechaFormClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TViewPadrao.FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  if Key = VK_RETURN then
    MudarFoco();
end;

procedure TViewPadrao.MudarFoco();
begin
  keybd_event(VK_TAB, 0, 0, 0);
end;

procedure TViewPadrao.Panel1MouseDown(Sender: TObject; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
const
  SC_DRAGMOVE = $F012;
begin
  if Button = mbleft then
  begin
    ReleaseCapture;
    Self.Perform(WM_SYSCOMMAND, SC_DRAGMOVE, 0);
  end;
end;

end.
