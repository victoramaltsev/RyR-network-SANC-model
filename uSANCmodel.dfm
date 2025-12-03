object Form1: TForm1
  Left = 0
  Top = 0
  Margins.Left = 7
  Margins.Top = 7
  Margins.Right = 7
  Margins.Bottom = 7
  Caption = 'SANC model with CRUs of various sizes with single RyR precision'
  ClientHeight = 619
  ClientWidth = 1548
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -17
  Font.Name = 'Tahoma'
  Font.Style = []
  Position = poDesigned
  OnCreate = FormCreate
  OnDestroy = FormDestroy
  PixelsPerInch = 144
  TextHeight = 21
  object Label16: TLabel
    Left = 570
    Top = 10
    Width = 152
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'dSTORM distribution'
  end
  object Label23: TLabel
    Left = 788
    Top = 9
    Width = 132
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Model distribution'
  end
  object Label31: TLabel
    Left = 788
    Top = 514
    Width = 93
    Height = 21
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Total RyRs='
  end
  object Label25: TLabel
    Left = 788
    Top = 491
    Width = 95
    Height = 21
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Total CRUs='
  end
  object Label42: TLabel
    Left = 788
    Top = 535
    Width = 110
    Height = 21
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Average CRU='
  end
  object Label21: TLabel
    Left = 570
    Top = 562
    Width = 81
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'RyR/um2='
  end
  object Label22: TLabel
    Left = 570
    Top = 514
    Width = 93
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Total RyRs='
  end
  object Label36: TLabel
    Left = 570
    Top = 491
    Width = 95
    Height = 21
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Total CRUs='
  end
  object Label40: TLabel
    Left = 570
    Top = 536
    Width = 110
    Height = 21
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Caption = 'Average CRU='
  end
  object Label53: TLabel
    Left = 788
    Top = 559
    Width = 81
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'RyR/um2='
  end
  object Label28: TLabel
    Left = 788
    Top = 584
    Width = 89
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Scaling Y = '
  end
  object Label12: TLabel
    Left = 1128
    Top = 570
    Width = 324
    Height = 21
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Histogram of RyR cluster sizes in the model'
  end
  object Chart1: TChart
    Left = 1031
    Top = 12
    Width = 498
    Height = 546
    Margins.Left = 7
    Margins.Top = 7
    Margins.Right = 7
    Margins.Bottom = 7
    Legend.Visible = False
    Title.Font.Style = [fsBold]
    Title.Text.Strings = (
      'CRU statistics')
    Title.Visible = False
    View3D = False
    View3DOptions.FontZoom = 151
    TabOrder = 0
    DefaultCanvas = 'TGDIPlusCanvas'
    ColorPaletteIndex = 13
    object Series1: TBarSeries
      HoverElement = []
      Marks.Visible = False
      XValues.Name = 'X'
      XValues.Order = loAscending
      YValues.Name = 'Bar'
      YValues.Order = loNone
    end
  end
  object GroupBox1: TGroupBox
    Left = 253
    Top = 9
    Width = 287
    Height = 325
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Set CRUs'
    Color = clSkyBlue
    ParentBackground = False
    ParentColor = False
    TabOrder = 1
    object Label7: TLabel
      Left = 10
      Top = 233
      Width = 173
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Loaded CRU model file:'
    end
    object Label8: TLabel
      Left = 10
      Top = 253
      Width = 38
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'None'
    end
    object Label4: TLabel
      Left = 7
      Top = 130
      Width = 167
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'New CRU Model Name'
    end
    object Label17: TLabel
      Left = 19
      Top = 57
      Width = 184
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'S_cell_mkm2 in dSTORM'
    end
    object Button7: TButton
      Left = 10
      Top = 279
      Width = 105
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Save model'
      TabOrder = 0
      OnClick = Button7Click
    end
    object Button8: TButton
      Left = 122
      Top = 279
      Width = 115
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Load model'
      TabOrder = 1
      OnClick = Button8Click
    end
    object Edit39: TEdit
      Left = 171
      Top = 25
      Width = 109
      Height = 29
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      TabOrder = 2
      Text = '52.562'
    end
    object Edit4: TEdit
      Left = 7
      Top = 154
      Width = 275
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 3
      Text = 'Model1.txt'
    end
    object CheckBox1: TCheckBox
      Left = 12
      Top = 30
      Width = 147
      Height = 17
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Fix RyRs/um2 ='
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object Edit31: TEdit
      Left = 9
      Top = 195
      Width = 273
      Height = 29
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      TabOrder = 5
      Text = 'C:\Users\Public\'
    end
    object Edit3: TEdit
      Left = 20
      Top = 88
      Width = 94
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 6
      Text = '304.3644'
    end
  end
  object GroupBox5: TGroupBox
    Left = 9
    Top = 9
    Width = 236
    Height = 304
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Simulation control'
    Color = clGold
    ParentBackground = False
    ParentColor = False
    TabOrder = 2
    object Label1: TLabel
      Left = 12
      Top = 155
      Width = 43
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Time:'
    end
    object Label3: TLabel
      Left = 9
      Top = 217
      Width = 96
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Duration, ms'
    end
    object Label6: TLabel
      Left = 14
      Top = 177
      Width = 110
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Compute time:'
    end
    object Button6: TButton
      Left = 7
      Top = 28
      Width = 118
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Create model'
      TabOrder = 0
      OnClick = Button6Click
    end
    object Button1: TButton
      Left = 134
      Top = 28
      Width = 86
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Run'
      Enabled = False
      TabOrder = 1
      OnClick = Button1Click
    end
    object Button11: TButton
      Left = 7
      Top = 70
      Width = 118
      Height = 36
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Stop'
      Enabled = False
      TabOrder = 2
      OnClick = Button11Click
    end
    object Edit2: TEdit
      Left = 108
      Top = 214
      Width = 112
      Height = 29
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      TabOrder = 3
      Text = '16000'
    end
    object Button18: TButton
      Left = 7
      Top = 249
      Width = 217
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Simulation Parameters'
      TabOrder = 4
      OnClick = Button18Click
    end
    object Button27: TButton
      Left = 134
      Top = 70
      Width = 86
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Continue'
      Enabled = False
      TabOrder = 5
      OnClick = Button27Click
    end
    object Button32: TButton
      Left = 77
      Top = 118
      Width = 81
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Re-Run'
      Enabled = False
      TabOrder = 6
      OnClick = Button32Click
    end
    object Button33: TButton
      Left = 7
      Top = 118
      Width = 67
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Halt'
      Enabled = False
      TabOrder = 7
      OnClick = Button33Click
    end
    object Button5: TButton
      Left = 158
      Top = 118
      Width = 61
      Height = 38
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Exit'
      TabOrder = 8
      OnClick = Button5Click
    end
  end
  object GroupBox6: TGroupBox
    Left = 253
    Top = 342
    Width = 287
    Height = 79
    Margins.Left = 4
    Margins.Top = 4
    Margins.Right = 4
    Margins.Bottom = 4
    Caption = 'Plot Vm'
    Color = clPink
    ParentBackground = False
    ParentColor = False
    TabOrder = 3
    object Label2: TLabel
      Left = 103
      Top = 27
      Width = 93
      Height = 21
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'sampling,ms'
    end
    object Edit1: TEdit
      Left = 205
      Top = 23
      Width = 75
      Height = 29
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      TabOrder = 0
      Text = '0.75'
    end
    object Button2: TButton
      Left = 7
      Top = 20
      Width = 84
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Vm Form'
      TabOrder = 1
      OnClick = Button2Click
    end
  end
  object Memo1: TMemo
    Left = 571
    Top = 34
    Width = 191
    Height = 445
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Lines.Strings = (
      '0'#9'0'
      '1'#9'0'
      '2'#9'0'
      '3'#9'50'
      '4'#9'48'
      '5'#9'39'
      '6'#9'136'
      '7'#9'92'
      '8'#9'70'
      '9'#9'81'
      '10'#9'51'
      '11'#9'44'
      '12'#9'40'
      '13'#9'31'
      '14'#9'28'
      '15'#9'29'
      '16'#9'32'
      '17'#9'24'
      '18'#9'21'
      '19'#9'23'
      '20'#9'18'
      '21'#9'13'
      '22'#9'13'
      '23'#9'5'
      '24'#9'9'
      '25'#9'6'
      '26'#9'7'
      '27'#9'5'
      '28'#9'5'
      '29'#9'5'
      '30'#9'5'
      '31'#9'5'
      '32'#9'1'
      '33'#9'8'
      '34'#9'10'
      '35'#9'3'
      '36'#9'2'
      '37'#9'2'
      '38'#9'4'
      '39'#9'5'
      '40'#9'2'
      '41'#9'2'
      '42'#9'3'
      '43'#9'2'
      '44'#9'3'
      '45'#9'2'
      '46'#9'4'
      '47'#9'1'
      '48'#9'1'
      '49'#9'3'
      '50'#9'3'
      '51'#9'0'
      '52'#9'1'
      '53'#9'3'
      '54'#9'2'
      '55'#9'1'
      '56'#9'0'
      '57'#9'2'
      '58'#9'2'
      '59'#9'0'
      '60'#9'0'
      '61'#9'2'
      '62'#9'2'
      '63'#9'1'
      '64'#9'2'
      '65'#9'1'
      '66'#9'0'
      '67'#9'1'
      '68'#9'1'
      '69'#9'0'
      '70'#9'2'
      '71'#9'2'
      '72'#9'1'
      '73'#9'1'
      '74'#9'1'
      '75'#9'2'
      '76'#9'1'
      '77'#9'0'
      '78'#9'0'
      '79'#9'1'
      '80'#9'0'
      '81'#9'1'
      '82'#9'0'
      '83'#9'0'
      '84'#9'0'
      '85'#9'0'
      '86'#9'1'
      '87'#9'0'
      '88'#9'1'
      '89'#9'1'
      '90'#9'0'
      '91'#9'0'
      '92'#9'1'
      '93'#9'0'
      '94'#9'1'
      '95'#9'0'
      '96'#9'0'
      '97'#9'1'
      '98'#9'0'
      '99'#9'1'
      '100'#9'0'
      '101'#9'0'
      '102'#9'0'
      '103'#9'1'
      '104'#9'0'
      '105'#9'0'
      '106'#9'0'
      '107'#9'0'
      '108'#9'0'
      '109'#9'0'
      '110'#9'0'
      '111'#9'0'
      '112'#9'0'
      '113'#9'0'
      '114'#9'0'
      '115'#9'0'
      '116'#9'0'
      '117'#9'0'
      '118'#9'0'
      '119'#9'0'
      '120'#9'0'
      '121'#9'2'
      '122'#9'0'
      '123'#9'0'
      '124'#9'0'
      '125'#9'0'
      '126'#9'0'
      '127'#9'0'
      '128'#9'1'
      '129'#9'1'
      '130'#9'0'
      '131'#9'0'
      '132'#9'0'
      '133'#9'0'
      '134'#9'0'
      '135'#9'0'
      '136'#9'0'
      '137'#9'0'
      '138'#9'0'
      '139'#9'0'
      '140'#9'0'
      '141'#9'0'
      '142'#9'0'
      '143'#9'0'
      '144'#9'0'
      '145'#9'0'
      '146'#9'0'
      '147'#9'0'
      '148'#9'0'
      '149'#9'0'
      '150'#9'0'
      '151'#9'0'
      '152'#9'0'
      '153'#9'0'
      '154'#9'0'
      '155'#9'0'
      '156'#9'0'
      '157'#9'0'
      '158'#9'0'
      '159'#9'0'
      '160'#9'0'
      '161'#9'0'
      '162'#9'0'
      '163'#9'0'
      '164'#9'0'
      '165'#9'0'
      '166'#9'0'
      '167'#9'0'
      '168'#9'0'
      '169'#9'0'
      '170'#9'0'
      '171'#9'0'
      '172'#9'0'
      '173'#9'0'
      '174'#9'0'
      '175'#9'0'
      '176'#9'0'
      '177'#9'0'
      '178'#9'0'
      '179'#9'0'
      '180'#9'0'
      '181'#9'0'
      '182'#9'0'
      '183'#9'0'
      '184'#9'0'
      '185'#9'1')
    ScrollBars = ssVertical
    TabOrder = 4
  end
  object Memo3: TMemo
    Left = 770
    Top = 34
    Width = 229
    Height = 445
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    ScrollBars = ssVertical
    TabOrder = 5
  end
  object GroupBox2: TGroupBox
    Left = 10
    Top = 317
    Width = 234
    Height = 274
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Image control'
    Color = clInfoBk
    ParentBackground = False
    ParentColor = False
    TabOrder = 6
    object Label5: TLabel
      Left = 98
      Top = 106
      Width = 108
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'JSR Max (mM)'
    end
    object Label9: TLabel
      Left = 85
      Top = 206
      Width = 114
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Pixels per voxel'
    end
    object Label10: TLabel
      Left = 101
      Top = 171
      Width = 121
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Casub Max (uM)'
    end
    object Label11: TLabel
      Left = 101
      Top = 137
      Width = 117
      Height = 21
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      Caption = 'Casub Min (uM)'
    end
    object Edit10: TEdit
      Left = 15
      Top = 101
      Width = 78
      Height = 29
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 0
      Text = '0.3'
    end
    object Edit5: TEdit
      Left = 15
      Top = 202
      Width = 63
      Height = 29
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 1
      Text = '4'
    end
    object Edit7: TEdit
      Left = 15
      Top = 166
      Width = 81
      Height = 29
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 2
      Text = '10'
    end
    object Edit8: TEdit
      Left = 14
      Top = 130
      Width = 81
      Height = 29
      Margins.Left = 4
      Margins.Top = 4
      Margins.Right = 4
      Margins.Bottom = 4
      TabOrder = 3
      Text = '0.15'
    end
    object CheckBox2: TCheckBox
      Left = 12
      Top = 68
      Width = 165
      Height = 26
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Show Ca each sec'
      TabOrder = 4
    end
    object Button3: TButton
      Left = 8
      Top = 28
      Width = 121
      Height = 37
      Margins.Left = 7
      Margins.Top = 7
      Margins.Right = 7
      Margins.Bottom = 7
      Caption = 'Show Images'
      TabOrder = 5
      OnClick = Button3Click
    end
    object Button4: TButton
      Left = 131
      Top = 29
      Width = 81
      Height = 36
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'reset'
      TabOrder = 6
      OnClick = Button4Click
    end
  end
  object GroupBox3: TGroupBox
    Left = 254
    Top = 430
    Width = 286
    Height = 161
    Margins.Left = 5
    Margins.Top = 5
    Margins.Right = 5
    Margins.Bottom = 5
    Caption = 'Beta-adrenergic stimulatin'
    Color = clCream
    ParentBackground = False
    ParentColor = False
    TabOrder = 7
    object Label24: TLabel
      Left = 19
      Top = 70
      Width = 76
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'Onset, ms'
    end
    object Label13: TLabel
      Left = 23
      Top = 107
      Width = 81
      Height = 21
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = '% to apply'
    end
    object CheckBox3: TCheckBox
      Left = 19
      Top = 28
      Width = 256
      Height = 25
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      Caption = 'beta adrenergic stimulation'
      TabOrder = 0
    end
    object Edit22: TEdit
      Left = 121
      Top = 63
      Width = 138
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 1
      Text = '0'
    end
    object Edit23: TEdit
      Left = 121
      Top = 103
      Width = 138
      Height = 29
      Margins.Left = 5
      Margins.Top = 5
      Margins.Right = 5
      Margins.Bottom = 5
      TabOrder = 2
      Text = '100'
    end
  end
  object OpenDialog1: TOpenDialog
    Left = 1389
    Top = 14
  end
end
