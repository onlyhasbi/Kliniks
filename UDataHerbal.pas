unit UDataHerbal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, StdCtrls;

type
  Tfherbal = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    ekode: TEdit;
    enama: TEdit;
    emerek: TEdit;
    eisi: TEdit;
    mdeskripsi: TMemo;
    ctanggal: TComboBox;
    cbulan: TComboBox;
    ctahun: TComboBox;
    csatuan: TComboBox;
    bsimpan: TButton;
    bbatal: TButton;
    sbinfo: TStatusBar;
    procedure FormActivate(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure ekodeChange(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
    function validateKode : Boolean;
    function validateData:Boolean;

  public
    procedure loadData;
    procedure setJual(bool:boolean;kode:string);
    function getJual:boolean;
    
  end;

var
  fherbal: Tfherbal;
  id, kHerbal : string;
  jual : boolean;
           

implementation

uses DatabaseScript, FormScript, UDataModule, UPenjualan;

{$R *.dfm}

procedure Tfherbal.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
setKadaluarsa(ctanggal,cbulan,ctahun);
bbatal.Click;

if getJual then
   begin
   ekode.Text:=kHerbal;
   setJual(false,'');
   end;
end;

procedure Tfherbal.bbatalClick(Sender: TObject);
begin
  batal(Self,id);
  ekode.SetFocus;
end;

procedure Tfherbal.bsimpanClick(Sender: TObject);
const
  kolom:array [0..6] of string = ('kode','nama','kadaluarsa','merek',
  'isi','satuan','deskripsi');

var
  data : array [0..6] of string;
  updateKolom:array of string;
  insertKolom:array of string;
  i:integer;

begin
if validateKode and validateData then
   begin
    data[0]:=ekode.Text;
    data[1]:=enama.Text;
    data[2]:=ctahun.Text+'/'+cbulan.Text+'/'+ctanggal.Text;
    data[3]:=emerek.Text;
    data[4]:=eisi.Text;
    data[5]:=csatuan.Text;
    data[6]:=mdeskripsi.Text;

    if id='' then
         begin
           SetLength(insertKolom,7);
           for i:=0 to 6 do
                insertKolom[i]:=kolom[i];
           runKueri(insertKueri(insertKolom,data,'data_herbal'),False);
           sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah ditambahkan';
         end
      else
          begin
            SetLength(updateKolom,7);
            for i:=1 to 6 do
                 updateKolom[i]:=kolom[i];
            runKueri(updateKueri(updateKolom,Data,'data_herbal',id),False);
            sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah disunting';
          end;
    bbatal.Click;
   end;
end;

procedure Tfherbal.ekodeChange(Sender: TObject);
begin
CodeChar(sender);
runKueri(openKueri('*','data_herbal',' where kode='+QuotedStr(TEdit(Sender).Text)));
if dm.zkue.RecordCount>0 then
      loadData
else
   id:='';
end;



procedure Tfherbal.loadData;
var
  kode,nama,merek,isi,satuan,deskripsi:String;
  tanggal,bulan,tahun:word;
  kadaluarsa:TDateTime;
begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    kode:=Fields[1].AsString;
    nama:=Fields[2].AsString;
    kadaluarsa:=Fields[3].AsDateTime;
    merek:=Fields[4].AsString;
    isi:=Fields[5].AsString;
    satuan:=Fields[6].AsString;
    deskripsi:=Fields[7].AsString;
    end;

ekode.Text:=kode;
enama.Text:=nama;

decodeDate(kadaluarsa,tahun,bulan,tanggal);
ctanggal.Text:=IntToStr(tanggal);
cbulan.Text:=IntToStr(bulan);
ctahun.Text:=IntToStr(tahun);

emerek.Text:=merek;
eisi.Text:=isi;
csatuan.Text:=satuan;
mdeskripsi.Text:=deskripsi;
ekode.SetFocus;
end;

function Tfherbal.validateKode: Boolean;
begin
runKueri(openKueri('kode','data_herbal',' where kode='+QuotedStr(ekode.Text)));
if dm.zkue.RecordCount<=1 then
   Result:=True
else
   begin
   sbinfo.Panels[1].Text:='Maaf, kode yang anda masukkan duplikat';
   Result:=False;
   end;

end;

function Tfherbal.validateData: Boolean;
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
          end;
  if not(cek) then Break;
  end;
Result:=cek;
end;

procedure Tfherbal.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   runKueri(openKueri('*','data_herbal',' where kode='+QuotedStr(TEdit(Sender).Text)));
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

procedure Tfherbal.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin          
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;


function Tfherbal.getJual: boolean;
begin
result:=jual;
end;

procedure Tfherbal.setJual(bool: boolean; kode:string);
begin
jual:=bool;
kHerbal:=kode;
end;

end.
