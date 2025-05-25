program Pkr;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF}
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  KartenAnzeigenFrm in 'KartenAnzeigenFrm.pas' {frmKartenAnzeigen},
  SpieldatenFestlegenFrm in 'SpieldatenFestlegenFrm.pas' {frmSpieldatenFestlegen},
  LizenzdialogFrm in 'LizenzdialogFrm.pas' {frmLizenzdialog},
  KartenTauschenFrm in 'KartenTauschenFrm.pas' {frmKartenTauschen},
  GlobalObjectHolder in 'GlobalObjectHolder.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
