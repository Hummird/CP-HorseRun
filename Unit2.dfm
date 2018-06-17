object Form2: TForm2
  Left = 98
  Top = 177
  BorderStyle = bsSingle
  Caption = 'Game'
  ClientHeight = 433
  ClientWidth = 1057
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object Panel1: TPanel
    Left = 0
    Top = 0
    Width = 1057
    Height = 433
    Align = alCustom
    Locked = True
    TabOrder = 0
    object PaintBox1: TPaintBox
      Left = 56
      Top = 8
      Width = 825
      Height = 105
    end
    object Label1: TLabel
      Left = 960
      Top = 152
      Width = 57
      Height = 13
      Caption = 'Your money'
    end
    object Label2: TLabel
      Left = 960
      Top = 168
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label3: TLabel
      Left = 960
      Top = 200
      Width = 56
      Height = 13
      Caption = 'Current bet'
    end
    object Label4: TLabel
      Left = 960
      Top = 216
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label5: TLabel
      Left = 960
      Top = 296
      Width = 23
      Height = 13
      Caption = 'Wins'
    end
    object Label6: TLabel
      Left = 960
      Top = 312
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label7: TLabel
      Left = 960
      Top = 344
      Width = 27
      Height = 13
      Caption = 'Loses'
    end
    object Label8: TLabel
      Left = 960
      Top = 360
      Width = 6
      Height = 13
      Caption = '0'
    end
    object Label9: TLabel
      Left = 960
      Top = 248
      Width = 56
      Height = 13
      Caption = 'Bet on a '#185
    end
    object Label10: TLabel
      Left = 960
      Top = 264
      Width = 6
      Height = 13
      Caption = '0'
    end
    object PaintBox2: TPaintBox
      Left = 56
      Top = 112
      Width = 825
      Height = 105
    end
    object PaintBox3: TPaintBox
      Left = 56
      Top = 216
      Width = 825
      Height = 105
    end
    object PaintBox4: TPaintBox
      Left = 56
      Top = 320
      Width = 825
      Height = 105
    end
    object Label11: TLabel
      Left = 8
      Top = 8
      Width = 35
      Height = 77
      Caption = '1'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label12: TLabel
      Left = 8
      Top = 112
      Width = 35
      Height = 77
      Caption = '2'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label13: TLabel
      Left = 8
      Top = 216
      Width = 35
      Height = 77
      Caption = '3'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label14: TLabel
      Left = 8
      Top = 320
      Width = 35
      Height = 77
      Caption = '4'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentFont = False
    end
    object Label15: TLabel
      Left = 896
      Top = 8
      Width = 33
      Height = 61
      Caption = 'F'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label16: TLabel
      Left = 896
      Top = 72
      Width = 24
      Height = 69
      Caption = 'I'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label17: TLabel
      Left = 896
      Top = 136
      Width = 43
      Height = 69
      Caption = 'N'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label18: TLabel
      Left = 896
      Top = 208
      Width = 24
      Height = 69
      Caption = 'I'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label19: TLabel
      Left = 888
      Top = 288
      Width = 36
      Height = 69
      Caption = 'S'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Label20: TLabel
      Left = 888
      Top = 360
      Width = 43
      Height = 65
      Caption = 'H'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -64
      Font.Name = 'Tahoma'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      Layout = tlCenter
      WordWrap = True
    end
    object Button1: TButton
      Left = 960
      Top = 104
      Width = 89
      Height = 25
      Caption = 'Exit to menu'
      TabOrder = 3
      OnClick = Button1Click
    end
    object Button2: TButton
      Left = 960
      Top = 8
      Width = 89
      Height = 25
      Caption = 'Start'
      TabOrder = 0
      OnClick = Button2Click
    end
    object Button3: TButton
      Left = 960
      Top = 40
      Width = 89
      Height = 25
      Caption = 'Settings'
      TabOrder = 1
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 960
      Top = 72
      Width = 89
      Height = 25
      Caption = 'Pause'
      TabOrder = 2
      OnClick = Button4Click
    end
  end
  object Timer1: TTimer
    Enabled = False
    Interval = 10
    OnTimer = Timer1Timer
    Left = 1016
    Top = 376
  end
end
