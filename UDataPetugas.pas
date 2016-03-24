unit UDataPetugas;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, ComCtrls;

type
  Tfpetugas = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    ekode: TEdit;
    enama: TEdit;
    etempatLahir: TEdit;
    etelepon: TEdit;
    ctanggal: TComboBox;
    cbulan: TComboBox;
    ctahun: TComboBox;
    cagama: TComboBox;
    malamat: TMemo;
    bsimpan: TButton;
    bbatal: TButton;
    sbinfo: TStatusBar;
    rgKelamin: TRadioGroup;
    procedure FormActivate(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure ctanggalKeyPress(Sender: TObject; var Key: Char);
    procedure eteleponChange(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ekodeChange(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function validateData:Boolean;
    procedure loadData;

  public
    { Public declarations }
  end;

var
  fpetugas: Tfpetugas;
  id:String;

implementation

uses DatabaseScript, FormScript, UDataModule, DB;

{$R *.dfm}

procedure Tfpetugas.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
setTanggal(ctanggal,cbulan,ctahun);
setAgama(cagama);
bbatal.Click;
end;

procedure Tfpetugas.bbatalClick(Sender: TObject);
begin
batal(Self,id);
ekode.Text:=generateKode('PS','data_petugas');
enama.SetFocus;
end;

procedure Tfpetugas.bsimpanClick(Sender: TObject);
const
  kolom:array [0..8] of string = ('kode','nama','tempatLahir','tanggalLahir',
  'kelamin','agama','alamat','telepon','tanggalDaftar');
  kelamin:array [0..1] of string = ('Pria','Wanita');
  
var
  data : array [0..8] of string;
  updateKolom:array of string;
  insertKolom:array of string;
  i:integer;

begin
  if validateKode(id,'PS',ekode.Text,'data_petugas',sbinfo,ekode) and validateData then
   begin
    data[0]:=ekode.Text;
    data[1]:=enama.Text;
    data[2]:=etempatLahir.Text;
    data[3]:=ctahun.Text+'/'+cbulan.Text+'/'+ctanggal.Text;
    data[4]:=kelamin[rgKelamin.ItemIndex];
    data[6]:=cagama.Text;
    data[5]:=malamat.Text;
    data[7]:=etelepon.Text;
    data[8]:=FormatDateTime('dd-mm-yyyy',now);

    if id='' then
         begin
           SetLength(insertKolom,9);
           for i:=0 to 8 do
                insertKolom[i]:=kolom[i];
           runKueri(insertKueri(insertKolom,data,'data_petugas'),False);
           sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah ditambahkan';
         end
      else
          begin
            SetLength(updateKolom,8);
            for i:=1 to 7 do
                 updateKolom[i]:=kolom[i];
            runKueri(updateKueri(updateKolom,Data,'data_petugas',id),False);
            sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah disunting';
          end;
    bbatal.Click;
   end;
end;

function Tfpetugas.validateData: Boolean;
var
 cek:Boolean;
 j,i:Integer;

begin
cek:=True;
 for i:=1 to 9 do
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

procedure Tfpetugas.ctanggalKeyPress(Sender: TObject; var Key: Char);
begin
key:=#00;
end;

procedure Tfpetugas.eteleponChange(Sender: TObject);
begin
  phoneNumber(sender);
end;

procedure Tfpetugas.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   runKueri(openKueri('*','data_petugas',' where kode='+QuotedStr(TEdit(Sender).Text)));
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

procedure Tfpetugas.ekodeChange(Sender: TObject);
begin
CodeChar(sender);
runKueri(openKueri('*','data_petugas',' where kode='+QuotedStr(TEdit(Sender).Text)));
if dm.zkue.RecordCount>0 then
      loadData
else
   id:='';
end;

procedure Tfpetugas.loadData;
var
  kode,nama,tempatLahir,kelamin,agama,alamat,telepon:String;
  tanggalLahir:TDateTime;
  tanggal,bulan,tahun : word;
begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    kode:=Fields[1].AsString;
    nama:=Fields[2].AsString;
    tempatLahir:=Fields[3].AsString;
    tanggalLahir:=Fields[4].AsDateTime;
    kelamin:=Fields[5].AsString;
    agama:=Fields[6].AsString;
    alamat:=Fields[7].AsString;
    telepon:=Fields[8].AsString;
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
cagama.Text:=agama;
malamat.Text:=alamat;
etelepon.Text:=telepon;
ekode.SetFocus;
end;

procedure Tfpetugas.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin   
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;

end.
