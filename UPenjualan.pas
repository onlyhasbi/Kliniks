unit UPenjualan;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGrids, Menus, ActnList;

type
  Tfpenjualan = class(TForm)
    ltotalbelanja: TLabel;
    etotalBayar: TEdit;
    Label1: TLabel;
    Label3: TLabel;
    eBayar: TEdit;
    eKembalian: TEdit;
    eDiskon: TEdit;
    sbinfo: TStatusBar;
    rgPelanggan: TRadioGroup;
    Label8: TLabel;
    PageControl: TPageControl;
    TabHerbal: TTabSheet;
    TabTerapi: TTabSheet;
    Label2: TLabel;
    Label7: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    Label4: TLabel;
    ehTotal: TEdit;
    gridHerbal: TDBGrid;
    bhTambah: TButton;
    ehJumlah: TEdit;
    ehHarga: TEdit;
    ehNama: TEdit;
    ehKode: TEdit;
    ctNama: TComboBox;
    Label9: TLabel;
    Label10: TLabel;
    etHarga: TEdit;
    Label11: TLabel;
    etJumlah: TEdit;
    btTambah: TButton;
    gridTerapi: TDBGrid;
    Label12: TLabel;
    etTotal: TEdit;
    Label13: TLabel;
    etKode: TEdit;
    ekodePasien: TEdit;
    bbatal: TButton;
    bsimpan: TButton;
    PopupHerbal: TPopupMenu;
    plihat: TMenuItem;
    pstok: TMenuItem;
    phapus: TMenuItem;
    ActionGridHerbal: TActionList;
    lihatData: TAction;
    hapusData: TAction;
    lihatStok: TAction;
    etDiskon: TEdit;
    Label14: TLabel;
    ehDiskon: TEdit;
    Label15: TLabel;
    procedure rgPelangganClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure ekodePasienChange(Sender: TObject);
    procedure ekodePasienKeyPress(Sender: TObject; var Key: Char);
    procedure bhTambahClick(Sender: TObject);
    procedure ehKodeChange(Sender: TObject);
    procedure eBayarChange(Sender: TObject);
    procedure eKembalianChange(Sender: TObject);
    procedure eDiskonChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure ehKodeKeyPress(Sender: TObject; var Key: Char);
    procedure btTambahClick(Sender: TObject);
    procedure PopupHerbalPopup(Sender: TObject);
    procedure ehJumlahChange(Sender: TObject);
    procedure ehHargaChange(Sender: TObject);
    procedure ehTotalChange(Sender: TObject);
    procedure hapusDataExecute(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ehDiskonChange(Sender: TObject);
    procedure lihatStokExecute(Sender: TObject);
    procedure lihatDataExecute(Sender: TObject);
    procedure etJumlahKeyPress(Sender: TObject; var Key: Char);
    procedure ehJumlahKeyPress(Sender: TObject; var Key: Char);
  private
    procedure loadDataHerbal;
    procedure sambungGridHerbal;
    procedure sambungGridTerapi;
    procedure hitungKembalian;
    procedure setNol(var sender : tobject);
    procedure clearHerbal;    
    
  public
    { Public declarations }
  end;

var
  fpenjualan: Tfpenjualan;
  aktif,totalHerbal,totalTerapi:integer;



implementation

uses DatabaseScript, FormScript, UDataModule, DB, Uutama, MemDS,
  UHargaHerbal, UDataHerbal;

{$R *.dfm}

procedure Tfpenjualan.rgPelangganClick(Sender: TObject);
begin
if rgPelanggan.ItemIndex=1 then
   begin
   ekodePasien.Visible:=true;
   ekodePasien.Clear;
   TabTerapi.Enabled:=true;
   ekodePasien.SetFocus;
   end
else if rgPelanggan.ItemIndex=0 then
     begin
     ekodePasien.Visible:=false;
     TabTerapi.Enabled:=false;
     end;
end;

procedure Tfpenjualan.bbatalClick(Sender: TObject);
begin
ekodePasien.Visible:=false;
rgPelanggan.ItemIndex:=0;
dm.vtTerapi.Clear;
dm.vtHerbal.Clear;
totalHerbal:=0;
totalTerapi:=0;

clearHerbal;
ehTotal.Text:='0';

etKode.Clear;
ctNama.Text:='Pilihan';
etHarga.Clear;
etJumlah.Clear;
etTotal.Text:='0';

etotalBayar.Text:='0';
ebayar.Text:='0';
eKembalian.Text:='0';
eDiskon.Text:='0';

ehKode.SetFocus;
end;

procedure Tfpenjualan.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
if aktif=0 then
   inc(aktif)
else
   begin
   if aktif=1 then
      begin
      totalHerbal:=0;
      totalTerapi:=0;
      end;
   end;
sambungGridTerapi;
sambungGridHerbal;
rgPelanggan.ItemIndex:=0;
ThousandSeparator:='.';
DecimalSeparator:='.';
ehKode.SetFocus;
end;


procedure Tfpenjualan.bsimpanClick(Sender: TObject);
var
  kode,kp,tanggal,tipe,bayar,diskon,total,strSQL:string;
  kod,jum,dis : string;
  savingMaster : boolean;

begin
savingMaster:=true;
kode:=generateKodeTransaksi('TRJ','master_penjualan');

if (eBayar.Text<>'0') and (eKembalian.Text<>'0') and (etotalBayar.Text<>'0')then
   begin
   if (dm.vtHerbal.RecordCount>0) or (dm.vtTerapi.RecordCount>0) then
      begin
      if dm.vtHerbal.RecordCount>0 then
         begin
         dm.vtHerbal.First;
         savingMaster:=true;
         while not(dm.vtHerbal.Eof) do
            begin
            kod:=dm.vtHerbal['Kode'];
            jum:=dm.vtHerbal['Jumlah'];
            runkueri(openKueri('diskon','data_herbal_setelan',' where fk_herbal='+QuotedStr(kod)));
            if dm.zkue.RecordCount>0 then
               dis:=dm.Zkue.fields[0].asstring;
            strSQL:='insert into detail_jual_herbal(fk_penjualan,fk_herbal,jumlah,diskon) '+
                    'values ("%s","%s","%s","%s")';
            runKueri(format(strSQL,[kode,kod,jum,dis]),false);
            strSQL:='UPDATE data_herbal_setelan set '+
                       'jumlah=jumlah-"%d" '+
                       'WHERE fk_herbal="%s"';;
            runKueri(format(strSQL,[strToint(jum),kod]),false);
            dm.vtHerbal.Next;
            end;
         end;
            
      if dm.vtTerapi.RecordCount>0 then
         begin
         dm.vtTerapi.First;
         while not(dm.vtTerapi.Eof) do
              begin
              kod:=dm.vtTerapi['Kode'];
              jum:=dm.vtTerapi['Jumlah'];
              dis:='0';
              strSQL:='insert into detail_jual_layanan(fk_penjualan,fk_terapi,jumlah,diskon) '+
                      'values ("%s","%s","%s","%s")';
              runKueri(format(strSQL,[kode,kod,jum,dis]),false);
              dm.vtTerapi.Next;
              end;
         end; 
      end
   else
      begin
      sbinfo.Panels[1].Text:='Maaf, anda belum melakukan transaksi';
      savingMaster:=false;
      end;
   end
else
    begin
    sbinfo.Panels[1].Text:='Maaf, pembayaran anda belum lengkap';
    savingMaster:=false;
    end;

if savingMaster then
   begin
   runKueri(openKueri('kode','data_petugas',' where nama='+QuotedStr(futama.sbinfo.Panels[2].text)));
    if dm.zkue.RecordCount>0 then
       kp:=dm.zkue.Fields[0].AsString;
    tanggal:=formatDateTime('YYYY-MM-DD HH:MM:SS',now);
    if rgPelanggan.ItemIndex=0 then
       tipe:='umum'
    else
       tipe:=ekodePasien.Text;

    bayar:=keAngka(eBayar.Text);
    diskon:=keAngka(eDiskon.Text);
    total:=keAngka(etotalBayar.Text);

    strSQL:='insert into master_penjualan(kode,fk_pengguna,tanggal,tipe,bayar,diskon,total) values '+
    '("%s","%s","%s","%s","%s","%s","%s")';
    runkueri(format(strSQL,[kode,kp,tanggal,tipe,bayar,diskon,total]),false);
    sbinfo.Panels[1].Text:='Data transaksi telah disimpan';
    bbatal.Click;
   end;
end;


procedure Tfpenjualan.ekodePasienChange(Sender: TObject);
begin
CodeChar(sender);
end;


procedure Tfpenjualan.ekodePasienKeyPress(Sender: TObject; var Key: Char);
var
  nr,ns,tanggal,namapas,kelamin,namates : string;
begin
if Key=#13 then
   begin
   if ekodePasien.Text<>'' then
   begin
   if validateKode('PN',ekodePasien.Text,sbinfo,ekodePasien) then
      begin
      nr:='RM'+copy(ekodePasien.Text,3,length(ekodePasien.Text));
      tanggal:=FormatDateTime('yyyy-mm-dd',now);
      runkueri(openKueri('noRegistrasi','kunjungan',
      ' where fk_noRekamMedis='+QuotedStr(nr)+' and tanggal='+
      QuotedStr(tanggal)+' order by waktu desc'));
      if dm.zkue.RecordCount>0 then
         ns:=dm.zkue.Fields[0].AsString;

      if ns<>'' then
         begin
         runkueri(openKueri('d.kode,d.nama,h.hargaJual,h.diskon,r.jumlah',
         ' data_herbal as d INNER JOIN data_herbal_setelan as h '+
         'ON d.kode=h.fk_herbal INNER JOIN resep as r ON r.fk_herbal=h.fk_herbal',
         ' WHERE r.noPeriksa='+QuotedStr(ns)));
         if dm.zkue.RecordCount>0 then
            begin
            while not(dm.zkue.Eof) do
                  begin
                  ehKode.Text:=dm.zkue.Fields[0].AsString;
                  ehNama.Text:=dm.zkue.Fields[1].AsString;
                  ehHarga.Text:=dm.zkue.Fields[2].AsString;
                  ehDiskon.Text:=dm.zkue.Fields[3].AsString;
                  ehJumlah.Text:=dm.zkue.Fields[4].AsString;
                  bhTambah.Click;
                  dm.zkue.Next;
                  end;
            end;

         runKueri(openKueri('p.nama,p.kelamin,t.nama','data_pasien as p LEFT JOIN kunjungan as k ON'+
         ' p.kodeRM=k.fk_noRekamMedis LEFT JOIN data_terapis as t ON'+
         ' t.kode=k.fk_terapis',' where fk_noRegistrasi='+QuotedStr(ns)));
         if dm.zkue.RecordCount>0 then
            begin
            namapas:=dm.zkue.Fields[0].AsString;
            kelamin:=dm.zkue.Fields[1].AsString;
            namates:=dm.zkue.Fields[2].AsString;
            if kelamin='Pria' then
               kelamin:='Tuan'
            else
                Kelamin:='Nyonya';
            sbinfo.Panels[1].Text:=kelamin+' '+namapas+' ditangani oleh '+namates;
            end;

         runKueri(openKueri('t.kode,t.nama,t.biaya,t.diskon,n.jumlah','tindakan as n LEFT JOIN kunjungan as k ON'+
         ' k.noRegistrasi=n.fk_noRegistrasi LEFT JOIN data_terapi as t ON t.kode=n.fk_terapi',
         ' where fk_noRegistrasi='+QuotedStr(ns)));
         if dm.zkue.RecordCount>0 then
            begin
            while not(dm.zkue.Eof) do
                  begin
                  etKode.Text:=dm.zkue.Fields[0].AsString;
                  ctNama.Text:=dm.zkue.Fields[1].AsString;
                  etHarga.Text:=dm.zkue.Fields[2].AsString;
                  etDiskon.Text:=dm.zkue.Fields[3].AsString;
                  etJumlah.Text:=dm.zkue.Fields[4].AsString;
                  btTambah.Click;
                  dm.zkue.Next;
                  end;
            end;       
         end
      else
         sbinfo.Panels[1].Text:='Data '+ekodePasien.Text+' tidak ditemukan !';
      end;
   end;
   key:=#0;
   end;
end;

procedure Tfpenjualan.loadDataHerbal;
var
  diskon,harga : integer;
begin
harga:=StrToInt(dm.zkue.Fields[2].AsString);
diskon:=StrToInt(dm.zkue.Fields[3].AsString);
dec(harga,diskon);

with dm.zkue do
   begin
     ehKode.Text:=Fields[0].AsString;
     ehNama.Text:=Fields[1].AsString;
     ehHarga.Text:=IntToStr(harga);
     ehdiskon.Text:=Fields[3].AsString;
   end;
end;

             
procedure Tfpenjualan.bhTambahClick(Sender: TObject);
var
  kode,nama,harga,jumlah : String;
  intharga,intjumlah,intDiskon,sub : integer;

begin
 kode:=ehKode.Text;
 nama:=ehNama.Text;
 if TryStrToInt(keAngka(ehHarga.Text),intharga) and TryStrToInt(ehJumlah.Text,intjumlah) and TryStrToInt(keAngka(ehDiskon.Text),intDiskon) then
    begin
     harga:=keAngka(ehHarga.Text);
     jumlah:=ehJumlah.Text;
     sub:=intharga*intjumlah;

     with dm do
       begin
       vtHerbal.append;
       vtHerbal.FieldByName('Kode').AsString:=kode;
       vtHerbal.FieldByName('Nama').AsString:=nama;
       vtHerbal.FieldByName('Harga').AsString:=keRupiah(harga);
       vtHerbal.FieldByName('Diskon').AsString:=keRupiah(IntToStr(intDiskon));
       vtHerbal.FieldByName('Jumlah').AsString:=jumlah;
       vtHerbal.FieldByName('SubTotal').AsString:=keRupiah(IntToStr(sub));
       vtHerbal.Post;
       end;

      totalHerbal:=totalHerbal+sub;
      ehTotal.Text:=keRupiah(IntToStr(totalHerbal));
      hitungKembalian;                               
      etotalBayar.Text:=keRupiah(intToStr(totalHerbal+totalTerapi));
      clearHerbal;
    end
 else
    sbinfo.Panels[1].Text:='Teks jumlah masih kosong';
end;


procedure Tfpenjualan.btTambahClick(Sender: TObject);
var
  kode,nama,harga,jumlah : String;
  sub,intharga,intjumlah,intDiskon : integer;

begin
 kode:=etKode.Text;
 nama:=ctNama.Text;
 if TryStrToInt(keAngka(etHarga.Text),intharga) and TryStrToInt(etJumlah.Text,intjumlah) and TryStrToInt(etDiskon.Text,intDiskon) then
    begin
     harga:=keAngka(etHarga.Text);
     jumlah:=etJumlah.Text;
     sub:=intharga*intjumlah;

     with dm do
       begin
       vtTerapi.append;
       vtTerapi.FieldByName('Kode').AsString:=kode;
       vtTerapi.FieldByName('Nama Terapi').AsString:=nama;
       vtTerapi.FieldByName('Harga').AsString:=keRupiah(harga);
       vtHerbal.FieldByName('Diskon').AsString:=keRupiah(IntToStr(intDiskon));
       vtTerapi.FieldByName('Jumlah').AsString:=jumlah;
       vtTerapi.FieldByName('SubTotal').AsString:=keRupiah(IntToStr(sub));
       vtTerapi.Post;
       end;

      totalTerapi:=totalTerapi+sub;
      etTotal.Text:=keRupiah(IntToStr(totalTerapi));

      etotalBayar.Text:=intToStr(totalHerbal+totalTerapi);
    end
 else
    sbinfo.Panels[1].Text:='Teks jumlah masih kosong';
end;


procedure Tfpenjualan.sambungGridHerbal;
begin
gridHerbal.DataSource:=dm.dsHerbal;
dm.dsHerbal.DataSet:=dm.vtHerbal;
dm.vtHerbal.Active:=true;
end;


procedure Tfpenjualan.sambungGridTerapi;
begin
gridTerapi.DataSource:=dm.dsTerapi;
dm.dsTerapi.DataSet:=dm.vtTerapi;
dm.vtTerapi.Active:=true;
end;


procedure Tfpenjualan.ehKodeChange(Sender: TObject);
begin
CodeChar(sender);
end;


procedure Tfpenjualan.eBayarChange(Sender: TObject);
var
  total,bayar : integer;

begin
if tedit(sender).Text<>'' then
   begin
   moneyNumber(sender);

   if TryStrToInt(tedit(sender).Text,bayar) then
      tedit(sender).Text:=IntToStr(bayar);

     begin
     if (keAngka(etotalBayar.Text)<>'') then
        begin
        if bayar=0 then
          eKembalian.Text:='0'
        else
          begin
            total:=StrToInt(keAngka(etotalBayar.Text));
            bayar:=StrToInt(keAngka(Tedit(Sender).Text));

             if (total>0) and (total<=bayar) then
                eKembalian.Text:=keRupiah(intToStr(bayar-total))
             else
                eKembalian.Text:='0';
          end;
        end; 

     if length(tedit(sender).Text)>3 then
        tedit(sender).Text:=keRupiah(tedit(sender).Text);

     TEdit(sender).SelStart:=Length(TEdit(sender).text);
     end;                      
   end
else
   begin
   TEdit(sender).Text:='0';
   eKembalian.Text:='0';
   TEdit(sender).SelStart:=length(TEdit(sender).Text);
   end;
end;

procedure Tfpenjualan.eKembalianChange(Sender: TObject);
begin
moneyNumber(sender);
if length(tedit(sender).Text)>3 then
   Tedit(sender).Text:=keRupiah(Tedit(sender).Text);
end;

procedure Tfpenjualan.eDiskonChange(Sender: TObject);
var
  total,totalbayar,diskon,bayar,kembalian : integer;
  teks:string;

begin            
if TEdit(sender).Text<>'' then
   begin
   moneyNumber(sender);

   if TryStrToInt(tedit(sender).Text,diskon) then
      tedit(sender).Text:=IntToStr(diskon);

   if (etotalBayar.Text<>'') and (ebayar.Text<>'') then
      begin
         totalbayar:=StrToInt(keAngka(etotalBayar.Text));
         diskon:=StrToInt(keAngka(eDiskon.Text));
         bayar:=StrToInt(keAngka(eBayar.Text));

         if diskon>=0 then
            begin
               if diskon<=totalBayar then
                  begin
                  total:=(totalHerbal+totalTerapi)-diskon;
                  kembalian:=bayar-total;
                  etotalBayar.Text:=keRupiah(IntToStr(total));
                  eKembalian.Text:=keRupiah(IntToStr(kembalian));
                  end
               else
                  begin
                  sbinfo.Panels[1].Text:='Nilai diskon terlalu besar';
                  teks:=Tedit(sender).Text;
                  delete(teks,length(teks),1);
                  Tedit(sender).Text:=teks;
                  end;
            end;
       if length(tedit(sender).Text)>3 then
          Tedit(sender).text:=keRupiah(tedit(sender).Text);

      Tedit(sender).SelStart:=Length(TEdit(sender).Text);
     end;
   end
else
   begin
   TEdit(sender).Text:='0';
   TEdit(sender).SelStart:=length(TEdit(sender).Text);
   end; 
end;



procedure Tfpenjualan.FormKeyPress(Sender: TObject; var Key: Char);
begin
if key=#27 then
   begin
   Self.Close;
   key:=#0;
   end;
end;

procedure Tfpenjualan.ehKodeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
   runKueri(openKueri('d.kode,d.nama,h.hargajual,h.diskon',
   'data_herbal as d INNER JOIN data_herbal_setelan as h on d.kode=h.fk_herbal',
   ' where d.kode='+QuotedStr(ehKode.Text)));
   if dm.zkue.RecordCount>0 then
       begin
       loadDataHerbal;
       ehJumlah.SetFocus;
       end;
   key:=#0;
   end;
end;

procedure Tfpenjualan.PopupHerbalPopup(Sender: TObject);
begin
if dm.vtHerbal.RecordCount<0 then
   begin
   plihat.Enabled:=false;
   pstok.Enabled:=false;
   phapus.Enabled:=false;
   end;
end;

procedure Tfpenjualan.ehJumlahChange(Sender: TObject);
begin
number(sender);
end;

procedure Tfpenjualan.ehHargaChange(Sender: TObject);
begin
moneyNumber(sender);
Tedit(sender).Text:=keRupiah(Tedit(sender).Text);
end;

procedure Tfpenjualan.ehTotalChange(Sender: TObject);
begin
setNol(sender);
if length(tedit(sender).Text)>3 then
   Tedit(sender).Text:=keRupiah(Tedit(sender).Text);

end;

procedure Tfpenjualan.hapusDataExecute(Sender: TObject);
var
  deleted : integer;
  kode,nama,ssubtotal : string;
  subtotal,total,bayar : integer;

begin
deleted:=MessageDlg('Anda yakin ingin menghapus data dari tabel ?',mtConfirmation,[mbYes,mbNo],0);

if deleted=mrYes then
   begin
   kode:=gridHerbal.Fields[0].AsString;
   nama:=gridHerbal.Fields[1].AsString;
   ssubtotal:=gridHerbal.Fields[5].AsString;
   subtotal:=StrToInt(keAngka(ssubtotal));

   totalHerbal:=totalHerbal-subtotal;
   total:=totalHerbal+totalTerapi;
   etotalBayar.Text:=intToStr(total);
   ehTotal.Text:=IntToStr(totalHerbal);

   hitungKembalian;

   if (totalHerbal+totalTerapi)=0 then
       eKembalian.Text:='0';

   dm.vtHerbal.Delete;
   sbinfo.Panels[1].Text:=nama+' telah dihapus dari daftar';
   end;
end;


procedure Tfpenjualan.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.vtHerbal.Clear;
dm.vtTerapi.Clear;
totalHerbal:=0;
totalTerapi:=0;
end;

procedure Tfpenjualan.ehDiskonChange(Sender: TObject);
begin
Tedit(sender).Text:=keRupiah(Tedit(sender).Text);
end;

procedure Tfpenjualan.hitungKembalian;
var
  bayar,total,diskon : integer;
begin
total:=totalHerbal+totalTerapi;
bayar:=StrToInt(keAngka(eBayar.Text));
   if bayar>total then
      begin
      if ediskon.Text<>'' then
         begin
         diskon:=StrToInt(keAngka(ediskon.Text));
         eKembalian.Text:=intToStr(bayar-total-diskon)
         end;
      end
   else
      eKembalian.Text:='0';
end;

procedure Tfpenjualan.setNol(var sender:tobject);
begin
if tedit(sender).Text='' then
   tedit(sender).Text:='0';
end;

procedure Tfpenjualan.lihatStokExecute(Sender: TObject);
var
  kode:string;
  
begin
kode:=gridHerbal.Fields[0].AsString;
try
   fhargaherbal:=Tfhargaherbal.Create(nil);
   fhargaherbal.setJual(true,kode);
   fhargaherbal.ShowModal;
Finally
   fhargaherbal.Free;
end;
end;

procedure Tfpenjualan.lihatDataExecute(Sender: TObject);
var
  kode:string;
begin
kode:=gridHerbal.Fields[0].AsString;
try
  fherbal:=Tfherbal.Create(nil);
  fherbal.setJual(true,kode);
  fherbal.ShowModal;
finally
  fherbal.Free;
end;
end;

procedure Tfpenjualan.etJumlahKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   btTambahClick(self.btTambah);
end;

procedure Tfpenjualan.ehJumlahKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   begin
   SelectNext(sender as TWinControl,True,True);
   key:=#0;
   end;
end;

procedure Tfpenjualan.clearHerbal;
begin
ehKode.Clear;
ehNama.Clear;
ehDiskon.Clear;
ehHarga.Clear;
ehJumlah.Clear;
end;

end.
