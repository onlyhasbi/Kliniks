unit UPembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, Grids, DBGrids, ActnList, Menus;

type
  TPemasok = class
  private
    FKode : String;
  public
    constructor createPemasok(const aKode : String);
    property kode : String read FKode write FKode;

  end;


  Tfpembelian = class(TForm)
    gridPembelian: TDBGrid;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ekode: TEdit;
    enama: TEdit;
    ejumlah: TEdit;
    ediskon: TEdit;
    btambah: TButton;
    Label6: TLabel;
    cpemasok: TComboBox;
    bsimpan: TButton;
    bbatal: TButton;
    sbinfo: TStatusBar;
    Label8: TLabel;
    ehargaBeli: TEdit;
    eTotalBayar: TEdit;
    ActionGridBeli: TActionList;
    PopupBeli: TPopupMenu;
    Hapus1: TMenuItem;
    Hapus2: TMenuItem;
    lihatData: TAction;
    hapusData: TAction;
    ehargaJual: TEdit;
    Label7: TLabel;
    procedure ekodeChange(Sender: TObject);
    procedure ekodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormActivate(Sender: TObject);
    procedure ehargaBeliChange(Sender: TObject);
    procedure ejumlahChange(Sender: TObject);
    procedure ediskonChange(Sender: TObject);
    procedure eTotalBayarChange(Sender: TObject);
    procedure btambahClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure hapusDataExecute(Sender: TObject);
    procedure ehargaJualChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure lihatDataExecute(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure enamaKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    procedure setNol(var sender : tobject);
    procedure setPemasok;
    procedure clear;

  public
    { Public declarations }
    procedure loadDataHerbal;
  end;

var
  fpembelian: Tfpembelian;
  total:integer;

implementation

uses DatabaseScript, FormScript, UDataModule, Uutama, UDataHerbal;

{$R *.dfm}

procedure Tfpembelian.ekodeChange(Sender: TObject);
begin
CodeChar(sender);
end;

procedure Tfpembelian.ekodeKeyPress(Sender: TObject; var Key: Char);
var
  tanya : integer;
begin
if key=#13 then
   begin
   runKueri(openKueri('kode,nama','data_herbal',' where kode='+QuotedStr(ekode.Text)));
   if dm.zkue.RecordCount>0 then
       begin
       loadDataHerbal;
       ejumlah.SetFocus;
       end
   else
       begin
       tanya:=MessageDlg('Data herbal belum terdaftar, ingin menambah data ?',mtConfirmation,[mbYes,mbNo],0);
       if tanya=mrYes then
           begin
           fherbal:=Tfherbal.Create(nil);
           fherbal.setJual(true,ekode.Text);
           fherbal.ShowModal;
           end;
       end;
   key:=#0;
   end;
end;

procedure Tfpembelian.loadDataHerbal;
begin
ekode.Text:=dm.zkue.Fields[0].AsString;
enama.Text:=dm.zkue.Fields[1].AsString;
end;

procedure Tfpembelian.FormActivate(Sender: TObject);
var
  i : integer;
begin
KeyPreview:=true;
ThousandSeparator:='.';
DecimalSeparator:='.';
cpemasok.SetFocus; 
end;

procedure Tfpembelian.ehargaBeliChange(Sender: TObject);
begin
money(sender);
end;

procedure Tfpembelian.ejumlahChange(Sender: TObject);
begin
if tedit(sender).Text='' then
   tedit(sender).Text:='0'
else
   number(sender);
end;

procedure Tfpembelian.ediskonChange(Sender: TObject);
begin
money(sender);
end;

procedure Tfpembelian.eTotalBayarChange(Sender: TObject);
begin
setNol(sender);
if length(tedit(sender).Text)>3 then
   Tedit(sender).Text:=keRupiah(Tedit(sender).Text);
end;

procedure Tfpembelian.btambahClick(Sender: TObject);
var
  kode,nama,hargaBeli,hargaJual,jumlah : String;
  inthargaBeli,intHargaJual,intjumlah,intDiskon,sub : integer;

begin
 kode:=ekode.Text;
 nama:=enama.Text;
 
 if TryStrToInt(keAngka(ehargaJual.Text),intHargaJual) and TryStrToInt(keAngka(ehargaBeli.Text),inthargaBeli) and TryStrToInt(eJumlah.Text,intjumlah) and TryStrToInt(keAngka(eDiskon.Text),intDiskon) then
    begin
     hargaBeli:=keAngka(ehargaBeli.Text);
     hargaJual:=keAngka(ehargaJual.Text);
     jumlah:=eJumlah.Text;
     sub:=inthargaBeli*intjumlah;

     with dm do
       begin
       vtPembelian.append;
       vtPembelian.FieldByName('Kode').AsString:=kode;
       vtPembelian.FieldByName('Nama').AsString:=nama;
       vtPembelian.FieldByName('Harga Beli').AsString:=keRupiah(hargaBeli);
       vtPembelian.FieldByName('Diskon').AsString:=keRupiah(IntToStr(intDiskon));
       vtPembelian.FieldByName('Jumlah').AsString:=jumlah;
       vtPembelian.FieldByName('SubTotal').AsString:=keRupiah(IntToStr(sub));
       vtPembelian.FieldByName('Harga Jual').AsString:=keRupiah(hargaJual);
       vtPembelian.Post;
       end;

      total:=total+sub;
      etotalBayar.Text:=keRupiah(intToStr(total));
    clear;
    ekode.SetFocus;
    sbinfo.Panels[1].Text:='Belanjaan telah ditambahkan';
    end
 else
    begin
    if ehargaBeli.Text='0' then
        sbinfo.Panels[1].Text:='Harga Beli belum ditentukan';
    if ehargaJual.Text='0' then
        sbinfo.Panels[1].Text:='Harga Jual belum ditentukan';
    if ejumlah.Text='0' then
        sbinfo.Panels[1].Text:='Jumlah belum ditentukan';
    if ediskon.Text='0' then
        sbinfo.Panels[1].Text:='Diskon belum ditentukan';
    end;
end;

procedure Tfpembelian.bsimpanClick(Sender: TObject);
var
  kode,kod,kp,kdPemasok,tanggal,dis,hargaBeli,hargaJual,jum,strSQL : string;
  pemasok:TPemasok;

begin
if cpemasok.Text<>'Pilihan' then
  begin
  if dm.vtPembelian.RecordCount>0 then
     begin
      kode:=generateKodeTransaksi('TRB','master_pembelian');

      dm.vtPembelian.First;
      while not(dm.vtPembelian.Eof) do
         begin
         kod:=dm.vtPembelian.FieldValues['Kode'];
         dis:=keAngka(dm.vtPembelian.FieldValues['Diskon']);
         hargaBeli:=keAngka(dm.vtPembelian.FieldValues['Harga Beli']);
         hargaJual:=keAngka(dm.vtPembelian.FieldValues['Harga Jual']);
         jum:=dm.vtPembelian.FieldValues['Jumlah'];

         strSQL:='insert into detail_beli_herbal(fk_pembelian,fk_herbal,jumlah) '+
                 'values ("%s","%s","%s")';

         runKueri(format(strSQL,[kode,kod,jum]),false);

         strSQL:='UPDATE data_herbal_setelan set '+
                    'jumlah=jumlah+"%d",diskon="%s",hargaBeli="%s",hargaJual="%s" '+
                    'WHERE fk_herbal="%s"';;
         runKueri(format(strSQL,[strToint(jum),dis,hargaBeli,hargaJual,kod]),false);
         dm.vtPembelian.Next;
       end;

      runKueri(openKueri('kode','data_petugas',' where nama='+QuotedStr(futama.sbinfo.Panels[2].text)));
      if dm.zkue.RecordCount>0 then
         kp:=dm.zkue.Fields[0].AsString;

      pemasok:=TPemasok(cpemasok.Items.Objects[cpemasok.ItemIndex]);
      kdPemasok:=pemasok.kode;
      tanggal:=formatDateTime('YYYY-MM-DD HH:MM:SS',now);


      strSQL:='insert into master_pembelian(kode,fk_pengguna,fk_pemasok,tanggal) values '+
      '("%s","%s","%s","%s")';
      runkueri(format(strSQL,[kode,kp,kdpemasok,tanggal]),false);
      sbinfo.Panels[1].Text:='Data transaksi telah disimpan';
      bbatal.Click;
     end
  else
     sbinfo.Panels[1].Text:='Anda belum melakukan transaksi';
  end
else
  sbinfo.Panels[1].Text:='Anda belum memilih pemasok';
end;

procedure Tfpembelian.bbatalClick(Sender: TObject);
begin
cpemasok.Text:='Pilihan';
clear;
eTotalBayar.Text:='0';
dm.vtPembelian.Clear;
ekode.SetFocus;
end;

procedure Tfpembelian.hapusDataExecute(Sender: TObject);
var
  deleted, total : integer;
  nama,subtotal : string;

begin
deleted:=MessageDlg('Anda yakin ingin menghapus data dari tabel ?',mtConfirmation,[mbYes,mbNo],0);
if deleted=mrYes then
   begin
   nama:=gridPembelian.Fields[1].AsString;
   subtotal:=gridPembelian.Fields[5].AsString;

   total:=StrToInt(keAngka(eTotalBayar.Text));
   total:=total-(StrToInt(keAngka(subtotal)));
   eTotalBayar.Text:=IntToStr(total);
   dm.vtPembelian.Delete;
   sbinfo.Panels[1].Text:=nama+' telah dihapus dari daftar';
   end;
end;

procedure Tfpembelian.setNol(var sender: tobject);
begin
if tedit(sender).Text='' then
   tedit(sender).Text:='0';
end;

procedure Tfpembelian.setPemasok;
var
  kdPemasok,nmPemasok : String;
begin
runKueri(openKueri('kode,nama','data_pemasok',''));
if dm.zkue.RecordCount>0 then
   begin
   dm.zkue.First;
   cpemasok.Items.Add('Pilihan');
   cpemasok.Items.BeginUpdate;
      while not(dm.zkue.Eof) do
        begin
        kdPemasok:=dm.zkue.Fields[0].AsString;
        nmPemasok:=dm.zkue.Fields[1].AsString;
        cpemasok.Items.AddObject(nmPemasok,TPemasok.createPemasok(kdPemasok));
        dm.zkue.Next;   
        end;
   cpemasok.Items.EndUpdate;
   end;
end;


{ TPemasok }

constructor TPemasok.createPemasok(const aKode: String);
begin
Inherited Create;
FKode:=aKode;
end;

procedure Tfpembelian.ehargaJualChange(Sender: TObject);
begin
money(sender);
end;

procedure Tfpembelian.clear;
begin
ekode.Clear;
enama.Clear;
ediskon.Text:='0';
ehargaBeli.Text:='0';
ehargaJual.Text:='0';
ejumlah.Text:='0';
end;

procedure Tfpembelian.FormCreate(Sender: TObject);
begin
sambungKeDatabase;
setPemasok;
end;

procedure Tfpembelian.FormClose(Sender: TObject; var Action: TCloseAction);
var
  i:integer;
begin
  for i:=0 to cpemasok.Items.Count-1 do
      cpemasok.Items.Objects[i].Free;
end;

procedure Tfpembelian.lihatDataExecute(Sender: TObject);
var
  kode:string;
begin
kode:=gridPembelian.Fields[0].AsString;
try
  fherbal:=Tfherbal.Create(nil);
  fherbal.setJual(true,kode);
  fherbal.ShowModal;
finally
  fherbal.Free;
end;
end;

procedure Tfpembelian.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then
   begin
   Self.Close;
   key:=#0;
   end;
end;

procedure Tfpembelian.enamaKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
   SelectNext(sender as TWinControl,True,True);
   key:=#0;
   end;    
end;

end.
