object fpembelian: Tfpembelian
  Left = 257
  Top = 153
  BorderStyle = bsSingle
  Caption = 'Pembelian'
  ClientHeight = 539
  ClientWidth = 693
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
  OnCreate = FormCreate
  OnKeyPress = FormKeyPress
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel
    Left = 592
    Top = 56
    Width = 51
    Height = 16
    Caption = 'Pemasok'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label2: TLabel
    Left = 112
    Top = 128
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
    Left = 289
    Top = 128
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
  object Label4: TLabel
    Left = 336
    Top = 128
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
  object Label5: TLabel
    Left = 32
    Top = 128
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
  object Label6: TLabel
    Left = 32
    Top = 32
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
  object Label8: TLabel
    Left = 416
    Top = 128
    Width = 58
    Height = 16
    Caption = 'Harga Beli'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object Label7: TLabel
    Left = 488
    Top = 128
    Width = 60
    Height = 16
    Caption = 'Harga Jual'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
  end
  object gridPembelian: TDBGrid
    Left = 32
    Top = 184
    Width = 609
    Height = 241
    Ctl3D = False
    DataSource = dm.dsPembelian
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
    ParentCtl3D = False
    ParentFont = False
    PopupMenu = PopupBeli
    TabOrder = 10
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
  end
  object ekode: TEdit
    Left = 32
    Top = 152
    Width = 73
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
    OnKeyPress = ekodeKeyPress
  end
  object enama: TEdit
    Left = 112
    Top = 152
    Width = 169
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
    OnKeyPress = enamaKeyPress
  end
  object ejumlah: TEdit
    Left = 288
    Top = 152
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
    OnChange = ejumlahChange
    OnKeyPress = enamaKeyPress
  end
  object ediskon: TEdit
    Left = 336
    Top = 152
    Width = 73
    Height = 22
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 4
    Text = '0'
    OnChange = ediskonChange
    OnKeyPress = enamaKeyPress
  end
  object btambah: TButton
    Left = 568
    Top = 152
    Width = 75
    Height = 22
    Caption = '+'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 7
    OnClick = btambahClick
  end
  object cpemasok: TComboBox
    Left = 514
    Top = 81
    Width = 129
    Height = 24
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ItemHeight = 16
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 0
    Text = 'Pilihan'
  end
  object bsimpan: TButton
    Left = 448
    Top = 448
    Width = 90
    Height = 30
    Caption = 'Simpan'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 8
    OnClick = bsimpanClick
  end
  object bbatal: TButton
    Left = 552
    Top = 448
    Width = 90
    Height = 30
    Caption = 'Batal'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 9
    OnClick = bbatalClick
  end
  object sbinfo: TStatusBar
    Left = 0
    Top = 520
    Width = 693
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
  object ehargaBeli: TEdit
    Left = 416
    Top = 152
    Width = 65
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
    Text = '0'
    OnChange = ehargaBeliChange
    OnKeyPress = enamaKeyPress
  end
  object eTotalBayar: TEdit
    Left = 56
    Top = 64
    Width = 425
    Height = 51
    BorderStyle = bsNone
    Color = clBtnFace
    Ctl3D = False
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -37
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentCtl3D = False
    ParentFont = False
    TabOrder = 12
    Text = '0'
    OnChange = eTotalBayarChange
  end
  object ehargaJual: TEdit
    Left = 488
    Top = 152
    Width = 73
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
    Text = '0'
    OnChange = ehargaJualChange
    OnKeyPress = enamaKeyPress
  end
  object ActionGridBeli: TActionList
    Left = 32
    Top = 456
    object lihatData: TAction
      Caption = 'Lihat Data'
      OnExecute = lihatDataExecute
    end
    object hapusData: TAction
      Caption = 'hapusData'
      OnExecute = hapusDataExecute
    end
  end
  object PopupBeli: TPopupMenu
    Left = 64
    Top = 456
    object Hapus1: TMenuItem
      Action = lihatData
    end
    object Hapus2: TMenuItem
      Action = hapusData
      Caption = 'Hapus Data'
    end
  end
end
