program sgrid;

uses
  Vcl.Forms,
  Windows,
  screengrid in 'screengrid.pas' {frmMain},
  gridsettings in 'gridsettings.pas' {frmGridSettings},
  Grid in 'Grid.pas' {frmGrid};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskBar := true;
  Application.CreateForm(TfrmMain, frmMain);
  Application.CreateForm(TfrmGrid, frmGrid);
  Application.CreateForm(TfrmGridSettings, frmGridSettings);
  Application.ShowMainForm := false;
  ShowWindow(application.Handle, SW_HIDE);
  Application.Run;

end.
