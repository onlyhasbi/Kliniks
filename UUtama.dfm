object futama: Tfutama
  Left = 107
  Top = 115
  BorderStyle = bsSingle
  Caption = 'Sistem Informasi Klinik'
  ClientHeight = 565
  ClientWidth = 1033
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 366
    Top = 496
    Width = 74
    Height = 16
    Caption = 'Total Antrian'
  end
  object ltotalAntrian: TLabel
    Left = 454
    Top = 496
    Width = 9
    Height = 16
    Caption = '#'
  end
  object Label3: TLabel
    Left = 69
    Top = 66
    Width = 69
    Height = 16
    Caption = 'Kode Pasien'
  end
  object Label4: TLabel
    Left = 105
    Top = 97
    Width = 33
    Height = 16
    Caption = 'Nama'
  end
  object Label5: TLabel
    Left = 107
    Top = 127
    Width = 31
    Height = 16
    Caption = 'Umur'
  end
  object Label7: TLabel
    Left = 64
    Top = 406
    Width = 74
    Height = 16
    Caption = 'Tinggi Badan'
  end
  object Label8: TLabel
    Left = 69
    Top = 375
    Width = 69
    Height = 16
    Caption = 'Berat Badan'
  end
  object Label10: TLabel
    Left = 913
    Top = 496
    Width = 59
    Height = 16
    Caption = 'Menunggu'
  end
  object lmenunggu: TLabel
    Left = 985
    Top = 496
    Width = 9
    Height = 16
    Caption = '#'
  end
  object Label6: TLabel
    Left = 52
    Top = 154
    Width = 86
    Height = 16
    Caption = 'Keluhan Utama'
  end
  object Label12: TLabel
    Left = 39
    Top = 226
    Width = 99
    Height = 16
    Caption = 'Keluhan Penyerta'
  end
  object Label13: TLabel
    Left = 297
    Top = 374
    Width = 14
    Height = 16
    Caption = 'Kg'
  end
  object Label14: TLabel
    Left = 297
    Top = 403
    Width = 19
    Height = 16
    Caption = 'Cm'
  end
  object Label2: TLabel
    Left = 55
    Top = 436
    Width = 83
    Height = 16
    Caption = 'Ditangani Oleh'
  end
  object Label11: TLabel
    Left = 46
    Top = 36
    Width = 92
    Height = 16
    Caption = 'Jenis Kunjungan'
  end
  object Label9: TLabel
    Left = 280
    Top = 128
    Width = 35
    Height = 14
    Caption = 'Tahun'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label15: TLabel
    Left = 42
    Top = 299
    Width = 96
    Height = 16
    Caption = 'Riwayat Penyakit'
  end
  object Label16: TLabel
    Left = 794
    Top = 32
    Width = 200
    Height = 25
    Caption = 'Daftar Antrian Pasien'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -21
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object gridKunjungan: TDBGrid
    Left = 358
    Top = 72
    Width = 636
    Height = 409
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -12
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 12
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -13
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    OnCellClick = gridKunjunganCellClick
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 546
    Width = 1033
    Height = 19
    Panels = <
      item
        Text = '        Status'
        Width = 80
      end
      item
        Width = 730
      end
      item
        Width = 100
      end>
  end
  object ekode: TEdit
    Left = 158
    Top = 64
    Width = 164
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 1
    OnChange = ekodeChange
    OnKeyPress = ekodeKeyPress
    OnKeyUp = ekodeKeyUp
  end
  object enama: TEdit
    Left = 158
    Top = 94
    Width = 164
    Height = 22
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 2
  end
  object eumur: TEdit
    Left = 158
    Top = 124
    Width = 115
    Height = 22
    Ctl3D = False
    Enabled = False
    ParentCtl3D = False
    TabOrder = 3
  end
  object eberat: TEdit
    Left = 158
    Top = 372
    Width = 124
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 7
    OnChange = eberatChange
  end
  object etinggi: TEdit
    Left = 158
    Top = 402
    Width = 124
    Height = 22
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 8
    OnChange = etinggiChange
  end
  object btambah: TButton
    Left = 158
    Top = 480
    Width = 83
    Height = 35
    Caption = 'Tambah'
    TabOrder = 10
    OnClick = btambahClick
  end
  object mkutama: TMemo
    Left = 158
    Top = 154
    Width = 164
    Height = 65
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 4
  end
  object mkpenyerta: TMemo
    Left = 158
    Top = 226
    Width = 164
    Height = 65
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 5
  end
  object cterapis: TComboBox
    Left = 158
    Top = 432
    Width = 164
    Height = 24
    Hint = 'Pilihan'
    ItemHeight = 16
    TabOrder = 9
  end
  object ckunjungan: TComboBox
    Left = 158
    Top = 32
    Width = 164
    Height = 24
    Hint = 'Pilihan'
    ItemHeight = 16
    TabOrder = 0
    Items.Strings = (
      'Berobat'
      'Konsultasi')
  end
  object bbatal: TButton
    Left = 247
    Top = 480
    Width = 75
    Height = 35
    Caption = 'Batal'
    TabOrder = 11
    OnClick = bbatalClick
  end
  object mriwayat: TMemo
    Left = 158
    Top = 299
    Width = 161
    Height = 65
    Ctl3D = False
    ParentCtl3D = False
    TabOrder = 6
  end
  object bsegarkan: TButton
    Left = 360
    Top = 32
    Width = 97
    Height = 30
    Caption = 'Segarkan'
    TabOrder = 14
    OnClick = bsegarkanClick
  end
  object MainMenu1: TMainMenu
    Left = 8
    Top = 8
    object mmasuk: TMenuItem
      Caption = 'Masuk'
      OnClick = mmasukClick
    end
    object mberkas: TMenuItem
      Caption = 'Berkas'
      object mdpasien: TMenuItem
        Caption = 'Data Pasien'
        OnClick = mdpasienClick
      end
      object mdterapis: TMenuItem
        Caption = 'Data Terapis'
        OnClick = mdterapisClick
      end
      object Kontrol1: TMenuItem
        Caption = '-'
      end
      object mdherbal: TMenuItem
        Caption = 'Data Herbal'
        OnClick = mdherbalClick
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object mhHerbal: TMenuItem
        Caption = 'Harga Herbal'
        OnClick = mhHerbalClick
      end
      object mhterapi: TMenuItem
        Caption = 'Harga Terapi'
        OnClick = mhterapiClick
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object mdpemasok: TMenuItem
        Caption = 'Data Pemasok'
        OnClick = mdpemasokClick
      end
      object mdpetugas: TMenuItem
        Caption = 'Data Petugas'
        OnClick = mdpetugasClick
      end
    end
    object mtransaksi: TMenuItem
      Caption = 'Transaksi'
      object mpenjualan: TMenuItem
        Caption = 'Penjualan'
        OnClick = mpenjualanClick
      end
      object mpembelian: TMenuItem
        Caption = 'Pembelian'
        OnClick = mpembelianClick
      end
    end
    object mlaporan: TMenuItem
      Caption = 'Laporan'
      object mlpasien: TMenuItem
        Caption = 'Pasien'
        object mlkartu: TMenuItem
          Caption = 'Kartu Pasien'
        end
        object mldata: TMenuItem
          Caption = 'Data Pasien'
        end
        object mlhasil: TMenuItem
          Caption = 'Hasil Pemeriksaan'
        end
        object mlresep: TMenuItem
          Caption = 'Resep Herbal'
        end
      end
      object mlkunjungan: TMenuItem
        Caption = 'Kunjungan'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object mltransaksi: TMenuItem
        Caption = 'Transaksi'
      end
      object mlstok: TMenuItem
        Caption = 'Stok Herbal'
      end
    end
    object mpengaturan: TMenuItem
      Caption = 'Pengaturan'
      object mpengguna: TMenuItem
        Caption = 'Pengguna'
        OnClick = mpenggunaClick
      end
      object N4: TMenuItem
        Caption = '-'
      end
      object mekspor: TMenuItem
        Caption = 'Ekspor'
      end
      object mimpor: TMenuItem
        Caption = 'Impor'
      end
    end
    object mtentang: TMenuItem
      Caption = 'Tentang'
    end
  end
end
