program Pkr;

uses
  {$IFDEF DEBUG}
  FastMM4,
  {$ENDIF}
  Vcl.Forms,
  MainFrm in 'MainFrm.pas' {frmMain},
  KartenAnzeigenFrm in 'KartenAnzeigenFrm.pas' {frmKartenAnzeigen},
  SpieldatenFestlegenFrm in 'SpieldatenFestlegenFrm.pas' {frmSpieldatenFestlegen},
  KartenTauschenFrm in 'KartenTauschenFrm.pas' {frmKartenTauschen},
  LizenzdialogFrm in 'LizenzdialogFrm.pas' {frmLizenzdialog};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TfrmMain, frmMain);
  Application.Run;
end.
