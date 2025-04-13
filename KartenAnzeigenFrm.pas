unit KartenAnzeigenFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls;

type
  TfrmKartenAnzeigen = class(TForm)
    lblK11: TLabel;
    lblK12: TLabel;
    lblK13: TLabel;
    lblK14: TLabel;
    lblK15: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lblK23: TLabel;
    lblK21: TLabel;
    lblK25: TLabel;
    lblK24: TLabel;
    lblK22: TLabel;
    Panel3: TPanel;
    lblK33: TLabel;
    lblK31: TLabel;
    lblK35: TLabel;
    lblK34: TLabel;
    lblK32: TLabel;
    Panel4: TPanel;
    lblK43: TLabel;
    lblK41: TLabel;
    lblK45: TLabel;
    lblK44: TLabel;
    lblK42: TLabel;
    Panel5: TPanel;
    lblK53: TLabel;
    lblK51: TLabel;
    lblK55: TLabel;
    lblK54: TLabel;
    lblK52: TLabel;
    lblSp1: TLabel;
    lblSp2: TLabel;
    lblSp3: TLabel;
    lplSp4: TLabel;
    lblSp5: TLabel;
    lblVer1: TLabel;
    lblGew1: TLabel;
    lblVer2: TLabel;
    lblGew2: TLabel;
    lblVer3: TLabel;
    lblGew3: TLabel;
    lblVer4: TLabel;
    lblGew4: TLabel;
    lblVer5: TLabel;
    lblGew5: TLabel;
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure SetData(ASpieler: Byte; AKarten: Array of string; AIstGewinner: Boolean; AIstVerlierer: Boolean);
    procedure SetzeSpielerAnzahl(ASpielerAnz: Byte); deprecated; //Nutzt falsche Ergebnisse, macht SetData(...) automatisch korrekt.
  end;

implementation

{$R *.dfm}

{ TKartenAnzeigenFrm }

procedure TfrmKartenAnzeigen.SetData(ASpieler: Byte; AKarten: array of string;
  AIstGewinner: Boolean; AIstVerlierer: Boolean);
begin
  case ASpieler of
    1:
      begin
        Panel1.Visible := True;
        lblK11.Caption := AKarten[0];
        lblK12.Caption := AKarten[1];
        lblK13.Caption := AKarten[2];
        lblK14.Caption := AKarten[3];
        lblK15.Caption := AKarten[4];
        if AIstGewinner then
          lblGew1.Visible := True;
        if AIstVerlierer then
          lblVer1.Visible := True;
      end;
    2:
      begin
        Panel2.Visible := True;
        lblK21.Caption := AKarten[0];
        lblK22.Caption := AKarten[1];
        lblK23.Caption := AKarten[2];
        lblK24.Caption := AKarten[3];
        lblK25.Caption := AKarten[4];
        if AIstGewinner then
          lblGew2.Visible := True;
        if AIstVerlierer then
          lblVer2.Visible := True;
      end;
    3:
      begin
        Panel3.Visible := True;
        lblK31.Caption := AKarten[0];
        lblK32.Caption := AKarten[1];
        lblK33.Caption := AKarten[2];
        lblK34.Caption := AKarten[3];
        lblK35.Caption := AKarten[4];
        if AIstGewinner then
          lblGew3.Visible := True;
        if AIstVerlierer then
          lblVer3.Visible := True;
      end;
    4:
      begin
        Panel4.Visible := True;
        lblK41.Caption := AKarten[0];
        lblK42.Caption := AKarten[1];
        lblK43.Caption := AKarten[2];
        lblK44.Caption := AKarten[3];
        lblK45.Caption := AKarten[4];
        if AIstGewinner then
          lblGew4.Visible := True;
        if AIstVerlierer then
          lblVer4.Visible := True;
      end;
    5:
      begin
        Panel5.Visible := True;
        lblK51.Caption := AKarten[0];
        lblK52.Caption := AKarten[1];
        lblK53.Caption := AKarten[2];
        lblK54.Caption := AKarten[3];
        lblK55.Caption := AKarten[4];
        if AIstGewinner then
          lblGew5.Visible := True;
        if AIstVerlierer then
          lblVer5.Visible := True;
      end;
  end;
end;

procedure TfrmKartenAnzeigen.SetzeSpielerAnzahl(ASpielerAnz: Byte);
begin
  case ASpielerAnz of
    2:
      begin
        Panel3.Visible := False;
        Panel4.Visible := False;
        Panel5.Visible := False;
      end;
    3:
      begin
        Panel4.Visible := False;
        Panel5.Visible := False;
      end;
    4: Panel5.Visible := False;
  end;
end;

end.
