inherited frMant_Medida: TfrMant_Medida
  Caption = 'Mantenimiento Medidas'
  ClientHeight = 252
  ClientWidth = 456
  ExplicitWidth = 472
  ExplicitHeight = 291
  DesignSize = (
    456
    252)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParametros: TPanel
    inherited Image1: TImage
      Left = 311
      Height = 93
      ExplicitLeft = 311
      ExplicitHeight = 93
    end
    inherited edCodigo: TLabeledEdit
      Left = 68
      Top = 29
      EditLabel.Width = 64
      EditLabel.Caption = 'ID Medida'
      EditLabel.ExplicitLeft = 1
      EditLabel.ExplicitTop = 31
      EditLabel.ExplicitWidth = 64
      EditLabel.ExplicitHeight = 16
      OnKeyDown = edCodigoKeyDown
      OnKeyPress = edCodigoKeyPress
      ExplicitLeft = 68
      ExplicitTop = 29
    end
    inherited mk_Ci: TMaskEdit
      Visible = False
    end
    inherited pnAyuda: TPanel
      Left = 40
      Top = 53
      ExplicitLeft = 40
      ExplicitTop = 53
    end
  end
  inherited pnBody: TPanel
    Top = 99
    Height = 301
    ExplicitTop = 99
    ExplicitHeight = 301
    inherited edNombre: TLabeledEdit
      Top = 78
      EditLabel.ExplicitLeft = 16
      EditLabel.ExplicitTop = 82
      EditLabel.ExplicitWidth = 37
      Visible = False
      ExplicitTop = 78
    end
    inherited edApellido: TLabeledEdit
      Visible = False
    end
    inherited edDireccion: TLabeledEdit
      Top = 24
      Width = 29
      CharCase = ecNormal
      EditLabel.Width = 36
      EditLabel.Caption = 'Simbolo'
      EditLabel.ExplicitLeft = 237
      EditLabel.ExplicitTop = 28
      EditLabel.ExplicitWidth = 36
      OnKeyPress = edDireccionKeyPress
      ExplicitTop = 24
      ExplicitWidth = 29
    end
    inherited edCiudad: TLabeledEdit
      Visible = False
    end
    inherited edTelefono: TLabeledEdit
      Visible = False
    end
    inherited mk_Documento: TMaskEdit
      Top = 51
      Visible = False
      ExplicitTop = 51
    end
    object edDocumento: TLabeledEdit
      Left = 68
      Top = 24
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 37
      EditLabel.Height = 13
      EditLabel.Caption = 'Nombre'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Tahoma'
      Font.Style = []
      LabelPosition = lpLeft
      ParentFont = False
      TabOrder = 8
      OnKeyPress = edDocumentoKeyPress
    end
  end
  inherited pnPie: TPanel
    Left = -120
    Top = 202
    Width = 600
    Anchors = [akLeft, akTop, akRight]
    ExplicitLeft = -120
    ExplicitTop = 202
    ExplicitWidth = 600
    inherited btnActualizar: TButton
      OnClick = btnActualizarClick
    end
    inherited btnCancelar: TButton
      OnClick = btnCancelarClick
    end
  end
  inherited FDQuery1: TFDQuery
    AfterOpen = FDQuery1AfterOpen
    SQL.Strings = (
      'select * '
      'from medida'
      'where id=:paId')
    Left = 248
    Top = 32
    ParamData = <
      item
        Name = 'PAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object FDQuery1id: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object FDQuery1Nombre: TStringField
      FieldName = 'Nombre'
      Origin = 'Nombre'
      Required = True
    end
    object FDQuery1Simbolo: TStringField
      FieldName = 'Simbolo'
      Origin = 'Simbolo'
      Required = True
      Size = 5
    end
  end
end
