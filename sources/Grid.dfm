object frmGrid: TfrmGrid
  Left = 0
  Top = 0
  BorderStyle = bsNone
  Caption = 'Hit [Scroll lock] to on/off'
  ClientHeight = 338
  ClientWidth = 651
  Color = 14013909
  TransparentColor = True
  TransparentColorValue = 14013909
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  FormStyle = fsStayOnTop
  OldCreateOrder = False
  Position = poDefault
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PB: TPaintBox
    Left = 0
    Top = 0
    Width = 651
    Height = 338
    Align = alClient
    OnPaint = PBPaint
    ExplicitWidth = 654
    ExplicitHeight = 313
  end
  object Timer: TTimer
    Enabled = False
    Interval = 200
    OnTimer = TimerTimer
    Left = 32
    Top = 48
  end
end
