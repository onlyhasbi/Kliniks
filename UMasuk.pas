unit UMasuk;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ComCtrls;

type
  Tfmasuk = class(TForm)
    Label1: TLabel;
    Label2: TLabel;
    enama: TEdit;
    esandi: TEdit;
    bmasuk: TButton;
    sbinfo: TStatusBar;
    procedure bmasukClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure enamaKeyPress(Sender: TObject; var Key: Char);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }

  public
    { Public declarations }
  end;

var
  fmasuk: Tfmasuk;

implementation

uses DatabaseScript, FormScript, UDataModule, Uutama, DB;

{$R *.dfm}


procedure Tfmasuk.bmasukClick(Sender: TObject);
var
  fk_kode,sandi:string;
begin
runKueri(openKueri('*','data_pengguna',' where nama='+QuotedStr(enama.Text)));
if dm.zkue.RecordCount>0 then
   begin
   fk_kode:=dm.zkue.Fields[1].AsString;
   if copy(fk_kode,1,2)='PS' then
      begin
       sandi:=dm.zkue.Fields[3].AsString;
       if sandi=esandi.Text then
           begin
           runKueri(openKueri('nama','data_petugas',' where kode='+QuotedStr(fk_kode)));
           with futama do
              begin
              sbinfo.Panels[2].Text:=dm.zkue.Fields[0].AsString;
              Self.Close;
              end;
           end
       else
            sbinfo.Panels[0].Text:='Nama Pengguna dan Katasandi  Salah';
      end
   else
       begin
       sbinfo.Panels[0].Text:='Nama Pengguna dan Katasandi  Salah';
       enama.SetFocus;
       end;
  end
else
  sbinfo.Panels[0].Text:='Nama Pengguna dan Katasandi  Salah';
end;

procedure Tfmasuk.FormActivate(Sender: TObject);
begin
KeyPreview:=true;
batal(Self);
end;

procedure Tfmasuk.enamaKeyPress(Sender: TObject; var Key: Char);
begin
controlA(sender,key); 
end;

procedure Tfmasuk.FormKeyPress(Sender: TObject; var Key: Char);
begin
if (key=#13) or (key=#27) then
   begin 
   if key=#27 then
      Self.Close;
   if key=#13 then
      bmasuk.Click;
   key:=#0;
   end;
end;

end.
