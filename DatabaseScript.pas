unit DatabaseScript;

interface
uses UDataModule,Dialogs,Forms,SysUtils, FormScript;

procedure sambungKeDatabase;
function openKueri(kolom:string;tabel:String;xsearch:String):String;
function insertKueri(kol:array of string;var data:array of string;tabel:string):String;
function updateKueri(kol:array of string;var data:array of string;tabel:string;id:String):String;
function deleteKueri(tabel:string;id:String):String;
procedure runKueri(strSQL:string;OpenIt:boolean=true);

implementation


procedure sambungKeDatabase;
begin
  with dm.zkon do
  begin
    HostName:='localhost';
    database:='klinik';
    protocol:='mysql';
    Port:=3306;
    LibraryLocation:='libmysql.dll';
    User:='root';
    Password:='';
    Connect;
  end;
dm.zkue.Connection:=dm.zkon;
end;

function openKueri(kolom:string;tabel:String;xsearch:String):String;
begin
  Result:='select '+kolom+' from '+tabel+xsearch;
end;


function insertKueri(kol:array of string;var data:array of string;tabel:string):String;
var
  i:integer;
  kolom,dataInsert:string;
begin
with dm.zkue do
    begin
    close;
    SQL.Clear;
    for i:=0 to Length(data)-1 do
        begin
        kolom:=kolom+kol[i];
        dataInsert:=dataInsert+QuotedStr(data[i]);
        if i<=Length(data)-2 then
             begin
             kolom:=kolom+',';
             dataInsert:=dataInsert+',';
             end;
        end;
    ShowMessage('insert into '+tabel+'('+kolom+') values ('+dataInsert+')');
    Result:='insert into '+tabel+'('+kolom+') values ('+dataInsert+')';
    end;
cleanArr(data);
end;


function updateKueri(kol:array of string;var data:array of string;tabel:string;id:String):String;
var
  i:integer;
  dataUpdate:string;
begin
with dm.zkue do
    begin
      close;
      SQL.Clear;
      for i:=0 to Length(kol)-1 do
          begin
          if i=0 then Continue
             else
                begin
                dataUpdate:=dataUpdate+kol[i]+'='+QuotedStr(Data[i]);
                if i<=Length(kol)-2 then
                    dataUpdate:=dataUpdate+',';
                end;
          end;
    ShowMessage('update '+tabel+' set '+dataUpdate+' where id='+QuotedStr(id));
    Result:='update '+tabel+' set '+dataUpdate+' where id='+QuotedStr(id);
    end;
cleanArr(data);
end;

function deleteKueri(tabel:string;id:String):String;
begin
  result:='Delete from '+tabel+' where id='+QuotedStr(id);
end;


procedure runKueri(strSQL: string; OpenIt: boolean);
begin
if not dm.ZKon.InTransaction then
       dm.ZKon.StartTransaction;
try
with dm do
  begin
  ZKue.Close;
  ZKue.SQL.Clear;
  ZKue.SQL.Text := strSQL;
    if OpenIt then
     ZKue.Open
    else
     ZKue.ExecSQL;
  ZKon.Commit;
  end;
except
  dm.ZKue.CancelUpdates;
  dm.ZKon.Rollback;
  raise;
  Showmessage('Gagal menjalankan kueri !');
  exit
end;
end;


end.
