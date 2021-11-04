unit gridpainter;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.Samples.Spin, Registry;

type
  TfrmGridPainter = class(TForm)
    Panel1: TPanel;
    btnClose: TButton;
    PanelSettings: TPanel;
    LabelInfo: TLabel;
    OnTop: TCheckBox;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    ColorFont: TColorBox;
    Label4: TLabel;
    SizeFont: TSpinEdit;
    ColorBackground: TColorBox;
    Label5: TLabel;
    GroupBox2: TGroupBox;
    Label1: TLabel;
    ColorPrimary: TColorBox;
    ThickPrimary: TSpinEdit;
    Label3: TLabel;
    Label6: TLabel;
    ColorSecondary: TColorBox;
    Label7: TLabel;
    ThickSecondary: TSpinEdit;
    CountPrimary: TSpinEdit;
    Label8: TLabel;
    Label9: TLabel;
    CountSecondary: TSpinEdit;
    btnExit: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure btnExitClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    procedure SaveSettings;
    procedure LoadSettings;
    { Public declarations }
  end;

var
  frmGridPainter: TfrmGridPainter;

implementation

{$R *.dfm}

uses screengrid;

procedure TfrmGridPainter.btnCloseClick(Sender: TObject);
begin
  SaveSettings;
  Hide;
end;

procedure TfrmGridPainter.SaveSettings;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;
    If Reg.OpenKey('\Software\mysoftware\sgrid', true) Then
    Begin
      Reg.WriteInteger('ColorFont.Selected', ColorFont.Selected);
      Reg.WriteInteger('ColorBackground.Selected', ColorBackground.Selected);

      Reg.WriteInteger('ColorPrimary.Selected', ColorPrimary.Selected);
      Reg.WriteInteger('ColorSecondary.Selected', ColorSecondary.Selected);

      Reg.WriteInteger('SizeFont.Value', SizeFont.Value);
      Reg.WriteInteger('ThickPrimary.Value', ThickPrimary.Value);
      Reg.WriteInteger('ThickSecondary.Value', ThickSecondary.Value);

      Reg.WriteInteger('CountPrimary.Value', CountPrimary.Value);
      Reg.WriteInteger('CountSecondary.Value', CountSecondary.Value);

      Reg.WriteBool('OnTop.Checked', OnTop.Checked);
    End;
  except
  End;
  Reg.Free;
end;

procedure TfrmGridPainter.btnExitClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmGridPainter.FormCreate(Sender: TObject);
begin
  frmGridPainter.LoadSettings;
end;

procedure TfrmGridPainter.LoadSettings;
var
  Reg: TRegistry;
begin
  Reg := TRegistry.Create;
  Try
    Reg.RootKey := HKEY_CURRENT_USER;
    If Reg.OpenKey('\Software\mysoftware\sgrid', true) Then
    Begin
      If Reg.ValueExists('ColorFont.Selected') Then
        ColorFont.Selected := Reg.ReadInteger('ColorFont.Selected');
      If Reg.ValueExists('ColorBackground.Selected') Then
        ColorBackground.Selected := Reg.ReadInteger('ColorBackground.Selected');
      If Reg.ValueExists('ColorPrimary.Selected') Then
        ColorPrimary.Selected := Reg.ReadInteger('ColorPrimary.Selected');
      If Reg.ValueExists('ColorSecondary.Selected') Then
        ColorSecondary.Selected := Reg.ReadInteger('ColorSecondary.Selected');

      If Reg.ValueExists('SizeFont.Value') Then
        SizeFont.Value := Reg.ReadInteger('SizeFont.Value');
      If Reg.ValueExists('ThickPrimary.Value') Then
        ThickPrimary.Value := Reg.ReadInteger('ThickPrimary.Value');
      If Reg.ValueExists('ThickSecondary.Value') Then
        ThickSecondary.Value := Reg.ReadInteger('ThickSecondary.Value');

      If Reg.ValueExists('CountPrimary.Value') Then
        CountPrimary.Value := Reg.ReadInteger('CountPrimary.Value');
      If Reg.ValueExists('CountSecondary.Value') Then
        CountSecondary.Value := Reg.ReadInteger('CountSecondary.Value');

      If Reg.ValueExists('OnTop.Checked') Then
        OnTop.Checked := Reg.ReadBool('OnTop.Checked');
    End;
  except
  End;
  Reg.Free;
end;

end.
