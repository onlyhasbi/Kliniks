unit Ucoba;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls;

type
  TForm1 = class(TForm)
    ComboBox1: TComboBox;
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  angka : TStringList;

implementation

{$R *.dfm}                                                            

procedure TForm1.FormActivate(Sender: TObject);
begin
angka:=TStringList.Create;
ComboBox1.Items.BeginUpdate;
  ComboBox1.Items.Add('');
ComboBox1.Items.EndUpdate;

angka.Free;
end;

end.
