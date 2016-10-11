object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 766
  ClientWidth = 1045
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object DBGrid1: TDBGrid
    Left = 0
    Top = 0
    Width = 1045
    Height = 654
    Align = alClient
    DataSource = DataSource1
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -13
    Font.Name = 'Tahoma'
    Font.Style = []
    ParentFont = False
    TabOrder = 0
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWindowText
    TitleFont.Height = -11
    TitleFont.Name = 'Tahoma'
    TitleFont.Style = []
    Columns = <
      item
        Expanded = False
        FieldName = 'Personnummer'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'Tahoma'
        Font.Style = [fsBold]
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Produktbeskrivning'
        Width = 226
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'eRemissTid'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'BokadTid'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Tahoma'
        Font.Style = []
        Width = 141
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Signerad'
        Width = 150
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'RemL'#228'kare'
        Width = 151
        Visible = True
      end
      item
        Expanded = False
        FieldName = 'Signerande'
        Visible = True
      end>
  end
  object StatusBar1: TStatusBar
    Left = 0
    Top = 654
    Width = 1045
    Height = 112
    Panels = <>
  end
  object Button1: TButton
    Left = 939
    Top = 733
    Width = 75
    Height = 25
    Caption = '&Uppdatera'
    TabOrder = 2
    OnClick = Button1Click
  end
  object RadioGroup1: TRadioGroup
    Left = 8
    Top = 680
    Width = 185
    Height = 78
    Caption = 'Urval'
    TabOrder = 3
  end
  object RadioButtonM: TRadioButton
    Left = 24
    Top = 710
    Width = 113
    Height = 17
    Caption = 'M'#229'nad'
    TabOrder = 4
    OnClick = RadioButtonMClick
  end
  object RadioButtonV: TRadioButton
    Left = 24
    Top = 733
    Width = 113
    Height = 17
    Caption = 'Vecka'
    TabOrder = 5
    OnClick = RadioButtonVClick
  end
  object DBNavigator1: TDBNavigator
    Left = 774
    Top = 660
    Width = 240
    Height = 25
    DataSource = DataSource1
    TabOrder = 6
  end
  object PafConnection: TFDConnection
    Params.Strings = (
      'ConnectionDef=PAF')
    LoginPrompt = False
    Left = 506
    Top = 77
  end
  object DataSource1: TDataSource
    DataSet = FDQuery1
    Left = 504
    Top = 168
  end
  object FDQuery1: TFDQuery
    Connection = PafConnection
    SQL.Strings = (
      
        '-- =============================================================' +
        '============='
      
        '-- =============================================================' +
        '============='
      
        '-- SQL fr'#229'ga avsedd att visa de senaste unders'#246'kningarna som bes' +
        't'#228'llts av hj'#228'rtmottagningen'
      '-- Datum: 2016-09-27'
      '-- Utvecklad av: Niklas Storck'
      '-- epost: niklas.storck@capiostgoran.se; niklas@family-storck.se'
      '-- Telefon: 0736-841 220'
      '--'
      '-- Revisioner:'
      '--'
      
        '-- =============================================================' +
        '============='
      
        '-- =============================================================' +
        '============='
      ''
      'use fyspaf'
      'SELECT '
      
        #9'   --REMTAB.REMISSNR as Remissnummer, -- Vill jag ha med f'#246'r sp' +
        #229'rbarheten till en enskild patient i PAF'
      #9'   REMTAB.pnr as Personnummer,'
      #9'   '
      #9'   PRODTAB.KTXT as Produktbeskrivning,'
      #9'   PWRemissTab.best_datumtid as eRemissTid,'
      #9'   pattab.bokaddatumtid as BokadTid,'
      #9'   PATTAB.SIGNKLARTDATUMTID as Signerad,'
      #9'   PATTAB.BESTLAK as RemL'#228'kare,'
      '       IIF(PATTAB.MODMASK = '#39#197#39','#39#197'ters'#228'nd remiss'#39','#39#39'), '
      #9'   -- PATTAB.MODMASK,'
      #9'   '
      '       PATTAB.SIGNLAK as Signerande'
      #9'   '
      #9'   '
      #9'   '
      
        '-- Joinsatserna h'#228'r beh'#246'ver kollas och beror rimligen p'#229' hur dat' +
        'abasen '#228'r uppbyggd.'
      
        '-- Jag har lagt till Prodtab f'#246'r att f'#229' unders'#246'kningstyperna i k' +
        'lartext /NS 2015-05-07'
      '-- Koppla '#228'ven fyweb'
      
        'FROM ((((REMTAB join PATTAB ON  PATTAB.REMISSNR = REMTAB.REMISSN' +
        'R) '
      '        left join PRODTAB on  REMTAB.PRODKOD = PRODTAB.PRODKOD) '
      
        #9#9'left join Fysweb.dbo.PWRemissTab on  RemissNrLab = REMTAB.REMI' +
        'SSNR) '
      #9#9'left join BESTTAB on BESTTAB.ID = REMTAB.BEST) '
      #9#9'left join PERSONTAB on PATTAB.PNR = PERSONTAB.PNR'
      ''
      ''
      '--where PWRemissTab.best_datumtid >= '#39'2016-06-01'#39' '
      ''
      
        'where PATTAB.SIGNKLARTDATUMTID >= GetDate() - 2 and REMTAB.BEST ' +
        '= '#39'10011 101 m03'#39' '
      '--and PATTAB.MODMASK <> '#39#197#39
      'order by REMTAB.pnr')
    Left = 640
    Top = 208
  end
end
