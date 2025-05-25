object frmMain: TfrmMain
  Left = 0
  Top = 0
  Caption = 'Poker'
  ClientHeight = 441
  ClientWidth = 624
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object lblErklaerung: TLabel
    Left = 24
    Top = 48
    Width = 568
    Height = 45
    Caption = 
      'Poker ist ein rundenbasiertes Spiel, bei welchem der Erfolg in h' +
      'ohem Ma'#223'e vom Zufall abh'#228'ngt. Mit diesem Programm darf nicht um ' +
      'Geld oder andere Wertgegenst'#228'nde gespielt werden.'#13#10'Gl'#252'cksbasiert' +
      'es Spielen kann s'#252'chtig machen; Infos unter https://www.buwei.de' +
      ' - kostenfrei und anonym.'
    WordWrap = True
  end
  object lblMeSp: TLabel
    Left = 24
    Top = 136
    Width = 185
    Height = 15
    Caption = 'Anzahl Menschliche Spieler*innen: '
  end
  object lblCoSp: TLabel
    Left = 24
    Top = 157
    Width = 208
    Height = 15
    Caption = 'Anzahl computerbasierte Spieler*innen:'
  end
  object lblAnzMeSp: TLabel
    Left = 248
    Top = 136
    Width = 6
    Height = 15
    Caption = '0'
  end
  object lblAnzCoSp: TLabel
    Left = 248
    Top = 157
    Width = 6
    Height = 15
    Caption = '0'
  end
  object lblTksText: TLabel
    Left = 24
    Top = 178
    Width = 128
    Height = 15
    Caption = 'Anzahl Tokens pro Spiel:'
  end
  object lblAnzTks: TLabel
    Left = 248
    Top = 178
    Width = 6
    Height = 15
    Caption = '0'
  end
  object lblTksUebersicht: TLabel
    Left = 443
    Top = 115
    Width = 76
    Height = 15
    Caption = 'Anzahl Tokens'
    Visible = False
  end
  object lblPlatzierung: TLabel
    Left = 525
    Top = 115
    Width = 62
    Height = 15
    Caption = 'Platzierung:'
    Visible = False
  end
  object btnNaechsteRunde: TButton
    Left = 490
    Top = 352
    Width = 97
    Height = 25
    Caption = '&N'#228'chste Runde'
    Default = True
    Enabled = False
    TabOrder = 2
    OnClick = btnNaechsteRundeClick
  end
  object btnErkl: TButton
    Left = 8
    Top = 8
    Width = 89
    Height = 25
    Caption = '&? - Spielprinzip'
    TabOrder = 3
    OnClick = btnErklClick
  end
  object btnSpielStarten: TButton
    Left = 8
    Top = 352
    Width = 89
    Height = 25
    Caption = '&Spiel beginnen'
    TabOrder = 0
    OnClick = btnSpielStartenClick
  end
  object Panel1: TPanel
    Left = 440
    Top = 136
    Width = 65
    Height = 145
    BevelOuter = bvNone
    TabOrder = 4
    object lblSp1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 7
      Width = 59
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = 'Spieler*in 1'
      Visible = False
      ExplicitLeft = 22
      ExplicitTop = 130
    end
    object lblSp2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 59
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = 'Spieler*in 2'
      Visible = False
      ExplicitWidth = 53
    end
    object lblSp3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 57
      Width = 59
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = 'Spieler*in 3'
      Visible = False
      ExplicitWidth = 53
    end
    object lblSp4: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 82
      Width = 59
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = 'Spieler*in 4'
      Visible = False
      ExplicitWidth = 53
    end
    object lblSp5: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 107
      Width = 59
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = 'Spieler*in 5'
      Visible = False
      ExplicitWidth = 53
    end
  end
  object Panel2: TPanel
    Left = 511
    Top = 136
    Width = 32
    Height = 145
    BevelOuter = bvNone
    TabOrder = 5
    object lblTksSp1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 7
      Width = 26
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = '0'
      Visible = False
      ExplicitWidth = 6
    end
    object lblTksSp2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 26
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = '0'
      Visible = False
      ExplicitWidth = 6
    end
    object lblTksSp3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 57
      Width = 26
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = '0'
      Visible = False
      ExplicitWidth = 6
    end
    object lblTksSp4: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 82
      Width = 26
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = '0'
      Visible = False
      ExplicitWidth = 6
    end
    object lblTksSp5: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 107
      Width = 26
      Height = 15
      Margins.Top = 7
      Align = alTop
      Caption = '0'
      Visible = False
      ExplicitWidth = 6
    end
  end
  object Panel3: TPanel
    Left = 549
    Top = 136
    Width = 20
    Height = 145
    BevelOuter = bvNone
    TabOrder = 6
    object lblAktPlzSp5: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 107
      Width = 6
      Height = 15
      Margins.Top = 7
      Caption = '0'
      Visible = False
    end
    object lblAktPlzSp4: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 82
      Width = 6
      Height = 15
      Margins.Top = 7
      Caption = '0'
      Visible = False
    end
    object lblAktPlzSp3: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 57
      Width = 6
      Height = 15
      Margins.Top = 7
      Caption = '0'
      Visible = False
    end
    object lblAktPlzSp2: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 32
      Width = 6
      Height = 15
      Margins.Top = 7
      Caption = '0'
      Visible = False
    end
    object lblAktPlzSp1: TLabel
      AlignWithMargins = True
      Left = 3
      Top = 7
      Width = 6
      Height = 15
      Margins.Top = 7
      Caption = '0'
      Visible = False
    end
  end
  object btnSpielStoppen: TButton
    Left = 128
    Top = 352
    Width = 89
    Height = 25
    Cancel = True
    Caption = 'S&piel beenden'
    Enabled = False
    TabOrder = 1
    OnClick = btnSpielStoppenClick
  end
  object ActionList1: TActionList
    Left = 584
    Top = 224
    object actErklAnz: TAction
      Caption = 'Erkl'#228'rung anzeigen'
      ShortCut = 112
      OnExecute = actErklAnzExecute
    end
    object actShowLogWindow: TAction
      Caption = 'Log-Fenster anzeigen'
      ShortCut = 49228
      OnExecute = actShowLogWindowExecute
    end
  end
end
