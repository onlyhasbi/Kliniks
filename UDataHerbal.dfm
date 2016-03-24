object fherbal: Tfherbal
  Left = 817
  Top = 130
  BorderStyle = bsSingle
  Caption = 'Data Herbal'
  ClientHeight = 380
  ClientWidth = 451
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 67
    Top = 35
    Width = 28
    Height = 16
    Caption = 'Kode'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 64
    Top = 67
    Width = 33
    Height = 16
    Caption = 'Nama'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 38
    Top = 100
    Width = 63
    Height = 16
    Caption = 'Kadaluarsa'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 62
    Top = 133
    Width = 35
    Height = 16
    Caption = 'Merek'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 80
    Top = 164
    Width = 13
    Height = 16
    Caption = 'Isi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 57
    Top = 196
    Width = 40
    Height = 16
    Caption = 'Satuan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 49
    Top = 225
    Width = 51
    Height = 16
    Caption = 'Deskripsi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ekode: TEdit
    Left = 107
    Top = 32
    Width = 193
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
    OnChange = ekodeChange
    OnKeyUp = ekodeKeyUp
  end
  object enama: TEdit
    Left = 107
    Top = 64
    Width = 193
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
  end
  object emerek: TEdit
    Left = 107
    Top = 130
    Width = 193
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
  end
  object eisi: TEdit
    Left = 107
    Top = 161
    Width = 193
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
  end
  object mdeskripsi: TMemo
    Left = 107
    Top = 225
    Width = 193
    Height = 81
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 8
  end
  object ctanggal: TComboBox
    Left = 107
    Top = 96
    Width = 57
    Height = 24
    Hint = 'Tgl'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 2
  end
  object cbulan: TComboBox
    Left = 171
    Top = 96
    Width = 57
    Height = 24
    Hint = 'Bln'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 3
  end
  object ctahun: TComboBox
    Left = 235
    Top = 96
    Width = 65
    Height = 24
    Hint = 'Tahun'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 4
  end
  object csatuan: TComboBox
    Left = 107
    Top = 192
    Width = 193
    Height = 24
    Hint = 'Pilihan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentFont = False
    TabOrder = 7
    Items.Strings = (
      'Botol'
      'Kapsul'
      'Tablet'
      'Sachet'
      'Bungkus'
      'Biji'
      'ml'
      'gr'
      'l')
  end
  object bsimpan: TButton
    Left = 323
    Top = 32
    Width = 89
    Height = 30
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = bsimpanClick
  end
  object bbatal: TButton
    Left = 323
    Top = 72
    Width = 90
    Height = 30
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 10
    OnClick = bbatalClick
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 361
    Width = 451
    Height = 19
    Panels = <
      item
        Text = '        Status'
        Width = 80
      end
      item
        Width = 50
      end>
  end
end
