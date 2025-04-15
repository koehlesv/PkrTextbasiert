object frmKartenTauschen: TfrmKartenTauschen
  Left = 0
  Top = 0
  Caption = 'Karten tauschen'
  ClientHeight = 257
  ClientWidth = 590
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  Position = poScreenCenter
  TextHeight = 15
  object lblErkl: TLabel
    Left = 31
    Top = 32
    Width = 624
    Height = 30
    Caption = 
      'Es k'#246'nnen 0-5 Karten getauscht werden - f'#252'r diese Karten werden ' +
      'die n'#228'chsten Karten des Kartenstapels nachgezogen. Dies ist ein ' +
      'Mal pro Runde pro Spieler*in m'#246'glich.'
    WordWrap = True
  end
  object Panel1: TPanel
    Left = 31
    Top = 88
    Width = 522
    Height = 41
    BevelOuter = bvNone
    TabOrder = 0
    object lblK13: TLabel
      Left = 264
      Top = 11
      Width = 34
      Height = 15
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Caption = 'Label1'
    end
    object lblK11: TLabel
      Left = 110
      Top = 11
      Width = 34
      Height = 15
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Caption = 'Label1'
    end
    object lblK15: TLabel
      Left = 526
      Top = 11
      Width = 34
      Height = 15
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Caption = 'Label1'
    end
    object lblK14: TLabel
      Left = 341
      Top = 11
      Width = 34
      Height = 15
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Caption = 'Label1'
    end
    object lblK12: TLabel
      Left = 187
      Top = 11
      Width = 34
      Height = 15
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Caption = 'Label1'
    end
    object lblSp: TLabel
      Left = 0
      Top = 11
      Width = 50
      Height = 15
      Margins.Left = 15
      Margins.Top = 10
      Margins.Right = 20
      Margins.Bottom = 10
      Caption = 'Spieler*in'
    end
  end
  object btnTauschenUndFortsetzen: TButton
    Left = 31
    Top = 215
    Width = 154
    Height = 25
    Caption = '&Tauschen bzw. Fortsetzen'
    ModalResult = 1
    TabOrder = 6
  end
  object cbTauschen1: TCheckBox
    Left = 141
    Top = 152
    Width = 20
    Height = 17
    TabOrder = 1
  end
  object cbTauschen2: TCheckBox
    Left = 218
    Top = 152
    Width = 20
    Height = 17
    TabOrder = 2
  end
  object cbTauschen3: TCheckBox
    Left = 295
    Top = 152
    Width = 20
    Height = 17
    TabOrder = 3
  end
  object cbTauschen4: TCheckBox
    Left = 372
    Top = 152
    Width = 20
    Height = 17
    TabOrder = 4
  end
  object cbTauschen5: TCheckBox
    Left = 449
    Top = 152
    Width = 20
    Height = 17
    TabOrder = 5
  end
end
