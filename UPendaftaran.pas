unit UPendaftaran;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls, ExtCtrls,FormScript, DatabaseScript;

type
  Tfpendaftaran = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Label11: TLabel;
    Label13: TLabel;
    Label15: TLabel;
    Label16: TLabel;
    ekode: TEdit;
    enama: TEdit;
    edesa: TEdit;
    ekecamatan: TEdit;
    ekabupaten: TEdit;
    etelepon: TEdit;
    cagama: TComboBox;
    cperkawinan: TComboBox;
    cpendidikan: TComboBox;
    cpekerjaan: TComboBox;
    malamat: TMemo;
    ert: TEdit;
    erw: TEdit;
    rgKelamin: TRadioGroup;
    bsimpan: TButton;
    bbatal: TButton;
    sbinfo: TStatusBar;
    rgKewarganegaraan: TRadioGroup;
    Label12: TLabel;
    etempatLahir: TEdit;
    Label14: TLabel;
    ctanggal: TComboBox;
    cbulan: TComboBox;
    ctahun: TComboBox;
    procedure bsimpanClick(Sender: TObject);
    procedure ertChange(Sender: TObject);
    procedure enamaChange(Sender: TObject);
    procedure ekodeChange(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ctanggalKeyPress(Sender: TObject; var Key: Char);
    procedure eteleponChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function validateData:Boolean;

  public
    procedure loadData;


  end;

var
  fpendaftaran: Tfpendaftaran;
  id:String;


implementation

uses UDataModule, ZAbstractRODataset, DB;

{$R *.dfm}


procedure Tfpendaftaran.bsimpanClick(Sender: TObject);
const
  kolom:array [0..18] of string = ('kode','nama','tempatLahir','tanggalLahir',
  'kelamin','alamat','RT','RW','desa','kecamatan','kabupaten','agama','perkawinan',
  'pendidikan','pekerjaan','kewarganegaraan','telepon','tanggalDaftar','kodeRM');
  kelamin:array [0..1] of string = ('Pria','Wanita');
  warga:array [0..1] of string = ('WNI','WNA');

var
  data : array [0..18] of string;
  updateKolom:array of string;
  insertKolom:array of string;
  i:integer;

begin
if validateKode(id,'PN',ekode.Text,'data_pasien',sbinfo,ekode) and validateData then
   begin
    data[0]:=ekode.Text;
    data[1]:=enama.Text;
    data[2]:=etempatLahir.Text;
    data[3]:=ctahun.Text+'/'+cbulan.Text+'/'+ctanggal.Text;
    data[4]:=kelamin[rgKelamin.ItemIndex];
    data[5]:=malamat.Text;
    data[6]:=ert.Text;
    data[7]:=erw.Text;
    data[8]:=edesa.Text;
    data[9]:=ekecamatan.Text;
    data[10]:=ekabupaten.Text;
    data[11]:=cagama.Text;
    data[12]:=cperkawinan.Text;
    data[13]:=cpendidikan.Text;
    data[14]:=cpekerjaan.Text;
    data[15]:=warga[rgKewarganegaraan.ItemIndex];
    data[16]:=etelepon.Text;
    data[17]:=FormatDateTime('dd-mm-yyyy',now);
    data[18]:='RM'+copy(ekode.Text,3,3);

    if id='' then
         begin
           SetLength(insertKolom,19);
           for i:=0 to 18 do
                insertKolom[i]:=kolom[i];
           runKueri(insertKueri(insertKolom,data,'data_pasien'),False);
           sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah ditambahkan';
         end
      else
          begin
            SetLength(updateKolom,18);
            for i:=1 to 17 do
                 updateKolom[i]:=kolom[i];
            runKueri(updateKueri(updateKolom,Data,'data_pasien',id),False);
            sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah disunting';
          end;
    bbatal.Click;
   end;
end;


procedure Tfpendaftaran.loadData;
var
  kode,nama,tempatLahir,kelamin,alamat,rt,rw,desa,kecamatan,kabupaten,
  agama,perkawinan,pendidikan,pekerjaan,warga,telepon:String;
  tanggalLahir:TDateTime;
  tanggal,bulan,tahun:word;

begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    kode:=Fields[1].AsString;
    nama:=Fields[2].AsString;
    tempatLahir:=Fields[3].AsString;
    tanggalLahir:=Fields[4].asDateTime;
    kelamin:=Fields[5].AsString;
    alamat:=Fields[6].AsString;
    rt:=Fields[7].AsString;
    rw:=Fields[8].AsString;
    desa:=Fields[9].AsString;
    kecamatan:=Fields[10].AsString;
    kabupaten:=Fields[11].AsString;
    agama:=Fields[12].AsString;
    perkawinan:=Fields[13].AsString;
    pendidikan:=Fields[14].AsString;
    pekerjaan:=Fields[15].AsString;
    warga:=Fields[16].AsString;
    telepon:=Fields[17].AsString;
    end;

ekode.Text:=kode;
enama.Text:=nama;
etempatLahir.Text:=tempatLahir;
decodeDate(tanggalLahir,tahun,bulan,tanggal);
ctanggal.Text:=IntToStr(tanggal);
cbulan.Text:=IntToStr(bulan);
ctahun.Text:=IntToStr(tahun);
if kelamin='Pria' then
   rgKelamin.ItemIndex:=0
else if kelamin='Wanita' then
        rgKelamin.ItemIndex:=1;
malamat.Text:=alamat;
ert.Text:=rt;
erw.Text:=rw;
edesa.Text:=desa;
ekecamatan.Text:=kecamatan;
ekabupaten.Text:=kabupaten;
cagama.Text:=agama;
cperkawinan.Text:=perkawinan;
cpendidikan.Text:=pendidikan;
cpekerjaan.Text:=pekerjaan;
if warga='WNI' then
     rgKewarganegaraan.ItemIndex:=0
else if warga='WNA' then
        rgKewarganegaraan.ItemIndex:=1;
etelepon.Text:=telepon;
ekode.SetFocus;
end;

procedure Tfpendaftaran.enamaChange(Sender: TObject);
Const AllowedStr = ['a'..'z','A'..'Z','0'..'9',',','.',' ','-','/','(',')',#39];
var i: Integer;
begin
for I := 1 to Length(TEdit(Sender).Text) do
  begin
  if not(TEdit(Sender).Text[I] in Allowedstr) then
    begin
    TEdit(Sender).Undo;
    Exit;
    end;
  end;
TEdit(Sender).ClearUndo;
TEdit(Sender).SelStart:=Length(TEdit(Sender).Text);

if TEdit(sender).Color=clred then
   TEdit(sender).Color:=clWindow;
end;

procedure Tfpendaftaran.ekodeChange(Sender: TObject);
begin
CodeChar(sender);
runKueri(openKueri('*','data_pasien',' where kode='+QuotedStr(TEdit(Sender).Text)));
if dm.zkue.RecordCount>0 then
      loadData
else
   id:='';
end;


procedure Tfpendaftaran.ertChange(Sender: TObject);
Const AllowedStr = ['0'..'9',' ','+'];
var I: Integer;
begin
for i := 1 to Length(TEdit(Sender).Text) do
  begin
  if not(TEdit(Sender).Text[I] in Allowedstr) then
    begin
     TEdit(Sender).Undo;
     Exit;
    end;
  end;
TEdit(Sender).ClearUndo;
TEdit(Sender).SelStart:=Length(TEdit(Sender).Text);
end;
   

procedure Tfpendaftaran.bbatalClick(Sender: TObject);
begin
  batal(Self,id);
  ekode.Text:=generateKode('PN','data_pasien');
  enama.SetFocus;
end;

procedure Tfpendaftaran.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
setTanggal(ctanggal,cbulan,ctahun);
setAgama(cagama);
bbatal.Click;
end;

procedure Tfpendaftaran.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   runKueri(openKueri('*','data_pasien',' where kode='+QuotedStr(TEdit(Sender).Text)));
   if dm.zkue.RecordCount>0 then
          loadData
   else
       begin
       id:='';
       temp:=ekode.Text;
       batal(Self,id);
       ekode.Text:=temp;
       ekode.SetFocus;
       ekode.SelStart:=Length(ekode.Text);
       end;
   end;
end;

procedure Tfpendaftaran.ctanggalKeyPress(Sender: TObject; var Key: Char);
begin
key:=#00;
end;

function Tfpendaftaran.validateData: Boolean;
var
 cek:Boolean;
 j,i:Integer;

begin
cek:=True;
 for i:=1 to 19 do
     begin
     for j:=0 to ComponentCount-1 do
          begin
          if (Components[j] is TEdit) and (TEdit(Components[j]).TabOrder=i) then
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
          if (Components[j] is TRadioGroup) and (TRadioGroup(Components[j]).TabOrder=i) then
              begin
                if (TRadioGroup(Components[j]).ItemIndex=-1) then
                    begin
                    sbinfo.Panels[1].Text:='Anda belum menceklis pilihan';
                    cek:=false;
                    Break;
                    TRadioButton(Components[j]).SetFocus;
                    end;
            end;
          end;
  if not(cek) then Break;
  end;
 Result:=cek;
end;

procedure Tfpendaftaran.eteleponChange(Sender: TObject);
begin
phoneNumber(sender);
end;

procedure Tfpendaftaran.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin  
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;

end.
