object fpenjualan: Tfpenjualan
  Left = 299
  Top = 116
  BorderStyle = bsSingle
  Caption = 'Penjualan'
  ClientHeight = 536
  ClientWidth = 741
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnActivate = FormActivate
  OnClose = FormClose
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object ltotalbelanja: TLabel
    Left = 48
    Top = 33
    Width = 65
    Height = 16
    Caption = 'Total Bayar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label1: TLabel
    Left = 80
    Top = 413
    Width = 32
    Height = 16
    Caption = 'Bayar'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label3: TLabel
    Left = 75
    Top = 469
    Width = 37
    Height = 16
    Caption = 'Diskon'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label8: TLabel
    Left = 53
    Top = 441
    Width = 59
    Height = 16
    Caption = 'Kembalian'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object etotalBayar: TEdit
    Left = 80
    Top = 64
    Width = 401
    Height = 50
    BiDiMode = bdRightToLeft
    BorderStyle = bsNone
    Color = clBtnFace
    Ctl3D = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentBiDiMode = False
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 6
    Text = '0'
    OnChange = ehTotalChange
  end
  object eBayar: TEdit
    Left = 128
    Top = 410
    Width = 150
    Height = 22
    Color = clBtnFace
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 1
    Text = '0'
    OnChange = eBayarChange
  end
  object eKembalian: TEdit
    Left = 128
    Top = 438
    Width = 150
    Height = 22
    Color = clBtnFace
    Ctl3D = False
    Enabled = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 2
    Text = '0'
    OnChange = eKembalianChange
  end
  object eDiskon: TEdit
    Left = 128
    Top = 466
    Width = 150
    Height = 22
    Color = clBtnFace
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 3
    Text = '0'
    OnChange = eDiskonChange
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 517
    Width = 741
    Height = 19
    Panels = <
      item
        Text = '        Status'
        Width = 80
      end
      item
        Width = 500
      end>
  end
  object rgPelanggan: TRadioGroup
    Left = 520
    Top = 57
    Width = 165
    Height = 57
    Caption = '  Pelanggan '
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Items.Strings = (
      'Umum'
      'Pasien')
    ParentFont = False
    TabOrder = 7
    OnClick = rgPelangganClick
  end
  object PageControl: TPageControl
    Left = 48
    Top = 121
    Width = 641
    Height = 265
    ActivePage = TabHerbal
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    MultiLine = True
    ParentFont = False
    TabOrder = 0
    TabPosition = tpRight
    object TabHerbal: TTabSheet
      Caption = '   Herbal   '
      object Label2: TLabel
        Left = 404
        Top = 222
        Width = 29
        Height = 16
        Caption = 'Total'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label7: TLabel
        Left = 464
        Top = 16
        Width = 40
        Height = 16
        Caption = 'Jumlah'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label6: TLabel
        Left = 368
        Top = 16
        Width = 34
        Height = 16
        Caption = 'Harga'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label5: TLabel
        Left = 120
        Top = 16
        Width = 74
        Height = 16
        Caption = 'Nama Herbal'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentFont = False
      end
      object Label4: TLabel
        Left = 24
        Top = 16
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
      object Label15: TLabel
        Left = 280
        Top = 16
        Width = 37
        Height = 16
        Caption = 'Diskon'
      end
      object ehTotal: TEdit
        Left = 450
        Top = 219
        Width = 145
        Height = 22
        Color = clBtnFace
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 5
        Text = '0'
        OnChange = ehTotalChange
      end
      object gridHerbal: TDBGrid
        Left = 26
        Top = 72
        Width = 569
        Height = 129
        Ctl3D = False
        DataSource = dm.dsHerbal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
        ParentCtl3D = False
        ParentFont = False
        PopupMenu = PopupHerbal
        TabOrder = 6
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object bhTambah: TButton
        Left = 520
        Top = 40
        Width = 73
        Height = 22
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = bhTambahClick
      end
      object ehJumlah: TEdit
        Left = 464
        Top = 40
        Width = 41
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
        Text = '0'
        OnChange = ehJumlahChange
        OnKeyPress = ehJumlahKeyPress
      end
      object ehHarga: TEdit
        Left = 368
        Top = 40
        Width = 89
        Height = 22
        Ctl3D = False
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = []
        ParentCtl3D = False
        ParentFont = False
        TabOrder = 2
        Text = '0'
        OnChange = ehHargaChange
      end
      object ehNama: TEdit
        Left = 120
        Top = 40
        Width = 153
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
      object ehKode: TEdit
        Left = 24
        Top = 40
        Width = 89
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
        OnChange = ehKodeChange
        OnKeyPress = ehKodeKeyPress
      end
      object ehDiskon: TEdit
        Left = 280
        Top = 40
        Width = 81
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 7
        Text = '0'
        OnChange = ehDiskonChange
      end
    end
    object TabTerapi: TTabSheet
      Caption = '   Terapi   '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Tahoma'
      Font.Style = []
      ImageIndex = 1
      ParentFont = False
      object Label9: TLabel
        Left = 120
        Top = 16
        Width = 74
        Height = 16
        Caption = 'Nama Terapi'
      end
      object Label10: TLabel
        Left = 368
        Top = 16
        Width = 34
        Height = 16
        Caption = 'Harga'
      end
      object Label11: TLabel
        Left = 464
        Top = 16
        Width = 40
        Height = 16
        Caption = 'Jumlah'
      end
      object Label12: TLabel
        Left = 400
        Top = 220
        Width = 29
        Height = 16
        Caption = 'Total'
      end
      object Label13: TLabel
        Left = 24
        Top = 16
        Width = 28
        Height = 16
        Caption = 'Kode'
      end
      object Label14: TLabel
        Left = 280
        Top = 16
        Width = 37
        Height = 16
        Caption = 'Diskon'
      end
      object ctNama: TComboBox
        Left = 120
        Top = 40
        Width = 153
        Height = 24
        Hint = 'Pilihan'
        Ctl3D = False
        ItemHeight = 16
        ParentCtl3D = False
        TabOrder = 3
      end
      object etHarga: TEdit
        Left = 368
        Top = 40
        Width = 89
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 4
      end
      object etJumlah: TEdit
        Left = 464
        Top = 40
        Width = 41
        Height = 22
        Ctl3D = False
        ParentCtl3D = False
        TabOrder = 5
        OnKeyPress = etJumlahKeyPress
      end
      object btTambah: TButton
        Left = 520
        Top = 40
        Width = 73
        Height = 22
        Caption = '+'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        OnClick = btTambahClick
      end
      object gridTerapi: TDBGrid
        Left = 24
        Top = 72
        Width = 569
        Height = 129
        Ctl3D = False
        DataSource = dm.dsTerapi
        ParentCtl3D = False
        TabOrder = 0
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -13
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
      object etTotal: TEdit
        Left = 448
        Top = 216
        Width = 145
        Height = 22
        Color = clBtnFace
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 1
        Text = '0'
        OnChange = ehTotalChange
      end
      object etKode: TEdit
        Left = 24
        Top = 40
        Width = 89
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 2
      end
      object etDiskon: TEdit
        Left = 280
        Top = 40
        Width = 81
        Height = 22
        Ctl3D = False
        Enabled = False
        ParentCtl3D = False
        TabOrder = 7
        Text = '0'
      end
    end
  end
  object ekodePasien: TEdit
    Left = 592
    Top = 81
    Width = 83
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
    OnChange = ekodePasienChange
    OnKeyPress = ekodePasienKeyPress
  end
  object bbatal: TButton
    Left = 568
    Top = 410
    Width = 100
    Height = 30
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 5
    OnClick = bbatalClick
  end
  object bsimpan: TButton
    Left = 456
    Top = 410
    Width = 100
    Height = 30
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 4
    OnClick = bsimpanClick
  end
  object PopupHerbal: TPopupMenu
    MenuAnimation = [maLeftToRight]
    OwnerDraw = True
    OnPopup = PopupHerbalPopup
    Left = 644
    Top = 469
    object plihat: TMenuItem
      Action = lihatData
    end
    object pstok: TMenuItem
      Action = lihatStok
    end
    object phapus: TMenuItem
      Action = hapusData
      Caption = 'Hapus '
    end
  end
  object ActionGridHerbal: TActionList
    Left = 616
    Top = 472
    object lihatData: TAction
      Caption = 'Lihat Data Herbal'
      OnExecute = lihatDataExecute
    end
    object lihatStok: TAction
      Caption = 'Lihat Stok Herbal'
      OnExecute = lihatStokExecute
    end
    object hapusData: TAction
      Caption = 'Hapus Data Daftar Belanja'
      OnExecute = hapusDataExecute
    end
  end
end
