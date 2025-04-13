unit SpieldatenFestlegenFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls;

type
  TfrmSpieldatenFestlegen = class(TForm)
    edtSpMe: TEdit;
    lblAnzSpMe: TLabel;
    lblAnzSpCo: TLabel;
    edtSpCo: TEdit;
    lblErkl: TLabel;
    btnOK: TButton;
    rbAbsteigend: TRadioButton;
    rbAufsteigend: TRadioButton;
    lblAnzCredits: TLabel;
    edtAnzTokens: TEdit;
    cbWarnungVorMeSpKAnz: TCheckBox;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
  private
    function GetAnzCoSp: Integer;
    function GetAnzMeSp: Integer;
    function GetAnzTks: Integer;
    function GetSpielverlaufAbsteigend: Boolean;
    function GetMVSpWarAnz: Boolean;
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    property AnzMeSp: Integer read GetAnzMeSp;
    property AnzCoSp: Integer read GetAnzCoSp;
    property AnzTks: Integer read GetAnzTks;
    property SpielverlaufAbsteigend: Boolean read GetSpielverlaufAbsteigend;
    property MVSpWarAnz: Boolean read GetMVSpWarAnz;
  end;

implementation

uses
  System.UITypes;

{$R *.dfm}

procedure TfrmSpieldatenFestlegen.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if ModalResult = mrOK then
  begin
    CanClose := True;
    if ((edtSpMe.Text = '') and (edtSpCo.Text = '')) or ((AnzMeSp + AnzCoSp) < 2) or ((AnzMeSp + AnzCoSp) > 5) then
    begin
      MessageDlg('Die Summe der menschlichen und computerbasierten Spieler*innen zusammen muss zwischen 2 und 5 (jeweils inklusive) liegen.', TMsgDlgType.mtError, [mbClose], 0);
      CanClose := False;
    end;
  end;
end;

function TfrmSpieldatenFestlegen.GetAnzCoSp: Integer;
begin
  if edtSpCo.Text = '' then
    Result := 0
  else
    Result := StrToInt(edtSpCo.Text);
end;

function TfrmSpieldatenFestlegen.GetAnzMeSp: Integer;
begin
  if edtSpMe.Text = '' then
    Result := 0
  else
    Result := StrToInt(edtSpMe.Text);
end;

function TfrmSpieldatenFestlegen.GetAnzTks: Integer;
begin
  if edtAnzTokens.Text = '' then
    Result := 6
  else
    Result := StrToInt(edtAnzTokens.Text);
end;

function TfrmSpieldatenFestlegen.GetMVSpWarAnz: Boolean;
begin
  Result := cbWarnungVorMeSpKAnz.Checked;
end;

function TfrmSpieldatenFestlegen.GetSpielverlaufAbsteigend: Boolean;
begin
  Result := rbAbsteigend.Checked;
end;

end.
