unit LizenzdialogFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList;

type
  TfrmLizenzdialog = class(TForm)
    Memo1: TMemo;
    cbLizenzGelesenUndAkzeptiert: TCheckBox;
    btnBeenden: TButton;
    btnLizenzAkzeptieren: TButton;
    btnLIzenzSpeichern: TButton;
    btnLizenzDrucken: TButton;
    ActionList1: TActionList;
    actLizenzSpeichern: TAction;
    actLizenzDrucken: TAction;
    procedure cbLizenzGelesenUndAkzeptiertClick(Sender: TObject);
    procedure btnBeendenClick(Sender: TObject);
    procedure btnLizenzSpeichernClick(Sender: TObject);
    procedure btnLizenzDruckenClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure actLizenzSpeichernExecute(Sender: TObject);
    procedure actLizenzDruckenExecute(Sender: TObject);
  private
    { Private-Deklarationen }
    procedure LizenzSpeichern();
    procedure LizenzDrucken();
    procedure FillListWithLicenseText(var AList: TStringList);
  public
    { Public-Deklarationen }
  end;

implementation

uses
  VCL.Printers;

{$R *.dfm}

procedure TfrmLizenzdialog.actLizenzDruckenExecute(Sender: TObject);
begin
  LizenzDrucken();
end;

procedure TfrmLizenzdialog.actLizenzSpeichernExecute(Sender: TObject);
begin
  LizenzSpeichern();
end;

procedure TfrmLizenzdialog.btnBeendenClick(Sender: TObject);
begin
  Halt;
end;

procedure TfrmLizenzdialog.btnLizenzDruckenClick(Sender: TObject);
begin
  LizenzDrucken();
end;

procedure TfrmLizenzdialog.btnLizenzSpeichernClick(Sender: TObject);
begin
  LizenzSpeichern();
end;

procedure TfrmLizenzdialog.cbLizenzGelesenUndAkzeptiertClick(Sender: TObject);
begin
  btnLizenzAkzeptieren.Enabled := cbLizenzGelesenUndAkzeptiert.Checked;
end;

procedure TfrmLizenzdialog.FillListWithLicenseText(var AList: TStringList);
begin
  AList.Add('Mit der Benutzung der Software werden die Folgenden Lizenzbedingungen akzeptiert:');
  AList.Add('1. Poker ist ein rundenbasiertes Spiel, bei welchem der Erfolg in hohem Ma�e vom Zufall abh�ngt. Mit diesem Programm darf nicht um Geld oder andere Wertgegenst�nde gespielt werden.');
  AList.Add('2. Gl�cksbasiertes Spielen kann s�chtig machen; Informationen finden Sie unter https://www.buwei.de oder unter https://www.check-dein-spiel.de/ (beides kostenfrei).');
  AList.Add('3. Unter keinen Umst�nden und unter keiner Rechtstheorie, ob unerlaubte Handlung (einschlie�lich Fahrl�ssigkeit), Vertrag oder anderweitig, ' +
    'haften die urspr�ngliche Entwickler*innen, ein anderer Mitwirkender oder ein Vertreiber des abgedeckten Codes oder ein Lieferant einer dieser Parteien ' +
    'gegen�ber einer Person f�r indirekte, besondere, zuf�llige oder Folgesch�den jeglicher Art, einschlie�lich, aber nicht beschr�nkt auf Sch�den durch Verlust ' +
    'von Firmenwert, Arbeitsunterbrechung, Computerausfall oder -fehlfunktion oder alle anderen kommerziellen Sch�den oder Verluste, selbst wenn diese Partei �ber ' +
    'die M�glichkeit solcher Sch�den informiert wurde. Diese Haftungsbeschr�nkung gilt nicht f�r die Haftung f�r Todesf�lle oder Personensch�den, die auf Fahrl�ssigkeit ' +
    'der betreffenden Partei zur�ckzuf�hren sind, sofern das geltende Recht eine solche Beschr�nkung verbietet. In einigen Rechtsordnungen ist der Ausschluss oder die ' +
    'Beschr�nkung von Neben- oder Folgesch�den nicht zul�ssig, so dass dieser Ausschluss und diese Beschr�nkung m�glicherweise nicht f�r Sie gelten.');
  AList.Add('4. Wir �bernehmen keine Garantie jeglicher Art, weder ausdr�cklich noch stillschweigend, einschlie�lich, ohne Einschr�nkung, dass das Programm bzw. ' +
    'der Code frei von M�ngeln ist, handels�blich, geeignet f�r einen bestimmten Zweck oder nicht das Urheberrecht verletzend. Das gesamte Risiko in Bezug auf die Qualit�t ' +
    'und Leistung liegt bei Ihnen. Sollte sich das Programm oder der Code in irgendeiner Hinsicht als fehlerhaft erweisen, �bernehmen Sie (nicht der urspr�ngliche Entwickler ' +
    'oder ein anderer Mitwirkender) die Kosten f�r die notwendige Wartung, Reparatur oder Korrektur.');
  AList.Add('5. Gerichtsstandort ist Deutschland und es gilt deutsches Recht. Sofern zul�ssig wird der Gerichtsstandort auf Ulm festgelegt.');
  AList.Add('6. Diese Software darf nur in �bereinstimmung mit der internationalen Erkl�rung der Menschenrechte verwendet werden, wie von der Generalversammlung der ' +
    'Vereinten Nationen am 10. Dezember 1948 beschlossen.');
  AList.Add('7. Die Nutzung der Software oder des Codes ist nur zul�ssig, wenn diese Lizenz vollumf�nglich akzeptiert und eingehalten wird.');
  AList.Add('8. Sollten einzelne Teile dieser Lizenz ung�ltig sein, so bleiben die restlichen Bestandteile unver�ndert in Kraft.');
end;

procedure TfrmLizenzdialog.FormCreate(Sender: TObject);
begin
  Left := (Screen.Width - Width)  div 2;
  Top := (Screen.Height - Height) div 2;
end;

procedure TfrmLizenzdialog.FormShow(Sender: TObject);
Var
  TmpList: TstringList;
begin
  Memo1.Clear;
  TmpList := TStringList.Create;
  try
    FillListWithLicenseText(TmpList);
    Memo1.Lines.Assign(TmpList);
  finally
    TmpList.Free;
  end;
end;

procedure TfrmLizenzdialog.LizenzDrucken;
label
  ZeileFortsetzen;
var
  PrintDialogue: TPrintDialog;
  Breite, Hoehe, Links, Oben, X, Y: Integer;
  I, J, PosLetztLeerz: Integer;
  TmpList, MemoErsatzListe: TStringList;
  Tmp: string;
begin
  PrintDialogue := TPrintDialog.Create(nil);
  try
    if PrintDialogue.Execute() then
    begin
      TmpList := TStringList.Create;
      MemoErsatzListe := TStringList.Create;
      try
        FillListWithLicenseText(MemoErsatzListe);
        Printer.BeginDoc;
        SetMapMode(Printer.Canvas.Handle, MM_LOMETRIC); //Umstellen auf 1/10 mm

        Printer.Canvas.Font.Name := 'Calibri';
        Printer.Canvas.Brush.Color := clWhite;
        Printer.Canvas.Font.Height := 50;

        //Blattg��e in 1/10 mm ermitteln:
        Breite := GetDeviceCaps(Printer.Canvas.Handle, HORZSIZE) * 10;
        Hoehe := GetDeviceCaps(Printer.Canvas.Handle, VERTSIZE) * 10;

        Links := 250; //2,5 cm
        Oben := 250; //2,5 cm

        X := Links;
        Y := Oben * (- 1);

        for I := 0 to MemoErsatzListe.Count - 1 do
        begin
          if ((Printer.Canvas.TextWidth(MemoErsatzListe[I])) >= (breite - (2 * Links))) then
          begin
            J := 1;
            PosLetztLeerz := 0;
            ZeileFortsetzen:
            Tmp := '';
            while (Printer.Canvas.TextWidth(Tmp) < (breite - (2 * Links))) and (J <= Length(MemoErsatzListe[I])) do
            begin
              Tmp := Tmp + MemoErsatzListe[I][J];
              if MemoErsatzListe[I][J] = ' ' then
                PosLetztLeerz := J;
              Inc(J);
            end;
            if (J <= Length(MemoErsatzListe[I])) and (J <> PosLetztLeerz) then
            begin
              Tmp := Tmp.Substring(0, Length(Tmp) - (J - PosLetztLeerz) + 1); //+1: Leerzeichen auch drucken f�r die Lesbarkeit mit Assistenzsoftware.
              J := PosLetztLeerz + 1;
            end;
            TmpList.Add(Tmp);
            if J <= Length(MemoErsatzListe[I]) then
              goto ZeileFortsetzen;
          end
          else
          begin
            TmpList.Add(MemoErsatzListe[I]);
          end;
        end;

        for I := 0 to TmpList.Count - 1 do
        begin

          if ((- 1) * Y) > (Hoehe - (2 * Oben)) then
          begin
            Y := Oben * (- 1);
            Printer.NewPage;
          end;

          Printer.Canvas.TextOut(x, y, TmpList[I]);

          Y := Y - Printer.Canvas.TextHeight(TmpList[I]);

        end;
        Printer.EndDoc;
      finally
        MemoErsatzListe.Free;
        TmpList.Free;
      end;
    end;
  finally
    PrintDialogue.Free;
  end;
end;

procedure TfrmLizenzdialog.LizenzSpeichern;
var
  SaveDialogue: TSaveDialog;
begin
  SaveDialogue := TSaveDialog.Create(nil);
  try
    SaveDialogue.Filter := 'Textdateien|*.txt';
    SaveDialogue.DefaultExt := 'txt';
    SaveDialogue.Title := 'Lizenzdatei speichern';
    SaveDialogue.Options := [ofOverwritePrompt, ofOldStyleDialog, ofHideReadOnly, ofEnableSizing];

    if SaveDialogue.Execute() then
      Memo1.Lines.SaveToFile(SaveDialogue.FileName);
  finally
    SaveDialogue.Free;
  end;
end;

end.



