unit Upembelian;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, StdCtrls, ComCtrls, ResizeKit;

type
  Tfpembelian = class(TForm)
    btambah: TButton;
    bsimpan: TButton;
    bhapus: TButton;
    bbatal: TButton;
    Label1: TLabel;
    gridPembelian: TDBGrid;
    cpemasok: TComboBox;
    ekode: TEdit;
    Label10: TLabel;
    totalBelanja: TEdit;
    StatusBar: TStatusBar;
    procedure btambahClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure FormActivate(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure totalBelanjaChange(Sender: TObject);

  private
    { Private declarations }


   function buatKode:string;
   function totalItem:string;
   procedure perbaharuiKode;

   procedure aturKembali;
   function periksa:Boolean;

   procedure RunSQL(strSQL: string ; OpenIt: boolean = True);
   function SQLResult:boolean;

public
  procedure penambahanItem;
  procedure penguranganItem;
  function keRupiah(teks:String):String;
  function keAngka(teks:String):string;

  end;

var
  fpembelian: Tfpembelian;

implementation

uses UtambahPembelian, Umodul, ZAbstractRODataset, DB, ZDataset, Uutama;

{$R *.dfm}

procedure Tfpembelian.btambahClick(Sender: TObject);
var
  tanggal,strSQL,kodePemasok,kodePengguna,kodeTransaksi,kodeHerbal,nama : string;
  hargaBeli,hargaJual,jumlah,diskon,subtotal,total:string;
  temp,tempSubTotal:Integer;
  pesan:Boolean;

Begin
case (Sender as TButton).Tag of
  1  : begin
       Application.CreateForm(TFBeliTambah,FBeliTambah);
       FBeliTambah.Showmodal;
       end;

  2  : begin
       if not dm.ZKoneksi.InTransaction then
          dm.ZKoneksi.StartTransaction;
       try
       if periksa then
         begin
         strSQL:='select kode from data_petugas where nama="%s"';
         strSQL:=Format(strSQL,[StatusBar.Panels[2].Text]);
         RunSQL(strSQL);
         kodePengguna:=dm.zkmaster.Fields[0].AsString;

         strSQL:='select kode from data_pemasok where nama="%s"';
         strSQL:=Format(strSQL,[cpemasok.Text]);
         RunSQL(strSQL);
         kodePemasok:=dm.zkmaster.Fields[0].AsString;

         kodeTransaksi:=ekode.Text;
         tanggal:=FormatDateTime('yyyy/mm/dd hh:mm:ss',now);
         total:=keAngka(TotalBelanja.text);

         strSQL:='INSERT INTO master_pembelian(kode,fk_pengguna,fk_pemasok,tanggal,total) '+
                 'VALUES ("%s","%s","%s","%s","%s")';
         strSQL:=Format(strSQL,[kodeTransaksi,kodePengguna,kodePemasok,tanggal,total]);
         RunSQL(strSQL,false);

         dm.VPembelian.First;
         while not(dm.VPembelian.eof) do
              begin
              kodeHerbal:=dm.VPembelian['Kode'];
              nama:=dm.VPembelian['Nama'];
              jumlah:=dm.VPembelian['Jumlah'];
              hargaBeli:=keAngka(dm.VPembelian['Harga Beli']);
              hargaJual:=keAngka(dm.VPembelian['Harga Jual']);
              diskon:=dm.VPembelian['Diskon'];
              subtotal:=keAngka(dm.VPembelian['SubTotal']);
              //INSERT KE DETAIL_PEMBELIAN

              strSQL:='insert into detail_beli_herbal(fk_pembelian,fk_herbal,harga_beli,'+
              'jumlah,subTotal) values ("%s","%s","%s","%s","%s")';
              strSQL:=Format(strSQL,[kodeTransaksi,kodeHerbal,hargaBeli,jumlah,SubTotal]);
              RunSQL(strSQL,false);

              //CEK KEABSAHAN ID_HERBAL DARI TABEL DATA DAN SETELAN
              strSQL:='SELECT ds.id,ds.fk_herbal,dh.kode '+
              'FROM data_herbal_setelan as ds '+
              'LEFT JOIN data_herbal as dh '+
              'ON ds.fk_herbal=dh.kode '+
              'WHERE ds.fk_herbal = "%s" ORDER BY ds.id desc';
              strSQL:=Format(strSQL,[kodeHerbal]);
              RunSQL(strSQL);

                if SQLResult then
                   begin
                   strSQL:='UPDATE data_herbal_setelan set '+
                   'jumlah=jumlah+"%d",hargaBeli="%d",hargaJual="%d",diskon="%n" '+
                   'WHERE fk_herbal="%s"';
                   strSQL:=Format(strSQL,[StrToInt(jumlah),StrToInt(hargaBeli),
                   StrToInt(hargaJual),StrToFloat(diskon),kodeHerbal]);
                   RunSQL(strSQL,false);
                   end
                else
                   begin
                   strSQL:='INSERT INTO data_herbal_setelan(fk_herbal,jumlah,'+
                   'hargaBeli,hargaJual,diskon) VALUES ("%s","%s","%s","%s","%s")';
                   strSQL:=Format(strSQL,[kodeHerbal,jumlah,hargaBeli,hargaJual,diskon]);
                   RunSQL(strSQL,false);
                   end;
                dm.VPembelian.Next;
                end;
         perbaharuiKode;
         aturKembali;
         dm.ZKoneksi.Commit;
         StatusBar.Panels[1].Text:='Transaksi pembelian berhasil';
         end;
       except
         dm.ZKMaster.CancelUpdates;
         dm.ZKoneksi.Rollback;
         raise;
         StatusBar.Panels[1].Text:='Transaksi pembelian gagal';
         exit;
       end;

       end;

  3  : begin
       if dm.vpembelian.RecordCount>0 then
          penguranganItem;
       end;

  4  : begin
       aturKembali;
       end;

end;
end;


procedure Tfpembelian.FormClose(Sender: TObject; var Action: TCloseAction);
begin
dm.vpembelian.Clear;
dm.vpembelian.Close;
ModalResult:=mrOk;
end;

procedure Tfpembelian.FormActivate(Sender: TObject);
var
   strSQL:string;
   i:Integer;
begin
aturKembali;
with dm do
  begin
  VPembelian.Active:=True;
  DsTransaksi.DataSet:=VPembelian;
  end;
  gridPembelian.DataSource:=dm.DsTransaksi;

StatusBar.Panels[0].Text:='Total Item '+totalItem;
strSQL:='select nama from data_pemasok order by nama';
RunSQL(strSQL);

if dm.ZKMaster.RecordCount>0 then
  begin
  dm.ZKMaster.First;
  for i:=0 to dm.ZKMaster.RecordCount-1 do
    begin
    cpemasok.Items.Add(dm.ZKMaster.Fields[0].AsString);
    dm.ZKMaster.Next;
    end;
  end;

StatusBar.Panels[2].Text:=FUtama.StatusBar.Panels[2].Text;
DecimalSeparator:='.';
ThousandSeparator:='.';
KeyPreview:=True;
end;

procedure Tfpembelian.aturKembali;
var
  i:Integer;
begin
dm.VPembelian.Clear;
cpemasok.Text:=cpemasok.Hint;
totalBelanja.Text:=totalBelanja.Hint;
StatusBar.Panels[0].Text:='Total Item '+totalItem;
StatusBar.Panels[1].Text:='';
ekode.Text:=buatKode;
end;

function Tfpembelian.buatKode: String;
var
  strSQL:string;
  i,kode:Integer;
begin
strSQL:='select kode,angka from dump where kode="TRB"';
RunSQL(strSQL);

if dm.ZKMaster.RecordCount>0 then
  kode:=strToInt(dm.ZKMaster.Fields[1].asString)
else
  Begin
  kode:=0;
  strSQL:=Format('INSERT INTO dump(kode,angka) values ("%s","%d")',['TRB',kode]);
  RunSQL(strSQL,false);
  End;
Result:='TRB'+FormatFloat('000',kode+1);
end;

procedure Tfpembelian.perbaharuiKode;
var
 strSQL:String;
begin
strSQL:='update dump set angka=angka+1 where kode="TRB" limit 1';
RunSQL(strSQL,false);
end;

procedure Tfpembelian.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
if Key=VK_escape then
   ModalResult:=mrOk;
end;


function Tfpembelian.keRupiah(teks: String): String;
var
  NilaiRupiah: string;
  AngkaRupiah: Currency;

begin
    NilaiRupiah := teks;
    NilaiRupiah := StringReplace(NilaiRupiah,',','',[rfReplaceAll,rfIgnoreCase]);
    NilaiRupiah := StringReplace(NilaiRupiah,'.','',[rfReplaceAll,rfIgnoreCase]);
    AngkaRupiah := StrToCurrDef(NilaiRupiah,0);
    teks := FormatCurr('#,###',AngkaRupiah);
    result:=teks;
end;


function Tfpembelian.keAngka(teks: String): string;
var
  hasil : string;
begin
Hasil:=teks;
Hasil:=StringReplace(Hasil,',','',[rfReplaceAll,rfIgnoreCase]);
Hasil:=StringReplace(Hasil,'.','',[rfReplaceAll,rfIgnoreCase]);
Result:=Hasil;
end;

procedure Tfpembelian.penambahanItem;
var
   subtotal,total,subherbal:integer;

begin
subtotal:=0;

with dm do
  begin
  vpembelian.First;
  while not(vpembelian.Eof) do
     begin
     subherbal:=StrToInt(keAngka(vpembelian.FieldByName('SubTotal').AsString));
     subtotal:=Subtotal+subherbal;
     vpembelian.Next;
     end;
  end;

totalBelanja.Text:=keRupiah(IntToStr(subtotal));
StatusBar.Panels[0].Text:='Total Item '+totalItem;
StatusBar.Panels[1].Text:='Belanjaan herbal ditambahkan ';
end;

procedure Tfpembelian.penguranganItem;
var
subtotal,total,harga:integer;

begin
subtotal:=0;

if dm.vpembelian.RecordCount>0 then
   begin
   total:=StrToInt(keAngka(totalBelanja.text));

   harga:=StrToInt(keAngka(dm.vpembelian.FieldByName('SubTotal').AsString));
   total:=total-harga;
   totalBelanja.Text:=IntToStr(total);

   dm.vpembelian.Delete;
   StatusBar.Panels[0].Text:='Total Item '+totalItem;
   StatusBar.Panels[1].Text:='Belanjaan herbal dikurangi ';
   end;
end;

function Tfpembelian.totalItem: string;
var
  cherbal:integer;
begin
cherbal:=dm.vpembelian.RecordCount;
result:=IntToStr(cherbal);
end;

function Tfpembelian.periksa: Boolean;
var
  cek:Boolean;
begin
  cek:=true;
if dm.vpembelian.RecordCount=0 then
   cek:=false;
if cpemasok.Text='Pemasok' then
   begin
   ShowMessage('Anda belum memilih Pemasok');
   cek:=false;
   end;
Result:=cek;
end;



procedure Tfpembelian.RunSQL(strSQL: string; OpenIt: boolean);
begin
with dm.ZKMaster do
  begin
    Close;
    SQL.Clear;
    SQL.Text := strSQL;
    if OpenIt then
     Open
    else
     ExecSQL;
  end;
end;

function Tfpembelian.SQLResult: boolean;
var
  hasil:Boolean;
begin
   if dm.ZKMaster.RecordCount>0 then
      hasil:=true
   else
      hasil:=false;

   result:=hasil;
end;

procedure Tfpembelian.totalBelanjaChange(Sender: TObject);
begin
if totalBelanja.Text<>'0' then
   TEdit(Sender).Text:=keRupiah(TEdit(sender).Text);
end;

end.
