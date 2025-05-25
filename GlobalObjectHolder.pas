unit GlobalObjectHolder;

interface

uses Vcl.Forms;

type
  TLogwindowVerwalter = class(TObject)
  public
    class procedure AddLogtextIfShown(const AText: string);
  end;

var
  LogwindowIsShown: Boolean = False;
  Logwindow: TForm;

implementation

uses
  LogFrm;

{ TLogwindowVerwalter }

class procedure TLogwindowVerwalter.AddLogtextIfShown(const AText: string);
begin
  if LogwindowIsShown then
  begin
    (Logwindow as TfrmLog).AddLogText(AText);
  end;
end;

end.
