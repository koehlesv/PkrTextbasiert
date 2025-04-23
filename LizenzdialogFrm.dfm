object frmLizenzdialog: TfrmLizenzdialog
  Left = 0
  Top = 0
  Caption = 'Lizenzdialog'
  ClientHeight = 517
  ClientWidth = 837
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnCreate = FormCreate
  OnShow = FormShow
  TextHeight = 15
  object Memo1: TMemo
    AlignWithMargins = True
    Left = 20
    Top = 20
    Width = 797
    Height = 385
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Align = alTop
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object cbLizenzGelesenUndAkzeptiert: TCheckBox
    AlignWithMargins = True
    Left = 20
    Top = 428
    Width = 797
    Height = 17
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Align = alTop
    Caption = 
      'Ich habe die Lizenzbedingungen gelesen, verstanden und akzeptier' +
      'e diese.'
    TabOrder = 1
    OnClick = cbLizenzGelesenUndAkzeptiertClick
  end
  object btnBeenden: TButton
    AlignWithMargins = True
    Left = 20
    Top = 468
    Width = 193
    Height = 29
    Margins.Left = 20
    Margins.Top = 20
    Margins.Bottom = 20
    Align = alLeft
    Cancel = True
    Caption = '&Programm beenden'
    TabOrder = 2
    OnClick = btnBeendenClick
  end
  object btnLizenzAkzeptieren: TButton
    AlignWithMargins = True
    Left = 624
    Top = 468
    Width = 193
    Height = 29
    Margins.Left = 20
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alRight
    Caption = '&Lizenzbestimmungen akzeptieren'
    Default = True
    Enabled = False
    ModalResult = 1
    TabOrder = 5
  end
  object btnLIzenzSpeichern: TButton
    AlignWithMargins = True
    Left = 291
    Top = 468
    Width = 119
    Height = 29
    Margins.Left = 75
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alLeft
    Caption = 'Lizenz &speichern...'
    TabOrder = 3
    OnClick = btnLIzenzSpeichernClick
  end
  object btnLizenzDrucken: TButton
    AlignWithMargins = True
    Left = 430
    Top = 468
    Width = 108
    Height = 29
    Margins.Left = 0
    Margins.Top = 20
    Margins.Right = 20
    Margins.Bottom = 20
    Align = alLeft
    Caption = 'Lizenz &drucken...'
    TabOrder = 4
    WordWrap = True
    OnClick = btnLizenzDruckenClick
  end
  object ActionList1: TActionList
    Left = 8
    Top = 264
    object actLizenzSpeichern: TAction
      Caption = 'Lizenz speichern'
      ShortCut = 16467
      OnExecute = actLizenzSpeichernExecute
    end
    object actLizenzDrucken: TAction
      Caption = 'Lizenz drucken'
      ShortCut = 16464
      OnExecute = actLizenzDruckenExecute
    end
  end
end
