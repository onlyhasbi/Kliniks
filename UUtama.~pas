unit Uutama;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus, StdCtrls, ComCtrls, Grids, DBGrids;

type
  Tfutama = class(TForm)
    gridKunjungan: TDBGrid;
    sbinfo: TStatusBar;
    Label1: TLabel;
    ltotalAntrian: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ekode: TEdit;
    enama: TEdit;
    eumur: TEdit;
    eberat: TEdit;
    etinggi: TEdit;
    btambah: TButton;
    MainMenu1: TMainMenu;
    mmasuk: TMenuItem;
    mberkas: TMenuItem;
    mdpasien: TMenuItem;
    mdterapis: TMenuItem;
    Kontrol1: TMenuItem;
    mtransaksi: TMenuItem;
    mpenjualan: TMenuItem;
    mpembelian: TMenuItem;
    mtentang: TMenuItem;
    mlaporan: TMenuItem;
    mlpasien: TMenuItem;
    mlkunjungan: TMenuItem;
    Label10: TLabel;
    lmenunggu: TLabel;
    mkutama: TMemo;
    mkpenyerta: TMemo;
    Label6: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    Label14: TLabel;
    mdherbal: TMenuItem;
    mhterapi: TMenuItem;
    N1: TMenuItem;
    mdpemasok: TMenuItem;
    mdpetugas: TMenuItem;
    N2: TMenuItem;
    mltransaksi: TMenuItem;
    mlstok: TMenuItem;
    mlkartu: TMenuItem;
    mldata: TMenuItem;
    mlhasil: TMenuItem;
    mlresep: TMenuItem;
    mpengaturan: TMenuItem;
    mpengguna: TMenuItem;
    N4: TMenuItem;
    mekspor: TMenuItem;
    mimpor: TMenuItem;
    mhHerbal: TMenuItem;
    N3: TMenuItem;
    Label2: TLabel;
    cterapis: TComboBox;
    Label11: TLabel;
    ckunjungan: TComboBox;
    Label9: TLabel;
    bbatal: TButton;
    mriwayat: TMemo;
    Label15: TLabel;
    bsegarkan: TButton;
    Label16: TLabel;
    procedure mdpasienClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure mdpetugasClick(Sender: TObject);
    procedure mdpemasokClick(Sender: TObject);
    procedure mdterapisClick(Sender: TObject);
    procedure mdherbalClick(Sender: TObject);
    procedure mhterapiClick(Sender: TObject);
    procedure mhHerbalClick(Sender: TObject);
    procedure mpenggunaClick(Sender: TObject);
    procedure btambahClick(Sender: TObject);
    procedure eberatChange(Sender: TObject);
    procedure etinggiChange(Sender: TObject);
    procedure ekodeChange(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ekodeKeyPress(Sender: TObject; var Key: Char);
    procedure mmasukClick(Sender: TObject);
    procedure gridKunjunganCellClick(Column: TColumn);
    procedure bsegarkanClick(Sender: TObject);
    procedure mpenjualanClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure mpembelianClick(Sender: TObject);
  private

    procedure bersihkan;
    procedure sambungkanGridKunjungan;
    procedure setTerapis(var cterapis:TComboBox);
    function validateData:Boolean;
    procedure loadData;
    

  public
    { Public declarations }
  end;

var
  futama: Tfutama;
  id,kodeRM,noRegistrasi:string;

implementation

uses UDataModule, ZConnection, ZAbstractConnection, UPendaftaran,
  DatabaseScript, UDataPetugas, UDataPemasok, FormScript, UDataTerapis,
  UDataHerbal, UHargaTerapi, UHargaHerbal, UPengguna, DateUtils, DB,
  UMasuk, UPenjualan, UPembelian;



{$R *.dfm}

procedure Tfutama.mdpasienClick(Sender: TObject);
var
   sdpasien : TForm;
begin
    sdpasien:=Tfpendaftaran.Create(nil);
    sdpasien.Show;
end;

procedure Tfutama.mdterapisClick(Sender: TObject);
var
   sdterapis : TForm;
begin
   sdterapis:=Tfterapis.Create(nil);
   sdterapis.Show;
end;

procedure Tfutama.mdpetugasClick(Sender: TObject);
var
   sdpetugas : TForm;
begin
   sdpetugas:=Tfpetugas.Create(nil);
   sdpetugas.Show;
end;


procedure Tfutama.mdpemasokClick(Sender: TObject);
var
   sdpemasok : TForm;
begin
   sdpemasok:=Tfpemasok.Create(nil);
   sdpemasok.Show;
end;

procedure Tfutama.mdherbalClick(Sender: TObject);
var
   sdHerbal : TForm;
begin
   sdHerbal:=Tfherbal.Create(nil);
   sdHerbal.Show;
end;

procedure Tfutama.mhterapiClick(Sender: TObject);
var
   sdTerapi : TForm;
begin
   sdTerapi:=Tfhargaterapi.Create(nil);
   sdTerapi.Show;
end;


procedure Tfutama.mhHerbalClick(Sender: TObject);
var
   shHerbal : TForm;
begin
   shHerbal:=Tfhargaherbal.Create(nil);
   shHerbal.Show;
end;

procedure Tfutama.mpenggunaClick(Sender: TObject);
var
   spengguna : TForm;
begin
   spengguna:=Tfpengguna.Create(nil);
   spengguna.Show;
end;

procedure Tfutama.mmasukClick(Sender: TObject);
var
   smasuk : TForm;
begin
   smasuk:=tfmasuk.Create(nil);
   smasuk.ShowModal;
end;

procedure Tfutama.mpenjualanClick(Sender: TObject);
var
   spenjualan : TForm;
begin
   spenjualan:=Tfpenjualan.Create(nil);
   spenjualan.show;
end;


procedure Tfutama.mpembelianClick(Sender: TObject);
var
   spembelian : TForm;
begin
   spembelian:=Tfpembelian.Create(nil);
   spembelian.show;
end;

procedure Tfutama.FormActivate(Sender: TObject);
begin
sambungKeDatabase;
sambungkanGridKunjungan;
setTerapis(cterapis);
KeyPreview:=true;
batal(Self);
bsegarkan.Click;
if sbinfo.Panels[2].Text='' then
   mmasuk.click;
end;

procedure Tfutama.FormClose(Sender: TObject; var Action: TCloseAction);
Var
  keluar : integer;
begin
keluar:=MessageDlg('Anda yakin ini keluar dari program ?',mtConfirmation,[mbYes,mbNo],0);
if keluar=mrYes then
   Action:=caFree
else
   Action:=caNone;
end;


procedure Tfutama.sambungkanGridKunjungan;
begin
gridKunjungan.DataSource:=dm.dsKunjungan;
dm.dsKunjungan.DataSet:=dm.vtkunjungan;
dm.vtkunjungan.Active:=true;
ltotalAntrian.Caption:='0';
lmenunggu.Caption:='0';
end;

procedure Tfutama.btambahClick(Sender: TObject);
const
  kolKunjungan : array [0..7] of string = ('noRegistrasi','fk_noRekamMedis'
  ,'fk_pengguna','fk_terapis','tanggal','waktu','jenisKunjungan','status');
  kolRekamMedis : array [0..3] of string = ('fk_noRegistrasi','fk_noRekamMedis',
  'keluhanUtama','keluhanPenyerta');
  kolPeriksaFisik : array [0..3] of string = ('fk_noRegistrasi','fk_noRekamMedis',
  'tinggi_badan','berat_badan');

var
  dataKunjungan : array [0..7] of string;
  dataRekamMedis : array [0..3] of string;
  dataPeriksaFisik : array [0..3] of string;
  kodeRegistrasi,kodePengguna,kodeTerapis : String;
  updateKolom:array of string;
  insertKolom:array of string;
  strSQL:array of string;
  i,n:integer;
  aidi:string;

begin
if validateData and (kodeRM<>'')then
   begin
   kodeRegistrasi:=generateKodeKunjungan('KN','kunjungan');
   dataKunjungan[0]:=kodeRegistrasi;
   dataKunjungan[1]:=kodeRM;
   runKueri(openKueri('kode','data_petugas',' where nama='+QuotedStr(sbinfo.Panels[2].Text)));
   if dm.zkue.RecordCount>0 then
      kodePengguna:=dm.zkue.Fields[0].AsString;
   dataKunjungan[2]:=kodePengguna;
   runKueri(openKueri('kode','data_terapis',' where nama='+QuotedStr(cterapis.Text)));
   if dm.zkue.RecordCount>0 then
      kodeTerapis:=dm.zkue.Fields[0].AsString;
   dataKunjungan[3]:=kodeTerapis;
   dataKunjungan[4]:=FormatDateTime('yyyy/mm/dd',now);
   dataKunjungan[5]:=FormatDateTime('hh:mm:ss',now);
   dataKunjungan[6]:=ckunjungan.Text;
   dataKunjungan[7]:='Menunggu';

   dataRekamMedis[0]:=kodeRegistrasi;
   dataRekamMedis[1]:=kodeRM;
   dataRekamMedis[2]:=mkutama.text;
   dataRekamMedis[3]:=mkpenyerta.text;

   dataPeriksaFisik[0]:=kodeRegistrasi;
   dataPeriksaFisik[1]:=kodeRM;
   dataPeriksaFisik[2]:=etinggi.Text;
   dataPeriksaFisik[3]:=eberat.Text;

   if noRegistrasi='' then
         begin
         runKueri('update data_pasien set riwayat='+QuotedStr(mriwayat.Text)+' where id='+QuotedStr(id),false);
         runKueri(insertKueri(kolKunjungan,dataKunjungan,'kunjungan'),False);
         runKueri(insertKueri(kolRekamMedis,dataRekamMedis,'rekam_medis'),False);
         runKueri(insertKueri(kolPeriksaFisik,dataPeriksaFisik,'periksa_fisik'),False);

         with dm.vtkunjungan do
              begin
              append;
              FieldByName('No').AsString:=kodeRegistrasi;
              FieldByName('Nama Pasien').AsString:=enama.Text;
              FieldByName('Terapis').AsString:=cterapis.Text;
              FieldByName('Tanggal').AsString:=FormatDateTime('dd-mm-yyyy',now);
              FieldByName('Waktu').AsString:=FormatDateTime('hh:mm:ss',now);
              FieldByName('Status').AsString:='Menunggu';
              end;
         end
   else
         begin
           runKueri('update kunjungan set jenisKunjungan='+QuotedStr(ckunjungan.Text)
           +',fk_terapis='+QuotedStr(kodeTerapis)+' where noRegistrasi='+QuotedStr(noRegistrasi),false);
           runKueri('update rekam_medis set keluhanUtama='+QuotedStr(mkutama.Text)
           +',keluhanPenyerta='+QuotedStr(mkpenyerta.Text)+' where fk_noRegistrasi='+QuotedStr(noRegistrasi),false);
           runKueri('update periksa_fisik set berat_badan='+QuotedStr(eberat.Text)
           +',tinggi_badan='+QuotedStr(etinggi.Text)+' where fk_noRegistrasi='+QuotedStr(noRegistrasi),false);
           runKueri('update data_pasien set riwayat='+
           QuotedStr(mriwayat.Text)+' where kodeRM='+QuotedStr(id),false);
         end;
   bbatal.Click;
   end;
ckunjungan.SetFocus;
end;

procedure Tfutama.setTerapis(var cterapis: TComboBox);
var
  nama:string;
begin
cterapis.Text:=cterapis.Hint;
cterapis.Items.Add(cterapis.Hint);
cterapis.Items.BeginUpdate;
runKueri(openKueri('nama','data_terapis',''));
if dm.zkue.recordcount>0 then
   begin
   dm.zkue.First;
   while not(dm.zkue.Eof) do
        begin
        nama:=dm.zkue.Fields[0].AsString;
        cterapis.Items.Add(nama);
        dm.zkue.Next;
        end;
   end;
cterapis.Items.EndUpdate;
end;


procedure Tfutama.eberatChange(Sender: TObject);
begin
number(sender);
end;

procedure Tfutama.etinggiChange(Sender: TObject);
begin
number(sender);
end;

procedure Tfutama.ekodeChange(Sender: TObject);
var
  temp:string;
begin
CodeChar(sender);
runKueri(openKueri('id,nama,tanggalLahir,kodeRM','data_pasien',' where kode='+QuotedStr(TEdit(Sender).Text)));
if dm.zkue.RecordCount>0 then
      loadData
else
   begin
   temp:=ekode.Text;
   ekode.Text:=temp;
   ekode.SetFocus;
   ekode.SelStart:=Length(ekode.Text);
   end;
end;

function Tfutama.validateData: Boolean;
var
 cek:Boolean;
 j,i:Integer;

begin
cek:=True;
 for i:=0 to 10 do
     begin
     for j:=0 to ComponentCount-1 do
          begin
          if (Components[j] is TEdit) and (TEdit(Components[j]).TabOrder=i) and (TEdit(Components[j]).Enabled=true)then
              begin
              if (TEdit(Components[j]).Text=TEdit(Components[j]).Hint) then
                  Begin
                  sbinfo.Panels[1].Text:='Isian teks belum diisi ';
                  TEdit(Components[j]).SetFocus;
                  cek:=False;
                  Break;
                  end
              end;
          if (Components[j] is TComboBox) and (TComboBox(Components[j]).TabOrder=i) then
              begin
              if (TComboBox(Components[j]).Text=TComboBox(Components[j]).Hint) then
                  Begin
                  sbinfo.Panels[1].Text:='Anda belum memilih';
                  TComboBox(Components[j]).SetFocus;
                  cek:=False;
                  Break;
                  end;
              end;
          if (Components[j] is TMemo) and (TMemo(Components[j]).TabOrder=i) then
              begin
                if (TMemo(Components[j]).Text=TMemo(Components[j]).Hint) then
                  Begin
                  sbinfo.Panels[1].Text:='Isian teks belum diisi';
                  TMemo(Components[j]).SetFocus;
                  cek:=False;
                  Break;
                  end;
              end;
            end;
     
  if not(cek) then Break;
  end;
 Result:=cek;
end;


procedure Tfutama.loadData;
var
  nama,tanggalLahir,umur : String;
  tahunKelahiran:TDatetime;
  selisih:Word;
  i:integer;

begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    nama:=Fields[1].AsString;
    tanggalLahir:=Fields[2].AsString;
    kodeRM:=Fields[3].AsString;
    end;

tanggalLahir:=StringReplace(tanggalLahir,'-','/',[rfReplaceAll,rfIgnoreCase]);
tahunKelahiran:=StrToDate(tanggalLahir);
selisih:=YearsBetween(Now,tahunKelahiran);

enama.Text:=nama;
eumur.Text:=IntToStr(selisih);
ekode.SetFocus;
end;

procedure Tfutama.bbatalClick(Sender: TObject);
begin
batal(self);
id:='';
kodeRM:='';
noRegistrasi:='';
ckunjungan.SetFocus;
end;

procedure Tfutama.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   runKueri(openKueri('id,nama,tanggalLahir,kodeRM','data_pasien',' where kode='+QuotedStr(TEdit(Sender).Text)));
   if dm.zkue.RecordCount>0 then
      loadData
   else
       begin
       bersihkan; 
       temp:=ekode.Text;
       ekode.Text:=temp;
       ekode.SetFocus;
       ekode.SelStart:=Length(ekode.Text);
       end;
   end;
end;

procedure Tfutama.ekodeKeyPress(Sender: TObject; var Key: Char);
var
  baru:integer;
  sdpasien : TForm;

begin
if Key=#13 then
    begin
    baru:=MessageDlg('Data tidak ditemukan. Apakah anda ingin menambah data ?',mtConfirmation,[mbYes,mbNo],0);
    if baru=mrYes then
       begin
       sdpasien:=Tfpendaftaran.Create(nil);
       sdpasien.ShowModal;
       end;
    end;
end;


procedure Tfutama.gridKunjunganCellClick(Column: TColumn);
var
  strSQL:string;
  data : array [0..7] of string;
begin
if dm.vtkunjungan.RecordCount>0 then
   begin
   noRegistrasi:=dm.vtkunjungan.FieldValues['No'];
   strSQL:='SELECT k.jenisKunjungan,'+
                    'p.kode,'+
                    'p.riwayat,'+
                    'r.keluhanUtama,'+
                    'r.keluhanPenyerta,'+
                    'f.berat_badan,'+
                    'f.tinggi_badan,'+
                    't.nama '+
         'FROM kunjungan as k '+
         'LEFT JOIN data_pasien as p ON p.kodeRM=k.fk_noRekamMedis '+
         'LEFT JOIN rekam_medis as r ON r.fk_noRekamMedis=k.fk_noRekamMedis '+
         'LEFT JOIN Periksa_fisik as f ON f.fk_noRegistrasi=k.noRegistrasi '+
         'LEFT JOIN data_terapis as t ON t.kode=k.fk_terapis '+
         'WHERE k.noRegistrasi='+QuotedStr(noRegistrasi);
         
       runKueri(strSQL);
       if dm.zkue.RecordCount>0 then
         begin
         data[0]:=dm.zkue.Fields[0].AsString;
         data[1]:=dm.zkue.Fields[1].AsString;
         data[2]:=dm.zkue.Fields[2].AsString;
         data[3]:=dm.zkue.Fields[3].AsString;
         data[4]:=dm.zkue.Fields[4].AsString;
         data[5]:=dm.zkue.Fields[5].AsString;
         data[6]:=dm.zkue.Fields[6].AsString;
         data[7]:=dm.zkue.Fields[7].AsString;

         with dm.vtkunjungan do
              begin
               ckunjungan.Text:=data[0];
               ekode.Text:=data[1];
               mriwayat.Text:=data[2];
               mkutama.Text:=data[3];
               mkpenyerta.Text:=data[4];
               eberat.Text:=data[5];
               etinggi.Text:=data[6];
               cterapis.Text:=data[7];
              end;
          end;
   end;
end;

procedure Tfutama.bersihkan;
begin
noRegistrasi:='';
kodeRM:='';
id:='';
ckunjungan.Text:=ckunjungan.Hint;
enama.Clear;
eumur.Clear;
mkutama.Clear;
mkpenyerta.Clear;
mriwayat.Clear;
eberat.Clear;
etinggi.Clear;
end;

procedure Tfutama.bsegarkanClick(Sender: TObject);
var
  noRegistrasi,nmpasien,nmterapis,tanggal,waktu,status,temp:string;
  m,t:integer;

begin
m:=0;  t:=0;
dm.vtkunjungan.Clear;
temp:=FormatDateTime('yyyy/mm/dd',now);
runKueri(openKueri('k.noRegistrasi,k.tanggal,k.waktu,k.status,p.nama,t.nama',
'kunjungan as k LEFT JOIN data_pasien as p ON k.fk_noRekamMedis=p.kodeRM LEFT JOIN data_terapis as t ON k.fk_terapis=t.kode',
' where k.tanggal='+QuotedStr(temp)+' order by k.waktu asc'));

if dm.zkue.RecordCount>0 then
   begin
   dm.zkue.First;
   while not(dm.zkue.Eof) do
        begin
        noRegistrasi:=dm.zkue.Fields[0].AsString;
        tanggal:=dm.zkue.Fields[1].AsString;
        waktu:=dm.zkue.Fields[2].AsString;
        status:=dm.zkue.Fields[3].AsString;
        nmpasien:=dm.zkue.Fields[4].AsString;
        nmterapis:=dm.zkue.Fields[5].AsString;

        with dm.vtkunjungan do
             begin
             append;
             FieldByName('No').AsString:=noRegistrasi;
             FieldByName('Nama Pasien').AsString:=nmpasien;
             FieldByName('Terapis').AsString:=nmterapis;
             FieldByName('Tanggal').AsString:=tanggal;
             FieldByName('Waktu').AsString:=waktu;
             FieldByName('Status').AsString:=status;
             end;
        dm.zkue.Next;
        inc(t);
        if status='Menunggu' then
           inc(m);
        end;
  ltotalAntrian.Caption:=IntToStr(t);
  lmenunggu.Caption:=IntToStr(m); 
  end;
end;

procedure Tfutama.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin 
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;



end.
