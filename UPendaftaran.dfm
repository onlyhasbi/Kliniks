object fpendaftaran: Tfpendaftaran
  Left = 348
  Top = 101
  BorderStyle = bsSingle
  Caption = 'Pendaftaran Pasien'
  ClientHeight = 497
  ClientWidth = 784
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
    Left = 123
    Top = 29
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
    Left = 67
    Top = 67
    Width = 84
    Height = 16
    Caption = 'Nama Lengkap'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label4: TLabel
    Left = 60
    Top = 256
    Width = 91
    Height = 16
    Caption = 'Alamat Lengkap'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label5: TLabel
    Left = 429
    Top = 26
    Width = 90
    Height = 16
    Caption = 'Desa/Kelurahan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label6: TLabel
    Left = 456
    Top = 60
    Width = 63
    Height = 16
    Caption = 'Kecamatan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 429
    Top = 95
    Width = 90
    Height = 16
    Caption = 'Kabupaten/Kota'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 479
    Top = 130
    Width = 40
    Height = 16
    Caption = 'Agama'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label9: TLabel
    Left = 413
    Top = 167
    Width = 106
    Height = 16
    Caption = 'Status Perkawinan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label10: TLabel
    Left = 406
    Top = 203
    Width = 113
    Height = 16
    Caption = 'Pendidikan Terakhir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label11: TLabel
    Left = 462
    Top = 239
    Width = 57
    Height = 16
    Caption = 'Pekerjaan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label13: TLabel
    Left = 430
    Top = 344
    Width = 89
    Height = 16
    Caption = 'No. Telepon/HP'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 179
    Top = 344
    Width = 16
    Height = 16
    Caption = 'RT'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label16: TLabel
    Left = 275
    Top = 344
    Width = 20
    Height = 16
    Caption = 'RW'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label12: TLabel
    Left = 75
    Top = 106
    Width = 76
    Height = 16
    Caption = 'Tempat Lahir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label14: TLabel
    Left = 73
    Top = 146
    Width = 78
    Height = 16
    Caption = 'Tanggal Lahir'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object ekode: TEdit
    Left = 171
    Top = 26
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
    Tag = 1
    Left = 171
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
    OnChange = enamaChange
  end
  object edesa: TEdit
    Tag = 10
    Left = 539
    Top = 23
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
    TabOrder = 10
    OnChange = enamaChange
  end
  object ekecamatan: TEdit
    Tag = 11
    Left = 539
    Top = 57
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
    TabOrder = 11
    OnChange = enamaChange
  end
  object ekabupaten: TEdit
    Tag = 12
    Left = 539
    Top = 92
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
    TabOrder = 12
    OnChange = enamaChange
  end
  object etelepon: TEdit
    Tag = 18
    Left = 539
    Top = 338
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
    TabOrder = 18
    OnChange = eteleponChange
  end
  object cagama: TComboBox
    Tag = 13
    Left = 539
    Top = 126
    Width = 193
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
    TabOrder = 13
    OnKeyPress = ctanggalKeyPress
  end
  object cperkawinan: TComboBox
    Tag = 14
    Left = 539
    Top = 163
    Width = 193
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
    TabOrder = 14
    OnKeyPress = ctanggalKeyPress
    Items.Strings = (
      'Pilihan'
      'Menikah'
      'Lajang'
      'Janda'
      'Duda')
  end
  object cpendidikan: TComboBox
    Tag = 15
    Left = 539
    Top = 199
    Width = 193
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
    TabOrder = 15
    OnKeyPress = ctanggalKeyPress
    Items.Strings = (
      'Pilihan'
      'SD'
      'SMP'
      'SMA'
      'Diploma/Sarjana'
      'Lain-lain')
  end
  object cpekerjaan: TComboBox
    Tag = 16
    Left = 539
    Top = 235
    Width = 193
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
    TabOrder = 16
    OnKeyPress = ctanggalKeyPress
    Items.Strings = (
      'Pilihan'
      'PNS'
      'Wiraswasta'
      'TNI/Polri'
      'Pelajar/Mahasiswa'
      'Lain-lain')
  end
  object malamat: TMemo
    Tag = 7
    Left = 171
    Top = 256
    Width = 193
    Height = 65
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 7
    OnChange = enamaChange
  end
  object ert: TEdit
    Tag = 8
    Left = 211
    Top = 341
    Width = 49
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 8
    OnChange = ertChange
  end
  object erw: TEdit
    Tag = 9
    Left = 307
    Top = 341
    Width = 49
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 9
    OnChange = ertChange
  end
  object rgKelamin: TRadioGroup
    Tag = 6
    Left = 171
    Top = 182
    Width = 193
    Height = 57
    Caption = 'Jenis Kelamin'
    Columns = 2
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Pria'
      'Wanita')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
  end
  object bsimpan: TButton
    Left = 539
    Top = 406
    Width = 90
    Height = 30
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 19
    OnClick = bsimpanClick
  end
  object bbatal: TButton
    Left = 642
    Top = 406
    Width = 90
    Height = 30
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 20
    OnClick = bbatalClick
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 478
    Width = 784
    Height = 19
    Panels = <
      item
        Text = '        Status'
        Width = 80
      end
      item
        Width = 150
      end>
  end
  object rgKewarganegaraan: TRadioGroup
    Tag = 17
    Left = 539
    Top = 272
    Width = 193
    Height = 57
    Caption = 'Kewarganegaraan'
    Columns = 2
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'WNI'
      'WNA')
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 17
  end
  object etempatLahir: TEdit
    Tag = 2
    Left = 171
    Top = 103
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
    TabOrder = 2
    OnChange = enamaChange
  end
  object ctanggal: TComboBox
    Tag = 3
    Left = 171
    Top = 142
    Width = 57
    Height = 24
    Hint = 'Tgl'
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    OnKeyPress = ctanggalKeyPress
  end
  object cbulan: TComboBox
    Tag = 4
    Left = 235
    Top = 142
    Width = 57
    Height = 24
    Hint = 'Bln'
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
    OnKeyPress = ctanggalKeyPress
  end
  object ctahun: TComboBox
    Tag = 5
    Left = 299
    Top = 142
    Width = 65
    Height = 24
    Hint = 'Tahun'
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 5
    OnKeyPress = ctanggalKeyPress
  end
end
