unit UPengguna;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  Tfpengguna = class(TForm)
    Label1: TLabel;
    BuatAkun: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    csebagai: TComboBox;
    ekode: TEdit;
    enama: TEdit;
    esandi: TEdit;
    bsimpan: TButton;
    bhapus: TButton;
    bbatal: TButton;
    sbinfo: TStatusBar;
    procedure BuatAkunClick(Sender: TObject);
    procedure bbatalClick(Sender: TObject);
    procedure ekodeChange(Sender: TObject);
    procedure ekodeKeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure bsimpanClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure bhapusClick(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    function validateKode:Boolean;
    function validateData:Boolean;
    procedure loadData;

  public
    { Public declarations }
  end;

var
  fpengguna: Tfpengguna;
  id:string;

implementation

uses UDataPetugas, UDataModule, DatabaseScript, FormScript, UDataHerbal;

{$R *.dfm}

procedure Tfpengguna.BuatAkunClick(Sender: TObject);
var
   sdpetugas : TForm;
begin
   sdpetugas:=Tfpetugas.Create(nil);
   sdpetugas.ShowModal;
end;

procedure Tfpengguna.bbatalClick(Sender: TObject);
begin
batal(Self,id);
ekode.SetFocus;
end;

procedure Tfpengguna.ekodeChange(Sender: TObject);
var
  tabel,kode:string;

begin
CodeChar(sender);
kode:=copy(TEdit(Sender).Text,1,2);
if kode='PS' then
   tabel:='data_petugas'
else if kode='TS' then
      tabel:='data_terapis'
else
      tabel:='';
if tabel<>'' then
   begin
   runKueri(openKueri('b.id,a.kode,b.nama,b.sandi,b.sebagai',
   tabel+' as a left join data_pengguna as b ',
   'on a.kode=b.fk_kode where a.kode='+QuotedStr(TEdit(Sender).Text)));

   if dm.zkue.RecordCount>0 then
       begin
       if dm.zkue.Fields[0].AsString<>'' then
           loadData
       else
           id:='';
       end
    else
       id:='';
   end;        
end;

procedure Tfpengguna.loadData;
var
  nama,sandi,sebagai:String;

begin
with dm.zkue do
    begin
    id:=Fields[0].AsString;
    nama:=Fields[2].AsString;
    sandi:=Fields[3].AsString;
    sebagai:=Fields[4].AsString;
    end;

enama.Text:=nama;
esandi.Text:=sandi;
csebagai.Text:=sebagai;
ekode.SetFocus;
end;

function Tfpengguna.validateData: Boolean;
var
 cek:Boolean;
 j,i:Integer;

begin
cek:=True;
 for i:=1 to 4 do
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
            end;
  if not(cek) then Break;
  end;
 Result:=cek;
end;

procedure Tfpengguna.ekodeKeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
var
  temp,kode,tabel : string;

begin
if (Key=VK_delete) or (Key=VK_BACK) then
   begin
   kode:=copy(TEdit(Sender).Text,1,2);
    if kode='PS' then
       tabel:='data_petugas'
    else if kode='TS' then
          tabel:='data_terapis'
    else
        tabel:='data_petugas';

   runKueri(openKueri('b.id,a.kode,b.nama,b.sandi,b.sebagai',
   tabel+' as a left join data_pengguna as b ',
   'on a.kode=b.fk_kode where a.kode='+QuotedStr(TEdit(Sender).Text)));
     if dm.zkue.RecordCount>0 then
        begin
        if dm.zkue.Fields[0].AsString<>'' then
            loadData
        else
            id:='';
        end
     else
        begin
        id:='';
        tabel:='';
        temp:=ekode.Text;
        batal(Self,id);
        ekode.Text:=temp;
        ekode.SetFocus;
        ekode.SelStart:=Length(ekode.Text);
        end;
   end;
end;

procedure Tfpengguna.bsimpanClick(Sender: TObject);
const
  kolom:array [0..3] of string = ('fk_kode','nama','sandi','sebagai');

var
  data : array [0..3] of string;
  updateKolom:array of string;
  insertKolom:array of string;
  i:integer;

begin
if validateKode and validateData then
   begin
    data[0]:=ekode.Text;
    data[1]:=enama.Text;
    data[2]:=esandi.Text;
    data[3]:=csebagai.Text;

    if id='' then
         begin
           SetLength(insertKolom,4);
           for i:=0 to 3 do
                insertKolom[i]:=kolom[i];
           runKueri(insertKueri(insertKolom,data,'data_pengguna'),False);
           sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah ditambahkan';
         end
      else
          begin
            SetLength(updateKolom,4);
            for i:=1 to 3 do
                 updateKolom[i]:=kolom[i];
            runKueri(updateKueri(updateKolom,Data,'data_pengguna',id),False);
            sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah disunting';
          end;
    bbatal.Click;
   end;
end;

procedure Tfpengguna.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
bbatal.Click;
end;

procedure Tfpengguna.bhapusClick(Sender: TObject);
var
  deleted:integer;
begin
if id<>'' then
  begin
  deleted:=MessageDlg('Anda yakin ingin menghapus data ?',mtConfirmation,[mbyes,mbNo],0);
  if deleted=mrYes then
     begin
      runKueri(deleteKueri('pengguna',id),false);
      sbinfo.Panels[1].Text:='Data '+ekode.Text+' telah dihapus';
      bbatal.Click;
     end;
  end;   
end;

function Tfpengguna.validateKode: Boolean;
var
  tabel,angka,kode:string;
  n,i:Integer;
  cek:Boolean;

begin
cek:=true;
n:=Length(ekode.Text);
kode:=Copy(ekode.Text,1,2);
angka:=Copy(ekode.Text,3,n-2);

if ((Copy(kode,1,1)<>'P') or (Copy(kode,1,1)<>'T')) and (Copy(kode,2,1)<>'S') then
    begin
    sbinfo.Panels[1].Text:='Format kode salah, 2 digit pertama salah';
    cek:=False;
    end
else if not(TryStrToInt(angka,i)) then
      begin
      sbinfo.Panels[1].Text:='Format kode salah, digit setelah '+kode+' seharusnya angka';
      ekode.SetFocus;
      ekode.SelStart:=Length(ekode.Text);
      cek:=False;
      end
else
    begin
    if kode='TS' then
       tabel:='data_terapis'
    else if kode='PS' then
        tabel:='data_petugas';

    runKueri(openKueri('*',tabel,' where kode='+QuotedStr(ekode.Text)));
    if dm.zkue.RecordCount=0 then
       begin
       sbinfo.Panels[1].Text:='Kode '+ekode.Text+' belum terdaftar, silahkan buat akun';
       cek:=False;
       end;
    end;      
Result:=cek;
end;

procedure Tfpengguna.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin
   if key=#27 then
      Self.Close;
   key:=#0;
   end;
end;

end.
