object fpengguna: Tfpengguna
  Left = 496
  Top = 181
  Width = 449
  Height = 297
  Caption = 'Pengguna'
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnActivate = FormActivate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 208
    Top = 208
    Width = 127
    Height = 14
    Caption = 'Anda belum terdaftar ?'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object BuatAkun: TLabel
    Left = 344
    Top = 208
    Width = 57
    Height = 14
    Caption = 'Buat Akun'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    OnClick = BuatAkunClick
  end
  object Label3: TLabel
    Left = 32
    Top = 68
    Width = 93
    Height = 16
    Caption = 'Nama Pengguna'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 64
    Top = 100
    Width = 61
    Height = 16
    Caption = 'Kata Sandi'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 79
    Top = 132
    Width = 46
    Height = 16
    Caption = 'Sebagai'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 97
    Top = 36
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
  object csebagai: TComboBox
    Left = 136
    Top = 128
    Width = 160
    Height = 24
    Hint = 'Pilihan'
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    Items.Strings = (
      'Kasir'
      'Dokter'
      'Administrator')
  end
  object ekode: TEdit
    Left = 136
    Top = 32
    Width = 160
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
    OnChange = ekodeChange
    OnKeyUp = ekodeKeyUp
  end
  object enama: TEdit
    Left = 136
    Top = 64
    Width = 160
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
  end
  object esandi: TEdit
    Left = 136
    Top = 96
    Width = 160
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
  end
  object bsimpan: TButton
    Left = 312
    Top = 32
    Width = 90
    Height = 30
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bsimpanClick
  end
  object bhapus: TButton
    Left = 312
    Top = 68
    Width = 90
    Height = 30
    Caption = 'Hapus'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 6
    OnClick = bhapusClick
  end
  object bbatal: TButton
    Left = 312
    Top = 104
    Width = 90
    Height = 30
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    OnClick = bbatalClick
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 240
    Width = 433
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
