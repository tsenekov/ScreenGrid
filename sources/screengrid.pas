unit screengrid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, JvAppInst, Vcl.AppEvnts, Vcl.Menus, JvComponentBase, JvComputerInfoEx;

type
  TfrmMain = class(TForm)
    JvAppInstances1: TJvAppInstances;
    TrayIcon: TTrayIcon;
    PopupMenu: TPopupMenu;
    Showsettings1: TMenuItem;
    Exit1: TMenuItem;
    JvComputerInfoEx1: TJvComputerInfoEx;
    procedure Exit1Click(Sender: TObject);
    procedure Showsettings1Click(Sender: TObject);
    procedure TrayIconClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure Minimize(Sender: TObject);
    { Private declarations }
  public
    showmain: Boolean;
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation

{$R *.dfm}

uses gridsettings;

procedure TfrmMain.Minimize(Sender: TObject);
begin
  Application.Restore;
end;


procedure TfrmMain.Showsettings1Click(Sender: TObject);
begin
  frmGridSettings.Show;
end;

procedure TfrmMain.Exit1Click(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  Application.OnMinimize := Minimize;
end;

procedure TfrmMain.TrayIconClick(Sender: TObject);
begin
  frmGridSettings.Show;
end;

end.
