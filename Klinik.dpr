program Klinik;

uses
  Forms,
  UPendaftaran in 'UPendaftaran.pas' {fpendaftaran},
  Uutama in 'UUtama.pas' {futama},
  UDataModule in 'UDataModule.pas' {dm: TDataModule},
  FormScript in 'FormScript.pas',
  DatabaseScript in 'DatabaseScript.pas',
  UDataPetugas in 'UDataPetugas.pas' {fpetugas},
  UDataPemasok in 'UDataPemasok.pas' {fpemasok},
  UDataTerapis in 'UDataTerapis.pas' {fterapis},
  UDataHerbal in 'UDataHerbal.pas' {fherbal},
  UHargaHerbal in 'UHargaHerbal.pas' {fhargaherbal},
  UHargaTerapi in 'UHargaTerapi.pas' {fhargaterapi},
  UPengguna in 'UPengguna.pas' {fpengguna},
  UMasuk in 'UMasuk.pas' {fmasuk},
  UPenjualan in 'UPenjualan.pas' {fpenjualan},
  UPembelian in 'UPembelian.pas' {fpembelian},
  Ucoba in 'Ucoba.pas' {Form1};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(Tfutama, futama);
  Application.CreateForm(Tfpenjualan, fpenjualan);
  Application.CreateForm(Tfpendaftaran, fpendaftaran);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(Tfpetugas, fpetugas);
  Application.CreateForm(Tfpemasok, fpemasok);
  Application.CreateForm(Tfterapis, fterapis);
  Application.CreateForm(Tfherbal, fherbal);
  Application.CreateForm(Tfhargaherbal, fhargaherbal);
  Application.CreateForm(Tfhargaterapi, fhargaterapi);
  Application.CreateForm(Tfpengguna, fpengguna);
  Application.CreateForm(Tfmasuk, fmasuk);
  Application.CreateForm(Tfpembelian, fpembelian);
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
