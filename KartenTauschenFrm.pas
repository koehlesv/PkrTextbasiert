unit KartenTauschenFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls,
  Vcl.Imaging.pngimage;

type
  TfrmKartenTauschen = class(TForm)
    Panel1: TPanel;
    lblK13: TLabel;
    lblK11: TLabel;
    lblK15: TLabel;
    lblK14: TLabel;
    lblK12: TLabel;
    lblSp: TLabel;
    btnTauschenUndFortsetzen: TButton;
    cbTauschen1: TCheckBox;
    cbTauschen2: TCheckBox;
    cbTauschen3: TCheckBox;
    cbTauschen4: TCheckBox;
    cbTauschen5: TCheckBox;
    lblErkl: TLabel;
  private
    function GetK1Tauschen: Boolean;
    function GetK2Tauschen: Boolean;
    function GetK3Tauschen: Boolean;
    function GetK4Tauschen: Boolean;
    function GetK5Tauschen: Boolean;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure SetData(ASpNummer: Integer; AKartenBez: Array of string);
    property K1Tauschen: Boolean read GetK1Tauschen;
    property K2Tauschen: Boolean read GetK2Tauschen;
    property K3Tauschen: Boolean read GetK3Tauschen;
    property K4Tauschen: Boolean read GetK4Tauschen;
    property K5Tauschen: Boolean read GetK5Tauschen;
  end;

implementation

{$R *.dfm}

{ TfrmKartenTauschen }

function TfrmKartenTauschen.GetK1Tauschen: Boolean;
begin
  Result := cbTauschen1.Checked;
end;

function TfrmKartenTauschen.GetK2Tauschen: Boolean;
begin
  Result := cbTauschen2.Checked;
end;

function TfrmKartenTauschen.GetK3Tauschen: Boolean;
begin
  Result := cbTauschen3.Checked;
end;

function TfrmKartenTauschen.GetK4Tauschen: Boolean;
begin
  Result := cbTauschen4.Checked;
end;

function TfrmKartenTauschen.GetK5Tauschen: Boolean;
begin
  Result := cbTauschen5.Checked;
end;

procedure TfrmKartenTauschen.SetData(ASpNummer: Integer;
  AKartenBez: array of string);
begin
  lblSp.Caption := lblSp.Caption + ' ' + IntToStr(ASpNummer);
  lblK11.Caption := AKartenBez[0];
  lblK12.Caption := AKartenBez[1];
  lblK13.Caption := AKartenBez[2];
  lblK14.Caption := AKartenBez[3];
  lblK15.Caption := AKartenBez[4];
end;

end.
