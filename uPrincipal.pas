unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, System.Actions, Vcl.ActnList, Vcl.Menus,
   Vcl.StdCtrls, uMant_Tarea, uCons_Tarea, uMant_Medida, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    MainMenu1: TMainMenu;
    Cliente1: TMenuItem;
    Otracosa1: TMenuItem;
    ListaMenu: TActionList;
    Action1Cons_Cliente: TAction;
    Action2Mant_Cliente: TAction;
    Mantenimiento1: TMenuItem;
    Vehiculo1: TMenuItem;
    Consulta1: TMenuItem;
    Mantenimiento2: TMenuItem;
    Action3Mant_Vehiculo: TAction;
    area1: TMenuItem;
    Consulta2: TMenuItem;
    MantenimientTarea1: TMenuItem;
    Action4Mant_Tarea: TAction;
    Action5Cons_Tarea: TAction;
    Mantenimiento3: TMenuItem;
    Medidas1: TMenuItem;
    Action6Mant_Medida: TAction;
    Action7Mant_Material: TAction;
    Action8Preuba: TAction;
    Action8Cons_Vehiculo: TAction;
    Fondo: TImage;
    Material1: TMenuItem;
    Consulta3: TMenuItem;
    Mantenimiento4: TMenuItem;
    Action9Cons_Material: TAction;
    Consulta: TMenuItem;
    Action10Cons_Medida: TAction;
    Action11Cant_MatUt: TAction;
    CantidadMaterialUtilizado1: TMenuItem;
    procedure Action1Cons_ClienteExecute(Sender: TObject);
    procedure Action2Mant_ClienteExecute(Sender: TObject);
    procedure Action4Mant_TareaExecute(Sender: TObject);
    procedure Action5Cons_TareaExecute(Sender: TObject);
    procedure Action6Mant_MedidaExecute(Sender: TObject);
    procedure Action7Mant_MaterialExecute(Sender: TObject);
//    procedure Action8PreubaExecute(Sender: TObject);
    procedure Action3Mant_VehiculoExecute(Sender: TObject);
    procedure Action8Cons_VehiculoExecute(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure Action9Cons_MaterialExecute(Sender: TObject);
    procedure Action10Cons_MedidaExecute(Sender: TObject);
    procedure Action11Cant_MatUtExecute(Sender: TObject);




  private
    { Private declarations }
    function VentanaAbierta (Ventana:TClass): Boolean;
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uCons_Cliente, uMant_Cliente, uMant_Vehiculo, uMant_Material, uPrueba,
  uCons_Vehiculo, uCons_Material, uCons_Medidas,uCant_MaterialUt;



procedure TForm1.Action10Cons_MedidaExecute(Sender: TObject);
var
  f:TfrCons_Medidas;
begin


  if not VentanaAbierta(TfrCons_Medidas) then
  begin
    f:=TfrCons_Medidas.Create(nil);
    f.Show;
  end;

end;


procedure TForm1.Action11Cant_MatUtExecute(Sender: TObject);
var
  f:TfrCant_MaterialUt;
begin


  if not VentanaAbierta(TfrCant_MaterialUt) then
  begin
    f:=TfrCant_MaterialUt.Create(nil);
    f.Show;
  end;

end;

procedure TForm1.Action1Cons_ClienteExecute(Sender: TObject);
var
  f:TfrCons_Cliente;
begin


  if not VentanaAbierta(TfrCons_Cliente) then
  begin
    f:=TfrCons_Cliente.Create(nil);
    f.Show;
  end;


end;



procedure TForm1.Action2Mant_ClienteExecute(Sender: TObject);
var
f:TfrMant_Cliente;
begin

  if not VentanaAbierta(TfrMant_Cliente) then
  begin
    f:=TfrMant_Cliente.Create(nil);
    f.Show;
  end;

end;

procedure TForm1.Action3Mant_VehiculoExecute(Sender: TObject);
var
  f : TfrMant_Vehiculo;
begin

  if not VentanaAbierta(TfrMant_Vehiculo) then
  begin
    f := TfrMant_Vehiculo.Create(nil);
    f.Show;
  end;


end;

procedure TForm1.Action4Mant_TareaExecute(Sender: TObject);
var
  f : TfrMant_Tarea;
begin

  if not VentanaAbierta(TfrMant_Tarea) then
  begin
    f := TfrMant_Tarea.Create(nil);
    f.Show;
  end;

end;

procedure TForm1.Action5Cons_TareaExecute(Sender: TObject);
var
  f : TfrCons_Tarea;
begin

  if not VentanaAbierta(TfrCons_Tarea) then
  begin
    f := TfrCons_Tarea.Create(nil);
    f.Show;
  end;

end;



procedure TForm1.Action6Mant_MedidaExecute(Sender: TObject);
var
  f : TfrMant_Medida;
begin

  if not VentanaAbierta(TfrMant_Medida) then
  begin
    f := TfrMant_Medida.Create(nil);
    f.Show;
  end;

end;

procedure TForm1.Action7Mant_MaterialExecute(Sender: TObject);
var
  f : TfrMant_Material;
begin

  if not VentanaAbierta(TfrMant_Material) then
  begin
    f := TfrMant_Material.Create(nil);
    f.Show;
  end;

end;

procedure TForm1.Action8Cons_VehiculoExecute(Sender: TObject);
var
  f : TfrCons_Vehiculo;
begin

  if not VentanaAbierta(TfrCons_Vehiculo) then
  begin
    f :=TfrCons_Vehiculo.Create(nil);
    f.Show;
  end;
end;
{
procedure TForm1.Action8PreubaExecute(Sender: TObject);
var
  f : TfrPrueba;
begin

  if not VentanaAbierta(TfrMant_Cliente) then
  begin
    f :=TfrPrueba.Create(nil);
    f.Show;
  end;

end;
     }

procedure TForm1.Action9Cons_MaterialExecute(Sender: TObject);
var
  f : TfrCons_Material;
begin

  if not VentanaAbierta(TfrCons_Material) then
  begin
    f :=TfrCons_Material.Create(nil);
    f.Show;
  end;
end;


procedure TForm1.FormActivate(Sender: TObject);
begin


   try
    Fondo.Picture.LoadFromFile(ExtractFilePath(Application.ExeName)+'\img\'+'FondoP.jpg');
    Fondo.Stretch:=True;
  except
  end;

end;

function TForm1.VentanaAbierta (Ventana:TClass): Boolean;
var i:integer;
    nada:TClass;
    f:Tform;
begin
  result := False;
  for i := Screen.FormCount-1 downto 0 do
  begin
    f:= Screen.Forms[i];
    if F.ClassType = Ventana then
     begin
     if F.WindowState = wsMinimized then
        F.WindowState := WsNormal;
     F.BringToFront;
     result := TRUE;
     break;
     end;
    end;
end;


end.
