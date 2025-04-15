object frmSpieldatenFestlegen: TfrmSpieldatenFestlegen
  Left = 0
  Top = 0
  Caption = 'Spieldaten festlegen'
  ClientHeight = 441
  ClientWidth = 429
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnCloseQuery = FormCloseQuery
  TextHeight = 15
  object lblAnzSpMe: TLabel
    Left = 16
    Top = 83
    Width = 184
    Height = 15
    Caption = 'Anzahl Spieler*innen (menschlich):'
  end
  object lblAnzSpCo: TLabel
    Left = 16
    Top = 120
    Width = 175
    Height = 15
    Caption = 'Anzahl Spieler*innen (computer):'
  end
  object lblErkl: TLabel
    Left = 16
    Top = 24
    Width = 397
    Height = 30
    Caption = 
      'Das Spiel ist f'#252'r mindestens zwei und maximal f'#252'nf Spieler*innen' +
      ' ausgelegt (menschliche und computerbasierte  zussammengez'#228'hlt).'
    WordWrap = True
  end
  object lblAnzCredits: TLabel
    Left = 16
    Top = 160
    Width = 291
    Height = 15
    Caption = 'Anzahl Tokens (Empfehlung: Werte zwischen 5 und 10):'
  end
  object edtSpMe: TEdit
    Left = 216
    Top = 80
    Width = 197
    Height = 23
    NumbersOnly = True
    TabOrder = 0
  end
  object edtSpCo: TEdit
    Left = 216
    Top = 117
    Width = 197
    Height = 23
    NumbersOnly = True
    TabOrder = 1
  end
  object btnOK: TButton
    Left = 338
    Top = 408
    Width = 75
    Height = 25
    Caption = '&OK'
    Default = True
    ModalResult = 1
    TabOrder = 6
  end
  object rbAbsteigend: TRadioButton
    Left = 16
    Top = 200
    Width = 397
    Height = 49
    Caption = 
      'Spielverlauf absteigend: Alle beginnen mit der festgelegten Toke' +
      'nanzahl. Der/Die Verlierer*in verliert pro Runde ein Token. Es g' +
      'ewinnt, wer als letztes '#252'brig bleibt.'
    Checked = True
    TabOrder = 3
    TabStop = True
    WordWrap = True
  end
  object rbAufsteigend: TRadioButton
    Left = 16
    Top = 272
    Width = 397
    Height = 49
    Caption = 
      'Spielverlauf aufsteigend: Alle beginnen mit 0 Token. Der/Die Gew' +
      'inner*in erh'#228'lt ein Token pro Runde. Es gewinnt, wer als erstes ' +
      'die festgelegte Tokenanzahl erreicht.'
    TabOrder = 4
    WordWrap = True
  end
  object edtAnzTokens: TEdit
    Left = 320
    Top = 157
    Width = 93
    Height = 23
    MaxLength = 3
    NumbersOnly = True
    TabOrder = 2
  end
  object cbWarnungVorMeSpKAnz: TCheckBox
    Left = 16
    Top = 344
    Width = 397
    Height = 41
    Caption = 
      'Warnung anzeigen, bevor der Kartentauschdialog angezeigt wird (D' +
      'amit andere Spielende wegschauen k'#246'nnen und so keinen Einblick i' +
      'n die Karten erhalten).'
    TabOrder = 5
    WordWrap = True
  end
end
