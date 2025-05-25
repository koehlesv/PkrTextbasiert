unit LogFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,
  GlobalObjectHolder;

type
  TfrmLog = class(TForm)
    memoLogAusgabe: TMemo;
    btnClose: TButton;
    pnlButtons: TPanel;
    btnClearMemo: TButton;
    procedure btnCloseClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnClearMemoClick(Sender: TObject);
  private
    { Private-Deklarationen }
  public
    { Public-Deklarationen }
    procedure AddLogText(const AText: string);
  end;

implementation

{$R *.dfm}

procedure TfrmLog.AddLogText(const AText: string);
begin
  memoLogAusgabe.Lines.Add(AText);
end;

procedure TfrmLog.btnClearMemoClick(Sender: TObject);
begin
  memoLogAusgabe.Clear;
end;

procedure TfrmLog.btnCloseClick(Sender: TObject);
begin
  Self.Close;
end;

procedure TfrmLog.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  LogwindowIsShown := False;
  Action := caFree;
end;

end.
