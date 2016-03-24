unit UDataModule;

interface

uses
  SysUtils, Classes, DB, ZAbstractRODataset, ZAbstractDataset, ZDataset,
  ZAbstractConnection, ZConnection, MemDS, VirtualTable;

type
  Tdm = class(TDataModule)
    zkon: TZConnection;
    zkue: TZQuery;
    vtkunjungan: TVirtualTable;
    dsKunjungan: TDataSource;
    vtHerbal: TVirtualTable;
    dsHerbal: TDataSource;
    vtTerapi: TVirtualTable;
    dsTerapi: TDataSource;
    vtPembelian: TVirtualTable;
    dsPembelian: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dm: Tdm;

implementation

{$R *.dfm}

end.
