program SANCmodel;

uses
  Vcl.Forms,
  uSANCmodel in 'uSANCmodel.pas' {Form1},
  uImage2 in 'uImage2.pas' {fImage2},
  uParams in 'uParams.pas' {fParams},
  UplotVm in 'UplotVm.pas' {fPlotVm};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TfImage2, fImage2);
  Application.CreateForm(TfParams, fParams);
  Application.CreateForm(TfPlotVm, fPlotVm);
  Application.Run;
end.
