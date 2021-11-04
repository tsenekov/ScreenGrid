unit Grid;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls;

type
  TfrmGrid = class(TForm)
    Timer: TTimer;
    PB: TPaintBox;
    procedure FormCreate(Sender: TObject);
    procedure TimerTimer(Sender: TObject);
    procedure PBPaint(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  protected
    procedure CreateParams(var Params: TCreateParams); override;
  public
    { Public declarations }
  end;

var
  frmGrid: TfrmGrid;

implementation

{$R *.dfm}

uses gridsettings, screengrid;

procedure TfrmGrid.FormCreate(Sender: TObject);
begin
  Timer.Enabled := true;
  PB.Visible := false;
end;

procedure TfrmGrid.FormShow(Sender: TObject);
begin
  Left := 0;
  Top := 0;
  Width := screen.Width;
  Height := screen.Height;
end;

procedure TfrmGrid.PBPaint(Sender: TObject);
var
  x1, y1: integer;
  x2, y2: integer;
  r1, r2: TRect;
  txt: string;
  th, tw: integer;
begin
  with PB.canvas do
  begin
    Font.Height := frmGridSettings.SizeFont.Value;
    Font.Color := frmGridSettings.ColorFont.Selected;
    tw := TextWidth('9-9');
    th := TextHeight('9-9');
    for x1 := 0 to frmGridSettings.CountPrimary.Value - 1 do
      for y1 := 0 to frmGridSettings.CountPrimary.Value - 1 do
      begin
        r1.Left := trunc(x1 * PB.Width / frmGridSettings.CountPrimary.Value);
        r1.Top := trunc(y1 * PB.Height / frmGridSettings.CountPrimary.Value);
        r1.Width := trunc(PB.Width / frmGridSettings.CountPrimary.Value);
        r1.Height := trunc(PB.Height / frmGridSettings.CountPrimary.Value);
        for x2 := 0 to frmGridSettings.CountSecondary.Value - 1 do
          for y2 := 0 to frmGridSettings.CountSecondary.Value - 1 do
          begin
            r2.Left := r1.Left + trunc(x2 * r1.Width / frmGridSettings.CountSecondary.Value);
            r2.Top := r1.Top + trunc(y2 * r1.Height / frmGridSettings.CountSecondary.Value);
            r2.Width := trunc(r1.Width / frmGridSettings.CountSecondary.Value);
            r2.Height := trunc(r1.Height / frmGridSettings.CountSecondary.Value);
            Pen.Width := frmGridSettings.ThickSecondary.Value;
            Pen.Color := frmGridSettings.ColorSecondary.Selected;
            Brush.Color := frmGridSettings.ColorSecondary.Selected;
            MoveTo(r2.Left, r2.Top);
            LineTo(r2.Left + r2.Width, r2.Top);
            MoveTo(r2.Left, r2.Top);
            LineTo(r2.Left, r2.Top + r2.Height);

            txt := intToStr(1 + x1 + y1 * frmGridSettings.CountPrimary.Value) + '-' +
              intToStr(1 + x2 + y2 * frmGridSettings.CountSecondary.Value);

            Brush.Color := frmGridSettings.ColorBackground.Selected;
            Pen.Color := frmGridSettings.ColorFont.Selected;
            TextOut(r2.Left + r2.Width div 2 - tw div 2, r2.Top + r2.Height div 2 - th div 2, txt);
          end;
        //
        Pen.Width := frmGridSettings.ThickPrimary.Value;
        Brush.Color := frmGridSettings.ColorPrimary.Selected;
        Pen.Color := frmGridSettings.ColorPrimary.Selected;
        MoveTo(r1.Left, r1.Top);
        LineTo(r1.Left + r1.Width, r1.Top);
        MoveTo(r1.Left, r1.Top);
        LineTo(r1.Left, r1.Top + r1.Height);
        if x1 = 2 then
        begin
          MoveTo(r1.Left + r1.Width - 1, r1.Top);
          LineTo(r1.Left + r1.Width - 1, r1.Top + r1.Height);
        end;
        if y1 = 2 then
        begin
          MoveTo(r1.Left, r1.Top + r1.Height - 1);
          LineTo(r1.Left + r1.Width, r1.Top + r1.Height - 1);
        end;
      end;
  end;

end;

procedure TfrmGrid.TimerTimer(Sender: TObject);
begin
  if (GetKeyState(VK_Scroll) = 0) or (frmGridSettings.Showing) then
  begin
    frmGrid.Visible := false;
  end
  else
  begin
    if not frmGrid.Visible then
    begin
      frmGrid.Show;
      PB.Visible := true;
    end;
    if frmGridSettings.OnTop.Checked then
      BringToFront;
  end;
end;

procedure TfrmGrid.CreateParams(var Params: TCreateParams);
begin
  inherited;
  // Params.ExStyle := Params.ExStyle or WS_EX_LAYERED or WS_EX_TRANSPARENT or WS_EX_TOPMOST or WS_EX_APPWINDOW;
  Params.ExStyle := Params.ExStyle or WS_EX_LAYERED or WS_EX_TRANSPARENT or WS_EX_TOPMOST;
end;

end.
