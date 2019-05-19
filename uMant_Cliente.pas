unit uMant_Cliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uBase_Mantenimiento, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, FireDAC.Stan.Async, FireDAC.DApt,
  Datasnap.Provider, Datasnap.DBClient, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.ComCtrls, Vcl.Mask, Vcl.ExtCtrls;

type
  TfrMant_Cliente = class(TfrBase_Mantenimiento)
    qrCodigoid: TFDAutoIncField;
    qrCodigoCI: TStringField;
    qrCodigoNombre: TStringField;
    qrCodigoApellido: TStringField;
    qrCodigoDireccion: TStringField;
    qrCodigoCiudad: TStringField;
    qrCodigoTelefono: TStringField;
    edDocumento: TLabeledEdit;
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure qrCodigoAfterOpen(DataSet: TDataSet);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnActualizarClick(Sender: TObject);
    procedure mk_DocumentoKeyPress(Sender: TObject; var Key: Char);
    procedure edNombreKeyPress(Sender: TObject; var Key: Char);
    procedure edApellidoKeyPress(Sender: TObject; var Key: Char);
    procedure edDireccionKeyPress(Sender: TObject; var Key: Char);
    procedure edCiudadKeyPress(Sender: TObject; var Key: Char);
    procedure edTelefonoKeyPress(Sender: TObject; var Key: Char);
    procedure qrCodigoAfterClose(DataSet: TDataSet);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDocumentoKeyPress(Sender: TObject; var Key: Char);

  private
    { Private declarations }
    procedure IniPant;
  public
    { Public declarations }
  end;

var
  frMant_Cliente: TfrMant_Cliente;

implementation

{$R *.dfm}
uses udm,uAyuda,uMensage;
procedure TfrMant_Cliente.btnActualizarClick(Sender: TObject);
var
  lOk : Boolean;
  nId : Integer;

begin
  inherited;

  lOk := ValDato(edDocumento);
  if not lOk then
  begin
    MsgError('AGREGAR DOCUMENTO PARA IDENTIFICAR AL CLIENTE');
    lOk := False;
    edDocumento.SetFocus;
  end
  else if lOk then
  begin
    lOk := ValDato(edApellido);
    if not lOk then
    begin
      MsgError('AGREGAR APELLIDO PARA IDENTIFICAR AL CLIENTE');
      lOk := False;
      edApellido.SetFocus;
    end
  end;




  if lOk then
  begin
    Screen.Cursor := crHourGlass;
    TRY
      udm.con.MySQL.StartTransaction;
      TRY


        with udm.con.FDCommand1 do
        begin
          if qrCodigo.IsEmpty then
          begin
            nId := ProxId('cliente');
            CommandText.Text := 'Insert cliente ' +
                                '(id,CI,Nombre,Apellido,Direccion,Ciudad,Telefono) ' +
                                'Values ' +
                                '(:paId,:paCi,:paNom,:paAp,:paDir,:paCiu,:paTel)';
          end
          else
          begin
            nId := qrCodigoid.AsInteger;
            CommandText.Text := 'Update cliente ' +
                                'Set CI = :paCi, ' +
                                '    Nombre  = :paNom, ' +
                                '    Apellido = :paAp,  ' +
                                '    Direccion = :paDir,  ' +
                                '    Ciudad = :paCiu,  ' +
                                '    Telefono = :paTel  ' +
                                'Where id = :paId';
          end;

          ParamByName('paId').Value := nId;
          ParamByName('paCi').Value := edDocumento.Text;
          ParamByName('paNom').Value := edNombre.Text;
          ParamByName('paAp').Value := edApellido.Text;
          ParamByName('paDir').Value := edDireccion.Text;
          ParamByName('paCiu').Value := edCiudad.Text;
          ParamByName('paTel').Value := edTelefono.Text;
          Execute;

        end;
        udm.con.MySQL.Commit;
        MsgAviso('CLIENTE REGISTRADO CON ID : '+IntToStr(nId));
        IniPant;
      EXCEPT
        On E:Exception do
        begin
          udm.con.MySQL.Rollback;
          MsgError('NO SE PUDO GUARDAR EL CLIENTE.'+E.Message);
        end;
      END;
    FINALLY
      Screen.Cursor := crDefault;
    END;

  end;


end;

procedure TfrMant_Cliente.btnCancelarClick(Sender: TObject);
begin
  inherited;

  IniPant;
  edCodigo.SetFocus;

end;

procedure TfrMant_Cliente.edApellidoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edDireccion.SetFocus;
  end;

end;



procedure TfrMant_Cliente.edCiudadKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edTelefono.SetFocus;
  end;

end;

procedure TfrMant_Cliente.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key=112 then
    Ayuda('cliente',edCodigo);



end;

procedure TfrMant_Cliente.edCodigoKeyPress(Sender: TObject; var Key: Char);
var
  lOk : Boolean;
begin
  inherited;

  if key=#13 then
  begin
    if edCodigo.Text<>'' then
    begin
      if qrOpen(qrCodigo,edCodigo) then
      begin
        HabMant(True);
        edNombre.SetFocus;
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
      edDocumento.SetFocus;
    end;

  end;
end;


procedure TfrMant_Cliente.edDireccionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edCiudad.SetFocus;
  end;

end;

procedure TfrMant_Cliente.edDocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edNombre.SetFocus;
  end;

end;

procedure TfrMant_Cliente.edNombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edApellido.SetFocus;
  end;

end;

procedure TfrMant_Cliente.edTelefonoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    btnActualizar.SetFocus;
  end;

end;

procedure TfrMant_Cliente.IniPant;
begin


  edNombre.Clear;
  edApellido.Clear;
  edCiudad.Clear;
  edTelefono.Clear;
  edDireccion.Clear;
  mk_Documento.Clear;
  edDocumento.Clear;
  edCodigo.Clear;
  HabMant(False);
  qrCodigo.Close;



end;

procedure TfrMant_Cliente.mk_DocumentoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edNombre.SetFocus;
  end;

end;


procedure TfrMant_Cliente.qrCodigoAfterClose(DataSet: TDataSet);
begin
  inherited;

   edCodigo.SetFocus;

end;

procedure TfrMant_Cliente.qrCodigoAfterOpen(DataSet: TDataSet);
begin
  inherited;

  if not qrCodigo.IsEmpty then
  begin
    edDocumento.Text := qrCodigoCI.AsString;
    edNombre.Text := qrCodigoNombre.AsString;
    edApellido.Text := qrCodigoApellido.AsString;
    edCiudad.Text := qrCodigoCiudad.AsString;
    edTelefono.Text := qrCodigoTelefono.AsString;
    edDireccion.Text := qrCodigoDireccion.AsString;
  end;

end;

end.
