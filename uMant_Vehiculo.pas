unit uMant_Vehiculo;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase_Mantenimiento, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls,
  Vcl.DBCtrls;

type
  TfrMant_Vehiculo = class(TfrBase_Mantenimiento)
    txNom: TDBText;
    txDir: TDBText;
    txTel: TDBText;
    qrCliente: TFDQuery;
    suCliente: TDataSource;
    qrClienteid: TFDAutoIncField;
    qrClienteNombre: TStringField;
    qrClienteDireccion: TStringField;
    qrClienteTelefono: TStringField;
    Memo1: TMemo;
    Label1: TLabel;
    qrCodigoid: TFDAutoIncField;
    qrCodigoidCliente: TIntegerField;
    qrCodigoTipo: TStringField;
    qrCodigoMarca: TStringField;
    qrCodigoAnio: TStringField;
    qrCodigoDescripcion: TMemoField;
    edMatricula: TLabeledEdit;
    qrCodigoMatricula: TStringField;
    FDQuery2: TFDQuery;
    Panel1: TPanel;
    procedure edNombreKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure qrCodigoAfterOpen(DataSet: TDataSet);
    procedure edNombreKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edMatriculaKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure qrClienteAfterOpen(DataSet: TDataSet);
    procedure edDireccionKeyPress(Sender: TObject; var Key: Char);
    procedure edCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure edApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure edNombreMouseEnter(Sender: TObject);
    procedure edNombreMouseLeave(Sender: TObject);

  private
    { Private declarations }
    procedure IniPant;
  public
    { Public declarations }
  end;

var
  frMant_Vehiculo: TfrMant_Vehiculo;

implementation

{$R *.dfm}

uses uAyuda,uMensage,udm;

procedure TfrMant_Vehiculo.btnActualizarClick(Sender: TObject);
var
  lOk : Boolean;
  nId : Integer;

begin
  inherited;

  if ValDato(edMatricula) then
  begin



    Screen.Cursor := crHourGlass;
    TRY
      udm.con.MySQL.StartTransaction;
      TRY


        with udm.con.FDCommand1 do
        begin
          if qrCodigo.IsEmpty then
          begin
            nId := ProxId('vehiculo');
            CommandText.Text := 'Insert vehiculo ' +
                                '(id,Matricula,idCliente,Tipo,Marca,Anio,Descripcion) ' +
                                'Values ' +
                                '(:paId,:paM,:paCli,:paTip,:paMa,:paAn,:paDes)';
          end
          else
          begin
            nId := qrCodigoid.AsInteger;
            CommandText.Text := 'Update vehiculo ' +
                                'Set idCliente = :paCli, ' +
                                '    Tipo  = :paTip, ' +
                                '    Matricula = :paM,'+
                                '    Marca = :paMa,  ' +
                                '    Anio = :paAn,  ' +
                                '    Descripcion = :paDes  ' +
                                'Where id = :paId';
          end;

          ParamByName('paId').Value := nId;
          if edNombre.Text='' then
            ParamByName('paCli').Value := 0
          else
            ParamByName('paCli').Value := StrToInt(edNombre.Text);
          ParamByName('paTip').Value := edApellido.Text;
          ParamByName('paM').Value := edMatricula.Text;
          ParamByName('paMa').Value := edDireccion.Text;
          ParamByName('paAn').Value := edCiudad.Text;
          ParamByName('paDes').Value := Memo1.Text;

          Execute;

        end;
        udm.con.MySQL.Commit;
        MsgAviso('VEHICULO REGISTRADO CON ID : '+IntToStr(nId));
        IniPant;

        HabMant(False);
      EXCEPT
        On E:Exception do
        begin
          udm.con.MySQL.Rollback;
          MsgError('NO SE PUDO GUARDAR EL VEHICULO.'+E.Message);
        end;
      END;
    FINALLY
      Screen.Cursor := crDefault;
    END;

  end
  else
  begin
    MsgAviso('EL VEHICULO DEBE TENER UNA MATRICULA'+#10 +'QUE LO IDENTIFIQUE');
    edMatricula.SetFocus;
  end;

end;

procedure TfrMant_Vehiculo.btnCancelarClick(Sender: TObject);
begin
  inherited;

  IniPant;
  edCodigo.SetFocus;

end;

procedure TfrMant_Vehiculo.edApellidoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    Memo1.SetFocus;
  end;

end;

procedure TfrMant_Vehiculo.edCiudadKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edApellido.SetFocus;
  end;

end;

procedure TfrMant_Vehiculo.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key=112 then
    Ayuda('vehiculo',edCodigo);

end;

procedure TfrMant_Vehiculo.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

   if key=#13 then
  begin
    if edCodigo.Text<>'' then
    begin
      if qrOpen(qrCodigo,edCodigo) then
      begin
        HabMant(True);
        edMatricula.SetFocus;
      end
      else
      begin
        MsgError('CODIGO NO REGISTRADO');
        Abort;
      end;
    end
    else
    begin
      HabMant(True);
      edMatricula.SetFocus;
    end;

  end;

end;

procedure TfrMant_Vehiculo.edDireccionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edCiudad.SetFocus;
  end;

end;

procedure TfrMant_Vehiculo.edMatriculaKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    with FDQuery2 do
    begin
      Close;
      ParamByName('paM').Value := edMatricula.Text;
      Open;
    end;
    if not FDQuery2.IsEmpty then
      MsgError('�STA MATRICULA YA EXISTE EN LA BASE DE DATOS')
    else
      edNombre.SetFocus;
  end;


end;

procedure TfrMant_Vehiculo.edNombreKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key=112 then
    Ayuda('cliente',edNombre);

end;

procedure TfrMant_Vehiculo.edNombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    if edNombre.Text<>'' then
       qrOpen(qrCliente,edNombre);
  end;

end;




procedure TfrMant_Vehiculo.edNombreMouseEnter(Sender: TObject);
begin
  inherited;
  Panel1.Visible:=True;
end;

procedure TfrMant_Vehiculo.edNombreMouseLeave(Sender: TObject);
begin
  inherited;
  Panel1.Visible:=False;
end;

procedure TfrMant_Vehiculo.IniPant;
begin

  edMatricula.Clear;
  edNombre.Clear;
  edApellido.Clear;
  edCiudad.Clear;
  edTelefono.Clear;
  edDireccion.Clear;
  mk_Documento.Clear;
  Memo1.Clear;
  edCodigo.Clear;
  HabMant(False);
  qrCodigo.Close;
  qrCliente.Close;

end;


procedure TfrMant_Vehiculo.qrClienteAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if qrCliente.IsEmpty then
  begin
    MsgAviso('EL CLIENTE NO EST� REGISTRADO');
    edNombre.SetFocus;
  end
  else
    edDireccion.SetFocus;

end;

procedure TfrMant_Vehiculo.qrCodigoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if not qrCodigo.IsEmpty then
  begin
    HabMant(True);
    if (qrCodigoidCliente.AsString<>'') AND (qrCodigoidCliente.AsInteger<>0) then
    begin
      edNombre.Text := qrCodigoidCliente.AsString;
      qrOpen(qrCliente,edNombre);
    end;
    edMatricula.Text := qrCodigoMatricula.AsString;
    edApellido.Text := qrCodigoTipo.AsString;
    edDireccion.Text := qrCodigoMarca.Text;
    edCiudad.Text := qrCodigoAnio.AsString;
    Memo1.Text := Trim(qrCodigoDescripcion.AsString);
  end;

end;


end.
