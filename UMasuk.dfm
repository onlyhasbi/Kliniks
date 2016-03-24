object fmasuk: Tfmasuk
  Left = 471
  Top = 283
  BorderStyle = bsSingle
  Caption = 'Masuk'
  ClientHeight = 213
  ClientWidth = 335
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 40
    Top = 50
    Width = 89
    Height = 14
    Caption = 'Nama Pengguna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 67
    Top = 82
    Width = 57
    Height = 14
    Caption = 'Kata Sandi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object enama: TEdit
    Left = 144
    Top = 50
    Width = 150
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    OnKeyPress = enamaKeyPress
  end
  object esandi: TEdit
    Left = 144
    Top = 82
    Width = 150
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    OnKeyPress = enamaKeyPress
  end
  object bmasuk: TButton
    Left = 144
    Top = 122
    Width = 100
    Height = 35
    Caption = 'Masuk'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    OnClick = bmasukClick
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 194
    Width = 335
    Height = 19
    Panels = <
      item
        Width = 50
      end>
  end
end
