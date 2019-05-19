unit uMant_Material;

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
  TfrMant_Material = class(TfrBase_Mantenimiento)
    Panel1: TPanel;
    FDQuery1id: TIntegerField;
    FDQuery1Nombre: TStringField;
    FDQuery1idMedida: TIntegerField;
    txMedida: TDBText;
    qrMedida: TFDQuery;
    suMedida: TDataSource;
    qrMedidaid: TIntegerField;
    qrMedidaNombre: TStringField;
    qrMedidaSimbolo: TStringField;
    procedure btnActualizarClick(Sender: TObject);
    procedure edCodigoChange(Sender: TObject);
    procedure edDireccionMouseLeave(Sender: TObject);
    procedure edDireccionMouseEnter(Sender: TObject);
    procedure edDireccionKeyPress(Sender: TObject; var Key: Char);
    procedure edCodigoKeyPress(Sender: TObject; var Key: Char);
    procedure FDQuery1AfterOpen(DataSet: TDataSet);
    procedure edCodigoKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure edDireccionKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure btnCancelarClick(Sender: TObject);
    procedure edNombreKeyPress(Sender: TObject; var Key: Char);
    procedure edDireccionChange(Sender: TObject);

  private
    { Private declarations }
    procedure CargoConsulta;
    procedure IniPant;
  public
    { Public declarations }
  end;

var
  frMant_Material: TfrMant_Material;

implementation

{$R *.dfm}

uses udm,uAyuda,uMensage;

procedure TfrMant_Material.btnActualizarClick(Sender: TObject);
var
  nId:Integer;
  lOk:Boolean;
begin
  inherited;

  lOk := ValDato(edNombre);
  if not lOk then
  begin
    MsgError('NOMBRE NO PUEDE SER VACIO');
    edNombre.SetFocus;
    Abort;
  end
  else
    lOk := ValDato(edDireccion);

  if not lOk then
  begin
    MsgError('SELECCIONE UNA MEDIDA');
    edDireccion.SetFocus;
    Abort;
  end;
  if qrMedida.IsEmpty then
  begin
    MsgError('SELECCIONE UNA MEDIDA');
    edDireccion.SetFocus;
    Abort;
  end;


  if lOk then
  begin
    Screen.Cursor := crHourGlass;
    TRY
      udm.con.MySQL.StartTransaction;
      TRY


        with udm.con.FDCommand1 do
        begin
          if FDQuery1.IsEmpty then
          begin
            nId := ProxId('material');
            CommandText.Text := 'Insert material ' +
                                '(id,Nombre,idMedida) ' +
                                'Values ' +
                                '(:paId,:paNom,:paIdM)';
          end
          else
          begin
            nId := FDQuery1id.AsInteger;
            CommandText.Text := 'Update material ' +
                                'Set Nombre  = :paNom, ' +
                                '    idMedida  = :paIdM ' +
                                'Where id = :paId';
          end;

          ParamByName('paId').Value := nId;
          ParamByName('paNom').Value := edNombre.Text;
          ParamByName('paIdM').Value := qrMedidaid.AsInteger;
          Execute;

        end;
        udm.con.MySQL.Commit;
        MsgAviso('MATERIAL REGISTRADO CON ID : '+IntToStr(nId));
        IniPant;

      EXCEPT
        On E:Exception do
        begin
          udm.con.MySQL.Rollback;
          MsgError('NO SE PUDO REGISTRAR EL MATERIAL.'+E.Message);
        end;
      END;
    FINALLY
      Screen.Cursor := crDefault;
    END;

  end
end;

procedure TfrMant_Material.btnCancelarClick(Sender: TObject);
begin
  inherited;

  IniPant;

end;

procedure TfrMant_Material.CargoConsulta;
begin

  if edCodigo.Text<>'' then
    begin
      if qrOpen(FDQuery1,edCodigo) then
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
      edNombre.SetFocus;
    end;

end;

procedure TfrMant_Material.edCodigoChange(Sender: TObject);
begin
  inherited;

  FDQuery1.Close;

end;

procedure TfrMant_Material.edCodigoKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key=112 then
    Ayuda('Material',edCodigo);

end;

procedure TfrMant_Material.edCodigoKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
    CargoConsulta;


end;


procedure TfrMant_Material.edDireccionChange(Sender: TObject);
begin
  inherited;

  qrMedida.Close;

end;

procedure TfrMant_Material.edDireccionKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  inherited;

  if key=112 then
    Ayuda('Medida',edDireccion);

end;

procedure TfrMant_Material.edDireccionKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
    if not qrOpen(qrMedida,edDireccion) then
    begin
      MsgAviso('LA MEDIDA NO EXISTE');
    end
    else
      btnActualizar.SetFocus;


end;

procedure TfrMant_Material.edDireccionMouseEnter(Sender: TObject);
begin
  inherited;

  Panel1.Visible := True;

end;

procedure TfrMant_Material.edDireccionMouseLeave(Sender: TObject);
begin
  inherited;

  Panel1.Visible := False;

end;

procedure TfrMant_Material.edNombreKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;

  if key=#13 then
  begin
    edDireccion.SetFocus;
  end;

end;

procedure TfrMant_Material.FDQuery1AfterOpen(DataSet: TDataSet);
begin
  inherited;

  if not FDQuery1.IsEmpty then
  begin
    edNombre.Text := FDQuery1Nombre.Text;
    edDireccion.Text := FDQuery1idMedida.Text;
    qrOpen(qrMedida,edDireccion);
  end;

end;

procedure TfrMant_Material.IniPant;
begin

  edNombre.Clear;
  edDireccion.Clear;
  qrMedida.Close;
  FDQuery1.Close;
  HabMant(False);
  edCodigo.SetFocus;

end;

end.
