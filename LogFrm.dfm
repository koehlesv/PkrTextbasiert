object frmLog: TfrmLog
  Left = 0
  Top = 0
  Caption = 'Log'
  ClientHeight = 549
  ClientWidth = 410
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = 'Segoe UI'
  Font.Style = []
  OnClose = FormClose
  TextHeight = 15
  object memoLogAusgabe: TMemo
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 404
    Height = 502
    Align = alClient
    ReadOnly = True
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object pnlButtons: TPanel
    Left = 0
    Top = 508
    Width = 410
    Height = 41
    Align = alBottom
    BevelOuter = bvNone
    TabOrder = 1
    object btnClose: TButton
      AlignWithMargins = True
      Left = 332
      Top = 7
      Width = 75
      Height = 27
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alRight
      Cancel = True
      Caption = '&Schlie'#223'en'
      ModalResult = 8
      TabOrder = 0
      OnClick = btnCloseClick
    end
    object btnClearMemo: TButton
      AlignWithMargins = True
      Left = 3
      Top = 7
      Width = 75
      Height = 27
      Margins.Top = 7
      Margins.Bottom = 7
      Align = alLeft
      Caption = '&Leeren'
      ModalResult = 8
      TabOrder = 1
      OnClick = btnClearMemoClick
      ExplicitLeft = 332
    end
  end
end
