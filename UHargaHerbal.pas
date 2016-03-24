unit UHargaHerbal;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  Tfhargaherbal = class(TForm)
    sbinfo: TStatusBar;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    ekode: TEdit;
    enama: TEdit;
    ejumlah: TEdit;
    ehargabeli: TEdit;
    ehargajual: TEdit;
    bsimpan: TButton;
    bbatal: TButton;
    Label6: TLabel;
    ediskon: TEdit;
    procedure bbatalClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bsimpanClick(Sender: TObject);
    procedure ehargajualChange(Sender: TObject);
    procedure ehargabeliChange(Sender: TObject);
    procedure ejumlahChange(Sender: TObject);
    procedure ekodeChange(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure ekodeKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function validateData:Boolean;

  public
    procedure loadData;
    procedure setJual(bool:boolean; kode:string);
    function getJual:boolean;
    
  end;

var
  fhargaherbal: Tfhargaherbal;
  kodeTrans,kHerbal : String;
  jual:boolean;


implementation

uses DatabaseScript, FormScript, UDataHerbal, UDataModule, DB, UPenjualan;

{$R *.dfm}

procedure Tfhargaherbal.bbatalClick(Sender: TObject);
begin
  batal(Self,id);
  ekode.SetFocus;
end;

procedure Tfhargaherbal.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
bbatal.Click;

if getJual then
   begin
   ekode.Text:=kHerbal;
   setJual(false,'');
   end;
end;

procedure Tfhargaherbal.bsimpanClick(Sender: TObject);
const
  kolom:array [0..4] of string = ('fk_herbal','jumlah','hargabeli','hargajual','diskon');

var
  data : array [0..4] of string;
  updateKolom:array of string;
  insertKolom:array of string;
  i:integer;
begin
if validateData then
   begin
    data[0]:=ekode.Text;
    data[1]:=ejumlah.Text;
    data[2]:=ehargabeli.Text;
    data[3]:=ehargajual.Text;
    data[4]:=ediskon.Text;

    if id='' then
         begin
           SetLength(insertKolom,5);
           for i:=0 to 4 do
                insertKolom[i]:=kolom[i];
           runKueri(insertKueri(insertKolom,data,'data_herbal_setelan'),False);
           sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah ditambahkan';
         end
      else
          begin
            SetLength(updateKolom,5);
            for i:=1 to 4 do
                 updateKolom[i]:=kolom[i];
            runKueri(updateKueri(updateKolom,Data,'data_herbal_setelan',id),False);
            sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah disunting';
          end;
    bbatal.Click;
   end;
end;

function Tfhargaherbal.validateData: Boolean;
var
 cek:Boolean;
 j,i:Integer;

begin
cek:=True;
 for i:=1 to 6 do
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
            end;
  if not(cek) then Break;
  end;
 Result:=cek;
end;

procedure Tfhargaherbal.ehargajualChange(Sender: TObject);
begin
moneyNumber(sender);
end;

procedure Tfhargaherbal.ehargabeliChange(Sender: TObject);
begin
moneyNumber(sender);
end;

procedure Tfhargaherbal.ejumlahChange(Sender: TObject);
begin
number(sender);
end;

procedure Tfhargaherbal.ekodeChange(Sender: TObject);
begin
CodeChar(sender);
runKueri(openKueri('b.id,a.nama,b.jumlah,b.hargabeli,b.hargajual,b.diskon',
'data_herbal as a left join data_herbal_setelan as b',
' on a.kode=b.fk_herbal where a.kode='+QuotedStr(TEdit(Sender).Text)));
if dm.zkue.RecordCount>0 then
   begin
   if dm.zkue.Fields[0].AsString<>'' then
       loadData
   else
       begin
       id:='';
       enama.Text:=dm.zkue.Fields[1].AsString;
       end;
   end
else
   id:='';
end;

procedure Tfhargaherbal.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   runKueri(openKueri('b.id,a.nama,b.jumlah,b.hargabeli,b.hargajual,b.diskon',
   'data_herbal as a left join data_herbal_setelan as b',
   ' on a.kode=b.fk_herbal where a.kode='+QuotedStr(TEdit(Sender).Text)));
   if dm.zkue.RecordCount>0 then
      begin
      if dm.zkue.Fields[0].AsString<>'' then
          loadData
      else
          begin
          id:='';
          enama.Text:=dm.zkue.Fields[1].AsString;
          end;
       end
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

procedure Tfhargaherbal.loadData;
var
  nama,jumlah,hargabeli,hargajual,diskon:String;

begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    nama:=Fields[1].AsString;
    jumlah:=Fields[2].AsString;
    hargabeli:=Fields[3].AsString;
    hargajual:=Fields[4].AsString;
    diskon:=Fields[5].AsString;
    end;

enama.Text:=nama;
ejumlah.Text:=jumlah;
ehargabeli.Text:=hargabeli;
ehargajual.Text:=hargajual;
ediskon.Text:=diskon;
ekode.SetFocus;
end;

procedure Tfhargaherbal.ekodeKeyPress(Sender: TObject; var Key: Char);
begin
if key=#13 then
   key:=#0;
end;

procedure Tfhargaherbal.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin   
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;



function Tfhargaherbal.getJual: boolean;
begin
result:=jual;
end;

procedure Tfhargaherbal.setJual(bool:boolean; kode:string);
begin
jual:=bool;
kHerbal:=kode;
end;

end.
