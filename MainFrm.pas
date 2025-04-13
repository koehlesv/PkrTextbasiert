unit MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Contnrs, Vcl.StdCtrls, System.Actions,
  Vcl.ActnList, Vcl.ExtCtrls;

const
  WM_AFTER_SHOW = WM_USER + 300;
  WM_AFTER_CREATE = WM_USER + 301;

type
  TKartenWert = (kwZwei, kwDrei, kwVier, kwFuenf, kwSechs, kwSieben, kwAcht, kwNeun, kwZehn, kwBube, kwDame, kwKoenig, kwAss);
  TKartenFarbe = (kfPik, kfKreuz, kfHerz, kfKaro);

  TKarte = class(TObject)
  private
    FKartenWert: TKartenWert;
    FKartenFarbe: TKartenFarbe;
  public
    constructor Create(AKartenWert: TKartenWert; AKartenFarbe: TKartenFarbe);
  //published
    property KartenWert: TKartenWert read FKartenWert write FKartenWert;
    property KartenFarbe: TKartenFarbe read FKartenFarbe write FKartenFarbe;
  end;

  TKartenHelper = class(TObject)
  public
    class function IsRoyalFlush(AHand: TObjectList): Boolean;
    class function IsStraightFlush(AHand: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsFourOfAKind(AHand: TObjectList; out AKartenwert: TKartenWert): Boolean;
    class function IsFullHouse(AHand: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsFlush(AHand: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsStraight(AHand: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsThreeOfAKind(AHand: TObjectList; out ARemainingList: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsTwoPair(AHand: TObjectList; out ARemainingList: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsOnePair(AHand: TObjectList; out ARemainingList: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
    class function IsHighestCard(AHand: TObjectList; out AKartenwert: TKartenWert; out ARemainingList: TObjectList): Boolean;

    class function GetKartenBezeichnung(AKarte: TKarte): string;
  end;

  TDeck = class(TObject)
  private
    FInternerZaehler: Integer;
    FKartenListe: TObjectList;
    procedure LiefereZufallszahlen(Size: DWORD; var Buffer: TBytes);
  public
    constructor Create();
    destructor Destroy; override;
    procedure Initialize();
    procedure Mischeln();
    procedure KartenAusteilen(var AHand: TObjectList; AAnzahlKarten: Integer);
    procedure KartenTauschen(var AHand: TObjectList; var AKartenZuTauschen: TObjectList); //AKartenZuTauschen ist eine Teilmenge von AHand.
    class procedure HandBewerten(AHand: TObjectList; out APrimaerwert: Integer; out ASekundaerwert: Integer);
  end;

  TPlayer = class(TObject)
  private
    FMenschlicherSpieler: Boolean;
    FHand: TObjectList;
    FHandValue: Integer;
    FNummer: Integer;
    FTksAnz: Integer;
  public
    constructor Create(AMenschlicherSpieler: Boolean; ATksAnz: Integer);
    destructor Destroy; override;
    property Hand: TObjectList read FHand write FHand;
    property HandValue: Integer read FHandValue write FHandValue;
    property Nummer: Integer read FNummer write FNummer;
    property TksAnz: Integer read FTksAnz write FTksAnz;
    property MenschlicherSpieler: Boolean read FMenschlicherSpieler write FMenschlicherSpieler;
  end;

  TfrmMain = class(TForm)
    btnNaechsteRunde: TButton;
    lblErklaerung: TLabel;
    btnErkl: TButton;
    ActionList1: TActionList;
    actErklAnz: TAction;
    btnSpielStarten: TButton;
    lblMeSp: TLabel;
    lblCoSp: TLabel;
    lblAnzMeSp: TLabel;
    lblAnzCoSp: TLabel;
    lblTksText: TLabel;
    lblAnzTks: TLabel;
    lblTksUebersicht: TLabel;
    lblSp5: TLabel;
    lblSp1: TLabel;
    lblSp2: TLabel;
    lblSp3: TLabel;
    lblSp4: TLabel;
    Panel1: TPanel;
    Panel2: TPanel;
    lblTksSp1: TLabel;
    lblTksSp2: TLabel;
    lblTksSp3: TLabel;
    lblTksSp4: TLabel;
    lblTksSp5: TLabel;
    Panel3: TPanel;
    lblAktPlzSp5: TLabel;
    lblAktPlzSp4: TLabel;
    lblAktPlzSp3: TLabel;
    lblAktPlzSp2: TLabel;
    lblAktPlzSp1: TLabel;
    lblPlatzierung: TLabel;
    btnSpielStoppen: TButton;
    procedure btnErklClick(Sender: TObject);
    procedure actErklAnzExecute(Sender: TObject);
    procedure btnSpielStartenClick(Sender: TObject);
    procedure btnNaechsteRundeClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnSpielStoppenClick(Sender: TObject);
  private
    { Private-Deklarationen }
    FAnzMeSp: Integer;
    FAnzTks: Integer;
    FSpielartAbsteigend: Boolean;
    FSpielLaufend: Boolean;
    FMVSpWarAnz: Boolean;
    FDeck: TDeck;
    FPlayerList: TObjectList;
    procedure RundendetailsAnzeigen();
    procedure ErklaerungAnzeigen();
    procedure UpdateControls();
    procedure InitTksSpAnzeige();
    procedure UpdateTksAnzeige();
    procedure SetzePlatzierung(ABereitsPlatzierungAngepasst: Boolean; ASpieler: Byte);
    procedure SetzePlatzierungNachSpielende();
    procedure AfterShow(var Msg: TMessage); message WM_AFTER_SHOW;
    procedure AfterCreate(var Msg: TMessage); message WM_AFTER_CREATE;
   //protected
     //procedure WndProc(var Message: TMessage); override;
  public
    { Public-Deklarationen }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure InitializeDeck();
    procedure KartenGeben();
    procedure KartenTauschen();
    procedure Bewerten(out AMindestSpielerListe: TObjectList; out AHoechstSpielerListe: TObjectList; ATksAnwenden: Boolean);
    procedure SpielendeNachTksEntfernen();
  end;

function BCryptGenRandom(phAlgorithm: Pointer; pbBuffer: Pointer;
  cbBuffer: ULONG; dwFlags: ULONG): DWORD; stdcall; external 'Bcrypt.dll';

function BCryptOpenAlgorithmProvider(var phAlgorithm: Pointer;
  pszAlgId: PWideChar; pszImplementation: PWideChar; dwFlags: ULONG): DWORD;
  stdcall; external 'BCrypt.dll';

function BCryptCloseAlgorithmProvider(hAlgorithm: Pointer; dwFlags: ULONG)
  : DWORD; stdcall; external 'BCrypt.dll';

var
  frmMain: TfrmMain;

  AktNummer: Integer;
  AktPlatzierung: Integer;

implementation

{$R *.dfm}

uses KartenAnzeigenFrm, SpieldatenFestlegenFrm, KartenTauschenFrm, System.UITypes;

{ TKarte }

constructor TKarte.Create(AKartenWert: TKartenWert; AKartenFarbe: TKartenFarbe);
begin
  FKartenWert := AKartenWert;
  FKartenFarbe := AKartenFarbe;
end;

{ TDeck }

constructor TDeck.Create;
begin
  FKartenListe := TObjectList.Create(False);
  FInternerZaehler := 0;
end;

destructor TDeck.Destroy;
var
  I: Integer;
begin
  for I := 0 to FKartenListe.Count - 1 do
    (FKartenListe[I] as TKarte).Free;
  FKartenListe.Free;
  inherited Destroy;
end;

class procedure TDeck.HandBewerten(AHand: TObjectList; out APrimaerwert,
  ASekundaerwert: Integer);
var
  RemainingList: TObjectList;
  LKartenwert: TKartenWert;
begin
  ASekundaerwert := 0;
  RemainingList := TObjectList.Create(False);
  try
    if TKartenHelper.IsRoyalFlush(AHand) then
    begin
      APrimaerwert := 10;
      ASekundaerwert := 0;
      Exit;
    end
    else if TKartenHelper.IsStraightFlush(AHand, LKartenwert) then
    begin
      APrimaerwert := 9;
    end
    else if TKartenHelper.IsFourOfAKind(AHand, LKartenwert) then
    begin
      APrimaerwert := 8;
    end
    else if TKartenHelper.IsFullHouse(AHand, LKartenwert) then
    begin
      APrimaerwert := 7;
    end
    else if TKartenHelper.IsFlush(AHand, LKartenwert) then
    begin
      APrimaerwert := 6;
    end
    else if TKartenHelper.IsStraight(AHand, LKartenwert) then
    begin
      APrimaerwert := 5;
    end
    else if TKartenHelper.IsThreeOfAKind(AHand, RemainingList, LKartenwert) then
    begin
      APrimaerwert := 4;
    end
    else if TKartenHelper.IsTwoPair(AHand, RemainingList, LKartenwert) then
    begin
      APrimaerwert := 3;
    end
    else if TKartenHelper.IsOnePair(AHand, RemainingList, LKartenwert) then
    begin
      APrimaerwert := 2;
    end
    else if TKartenHelper.IsHighestCard(AHand, LKartenwert, RemainingList) then
    begin
      APrimaerwert := 1;
    end;
    ASekundaerwert := Ord(LKartenwert);
  finally
    RemainingList.Free;
  end;
end;

procedure TDeck.Initialize;
var
  I: TKartenWert;
  J: TKartenFarbe;
begin
  for I := Low(TKartenWert) to High(TKartenWert) do
  begin
    for J := Low(TKartenFarbe) to High(TKartenFarbe) do
    begin
      FKartenListe.Add(TKarte.Create(I, J));
    end;
  end;
end;

//Diese Methode gibt ZUSÄTZLICHE Karten aus und löscht die bisherigen Karten auf der Hand NICHT ab!
procedure TDeck.KartenAusteilen(var AHand: TObjectList; AAnzahlKarten: Integer);
var
  I: Integer;
begin
  for I := 0 to AAnzahlKarten - 1 do
  begin
    AHand.Add(FKartenListe[FInternerZaehler]);
    Inc(FInternerZaehler);
  end;
end;

procedure TDeck.KartenTauschen(var AHand: TObjectList; var AKartenZuTauschen: TObjectList);
var
  AnzKartenZumNachziehen: Integer;
  AktIndex: Integer;
  I: Integer;
begin
  AnzKartenZumNachziehen := 0;
  for I := AKartenZuTauschen.Count - 1 downto 0 do
  begin
    AktIndex := AHand.IndexOf(AKartenZuTauschen[I]);
    if AktIndex > -1 then
    begin
      AHand.Delete(AktIndex);
      Inc(AnzKartenZumNachziehen);
      //Verbesserungsmöglichkeit: Das Deck muss sich merken, welche Karten es jetzt (wieder) hat und welche nicht. Bei 5 Spielenden aber nicht zwingend notwendig.
    end;
  end;
  KartenAusteilen(AHand, AnzKartenZumNachziehen);
end;

procedure TDeck.LiefereZufallszahlen(Size: DWORD; var Buffer: TBytes);
var
  Status: DWORD;
  hAlgorithm: Pointer;
begin
  Status := BCryptOpenAlgorithmProvider(hAlgorithm,
    'RNG', nil, 0);
  try
    if Status = 0 then
    begin
      SetLength(Buffer, Size);
      Status := BCryptGenRandom(hAlgorithm, Buffer, Size, 0);
      if Status <> 0 then
        raise Exception.Create('Fehlercode: ' + IntToStr(Status) + sLineBreak + 'Wir entschuldigen uns für die Unannehmlichkeiten.');
    end
    else
    begin
      raise Exception.Create('Fehlercode: ' + IntToStr(Status) + sLineBreak + 'Wir entschuldigen uns für die Unannehmlichkeiten.');
    end;
  finally
    Status := BCryptCloseAlgorithmProvider(hAlgorithm, 0);
    if Status <> 0 then
        raise Exception.Create('Fehlercode: ' + IntToStr(Status) + sLineBreak + 'Wir entschuldigen uns für die Unannehmlichkeiten.');
  end;
end;

//Die statistische Wahrscheinlichkeit, dass nicht bereits im ersten Durchgang alle Karten zugewiesen werden, ist bei unter einem Prozent. (Berechnet durch Inklusion-Exklusion).
//Wir nehmen hierbei an, dass der Zufallsgenerator des Betriebssystems alle Zahlen zufällig gleichverteilt zieht (davon ist auch die "Fairness" der Mischung der Karten abhängig).
//Zur Sicherheit gibt es trotzdem maximal bis zu zehn Druchgänge.
procedure TDeck.Mischeln;
var
  Buffer: TBytes;
  Status: string;
  I, J: Integer;
  Pos: Integer;
  Counter: Integer;
  TmpList: TObjectList;
begin
  FInternerZaehler := 0;
  Counter := 0;
  Status := '1111111111111111111111111111111111111111111111111111';
  TmpList := TObjectList.Create(False);
  try
    for J := 0 to 9 do
    begin
      LiefereZufallszahlen(1024 * 2, Buffer);
        for I := 0 to Length(Buffer) - 1 do
        begin
          Pos := Buffer[I];
          if (Pos > 103) or (Pos < -104) then
            Continue;
          if Pos > 51 then
            Pos := Pos - 52;
          if Pos < 0 then
            Pos := Pos + 52;
          if Pos < 0 then
            Pos := Pos + 52;
          if (Pos + 1 > 52) or (Pos + 1 < 1) then
            Continue;
          if Status[Pos + 1] = '1' then
          begin
            Inc(Counter);
            Status[Pos + 1] := '0';
            TmpList.Add(FKartenListe[Pos]);
          end;
          if Counter >= FKartenListe.Count then
            Break;
        end;
        if Counter >= FKartenListe.Count then
          Break;
    end;
    FKartenListe.Clear;
    for I := 0 to TmpList.Count - 1 do
      FKartenListe.Add(TmpList[I]);
  finally
    TmpList.Free;
  end;
end;

{ TKartenHelper }

class function TKartenHelper.GetKartenBezeichnung(AKarte: TKarte): string;
begin
  case AKarte.KartenFarbe of
    kfPik: Result := 'Pik';
    kfKreuz: Result := 'Kreuz';
    kfHerz: Result := 'Herz';
    kfKaro: Result := 'Karo';
  end;
  case AKarte.KartenWert of
    kwZwei: Result := Result + ' 2';
    kwDrei: Result := Result + ' 3';
    kwVier: Result := Result + ' 4';
    kwFuenf: Result := Result + ' 5';
    kwSechs: Result := Result + ' 6';
    kwSieben: Result := Result + ' 7';
    kwAcht: Result := Result +  ' 8';
    kwNeun: Result := Result + ' 9';
    kwZehn: Result := Result + ' 10';
    kwBube: Result := Result + ' Bube';
    kwDame: Result := Result + ' Dame';
    kwKoenig: Result := Result + ' König';
    kwAss: Result := Result + ' Ass';
  end;
end;

class function TKartenHelper.IsFlush(AHand: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
var
  LKartenFarbe: TKartenFarbe;
  I: Integer;
begin
  Result := False;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LKartenFarbe := (AHand[0] as TKarte).KartenFarbe;
  for I := 0 to AHand.Count - 1 do
  begin
    if (AHand[I] as TKarte).KartenFarbe <> LKartenFarbe then
      Exit;
  end;
  AHoechsterKartenwert := kwZwei;
  for I := 0 to AHand.Count - 1 do
  begin
    if Ord((AHand[I] as TKarte).KartenWert) > Ord(AHoechsterKartenwert) then
    begin
      AHoechsterKartenwert := (AHand[I] as TKarte).KartenWert;
    end;
  end;
  Result := True;
end;

class function TKartenHelper.IsFourOfAKind(AHand: TObjectList; out AKartenWert: TKartenWert): Boolean;
var
  LErsterKartenWert, LZweiterKartenWert: TKartenWert;
  I: Integer;
  VorkommenErsterWert, VorkommenZweiterWert: Integer;
begin
  Result := False;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LErsterKartenWert := (AHand[0] as TKarte).KartenWert;
  LZweiterKartenWert := (AHand[0] as TKarte).KartenWert;
  VorkommenErsterWert := 0;
  VorkommenZweiterWert := 0;
  for I := 0 to AHand.Count - 1 do
  begin
    if (AHand[I] as TKarte).KartenWert = LErsterKartenWert then
      Inc(VorkommenErsterWert)
    else if (AHand[I] as TKarte).KartenWert = LZweiterKartenWert then
      Inc(VorkommenZweiterWert)
    else if LErsterKartenWert = LZweiterKartenWert then
    begin
      LZweiterKartenWert := (AHand[I] as TKarte).KartenWert;
      Inc(VorkommenZweiterWert);
    end;
  end;
  if (VorkommenErsterWert = 4) or (VorkommenZweiterWert = 4) then
  begin
    Result := True;
    if VorkommenErsterWert = 4 then
      AKartenwert := LErsterKartenWert
    else
      AKartenwert := LZweiterKartenWert;
  end;
end;

class function TKartenHelper.IsFullHouse(AHand: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
var
  RemainingList, Ignore: TObjectList;
  I: Integer;
begin
  RemainingList := TObjectList.Create(False);
  Ignore := TObjectList.Create(False);
  try
    Result := IsThreeOfAKind(AHand, RemainingList, AHoechsterKartenwert);
    Result := Result and IsOnePair(RemainingList, Ignore, AHoechsterKartenwert);
    if Result then
    begin
      AHoechsterKartenwert := kwZwei;
      for I := 0 to AHand.Count - 1 do
      begin
        if Ord((AHand[I] as TKarte).KartenWert) > Ord(AHoechsterKartenwert) then
        begin
          AHoechsterKartenwert := (AHand[I] as TKarte).KartenWert;
        end;
      end;
    end;
  finally
    Ignore.Free;
    RemainingList.Free;
  end;
end;

class function TKartenHelper.IsHighestCard(AHand: TObjectList;
  out AKartenwert: TKartenWert; out ARemainingList: TObjectList): Boolean;
var
  I: Integer;
begin
  Result := True;
  AKartenwert := (AHand[0] as TKarte).KartenWert;
  for I := 0 to AHand.Count - 1 do
  begin
    if Ord((AHand[I] as TKarte).KartenWert) > Ord(AKartenwert) then
      AKartenwert := (AHand[I] as TKarte).KartenWert;
  end;
  for I := 0 to AHand.Count - 1 do
  begin
    if ((AHand[I] as TKarte).KartenWert <> AKartenwert) {or AlreadyOneKept} then //Nicht benötigt, da wir hier nur dann reinlaufen, wenn wir kein Paar haben.
    begin
      ARemainingList.Add(AHand[I]);
    end;
  end;
end;

class function TKartenHelper.IsOnePair(AHand: TObjectList; out ARemainingList: TObjectList;
  out AHoechsterKartenwert: TKartenWert): Boolean;
var
  LErsterKartenWert, LZweiterKartenWert, LDritterKartenWert, LVierterKartenWert: TKartenWert;
  I: Integer;
  VorkommenErsterWert, VorkommenZweiterWert, VorkommenDritterWert, VorkommenVierterWert: Integer;
begin
  Result := False;
  ARemainingList.Clear;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LErsterKartenWert := (AHand[0] as TKarte).KartenWert;
  LZweiterKartenWert := (AHand[0] as TKarte).KartenWert;
  LDritterKartenWert := (AHand[0] as TKarte).KartenWert;
  LVierterKartenWert := (AHand[0] as TKarte).KartenWert;
  VorkommenErsterWert := 0;
  VorkommenZweiterWert := 0;
  VorkommenDritterWert := 0;
  VorkommenVierterWert := 0;
  for I := 0 to AHand.Count - 1 do
  begin
    if (AHand[I] as TKarte).KartenWert = LErsterKartenWert then
      Inc(VorkommenErsterWert)
    else if (AHand[I] as TKarte).KartenWert = LZweiterKartenWert then
      Inc(VorkommenZweiterWert)
    else if (AHand[I] as TKarte).KartenWert = LDritterKartenWert then
      Inc(VorkommenDritterWert)
    else if (AHand[I] as TKarte).KartenWert = LVierterKartenWert then
      Inc(VorkommenVierterWert)
    else if LErsterKartenWert = LZweiterKartenWert then
    begin
      LZweiterKartenWert := (AHand[I] as TKarte).KartenWert;
      Inc(VorkommenZweiterWert);
    end
    else if LErsterKartenWert = LDritterKartenWert then
    begin
      LDritterKartenWert := (AHand[I] as TKarte).KartenWert;
      Inc(VorkommenDritterWert);
    end
    else if LErsterKartenWert = LVierterKartenWert then
    begin
      LVierterKartenWert := (AHand[I] as TKarte).KartenWert;
      Inc(VorkommenVierterWert);
    end;
  end;
  if (VorkommenErsterWert = 2) or (VorkommenZweiterWert = 2) or (VorkommenDritterWert = 2) or
    (VorkommenVierterWert = 2) then
  begin
    Result := True;
    if VorkommenErsterWert = 2 then
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LErsterKartenWert then
        begin
          ARemainingList.Add(AHand[I]);
          AHoechsterKartenwert := LErsterKartenWert;
        end;
      end;
    end
    else if VorkommenZweiterWert = 2 then
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LZweiterKartenWert then
        begin
          ARemainingList.Add(AHand[I]);
          AHoechsterKartenwert := LZweiterKartenWert;
        end;
      end;
    end
    else if VorkommenDritterWert = 2 then
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LDritterKartenWert then
        begin
          ARemainingList.Add(AHand[I]);
          AHoechsterKartenwert := LDritterKartenWert;
        end;
      end;
    end
    else //VorkommenVierterWert = 2
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LVierterKartenWert then
        begin
          ARemainingList.Add(AHand[I]);
          AHoechsterKartenwert := LVierterKartenWert;
        end;
      end;
    end;
  end;
end;

class function TKartenHelper.IsRoyalFlush(AHand: TObjectList): Boolean;
var
  LKartenFarbe: TKartenFarbe;
  I: Integer;
begin
  Result := False;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LKartenFarbe := (AHand[0] as TKarte).KartenFarbe;
  for I := 0 to AHand.Count - 1 do
  begin
    if (AHand[I] as TKarte).KartenFarbe <> LKartenFarbe then
      Exit;
    if not ((AHand[I] as TKarte).KartenWert in [kwZehn, kwBube, kwDame, kwKoenig, kwAss]) then
      Exit;
  end;
  Result := True;
end;

class function TKartenHelper.IsStraight(AHand: TObjectList;
  out AHoechsterKartenwert: TKartenWert): Boolean;
var
  LMinKartenWert, LMaxKartenWert: TKartenWert;
  I: Integer;
begin
  Result := False;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LMinKartenWert := (AHand[0] as TKarte).KartenWert;
  LMaxKartenWert := (AHand[0] as TKarte).KartenWert;
  for I := 0 to AHand.Count - 1 do
  begin
    if Ord((AHand[I] as TKarte).KartenWert) > Ord(LMaxKartenWert) then
      LMaxKartenWert := (AHand[I] as TKarte).KartenWert;
    if Ord((AHand[I] as TKarte).KartenWert) > Ord(LMinKartenWert) then
      LMinKartenWert := (AHand[I] as TKarte).KartenWert;
  end;
  if Ord(LMaxKartenWert) = Ord(LMinKartenWert) + 4 then
  begin
    Result := True;
    AHoechsterKartenwert := LMaxKartenWert;
  end;
end;

class function TKartenHelper.IsStraightFlush(AHand: TObjectList;
  out AHoechsterKartenwert: TKartenWert): Boolean;
var
  LKartenFarbe: TKartenFarbe;
  LMinKartenWert, LMaxKartenWert: TKartenWert;
  I: Integer;
begin
  Result := False;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LKartenFarbe := (AHand[0] as TKarte).KartenFarbe;
  LMinKartenWert := (AHand[0] as TKarte).KartenWert;
  LMaxKartenWert := (AHand[0] as TKarte).KartenWert;
  for I := 0 to AHand.Count - 1 do
  begin
    if (AHand[I] as TKarte).KartenFarbe <> LKartenFarbe then
      Exit;
    if Ord((AHand[I] as TKarte).KartenWert) > Ord(LMaxKartenWert) then
      LMaxKartenWert := (AHand[I] as TKarte).KartenWert;
    if Ord((AHand[I] as TKarte).KartenWert) > Ord(LMinKartenWert) then
      LMinKartenWert := (AHand[I] as TKarte).KartenWert;
  end;
  if Ord(LMaxKartenWert) = Ord(LMinKartenWert) + 4 then
  begin
    Result := True;
    AHoechsterKartenwert := LMaxKartenWert;
  end;
end;

class function TKartenHelper.IsThreeOfAKind(AHand: TObjectList;
  out ARemainingList: TObjectList; out AHoechsterKartenwert: TKartenWert): Boolean;
var
  LErsterKartenWert, LZweiterKartenWert, LDritterKartenWert: TKartenWert;
  I: Integer;
  VorkommenErsterWert, VorkommenZweiterWert, VorkommenDritterWert: Integer;
begin
  Result := False;
  ARemainingList.Clear;
  if (AHand.Count = 0) or (AHand.Count > 5) then
    Exit;
  LErsterKartenWert := (AHand[0] as TKarte).KartenWert;
  LZweiterKartenWert := (AHand[0] as TKarte).KartenWert;
  LDritterKartenWert := (AHand[0] as TKarte).KartenWert;
  VorkommenErsterWert := 0;
  VorkommenZweiterWert := 0;
  VorkommenDritterWert := 0;
  for I := 0 to AHand.Count - 1 do
  begin
    if (AHand[I] as TKarte).KartenWert = LErsterKartenWert then
      Inc(VorkommenErsterWert)
    else if (AHand[I] as TKarte).KartenWert = LZweiterKartenWert then
      Inc(VorkommenZweiterWert)
    else if (AHand[I] as TKarte).KartenWert = LDritterKartenWert then
      Inc(VorkommenDritterWert)
    else if LErsterKartenWert = LZweiterKartenWert then
    begin
      LZweiterKartenWert := (AHand[I] as TKarte).KartenWert;
      Inc(VorkommenZweiterWert);
    end
    else if LErsterKartenWert = LDritterKartenWert then
    begin
      LDritterKartenWert := (AHand[I] as TKarte).KartenWert;
      Inc(VorkommenDritterWert);
    end
  end;
  if (VorkommenErsterWert = 3) or (VorkommenZweiterWert = 3) or (VorkommenDritterWert = 3) then
  begin
    Result := True;
    if VorkommenErsterWert = 3 then
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LErsterKartenWert then
          ARemainingList.Add(AHand[I]);
        AHoechsterKartenwert := LErsterKartenWert;
      end;
    end
    else if VorkommenZweiterWert = 3 then
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LZweiterKartenWert then
          ARemainingList.Add(AHand[I]);
        AHoechsterKartenwert := LZweiterKartenWert;
      end;
    end
    else //VorkommenDritterWert = 3
    begin
      for I := 0 to AHand.Count - 1 do
      begin
        if (AHand[I] as TKarte).KartenWert <> LDritterKartenWert then
          ARemainingList.Add(AHand[I]);
        AHoechsterKartenwert := LDritterKartenWert;
      end;
    end;
  end;
end;

class function TKartenHelper.IsTwoPair(AHand: TObjectList; out ARemainingList: TObjectList;
  out AHoechsterKartenwert: TKartenWert): Boolean;
var
  RemainingList: TObjectList;
  LHoechsterKartenWert: TKartenWert;
begin
  RemainingList := TObjectList.Create(False);
  try
    Result := IsOnePair(AHand, RemainingList, AHoechsterKartenwert);
    Result := Result and IsOnePair(RemainingList, ARemainingList, LHoechsterKartenWert);
    if Ord(AHoechsterKartenwert) < Ord(LHoechsterKartenWert) then
      AHoechsterKartenwert := LHoechsterKartenWert;
  finally
    RemainingList.Free;
  end;
end;

{ TPlayer }

constructor TPlayer.Create(AMenschlicherSpieler: Boolean; ATksAnz: Integer);
begin
  FHand := TObjectList.Create(False);
  Inc(AktNummer);
  FNummer :=  AktNummer;
  FMenschlicherSpieler := AMenschlicherSpieler;
  FTksAnz := ATksAnz;
end;

destructor TPlayer.Destroy;
begin
  FHand.Free;
  inherited Destroy;
end;

{ TfrmMain }

procedure TfrmMain.actErklAnzExecute(Sender: TObject);
begin
  ErklaerungAnzeigen();
end;

procedure TfrmMain.AfterCreate(var Msg: TMessage);
begin

end;

procedure TfrmMain.AfterShow(var Msg: TMessage);
begin
  MessageDlg('Poker ist ein rundenbasiertes Spiel, bei welchem der Erfolg in hohem Maße vom Zufall abhängt. Mit diesem Programm darf nicht um Geld oder andere Wertgegenstände gespielt werden.' + sLineBreak +
    'Glücksbasiertes Spielen kann süchtig machen; Infos unter https://www.buwei.de - kostenfrei und anonym.' + sLineBreak + 'Alle Mitspieler*innen sind vor Spielbeginn darauf hinzuweisen.',
    TMsgDlgType.mtWarning, [mbOK], 0);
end;

procedure TfrmMain.Bewerten(out AMindestSpielerListe: TObjectList; out AHoechstSpielerListe: TObjectList; ATksAnwenden: Boolean);
var
  I: Integer;
  MinWert, MaxWert: Integer;
  Primaerwert, Sekundaerwert: Integer;
  CurrPlayer: TPlayer;
begin
  AMindestSpielerListe.Clear;
  AHoechstSpielerListe.Clear;
  for I := 0 to FPlayerList.Count - 1 do
  begin
    CurrPlayer := FPlayerList[I] as TPlayer;
    TDeck.HandBewerten(CurrPlayer.FHand, Primaerwert, Sekundaerwert);
    CurrPlayer.FHandValue := 100 * Primaerwert + Sekundaerwert;
  end;
  MinWert := 10000;
  MaxWert := -1;
  for I := 0 to FPlayerList.Count - 1 do
  begin
    CurrPlayer := FPlayerList[I] as TPlayer;
    if CurrPlayer.FHandValue < MinWert then
      MinWert := CurrPlayer.HandValue;
    if CurrPlayer.FHandValue > MaxWert then
      MaxWert := CurrPlayer.HandValue;
  end;
  for I := 0 to FPlayerList.Count - 1 do
  begin
    CurrPlayer := FPlayerList[I] as TPlayer;
    if CurrPlayer.FHandValue = MinWert then
    begin
      AMindestSpielerListe.Add(CurrPlayer);
      if ATksAnwenden and FSpielartAbsteigend then
        CurrPlayer.TksAnz := CurrPlayer.TksAnz - 1;
    end;
    if CurrPlayer.FHandValue = MaxWert then
    begin
      AHoechstSpielerListe.Add(CurrPlayer);
      if ATksAnwenden and not FSpielartAbsteigend then
        CurrPlayer.TksAnz := CurrPlayer.TksAnz + 1;
    end;
  end;
end;

procedure TfrmMain.btnErklClick(Sender: TObject);
begin
  ErklaerungAnzeigen();
end;

procedure TfrmMain.btnNaechsteRundeClick(Sender: TObject);
begin
  KartenGeben;
  //RundendetailsAnzeigen();
  KartenTauschen();
  RundendetailsAnzeigen();
  UpdateTksAnzeige();
  SpielendeNachTksEntfernen();
end;

procedure TfrmMain.btnSpielStartenClick(Sender: TObject);
var
  LAnzMeSp, LAnzCoSp: Integer;
  LTksAnz: Integer;
  I: Integer;
begin
  FPlayerList.Clear();
  AktNummer := 0;
  lblPlatzierung.Visible := False;
  with TfrmSpieldatenFestlegen.Create(nil) do
  begin
    try
      if ShowModal() <> mrOk then
      begin
        Exit;
        //Self.Close;
      end
      else
      begin
        LAnzMeSp := AnzMeSp;
        LAnzCoSp := AnzCoSp;
        FAnzTks := AnzTks;
        FSpielartAbsteigend := SpielverlaufAbsteigend;
        FMVSpWarAnz := MVSpWarAnz;
      end;
    finally
      Free;
    end;
  end;
  if FSpielartAbsteigend then
    AktPlatzierung := 6
  else
    AktPlatzierung := 0;
  lblTksUebersicht.Visible := True;
  FAnzMeSp := LAnzMeSp;
  lblAnzMeSp.Caption := IntToStr(LAnzMeSp);
  lblAnzCoSp.Caption := IntToStr(LAnzCoSp);
  lblAnzTks.Caption := IntToStr(FAnzTks);
  LTksAnz := 0;
  if FSpielartAbsteigend then
    LTksAnz := FAnzTks;
  InitializeDeck();
  for I := 0 to LAnzMeSp - 1 do
    FPlayerList.Add(TPlayer.Create(True, LTksAnz));
  for I := 0 to LAnzCoSp - 1 do
    FPlayerList.Add(TPlayer.Create(False, LTksAnz));
  FSpielLaufend := True;
  UpdateControls();
  InitTksSpAnzeige();
  UpdateTksAnzeige();
end;

procedure TfrmMain.btnSpielStoppenClick(Sender: TObject);
begin
  if MessageDlg('Aktuelles Spiel wirklich abbrechen?', TMsgDlgType.mtConfirmation, [mbYes, mbNo], 0) <> mrYes then
    Exit;
  FPlayerList.Clear;
  FSpielLaufend := False;
  UpdateControls();
end;

constructor TfrmMain.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  FPlayerList := TObjectList.Create(True);
  AktNummer := 0;
  FSpielLaufend := False;
end;

destructor TfrmMain.Destroy;
begin
  FPlayerList.Free;
  FDeck.Free;
  inherited Destroy;
end;

procedure TfrmMain.ErklaerungAnzeigen;
begin
  MessageDlg('Die hier gespielte Pokervariante funktioniert wie folgt: Pro Runde erhält jede*r Spieler*in fünf Karten. Danach kann jede Person auswählen, ob sie ' +
    'zwischen null und fünf Karten tauschen möchte; In diesem Fall werden die ausgewählten Karten hinten auf den Kartenstapel zurückgelegt, und die ausgewählte ' +
    'Anzahl an Karten wird nun vom Kartenstapel nachgezogen.' + sLineBreak + sLineBreak +
    'Das Pokerkartendeck enthält 52 Karten und besteht aus vier Farben (Karo, Pik, Herz, Kreuz), die in jeweils dreizehn Werten vorliegen: ' +
    '2, 3, 4, 5, 6, 7, 8, 9, 10, Bube, Dame, König, Ass (aufsteigend sortiert).' + sLineBreak +
    'Am Ende jeder Runde werden die Personen mit den meisten und den wenigsten Punkten ermittelt (je höher die Punktzahl desto besser). Die Ermittlung ' +
    'funktioniert folgendermaßen (absteigend sortiert von der höchsten zur niedrigsten Wertung):' + sLineBreak +
    'Royal Flush: Eine Folge von fünf Karten derselben Farbe, deren Werte sich jeweils um einen Punkt unterscheiden und das Ass beinhalten.' + sLineBreak +
    'Straight Flush: Eine Folge von fünf Karten derselben Farbe, deren Werte sich jeweils um einen Punkt unterscheiden.' + sLineBreak +
    'Four of a Kind: Vier Karten mit demselben Wert.' + sLineBreak +
    'Full House: Drei Karten mit dem gleichen Wert, und zwei Karten mit einem anderen, ebenfalls gleichen Wert (z.B. 3 x Ass und 2 x 4).' + sLineBreak +
    //'Straight Flush: Eine Folge von fünf Karten derselben Farbe, deren Werte sich jeweils um einen Punkt unterscheiden.' + sLineBreak +
    'Flush: Eine Folge von fünf Karten derselben Farbe.' + sLineBreak +
    'Straight: Eine Folge von fünf Karten, deren Werte sich jeweils um einen Punkt unterscheiden.' + sLineBreak +
    'Three of a Kind: Eine Folge von drei Karten derselben Farbe.' + sLineBreak +
    'Two Pair: Zwei Karten mit dem gleichen Wert, und zwei weitere Karten mit einem anderen, ebenfalls gleichen Wert (z.B. 2 x 6 und 2 x 9).' + sLineBreak +
    'One Pair: Zwei Karten mit demselben Wert.' + sLineBreak +
    'Highest Card: Die Karte mit dem höchsten Wert.' + sLineBreak +
    'Sind nicht alle Karten in einer Folge enthalten, dürfen die anderen beliebige Werte enthalten. Es zählt nur die Wertung mit der höchsten Punktzahl.' + sLineBreak +
    'Haben mehrere Personen dieselbe gewertete Folge, so wird die höchste Karte der gewerteten Folge verglichen und es gewinnt die Person mit der höchsten ' +
    'Karte (bzw. es verliert diejenige mit der niedrigsten Karte). Bleibt es bei einem Gleichstand, so gewinnen oder verlieren alle Personen mit derselben Wertung.',
    TMsgDlgType.mtInformation, [mbClose], 0);
end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_CREATE, 0, 0);
end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
  PostMessage(Self.Handle, WM_AFTER_SHOW, 0, 0);
end;

procedure TfrmMain.InitializeDeck;
begin
  if Assigned(FDeck) then
    FDeck.Free;
  FDeck := TDeck.Create;
  FDeck.Initialize();
end;

procedure TfrmMain.KartenGeben;
var
  I: Integer;
  TmpObjectList: TObjectList;
begin
  FDeck.Mischeln();
  //Counter := 0;
  for I := 0 to FPlayerList.Count - 1 do
  begin
    (FPlayerList[I] as TPlayer).Hand.Clear;
    TmpObjectList := (FPlayerList[I] as TPlayer).Hand;
    FDeck.KartenAusteilen(TmpObjectList, 5);
  end;
end;

procedure TfrmMain.KartenTauschen;
var
  Primaerwert, Sekundaerwert: Integer;
  I: Integer;
  RemainingList, TmpList: TObjectList;
  Ignore: TKartenWert;
  AKtSpieler: TPlayer;
  frmKartenTauschen: TfrmKartenTauschen;
begin
  for I := 0 to FPlayerList.Count - 1 do
  begin
    AKtSpieler := FPlayerList[I] as TPlayer;
    if AKtSpieler.FMenschlicherSpieler then
    begin
      if (FAnzMeSp > 1) and FMVSpWarAnz then
        MessageDlg('Spieler*in ' + IntToStr(AktSpieler.Nummer) + ' sieht als nächstes die Karten.', TMsgDlgType.mtInformation, [mbOK], 0);
      try
        frmKartenTauschen := TfrmKartenTauschen.Create(nil);
        frmKartenTauschen.SetData(AKtSpieler.Nummer,
          [TKartenHelper.GetKartenBezeichnung(AKtSpieler.Hand[0] as TKarte),
          TKartenHelper.GetKartenBezeichnung(AKtSpieler.Hand[1] as TKarte),
          TKartenHelper.GetKartenBezeichnung(AKtSpieler.Hand[2] as TKarte),
          TKartenHelper.GetKartenBezeichnung(AKtSpieler.Hand[3] as TKarte),
          TKartenHelper.GetKartenBezeichnung(AKtSpieler.Hand[4] as TKarte)]);
        frmKartenTauschen.ShowModal();
        RemainingList := TObjectList.Create(False);
        try
          if frmKartenTauschen.K1Tauschen then
            RemainingList.Add(AKtSpieler.Hand[0]);
          if frmKartenTauschen.K2Tauschen then
            RemainingList.Add(AKtSpieler.Hand[1]);
          if frmKartenTauschen.K3Tauschen then
            RemainingList.Add(AKtSpieler.Hand[2]);
          if frmKartenTauschen.K4Tauschen then
            RemainingList.Add(AKtSpieler.Hand[3]);
          if frmKartenTauschen.K5Tauschen then
            RemainingList.Add(AKtSpieler.Hand[4]);
          if RemainingList.Count > 0 then
          begin
            TmpList := AktSpieler.Hand;
            FDeck.KartenTauschen(TmpList, RemainingList);
            AKtSpieler.Hand := TmpList;
          end;
        finally
          RemainingList.Free;
        end;
      finally
        FreeAndNil(frmKartenTauschen);
      end;
      Continue;
    end;
    TDeck.HandBewerten(AKtSpieler.Hand, Primaerwert, Sekundaerwert);
    if Primaerwert >= 5 then
      Continue;
    if Primaerwert = 4 then //Three of a kind.
    begin
      RemainingList := TObjectList.Create(False);
      try
        TKartenHelper.IsThreeOfAKind(AKtSpieler.Hand, RemainingList, Ignore); //RemainingList kann kein Paar sein, ansonsten wäre es ein Full House.
        TmpList := AktSpieler.Hand;
        FDeck.KartenTauschen(TmpList, RemainingList);
        AKtSpieler.Hand := TmpList;
      finally
        RemainingList.Free;
      end;
    end;
    if Primaerwert = 3 then //Two pair.
    begin
      RemainingList := TObjectList.Create(False);
      try
        TKartenHelper.IsTwoPair(AKtSpieler.Hand, RemainingList, Ignore);
        TmpList := AktSpieler.Hand;
        FDeck.KartenTauschen(TmpList, RemainingList);
        AKtSpieler.Hand := TmpList;
      finally
        RemainingList.Free;
      end;
    end;
    if Primaerwert = 2 then //One pair.
    begin
      RemainingList := TObjectList.Create(False);
      try
        TKartenHelper.IsOnePair(AKtSpieler.Hand, RemainingList, Ignore);
        TmpList := AktSpieler.Hand;
        FDeck.KartenTauschen(TmpList, RemainingList);
        AKtSpieler.Hand := TmpList;
      finally
        RemainingList.Free;
      end;
    end;
    if Primaerwert = 1 then //Highest card.
    begin
      RemainingList := TObjectList.Create(False);
      try
        TKartenHelper.IsHighestCard(AKtSpieler.Hand, Ignore, RemainingList);
        TmpList := AktSpieler.Hand;
        FDeck.KartenTauschen(TmpList, RemainingList);
        AKtSpieler.Hand := TmpList;
      finally
        RemainingList.Free;
      end;
    end;
  end;
end;

procedure TfrmMain.RundendetailsAnzeigen;
var
  MinPlList, MaxPlList: TObjectList;
  frmKartenAnzeigen: TfrmKartenAnzeigen;
  I: Integer;
begin
  MinPlList := TObjectList.Create(False);
  MaxPlList := TObjectList.Create(False);
  try
    Bewerten(MinPlList, MaxPlList, True);
    frmKartenAnzeigen := TfrmKartenAnzeigen.Create(nil);
    try
      //frmKartenAnzeigen.SetzeSpielerAnzahl(FPlayerList.Count);
      for I := 0 to FPlayerList.Count - 1 do
      begin
        frmKartenAnzeigen.SetData((FPlayerList[I] as TPlayer).Nummer,
          [TKartenHelper.GetKartenBezeichnung((FPlayerList[I] as TPlayer).Hand[0] as TKarte),
          TKartenHelper.GetKartenBezeichnung((FPlayerList[I] as TPlayer).Hand[1] as TKarte),
          TKartenHelper.GetKartenBezeichnung((FPlayerList[I] as TPlayer).Hand[2] as TKarte),
          TKartenHelper.GetKartenBezeichnung((FPlayerList[I] as TPlayer).Hand[3] as TKarte),
          TKartenHelper.GetKartenBezeichnung((FPlayerList[I] as TPlayer).Hand[4] as TKarte)],
          MaxPlList.IndexOf(FPlayerList[I]) > -1, MinPlList.IndexOf(FPlayerList[I]) > -1);
      end;
      frmKartenAnzeigen.ShowModal;
    finally
      frmKartenAnzeigen.Free;
    end;
  finally
    MaxPlList.Free;
    MinPlList.Free;
  end;
end;

procedure TfrmMain.SetzePlatzierung(ABereitsPlatzierungAngepasst: Boolean;
  ASpieler: Byte {Index});
begin
  lblPlatzierung.Visible := True;
  if not ABereitsPlatzierungAngepasst then
  begin
    if FSpielartAbsteigend then
      Dec(AktPlatzierung)
    else
      Inc(AktPlatzierung);
  end;
  case ASpieler of
    1: lblAktPlzSp1.Caption := IntToStr(AktPlatzierung);
    2: lblAktPlzSp2.Caption := IntToStr(AktPlatzierung);
    3: lblAktPlzSp3.Caption := IntToStr(AktPlatzierung);
    4: lblAktPlzSp4.Caption := IntToStr(AktPlatzierung);
    5: lblAktPlzSp5.Caption := IntToStr(AktPlatzierung);
  end;
  case ASpieler of
    1: lblAktPlzSp1.Visible := True;
    2: lblAktPlzSp2.Visible := True;
    3: lblAktPlzSp3.Visible := True;
    4: lblAktPlzSp4.Visible := True;
    5: lblAktPlzSp5.Visible := True;
  end;
end;

procedure TfrmMain.SetzePlatzierungNachSpielende;
var
  I: Integer;
  AktPlatzierung: Integer;
begin
  if FSpielartAbsteigend then
    AktPlatzierung := 1
  else
    AktPlatzierung := AktNummer;
  for I := 1 to AktNummer do //-1?
  begin
    case I of
      1:
        begin
          if lblAktPlzSp1.Visible then
            Continue;
        end;
      2:
        begin
          if lblAktPlzSp2.Visible then
            Continue;
        end;
      3:
        begin
          if lblAktPlzSp3.Visible then
            Continue;
        end;
      4:
        begin
          if lblAktPlzSp4.Visible then
            Continue;
        end;
      5:
        begin
          if lblAktPlzSp5.Visible then
            Continue;
        end;
    end;
    case I of
      1: lblAktPlzSp1.Caption := IntToStr(AktPlatzierung);
      2: lblAktPlzSp2.Caption := IntToStr(AktPlatzierung);
      3: lblAktPlzSp3.Caption := IntToStr(AktPlatzierung);
      4: lblAktPlzSp4.Caption := IntToStr(AktPlatzierung);
      5: lblAktPlzSp5.Caption := IntToStr(AktPlatzierung);
    end;
    case I of
      1: lblAktPlzSp1.Visible := True;
      2: lblAktPlzSp2.Visible := True;
      3: lblAktPlzSp3.Visible := True;
      4: lblAktPlzSp4.Visible := True;
      5: lblAktPlzSp5.Visible := True;
    end;
  end;

end;

procedure TfrmMain.SpielendeNachTksEntfernen;
var
  I: Integer;
  UebersichtSps: string;
  LPlayer: TPlayer;
  BereitsPlatzierungAngepasst: Boolean;
begin
  if FSpielartAbsteigend then
    AktPlatzierung := FPlayerList.Count + 1
  {else
    AktPlatzierung := 6 - FPlayerList.Count};
  UebersichtSps := '';
  BereitsPlatzierungAngepasst := False;
  for I := FPlayerList.Count - 1 downto 0 do
  begin
    LPlayer := (FPlayerList[I] as TPlayer);
    if FSpielartAbsteigend and (LPlayer.TksAnz <= 0) then
    begin
      if UebersichtSps <>'' then
        UebersichtSps := UebersichtSps + ', ';
      UebersichtSps := UebersichtSps + IntToStr((FPlayerList[I] as TPlayer).Nummer);
      SetzePlatzierung(BereitsPlatzierungAngepasst, (FPlayerList[I] as TPlayer).Nummer);
      BereitsPlatzierungAngepasst := True;
      FPlayerList.Delete(I);
    end;
    if not FSpielartAbsteigend and ((FPlayerList[I] as TPlayer).TksAnz >= FAnzTks) then
    begin
      if UebersichtSps <>'' then
        UebersichtSps := UebersichtSps + ', ';
      UebersichtSps := UebersichtSps + IntToStr((FPlayerList[I] as TPlayer).Nummer);
      SetzePlatzierung(BereitsPlatzierungAngepasst, (FPlayerList[I] as TPlayer).Nummer);
      BereitsPlatzierungAngepasst := True;
      FPlayerList.Delete(I);
    end;
  end;
  if FPlayerList.Count = 0 then
  begin
    FSpielLaufend := False;
    UpdateControls();
    SetzePlatzierungNachSpielende();
    MessageDlg('Das Spiel ist beendet; Alle Spieler*innen haben entweder keine Tokens mehr oder den vordefinierten Wert erreicht.', TMsgDlgType.mtInformation, [mbOK], 0);
    Exit;
  end;
  if FPlayerList.Count = 1 then
  begin
    FSpielLaufend := False;
    UpdateControls();
    SetzePlatzierungNachSpielende();
    MessageDlg('Das Spiel ist beendet; Es verbleibt nur ein*e Spieler*in.', TMsgDlgType.mtInformation, [mbOK], 0);
    FPlayerList.Clear;
    Exit;
  end;
  if UebersichtSps <> '' then
  begin
    if FSpielartAbsteigend then
    begin
      if MessageDlg('Der/Die folgende(n) Spieler*innen besitzen keine Tokens mehr und nehmen nicht weiter am Spiel teil: ' + UebersichtSps + sLineBreak +
        'Soll das Spiel beendet werden?', TMsgDlgType.mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        FSpielLaufend := False;
        UpdateControls();
      end;
    end
    else
      if MessageDlg('Der/Die folgende(n) Spieler*innen haben die vorgesehene Tokenanzahl erreicht und nehmen nicht weiter am Spiel teil: ' + UebersichtSps + sLineBreak +
        'Soll das Spiel beendet werden?', TMsgDlgType.mtInformation, [mbYes, mbNo], 0) = mrYes then
      begin
        FSpielLaufend := False;
        UpdateControls();
      end;
  end;
end;

procedure TfrmMain.UpdateControls;
begin
  if FSpielLaufend then
  begin
    btnSpielStarten.Enabled := False;
    btnSpielStoppen.Enabled := True;
    btnNaechsteRunde.Enabled := True;
  end
  else
  begin
    btnSpielStarten.Enabled := True;
    btnSpielStoppen.Enabled := False;
    btnNaechsteRunde.Enabled := False;
  end;
end;

procedure TfrmMain.UpdateTksAnzeige;
var
  I: Integer;
begin
  for I := 0 to FPlayerList.Count - 1 do
  begin
    if (FplayerList[I] as TPlayer).Nummer = 1 then
      lblTksSp1.Caption := IntToStr((FplayerList[I] as TPlayer).TksAnz);
    if (FplayerList[I] as TPlayer).Nummer = 2 then
      lblTksSp2.Caption := IntToStr((FplayerList[I] as TPlayer).TksAnz);
    if (FplayerList[I] as TPlayer).Nummer = 3 then
      lblTksSp3.Caption := IntToStr((FplayerList[I] as TPlayer).TksAnz);
    if (FplayerList[I] as TPlayer).Nummer = 4 then
      lblTksSp4.Caption := IntToStr((FplayerList[I] as TPlayer).TksAnz);
    if (FplayerList[I] as TPlayer).Nummer = 5 then
      lblTksSp5.Caption := IntToStr((FplayerList[I] as TPlayer).TksAnz);
  end;
end;

procedure TfrmMain.InitTksSpAnzeige;
begin
  lblSp3.Visible := False;
  lblTksSp3.Visible := False;
  lblSp4.Visible := False;
  lblTksSp4.Visible := False;
  lblSp5.Visible := False;
  lblTksSp5.Visible := False;
  lblSp1.Visible := True;
  lblTksSp1.Visible := True;
  lblSp2.Visible := True;
  lblTksSp2.Visible := True;
  if FPlayerList.Count > 2 then
  begin
    lblSp3.Visible := True;
    lblTksSp3.Visible := True;
  end;
  if FPlayerList.Count > 3 then
  begin
    lblSp4.Visible := True;
    lblTksSp4.Visible := True;
  end;
  if FPlayerList.Count > 4 then
  begin
    lblSp5.Visible := True;
    lblTksSp5.Visible := True;
  end;
  lblAktPlzSp1.Visible := False;
  lblAktPlzSp2.Visible := False;
  lblAktPlzSp3.Visible := False;
  lblAktPlzSp4.Visible := False;
  lblAktPlzSp5.Visible := False;
end;

end.
