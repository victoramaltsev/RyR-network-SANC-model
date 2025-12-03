object fParams: TfParams
  Left = 0
  Top = 0
  Margins.Left = 5
  Margins.Top = 5
  Margins.Right = 5
  Margins.Bottom = 5
  Caption = 'Parameter set module'
  ClientHeight = 535
  ClientWidth = 1239
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -18
  Font.Name = 'Tahoma'
  Font.Style = []
  PixelsPerInch = 144
  TextHeight = 22
  object Label30: TLabel
    Left = 816
    Top = 3
    Width = 157
    Height = 22
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Parameter summary'
  end
  object Memo4: TMemo
    Left = 728
    Top = 37
    Width = 499
    Height = 486
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    ScrollBars = ssVertical
    TabOrder = 0
  end
  object GroupBox1: TGroupBox
    Left = 296
    Top = 7
    Width = 420
    Height = 255
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Computation'
    Color = clMoneyGreen
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label7: TLabel
      Left = 72
      Top = 61
      Width = 207
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'NTicks_Diffu2D_Ring_FSR'
    end
    object Label8: TLabel
      Left = 74
      Top = 139
      Width = 205
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'NTicks_Diffu_FSR_to_JSR'
    end
    object Label9: TLabel
      Left = 22
      Top = 99
      Width = 257
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'NTicks_Diffu_Ring_to_Core_FSR'
    end
    object Label10: TLabel
      Left = 14
      Top = 180
      Width = 265
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '  NTicks_Diffu_Ring_to_Core_Cyt'
    end
    object Label11: TLabel
      Left = 152
      Top = 220
      Width = 127
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '  NTicks_SERCA'
    end
    object Label27: TLabel
      Left = 174
      Top = 15
      Width = 105
      Height = 22
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'TimeTick, ms'
    end
    object Edit5: TEdit
      Left = 294
      Top = 53
      Width = 105
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 0
      Text = '5'
    end
    object Edit6: TEdit
      Left = 294
      Top = 93
      Width = 105
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Text = '1'
    end
    object Edit7: TEdit
      Left = 294
      Top = 133
      Width = 105
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 2
      Text = '10'
    end
    object Edit8: TEdit
      Left = 294
      Top = 175
      Width = 105
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 3
      Text = '10'
    end
    object Edit9: TEdit
      Left = 294
      Top = 215
      Width = 105
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 4
      Text = '5'
    end
    object Edit10: TEdit
      Left = 294
      Top = 12
      Width = 105
      Height = 30
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      TabOrder = 5
      Text = '0.0075'
    end
  end
  object GroupBox2: TGroupBox
    Left = 296
    Top = 268
    Width = 420
    Height = 253
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Spark activation/termination'
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object Label1: TLabel
      Left = 72
      Top = 77
      Width = 158
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'CRU_Casens, mM ='
    end
    object Label2: TLabel
      Left = 86
      Top = 118
      Width = 144
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'CRU_ProbConst ='
    end
    object Label3: TLabel
      Left = 43
      Top = 40
      Width = 187
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'CRU_ProbPower, mM ='
    end
    object Label33: TLabel
      Left = 9
      Top = 198
      Width = 167
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ispark_termination ='
    end
    object Label14: TLabel
      Left = 69
      Top = 163
      Width = 202
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Ispark_activation_tau_ms'
    end
    object Label4: TLabel
      Left = 278
      Top = 199
      Width = 102
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'x I_one_RyR'
    end
    object Edit1: TEdit
      Left = 240
      Top = 77
      Width = 157
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 0
      Text = '0.00015'
    end
    object Edit2: TEdit
      Left = 240
      Top = 119
      Width = 157
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Text = '0.00027'
    end
    object Edit3: TEdit
      Left = 240
      Top = 37
      Width = 157
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 2
      Text = '3'
    end
    object Edit25: TEdit
      Left = 186
      Top = 195
      Width = 83
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 3
      Text = '1'
    end
    object Edit14: TEdit
      Left = 292
      Top = 159
      Width = 105
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 4
      Text = '10'
    end
  end
  object GroupBox4: TGroupBox
    Left = 10
    Top = 10
    Width = 275
    Height = 180
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'SERCA and ICaL'
    Color = clSilver
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label17: TLabel
      Left = 17
      Top = 41
      Width = 95
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Pup mM/ms'
    end
    object Label18: TLabel
      Left = 16
      Top = 80
      Width = 91
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'gCaL nS/pF'
    end
    object Label5: TLabel
      Left = 17
      Top = 120
      Width = 92
      Height = 22
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Frac Cav1.3'
    end
    object Edit12: TEdit
      Left = 121
      Top = 34
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 0
      Text = '0.012'
    end
    object Edit13: TEdit
      Left = 121
      Top = 74
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Text = '0.464'
    end
    object Edit4: TEdit
      Left = 121
      Top = 116
      Width = 107
      Height = 30
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 2
      Text = '0.5'
    end
  end
end
