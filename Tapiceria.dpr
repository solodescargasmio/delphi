program Tapiceria;

uses
  Vcl.Forms,
  uPrincipal in 'uPrincipal.pas' {Form1},
  uBase_Consulta in '..\Form_Bases\uBase_Consulta.pas' {frBase_Consulta},
  uAyuda in 'uAyuda.pas',
  uBase_Mantenimiento in '..\Form_Bases\uBase_Mantenimiento.pas' {frBase_Mantenimiento},
  udm in 'udm.pas' {con},
  uMant_Cliente in 'uMant_Cliente.pas' {frMant_Cliente},
  uMant_Vehiculo in 'uMant_Vehiculo.pas' {frMant_Vehiculo},
  uMensage in 'uMensage.pas',
  uMant_Tarea in 'uMant_Tarea.pas' {frMant_Tarea},
  uBase_Ayuda in '..\Form_Bases\uBase_Ayuda.pas' {frBase_Ayuda},
  uAyuda_Cliente in '..\Ayuda\uAyuda_Cliente.pas' {frAyuda_Cliente},
  uAyuda_Vehiculo in '..\Ayuda\uAyuda_Vehiculo.pas' {frAyuda_Vehiculo},
  uAyuda_Tarea in '..\Ayuda\uAyuda_Tarea.pas' {frAyuda_tarea},
  uCons_Tarea in 'uCons_Tarea.pas' {frCons_Tarea},
  uMant_Medida in 'uMant_Medida.pas' {frMant_Medida},
  uMant_Material in 'uMant_Material.pas' {frMant_Material},
  uAyuda_Medida in '..\Ayuda\uAyuda_Medida.pas' {frAyuda_Medida},
  uAyuda_Material in '..\Ayuda\uAyuda_Material.pas' {frAyuda_Material},
  uPrueba in '..\Ayuda\uPrueba.pas' {frPrueba},
  uCons_Cliente in 'uCons_Cliente.pas' {frCons_Cliente},
  uCons_Vehiculo in 'uCons_Vehiculo.pas' {frCons_Vehiculo},
  uCons_Material in 'uCons_Material.pas' {frCons_Material},
  uCons_Medidas in 'uCons_Medidas.pas' {frCons_Medidas},
  uCant_MaterialUt in 'uCant_MaterialUt.pas' {frCant_MaterialUt};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(Tcon, con);
  Application.CreateForm(Tcon, con);
  Application.CreateForm(TfrBase_Consulta, frBase_Consulta);
  Application.CreateForm(TfrBase_Ayuda, frBase_Ayuda);
  Application.CreateForm(TfrAyuda_Vehiculo, frAyuda_Vehiculo);
  Application.CreateForm(TfrAyuda_tarea, frAyuda_tarea);
  Application.CreateForm(TfrAyuda_Medida, frAyuda_Medida);
  Application.CreateForm(TfrAyuda_Material, frAyuda_Material);
  Application.Run;
end.
