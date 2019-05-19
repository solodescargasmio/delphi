inherited frMant_Vehiculo: TfrMant_Vehiculo
  BorderStyle = bsSingle
  Caption = 'Mntenimiento Vehiculo'
  ClientHeight = 447
  ClientWidth = 547
  ExplicitWidth = 553
  ExplicitHeight = 476
  DesignSize = (
    547
    447)
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnParametros: TPanel
    Width = 721
    Height = 95
    ExplicitWidth = 721
    ExplicitHeight = 95
    DesignSize = (
      721
      95)
    inherited Image1: TImage
      Left = 385
      Top = 8
      Height = 89
      ExplicitLeft = 385
      ExplicitTop = 8
      ExplicitHeight = 89
    end
    inherited edCodigo: TLabeledEdit
      Left = 88
      Top = 29
      EditLabel.Width = 72
      EditLabel.Caption = 'ID Vehiculo'
      EditLabel.ExplicitLeft = 13
      EditLabel.ExplicitTop = 31
      EditLabel.ExplicitWidth = 72
      EditLabel.ExplicitHeight = 16
      OnKeyDown = edCodigoKeyDown
      OnKeyPress = edCodigoKeyPress
      ExplicitLeft = 88
      ExplicitTop = 29
    end
    inherited mk_Ci: TMaskEdit
      Visible = False
    end
    inherited pnAyuda: TPanel
      Left = 56
      Top = 56
      ExplicitLeft = 56
      ExplicitTop = 56
    end
  end
  inherited pnBody: TPanel
    Left = -16
    Top = 88
    Width = 724
    Height = 313
    ExplicitLeft = -16
    ExplicitTop = 88
    ExplicitWidth = 724
    ExplicitHeight = 313
    object txNom: TDBText [0]
      Left = 160
      Top = 96
      Width = 209
      Height = 17
      DataField = 'Nombre'
      DataSource = suCliente
    end
    object txDir: TDBText [1]
      Left = 160
      Top = 119
      Width = 209
      Height = 17
      DataField = 'Direccion'
      DataSource = suCliente
    end
    object txTel: TDBText [2]
      Left = 160
      Top = 143
      Width = 209
      Height = 17
      DataField = 'Telefono'
      DataSource = suCliente
    end
    object Label1: TLabel [3]
      Left = 28
      Top = 185
      Width = 54
      Height = 13
      Caption = 'Descripcion'
    end
    inherited edNombre: TLabeledEdit
      Left = 104
      Top = 93
      Width = 25
      EditLabel.Width = 47
      EditLabel.Caption = 'ID Cliente'
      EditLabel.ExplicitLeft = 54
      EditLabel.ExplicitTop = 97
      EditLabel.ExplicitWidth = 47
      NumbersOnly = True
      OnKeyDown = edNombreKeyDown
      OnKeyPress = edNombreKeyPress
      OnMouseEnter = edNombreMouseEnter
      OnMouseLeave = edNombreMouseLeave
      ExplicitLeft = 104
      ExplicitTop = 93
      ExplicitWidth = 25
    end
    inherited edApellido: TLabeledEdit
      Left = 416
      Top = 123
      EditLabel.Width = 34
      EditLabel.Caption = 'Modelo'
      EditLabel.ExplicitLeft = 379
      EditLabel.ExplicitTop = 127
      EditLabel.ExplicitWidth = 34
      TabOrder = 4
      OnKeyPress = edApellidoKeyPress
      ExplicitLeft = 416
      ExplicitTop = 123
    end
    inherited edDireccion: TLabeledEdit
      Left = 417
      Top = 32
      EditLabel.Width = 29
      EditLabel.Caption = 'Marca'
      EditLabel.ExplicitLeft = 385
      EditLabel.ExplicitTop = 36
      EditLabel.ExplicitWidth = 29
      TabOrder = 1
      OnKeyPress = edDireccionKeyPress
      ExplicitLeft = 417
      ExplicitTop = 32
    end
    inherited edCiudad: TLabeledEdit
      Left = 416
      Top = 79
      Width = 47
      EditLabel.Width = 19
      EditLabel.Caption = 'A'#241'o'
      EditLabel.ExplicitLeft = 394
      EditLabel.ExplicitTop = 83
      EditLabel.ExplicitWidth = 19
      MaxLength = 4
      TabOrder = 2
      OnKeyPress = edCiudadKeyPress
      ExplicitLeft = 416
      ExplicitTop = 79
      ExplicitWidth = 47
    end
    inherited edTelefono: TLabeledEdit
      Left = 492
      Top = 59
      Width = 46
      EditLabel.ExplicitLeft = 447
      EditLabel.ExplicitTop = 63
      EditLabel.ExplicitWidth = 42
      TabOrder = 3
      Visible = False
      ExplicitLeft = 492
      ExplicitTop = 59
      ExplicitWidth = 46
    end
    inherited mk_Documento: TMaskEdit
      Left = 248
      Top = 277
      TabOrder = 6
      Visible = False
      ExplicitLeft = 248
      ExplicitTop = 277
    end
    inherited DateTimePicker1: TDateTimePicker
      Left = 233
      Top = 16
      TabOrder = 7
      ExplicitLeft = 233
      ExplicitTop = 16
    end
    inherited DateTimePicker2: TDateTimePicker
      Left = 233
      Top = 16
      TabOrder = 8
      ExplicitLeft = 233
      ExplicitTop = 16
    end
    object Memo1: TMemo
      Left = 88
      Top = 185
      Width = 449
      Height = 89
      Lines.Strings = (
        '')
      TabOrder = 5
    end
    object edMatricula: TLabeledEdit
      Left = 104
      Top = 32
      Width = 121
      Height = 21
      CharCase = ecUpperCase
      EditLabel.Width = 43
      EditLabel.Height = 13
      EditLabel.Caption = 'Matricula'
      LabelPosition = lpLeft
      TabOrder = 9
      OnKeyPress = edMatriculaKeyPress
    end
    object Panel1: TPanel
      Left = 72
      Top = 115
      Width = 105
      Height = 37
      Caption = '&F1 Ayuda'
      Color = clInfoBk
      ParentBackground = False
      TabOrder = 10
      Visible = False
    end
  end
  inherited pnPie: TPanel
    Top = 392
    Width = 594
    Height = 55
    ExplicitTop = 392
    ExplicitWidth = 594
    ExplicitHeight = 55
    inherited btnActualizar: TButton
      Left = 419
      Top = 15
      Anchors = [akTop, akRight]
      OnClick = btnActualizarClick
      ExplicitLeft = 419
      ExplicitTop = 15
    end
    inherited btnCancelar: TButton
      Left = 509
      Top = 15
      Anchors = [akTop, akRight]
      OnClick = btnCancelarClick
      ExplicitLeft = 509
      ExplicitTop = 15
    end
  end
  inherited qrCodigo: TFDQuery
    AfterOpen = qrCodigoAfterOpen
    SQL.Strings = (
      'select * '
      'from vehiculo'
      'where id=:paId')
    object qrCodigoid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrCodigoidCliente: TIntegerField
      FieldName = 'idCliente'
      Origin = 'idCliente'
      Required = True
    end
    object qrCodigoTipo: TStringField
      FieldName = 'Tipo'
      Origin = 'Tipo'
      Required = True
      Size = 50
    end
    object qrCodigoMarca: TStringField
      FieldName = 'Marca'
      Origin = 'Marca'
      Required = True
      Size = 50
    end
    object qrCodigoAnio: TStringField
      FieldName = 'Anio'
      Origin = 'Anio'
      Required = True
      Size = 4
    end
    object qrCodigoDescripcion: TMemoField
      FieldName = 'Descripcion'
      Origin = 'Descripcion'
      Required = True
      BlobType = ftMemo
    end
    object qrCodigoMatricula: TStringField
      FieldName = 'Matricula'
      Origin = 'Matricula'
      Required = True
      Size = 10
    end
  end
  inherited FDQuery1: TFDQuery
    Left = 312
    Top = 144
  end
  inherited DataSource1: TDataSource
    Left = 296
    Top = 296
  end
  object qrCliente: TFDQuery
    AfterOpen = qrClienteAfterOpen
    Connection = con.Mysql
    SQL.Strings = (
      'select id,concat(Nombre,'#39' '#39',Apellido) as Nombre,'
      'concat(Direccion,'#39' '#39',Ciudad) as Direccion,Telefono '
      'from cliente'
      'where id=:paId')
    Left = 184
    Top = 160
    ParamData = <
      item
        Name = 'PAID'
        DataType = ftInteger
        ParamType = ptInput
        Value = Null
      end>
    object qrClienteid: TFDAutoIncField
      FieldName = 'id'
      Origin = 'id'
      ProviderFlags = [pfInWhere, pfInKey]
      ReadOnly = True
    end
    object qrClienteNombre: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Nombre'
      Origin = 'Nombre'
      ProviderFlags = []
      ReadOnly = True
      Size = 101
    end
    object qrClienteDireccion: TStringField
      AutoGenerateValue = arDefault
      FieldName = 'Direccion'
      Origin = 'Direccion'
      ProviderFlags = []
      ReadOnly = True
      Size = 101
    end
    object qrClienteTelefono: TStringField
      FieldName = 'Telefono'
      Origin = 'Telefono'
      Required = True
      Size = 50
    end
  end
  object suCliente: TDataSource
    DataSet = qrCliente
    Left = 184
    Top = 224
  end
  object FDQuery2: TFDQuery
    Connection = con.Mysql
    SQL.Strings = (
      'select * from vehiculo'
      'where Matricula= :paM')
    Left = 240
    Top = 144
    ParamData = <
      item
        Name = 'PAM'
        DataType = ftString
        ParamType = ptInput
        Value = Null
      end>
  end
end
