object frmGridPainter: TfrmGridPainter
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Settings'
  ClientHeight = 264
  ClientWidth = 563
  Color = clBtnFace
  TransparentColorValue = 14013909
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 226
    Width = 563
    Height = 38
    Align = alBottom
    BevelOuter = bvNone
    Caption = 'Panel1'
    ShowCaption = False
    TabOrder = 0
    object btnClose: TButton
      AlignWithMargins = True
      Left = 384
      Top = 5
      Width = 176
      Height = 28
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alRight
      Caption = #1057'lose the settings panel'
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnExit: TButton
      AlignWithMargins = True
      Left = 3
      Top = 5
      Width = 176
      Height = 28
      Margins.Top = 5
      Margins.Bottom = 5
      Align = alLeft
      Caption = 'Exit application'
      TabOrder = 1
      OnClick = btnExitClick
    end
  end
  object PanelSettings: TPanel
    Left = 0
    Top = 0
    Width = 563
    Height = 226
    Align = alClient
    BevelOuter = bvNone
    Caption = 'PanelSettings'
    ShowCaption = False
    TabOrder = 1
    object LabelInfo: TLabel
      AlignWithMargins = True
      Left = 5
      Top = 5
      Width = 553
      Height = 13
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Align = alTop
      Caption = 'Hit [Scroll lock] to on/off grid'
      WordWrap = True
      ExplicitWidth = 137
    end
    object OnTop: TCheckBox
      Left = 13
      Top = 190
      Width = 257
      Height = 17
      Caption = 'Move grid to top every second'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object GroupBox1: TGroupBox
      Left = 5
      Top = 23
      Width = 548
      Height = 64
      Caption = 'Font'
      TabOrder = 1
      object Label2: TLabel
        Left = 11
        Top = 27
        Width = 25
        Height = 13
        Caption = 'Color'
      end
      object Label4: TLabel
        Left = 442
        Top = 27
        Width = 19
        Height = 13
        Caption = 'Size'
      end
      object Label5: TLabel
        Left = 212
        Top = 27
        Width = 56
        Height = 13
        Caption = 'Background'
      end
      object ColorFont: TColorBox
        Left = 50
        Top = 24
        Width = 145
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
        TabOrder = 0
      end
      object SizeFont: TSpinEdit
        Left = 480
        Top = 24
        Width = 52
        Height = 22
        MaxValue = 50
        MinValue = 8
        TabOrder = 1
        Value = 20
      end
      object ColorBackground: TColorBox
        Left = 274
        Top = 24
        Width = 145
        Height = 22
        Selected = clWhite
        Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
        TabOrder = 2
      end
    end
    object GroupBox2: TGroupBox
      Left = 5
      Top = 93
      Width = 548
      Height = 84
      Caption = 'Grid'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 25
        Width = 25
        Height = 13
        Caption = 'Color'
      end
      object Label3: TLabel
        Left = 217
        Top = 24
        Width = 46
        Height = 13
        Caption = 'Thickness'
      end
      object Label6: TLabel
        Left = 8
        Top = 53
        Width = 25
        Height = 13
        Caption = 'Color'
      end
      object Label7: TLabel
        Left = 217
        Top = 52
        Width = 46
        Height = 13
        Caption = 'Thickness'
      end
      object Label8: TLabel
        Left = 385
        Top = 24
        Width = 29
        Height = 13
        Caption = 'Count'
      end
      object Label9: TLabel
        Left = 385
        Top = 52
        Width = 29
        Height = 13
        Caption = 'Count'
      end
      object ColorPrimary: TColorBox
        Left = 50
        Top = 19
        Width = 145
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
        TabOrder = 0
      end
      object ThickPrimary: TSpinEdit
        Left = 274
        Top = 19
        Width = 83
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 1
        Value = 3
      end
      object ColorSecondary: TColorBox
        Left = 50
        Top = 47
        Width = 145
        Height = 22
        Style = [cbStandardColors, cbExtendedColors, cbCustomColor, cbPrettyNames]
        TabOrder = 2
      end
      object ThickSecondary: TSpinEdit
        Left = 274
        Top = 47
        Width = 83
        Height = 22
        MaxValue = 10
        MinValue = 1
        TabOrder = 3
        Value = 1
      end
      object CountPrimary: TSpinEdit
        Left = 442
        Top = 19
        Width = 83
        Height = 22
        MaxValue = 6
        MinValue = 1
        TabOrder = 4
        Value = 3
      end
      object CountSecondary: TSpinEdit
        Left = 442
        Top = 47
        Width = 83
        Height = 22
        MaxValue = 6
        MinValue = 1
        TabOrder = 5
        Value = 3
      end
    end
  end
end
