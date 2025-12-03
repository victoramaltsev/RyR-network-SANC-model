unit UplotVm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, VCLTee.TeEngine,
  VCLTee.Series, Vcl.ExtCtrls, VCLTee.TeeProcs, VCLTee.Chart, Vcl.StdCtrls;

type
  TfPlotVm = class(TForm)
    Chart1: TChart;
    Series1: TLineSeries;
    Button1: TButton;
    Edit1: TEdit;
    Label1: TLabel;
    Edit2: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fPlotVm: TfPlotVm;

implementation

{$R *.dfm}

procedure TfPlotVm.Button1Click(Sender: TObject);
 var ExportDirStr, s: string;
 F: TextFile;
 i:integer;
 x,y: double;

begin
// save to file
 if series1.Count=0 then exit; // no data
  s:=Edit2.Text;
  ExportDirStr:= edit1.Text;
  ExportDirStr:= IncludeTrailingPathDelimiter(ExportDirStr);
  AssignFile(F,ExportDirStr+s);
  rewrite(F);
  for I := 0 to series1.Count -1  do
  begin
   x:=  series1.XValues[i];
   y:=  series1.YValues[i];
   writeln(F, FloatToStrF(x, ffGeneral, 8,8)+#9+FloatToStrF(y, ffGeneral, 8,8));
  end;
  CloseFile(F);
end; // proc

end.
