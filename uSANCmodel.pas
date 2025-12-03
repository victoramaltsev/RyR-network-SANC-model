unit uSANCmodel;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DateUtils,
  UITypes,
  Math,
  IOUtils,
   Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ToolWin, Vcl.ComCtrls,
  VclTee.TeeGDIPlus, VCLTee.TeEngine, VCLTee.Series, VCLTee.TeeProcs,
  VCLTee.Chart,
  UplotVm,
uImage2,
uParams
;


type
  TForm1 = class(TForm)
    OpenDialog1: TOpenDialog;
    Chart1: TChart;
    Series1: TBarSeries;
    GroupBox1: TGroupBox;
    Label7: TLabel;
    Label8: TLabel;
    Button7: TButton;
    Button8: TButton;
    Edit39: TEdit;
    GroupBox5: TGroupBox;
    Button6: TButton;
    Button1: TButton;
    Button11: TButton;
    Label1: TLabel;
    GroupBox6: TGroupBox;
    Label3: TLabel;
    Edit2: TEdit;
    Label2: TLabel;
    Edit1: TEdit;
    Button2: TButton;
    Button18: TButton;
    Button27: TButton;
    Button32: TButton;
    Button33: TButton;
    Label6: TLabel;
    Edit4: TEdit;
    Label4: TLabel;
    Memo1: TMemo;
    Memo3: TMemo;
    Label16: TLabel;
    Label23: TLabel;
    Label31: TLabel;
    Label25: TLabel;
    Label42: TLabel;
    CheckBox1: TCheckBox;
    Label21: TLabel;
    Label22: TLabel;
    Label36: TLabel;
    Label40: TLabel;
    Label53: TLabel;
    Edit31: TEdit;
    GroupBox2: TGroupBox;
    Label5: TLabel;
    Edit10: TEdit;
    Edit5: TEdit;
    Label9: TLabel;
    Edit7: TEdit;
    Label10: TLabel;
    Edit8: TEdit;
    Label11: TLabel;
    CheckBox2: TCheckBox;
    Button3: TButton;
    Button4: TButton;
    Button5: TButton;
    Label17: TLabel;
    Edit3: TEdit;
    Label28: TLabel;
    Label12: TLabel;
    GroupBox3: TGroupBox;
    Label24: TLabel;
    Label13: TLabel;
    CheckBox3: TCheckBox;
    Edit22: TEdit;
    Edit23: TEdit;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button6Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure Button8Click(Sender: TObject);
    procedure Button11Click(Sender: TObject);
    procedure Button18Click(Sender: TObject);
    procedure Button27Click(Sender: TObject);
    procedure Button33Click(Sender: TObject);
    procedure Button32Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;



implementation

{$R *.dfm}



// find N-th substring in tabulated string
Function TabStr(s:string; N:integer):string;
var tabcount,i:integer; s1:string;
begin
 TabStr:=''; if s='' then exit;
 i:=0; tabcount:=0; s1:='';
 repeat
 inc(i);
 if s[i]=#9 then
 begin
   inc(tabcount);
    if   tabcount = N then
   begin
     TabStr:=s1; exit;
   end else s1:='';
 end  // #9
 else s1:=s1+s[i];

 until i=length(s);
if N= tabcount+1 then  TabStr:=s1; // if  TabulatedStr is at the end
end; // proc



////////////////////////
Procedure WriteParams;
begin
with fParams.Memo4.Lines do
begin
 clear;
   add('Cell Geometry:');
   add('Cm (pF) = ' + FloatToStrF(Cm,ffGeneral,7,9));
   add('L_cell (mkm) = ' + FloatToStrF(L_cell_mkm, ffGeneral,7,9));
   add('R_cell (mkm) = ' + FloatToStrF(R_cell_mkm, ffGeneral,7,9));
   add('L_cross (mkm) = ' + FloatToStrF(L_cross_mkm,ffGeneral,7,9));
   add('S_cell_mkm2 = ' + FloatToStrF(S_cell_mkm2,ffGeneral,7,9));
   add('V_cyt_part = ' + FloatToStrF(V_cyt_part, ffGeneral,8,9));
   add('V_fSR_part = ' + FloatToStrF(V_fSR_part, ffGeneral,8,9));

 add('');
   add('Cell surface grid:');
   add('Grid unit, mkm = '+ FloatToStrF(GridSz_mkm,ffGeneral,7,9));
   add('Grid length in X = ' + IntToStr(xGridLen));
   add('Grid length in Y = ' + IntToStr(yGridLen));

add('');
 add('Subspace:');
 add('Num_Sub_voxels = ' + IntToStr(Num_Sub_voxels));
 add('Sub_depth_mkm = ' + FloatToStrF(Sub_depth_mkm, ffGeneral,8,9));
 add('xGridLen = ' + IntToStr(xGridLen));
 add('yGridLen = ' + IntToStr(yGridLen));

with VoxelSub do
begin
 add('Voxel dX, mkm = ' + FloatToStrF(dX_mkm, ffGeneral,9,9));
 add('Voxel dY, mkm = ' + FloatToStrF(dY_mkm, ffGeneral,9,9));
end;

add('');
 add('Ring:');
 add('Num_Ring_voxels = ' + IntToStr(Num_Ring_voxels));
 add('VoxelRing_depth_mkm = ' + FloatToStrF(VoxelRing_depth_mkm, ffGeneral,8,9));
with VoxelRing do
    begin
     add('V1_liters = ' + FloatToStrF(V1_liters, ffGeneral,9,9));
     add('Voxel dX, mkm = ' + FloatToStrF(dX_mkm, ffGeneral,9,9));
     add('Voxel dY, mkm = ' + FloatToStrF(dY_mkm, ffGeneral,9,9));
    end;
add('R_cyt_core_mkm = ' + FloatToStrF(R_core_mkm, ffGeneral,8,9));



 add('');
 add('Whole-cell volumes, in femtoliter (10^-15 liter) ');
 add('V_cell= ' + FloatToStrF(V_cell_mkm3, ffGeneral,7,9));
 add('V_sub_total = ' + FloatToStrF(V_sub_mkm3, ffGeneral,7,9));
 add('V_jSR_total = ' + FloatToStrF(V_JSR_total_mkm3, ffGeneral,7,9));
 add('V_ring_total = ' + FloatToStrF(V_ring_mkm3, ffGeneral,7,9));
 add('V_core = ' + FloatToStrF(V_core_mkm3, ffGeneral,7,9));
 add('V_ring_FSR = ' + FloatToStrF(V_ring_mkm3*V_fSR_part, ffGeneral,7,9));
 add('V_core_FSR = ' + FloatToStrF(V_core_mkm3*V_fSR_part, ffGeneral,7,9));

 add('');
 add('Local volumes, in atoliter (10^-18 liter):');
 add('1Voxel_subspace = ' + FloatToStrF(VoxelSub.V1_liters*1e18, ffGeneral,7,9));
 add('1Voxel_Ring = ' + FloatToStrF(VoxelRing.V1_liters*1e18, ffGeneral,7,9));
 add('average 1jSR = ' + FloatToStrF((V_JSR_total_mkm3/nCRUs) *1e3, ffGeneral,7,9));

 add('');
 add('TimeTick = '+FloatToStrF(TimeTick,ffGeneral,7,9));

 add('');
 add('Ca release:');
 add('TotalNRyRs = ' + IntToStr(TotalNRyRs));
 add('TotalNCRUs  = ' + IntToStr(nCRUs));
 add('Average CRU size = ' + FloatToStrF(TotalNRyRs/nCRUs, ffgeneral, 8, 8)+ ' RyRs');
 add('Iryr_at_1mM_CaJSR, pA = '+#9+FloatToStrF(Iryr_at_1mM_CaJSR,ffGeneral,7,9));
 add('CRU_firing_ProbConst = '+#9+FloatToStrF(CRU_ProbConst,ffGeneral,7,9));
 add('CRU_firing_ProbPower = '+#9+FloatToStrF(CRU_ProbPower,ffGeneral,7,9));
 add('CRU_firing_sensitivity, mM = '+#9+FloatToStrF(CRU_Casens,ffGeneral,7,9));
 add('CaJSR_spark_activation = '+#9+FloatToStrF(CaJSR_spark_activation,ffGeneral,7,9));
 add('Ispark_activation_tau_ms = '+#9+FloatToStrF(Ispark_activation_tau_ms,ffGeneral,7,9));
 add('Ispark_inactivation_tau_ms = '+#9+FloatToStrF(Ispark_inactivation_tau_ms,ffGeneral,7,9));

 add('');
  add('Membrane currents:');
  add('C_pF_per_mkm2='+#9+FloatToStrF(C_pF_per_mkm2,ffGeneral,7,9));
  add('gCaL'+#9+FloatToStrF(gCaL,ffGeneral,7,9));
  add('Cav1.3%='+#9+fParams.Edit4.Text);
  add('kNCX'+#9+FloatToStrF(kNCX,ffGeneral,7,9));
  add('gKr'+#9+FloatToStrF(gKr,ffGeneral,7,9));
  add('gh'+#9+FloatToStrF(gh,ffGeneral,7,9));
  add('gto'+#9+FloatToStrF(gto,ffGeneral,7,9));
  add('gsus'+#9+FloatToStrF(gsus,ffGeneral,7,9));
  add('gCaT'+#9+FloatToStrF(gCaT,ffGeneral,7,9));
  add('INaKmax'+#9+FloatToStrF(INaKmax,ffGeneral,7,9));
  add('gbCa'+#9+FloatToStrF(gbCa,ffGeneral,7,9));
  add('gKs'+#9+FloatToStrF(gKs,ffGeneral,7,9));
  add('Membrane currents TUNING:');
  add('KmfCa = '+#9+FloatToStrF(KmfCa  ,ffGeneral,7,9));
  add('alfafCa='+#9+FloatToStrF(alfafCa   ,ffGeneral,7,9));
  add('k_TauFL = '+#9+FloatToStrF(k_TauFL ,ffGeneral,7,9));
  add('k_IKr_Tau = '+#9+FloatToStrF(k_IKr_Tau,ffGeneral,7,9));
  add('V_Ih12 = '+#9+FloatToStrF(V_Ih12  ,ffGeneral,7,9));
 if Form1.CheckBox3.Checked then
   add('bAR stim%,ms'+#9+Form1.Edit23.Text+#9+Form1.Edit22.Text)
 else
 add('bAR stim'+#9+'No');

add('');
  add('Ca diffusion, pumping, and buffering:');
  add('Dcyt = '+FloatToStrF(DCyt_mkm2_per_ms   ,ffGeneral,7,9));
  add('DFSR = '+FloatToStrF(DFSR_mkm2_per_ms   ,ffGeneral,7,9));
  add('Tau_FSR_JSR_ML = '+FloatToStrF(Tau_FSR_JSR_ML_model  ,ffGeneral,7,9));
  add('Pup = '+ FloatToStrF(Pup   ,ffGeneral,7,9));
  add('CQtot = '+ FloatToStrF(CQtot   ,ffGeneral,7,9));
  add('CM_total = '+FloatToStrF(CM_total   ,ffGeneral,7,9));

end;// with memo1

// set cursor on the first line
  fParams.Memo4.SelStart := 0;
  fParams.Memo4.SelLength := 0;
end;  // proc


//////////////////////

// Read Model Interface
procedure Read_Interface;
begin
   NRyRs_per_mkm2:= StrToFloat(Form1.Edit39.Text);

with fParams do
begin
   // model integration
  TimeTick:=  StrToFloat(Edit10.Text);
  NTicks_Diffu2D_Ring_FSR:=StrToInt(edit5.text);
  NTicks_Diffu_FSR_to_JSR:=StrToInt(edit6.text);
  NTicks_Diffu_Ring_to_Core_FSR:=StrToInt(edit7.text);
  NTicks_Diffu_Ring_to_Core_Cyt:=StrToInt(edit8.text);
  NTicks_SERCA:=StrToInt(edit9.text);
end;

with Form1 do
  begin
  // output
    SimTotalDuration_ms:= StrToFloat(Edit2.Text); //300;
    SimOutputSampling_ms:=StrToFloat(Edit1.Text);// 1

  // model parameters
    bAR_stimulation_apply:= CheckBox3.Checked;
    bAR_onset:= StrToFloat(Edit22.Text);
    bAR_percent:=  StrToFloat(Edit23.Text);
  end;

// Default Basal state values:
    V_Ih12 := -64;
    gKr := 0.05679781;
    Pup:= StrToFloat(fParams.edit12.Text);
    gCaL:= StrToFloat(fParams.edit13.Text);

// set CRU firing
    CRU_Casens := StrToFloat(fParams.edit1.Text);// 0.00015; // mM: sensitivity of Ca release to Casub
    CRU_ProbConst := StrToFloat(fParams.edit2.Text);// 0.00027; // 0.0003 ms-1: CRU open probability rate at Casub=CRU_Casens

    Ispark_activation_tau_ms:=   StrToFloat(fParams.edit14.Text);
    Ispark_activation_tau_in_timeticks:=  Ispark_activation_tau_ms/TimeTick;

    Ispark_inactivation_tau_in_timeticks:= Ispark_inactivation_tau_ms/TimeTick; //tau = 1/kom; //  = 8.54700854701 ms

    CRU_ProbPower := StrToFloat(fParams.edit3.Text); // 3; //: Cooperativity of CRU activation by Casub
    Ispark_Termination_scale:= StrToFloat(fParams.Edit25.Text);

// set contribution of L-type Ca channel isoforms
    frac13_gCaL:=StrToFloat(fParams.edit4.Text); // fraction of ICaL via Cav1.3
    frac12_gCaL:= 1 - frac13_gCaL; // fraction of ICaL via Cav1.2
end;  // proc


///////////////////////////
// Findig correct index going around the torus
procedure IndexCircling(gridSize:integer; var index_test:integer);
begin
     index_test:= index_test mod gridSize;
     if  index_test <0 then  index_test := gridSize + index_test;
end;

////////////////////////////
// free memory of 2D arrays
procedure Ar2D_free_memory;
begin
  ArSubCyt:=nil;
  ArSubCyt_dCa:=nil;
  ArSubfCM:=nil;
  ArRingfCM:=nil;
  ArRingCyt:=nil;
  ArRingFSR:=nil;
  ArRingCyt_dCa:=nil;
  ArRingfSR_dCa:=nil;
end;


// Set sizes for 2D arrays for Ca dynamics
Procedure Ar2D_Set_Size;
begin
with VoxelSub do
  begin
    SetLength(ArSubCyt,     NvoxY, NvoxX); // create subspace Ca arrasy
    SetLength(ArSubCyt_dCa, NvoxY, NvoxX); // + subspace Ca each time tick
    SetLength(ArSubfCM, NvoxY, NvoxX); // Fractional occupancy of calmodulin by Ca in submembrane space
  end;

with VoxelRing do
  begin
    SetLength(ArRingfCM, NvoxY, NvoxX); // Fractional occupancy of calmodulin by Ca in myoplasm
    SetLength(ArRingCyt, NvoxY, NvoxX); // create cytosol Ca array
    SetLength(ArRingFSR, NvoxY, NvoxX); // free SR Ca
    SetLength(ArRingCyt_dCa, NvoxY, NvoxX); // + cytosol Ca  each time tick
    SetLength(ArRingfSR_dCa, NvoxY, NvoxX); // + free SR Ca  each time tick
  end;
end;// end proc


// setting a value in a 2D array
Procedure Ar2D_Set_Value(var Ar:Ar2Dtype; val: double);
var xi,yi:integer;
  begin
    for xi:=0 to High(Ar[0]) do  Ar[0][xi]:= val;
    for yi:=1 to High(Ar) do Ar[yi]:= Copy(Ar[0]);
  end;

////////////////////////////////////
procedure Set_geometry;
begin
L_cell_approx_mkm:= 54; // μm
R_cell_approx_mkm:= 3.5; // μm

// Calculate Grid size in grid units
xGridLen := Trunc(L_cell_approx_mkm/GridSz_mkm);
L_cross_perimeter_approx_mkm := 2*Pi* R_cell_approx_mkm;
yGridLen := Trunc(L_cross_perimeter_approx_mkm / GridSz_mkm);

// Exact cell sizes
L_cell_mkm :=  xGridLen*GridSz_mkm;
L_cross_mkm := yGridLen*GridSz_mkm;
R_cell_mkm :=  L_cross_mkm/(2*Pi);
S_cell_mkm2 := L_cell_mkm* L_cross_mkm;

// Cell volume for a cylinder Vcell = pi*Rcell^2 * Lcell
	V_cell_mkm3 := Pi * R_cell_mkm*R_cell_mkm*L_cell_mkm;

// Total Submembrane volume
  V_sub_mkm3 := 2*Pi*Sub_depth_mkm*(R_cell_mkm - Sub_depth_mkm/2)*L_cell_mkm;
  V_sub_picoliter :=  V_sub_mkm3*1e-3;

// Cell core located under cytosol ring
  R_core_mkm:=  R_cell_mkm - VoxelRing_depth_mkm - Sub_depth_mkm;

// Ring is a cell compartment between the core and subspace
V_ring_mkm3 := Pi* sqr(R_cell_mkm - Sub_depth_mkm) * L_cell_mkm  -Pi* sqr(R_core_mkm) * L_cell_mkm;


//We place JSRs inside respective ring voxels just below their outer
// side facing the cell membrane. To simplify computation, volumes of these ring
// voxels are kept the same by their extending into the core by
// the exact volume of the JSR. To calculate the core volume, we then subtract
// all JSR volumes from the volume of the cylinder core.
  V_core_mkm3 := Pi* sqr(R_core_mkm) * L_cell_mkm -  V_JSR_total_mkm3;

 // Set subspace voxels
With VoxelSub do
  begin
    SzX:= 1;
    SzY:= 1;
    NvoxX:= xGridLen div  SzX;
    NvoxY:= yGridLen div  SzY;
    Num_Sub_voxels:= NvoxX*NvoxY;
    V1_mkm3:= V_sub_mkm3 / Num_Sub_voxels;
    V1_liters:= V_sub_mkm3*1e-15 / Num_Sub_voxels;
  // distance between neighboring voxel centers in x
   dX_mkm:=  SzX * GridSz_mkm;
  // distance between neighboring voxel centers in y
    dY_mkm:=  2*(R_cell_mkm - Sub_depth_mkm/2)*sin(2*pi/(NvoxY*2));
  end; //   With VoxelSub

// set ring voxel
 With VoxelRing do
  begin
     SzX:= VoxelRing_GridSizeX;
     SzY:= VoxelRing_GridSizeY;
     NvoxX:= xGridLen div  SzX;
     NvoxY:= yGridLen div  SzY;
     Num_Ring_voxels:= NvoxX*NvoxY;
     V1_mkm3:= V_ring_mkm3 / Num_Ring_voxels;
     V1_liters:= V_ring_mkm3*1e-15/ Num_Ring_voxels;
  // distance between neighboring voxel centers in x
     dX_mkm:=  SzX * GridSz_mkm;
  // distance between neighboring voxel centers in y
     dY_mkm:= 2*(R_core_mkm + VoxelRing_depth_mkm/2)*sin(2*pi/(NvoxY*2));
  end;
 Volume_ratio_fSR_to_cyt:= V_fSR_part/V_cyt_part;  // used in SERCA pumping

end; // proc SetGeometry


///////////////////////////////
procedure ReadRyRSizeDistribution_dSTORM;
var
MaxBin, Nbins, i: integer;
Nbins_read: double;
Yscaling: double;
S_cell_mkm2_dSTORM, NRyRs_per_mkm2_dSTORM: double;
co_CRU_dist: double; // CRU count in original distribution
co_RyR_dist: double; // RyR count in original distribution
y: double;
s, s1, s2:string;

begin /////////////////////////

  with Form1 do
  begin
  if  Memo1.Lines.Count = 0 then exit;

  // read data into a dynamic array
  CRUdistr_dSTORM := nil;
  co_CRU_dist:=0;
  co_RyR_dist:=0;

  for i := 0 to Memo1.Lines.Count-1 do
    begin
      s:= Memo1.Lines[i];
      s1:=TabStr(Memo1.Lines[i],1);
      s2:=TabStr(Memo1.Lines[i],2);

      if TryStrToFloat(s2, y) then  // read data = y
        if TryStrToFloat(s1, Nbins_read) then  // read bin = Nbins_read
        begin
           Nbins:= trunc(Nbins_read);
           setlength(CRUdistr_dSTORM,Nbins+1);
           CRUdistr_dSTORM[Nbins]:= y;
           co_RyR_dist:=co_RyR_dist+ Nbins_read*y;
           co_CRU_dist:= co_CRU_dist+y;
        end;
    end;

   MaxBin:= high(CRUdistr_dSTORM);

  // create model distribution in integer
  // create array
     CRUdistr_model:= nil;
     setlength(CRUdistr_model, MaxBin+1);  //+1 for 0 bin

   // calculate total RyR numbers and the RyR density in dSTORM data
          S_cell_mkm2_dSTORM:= StrToFloat(Edit3.Text);
          NRyRs_per_mkm2_dSTORM:= co_RyR_dist/S_cell_mkm2_dSTORM;

  // output original distribution parameters
    label36.Caption:= 'Total CRUs='+ FloatToStrF(co_CRU_dist, ffgeneral, 8, 8);
    label22.Caption:= 'Total RyRs='+ FloatToStrF(co_RyR_dist, ffgeneral, 8, 8);
    label40.Caption:= 'Average CRU='+ FloatToStrF(co_RyR_dist/co_CRU_dist, ffgeneral, 8, 8);
    label21.Caption:= 'RyR/um2= '+FloatToStrF(NRyRs_per_mkm2_dSTORM, ffgeneral, 8, 8);

  // find total number of RyRs in the model
          if CheckBox1.Checked then
      begin // density is fixed, i.e. given in interface
       N:= round(NRyRs_per_mkm2* S_cell_mkm2);
      end
      else
  // obtained from dSTORM data: distribution and cell patch surface
      begin
        NRyRs_per_mkm2:= NRyRs_per_mkm2_dSTORM;
        N:=  round(NRyRs_per_mkm2* S_cell_mkm2);
      end;

   // scale dSTORM data distribution to get final model distribution
    Yscaling:=  N/co_RyR_dist;
    Form1.label28.Caption:= 'Scaling Y = '+ FloatToStrF(Yscaling, ffgeneral, 8, 8);

   for i := 0 to High(CRUdistr_dSTORM) do
      CRUdistr_model[i]:= round(Yscaling*CRUdistr_dSTORM[i]);

  end; // with Form1

end; // proc




/////////////////////////

Procedure Show_distr_RyR_cluster_sizes_model;
var
i:integer;
begin // show distr or RyR cluster sizes
// create histogram and output text
    Form1.Memo3.Clear;
    Form1.Series1.Clear;
// set auto xy axes
   Form1.Chart1.leftAxis.Automatic:= true;
   Form1.Chart1.BottomAxis.Automatic:= true;
  for i := 0 to High(CRUdistr_model) do
  begin
    Form1.Series1.AddXY(i,CRUdistr_model[i]); // make histo (plot)
    Form1.Memo3.Lines.Add(IntToStr(i)+#9+IntToStr(CRUdistr_model[i]));// write numbers to memo (text)
  end;

// set cursor on the first line
  Form1.Memo3.SelStart := 0;
  Form1.Memo3.SelLength := 0;
end;      // proc



/////////////////////////////////////

Procedure Show_distr_RyR_cluster_sizes_model2;
// Plot Histogram of RyR cluster sizes in the model
var Hist_test: array of integer;
NBins, i:integer;

begin // show distr or RyR cluster sizes

 // create histogram
        NBins:= MaxRyRNcluster +1;
        SetLength(Hist_test, NBins);
        for i := 0 to High(ArCRU) do
        with  ArCRU[i] do
        begin
          inc(Hist_test[NRyR]); // zero bin contains CRUs of bin1 RyRs size
        end;

//OUTPUT
// create histogram and output text
    Form1.Memo3.Clear;
    Form1.Series1.Clear;
// set auto xy axes
   Form1.Chart1.leftAxis.Automatic:= true;
   Form1.Chart1.BottomAxis.Automatic:= true;
  for i := 0 to High(Hist_test) do
  begin
  Form1.Series1.AddXY(i,Hist_test[i]); // make histo (plot)
  Form1.Memo3.Lines.Add(IntToStr(i)+#9+IntToStr(Hist_test[i]));// write numbers to memo (text)
  end;

// set cursor on the first line
  Form1.Memo3.SelStart := 0;
  Form1.Memo3.SelLength := 0;

// free memory
Hist_test:=nil;
end;      // proc


///////////////////////////////


procedure Calculate_CRU_parameters;
var CRUi: integer;
RyRcount: integer; // RyR counter

begin
    if ArCRU = nil  then exit;  // exit  of no CRU created
    nCRUs:=High(ArCRU)+1;    // record all CRUs that have been  created

     NvoxelsInAllCRUs:=0;
     RyRcount:= 0;

   for CRUi := 0 to High(ArCRU) do
     with ArCRU[CRUi] do
     begin
      // counting RyRs
               RyRcount:= RyRcount + NRyR;

      // For dSTORM data, we keep formulation for Dyadic volume
      // as # of submembrane voxels linked to dyadc space
          Dyadic_volume_liter:=NVoxels*VoxelSub.V1_liters*V_cyt_part;

      // We assign JSR volume in the CRU proportional to number of RyRs in the CRU

       JSR1_volume_mkm3:= NRyR * GridSz_RyR_mkm * GridSz_RyR_mkm* jSR_depth_mkm;
       JSR1_volume_liter:= JSR1_volume_mkm3*1e-15;

          Ispark_at_1mM_CaJSR1:= NRyR* Iryr_at_1mM_CaJSR; // pA

          NvoxelsInAllCRUs:= NvoxelsInAllCRUs+ NVoxels; // counting voxels

          // finding max RyR cluster
          if NRyR > MaxRyRNcluster then MaxRyRNcluster:= NRyR;
          if NRyR < MinRyRNcluster then MinRyRNcluster:= NRyR;
     end;
       TotalNRyRs:= RyRcount; // record the number of RyRs

   // Total junctional SR volume. It is used to find CORE volume
      V_JSR_total_mkm3 := TotalNRyRs*GridSz_RyR_mkm * GridSz_RyR_mkm * JSR_depth_mkm;

      // display prameters
      Form1.label25.Caption:=  'TotalNCRUs = '+IntToStr(nCRUs);
      Form1.label31.Caption:=  'TotalNRyRs = '+IntToStr(TotalNRyRs);
      Form1.label42.Caption:=  'Average CRU size = '+FloatToStrF(TotalNRyRs/nCRUs, ffgeneral, 8, 8);
      Form1.label53.Caption:=  'RyR/um2=' + FloatToStrF(TotalNRyRs/S_cell_mkm2, ffgeneral, 8, 8);
end;



/////////////////////////////
procedure Set_CRUs; // creates CRU network based on histogram of CRU distribution
var
CRUi: integer; // index of currenly created CRU
x_CRU, y_CRU:integer; // starting (seeding) coordinates for ther CRUi

// boolean grid tracks vacant locations for new CRU positions to exlude overlap
Vacant_locations: array of array of boolean;

// this subroutine marks vacant voxels to be occupied with CRUs
procedure Set_vacant_locations;
var xi, yi: integer;
begin
  // make xy array to mark JSR locations on the grid
          SetLength(Vacant_locations, yGridLen, xGridLen);
          for xi:=0 to xGridLen-1 do
          for yi:=0 to yGridLen -1 do
          Vacant_locations[yi,xi]:= true;
end;


// this subroutine checks if a randomly assign position of a CRU fits vacant locations
function  No_overlap: boolean; // subroutine
var
No_overlap_test:boolean;
i:integer;
x1, y1:integer;
xx, yy: integer;
xxi, yyi: integer;
begin
   No_overlap_test:=true;
   for i:=0  to ArCRU[CRUi].NVoxels -1  do
   begin
     x1:=  ArCRU[CRUi].Voxels[i].xv;
     y1:=  ArCRU[CRUi].Voxels[i].yv;
     for xxi := -1 to 1 do
     for yyi := -1 to 1 do
     begin
       xx:= x1+xxi;
       yy:= y1+yyi;
       IndexCircling(xGridLen,xx);
       IndexCircling(yGridLen,yy);
      No_overlap_test:= No_overlap_test and Vacant_locations[yy, xx];
     end;
  end;
  result:= No_overlap_test;
end; // subroutine


// this subroutine marks locations occupied with CRUi
procedure MarkLocations; // subroutine
var
i:integer;
x1, y1:integer;
begin
    for i:=0  to ArCRU[CRUi].NVoxels -1  do
     begin
       x1:=  ArCRU[CRUi].Voxels[i].xv;
       y1:=  ArCRU[CRUi].Voxels[i].yv;
       Vacant_locations[y1, x1]:=false;
    end;
end;// subroutine


// this subroutine creates CRUi
procedure createCRUi;
var i, j: integer; // indexes in x and y
voxeli:integer; // voxel index
NRyRi: integer;  // RyR down-counter
Nvox: integer; // number of voxel in a CRU
CM_voxel_index: integer; // center mass voxel
RandomRotation: integer;

// this sub-sub-routine find center mass of the CRU
// center mass position is used as a Ca sensor and also in CRU repulsion
procedure    FindCenterMass;
var i : integer;
distance, distance_min, sum1, y_center_mass, x_center_mass: double;
  begin
// find the center mass
// total mass is NRyR
    with ArCRU[CRUi] do
     begin
      sum1:= 0;
      for  i:= 0 to NVoxels-1 do sum1:= sum1 + voxels[i].nRyRv*voxels[i].xv;
      x_center_mass:= sum1/nRyR;

      sum1:= 0;
      for  i:= 0 to NVoxels-1 do sum1:= sum1 + voxels[i].nRyRv*voxels[i].yv;
      y_center_mass:= sum1/nRyR;

      distance_min:=maxsingle;
      for  i:= 0 to NVoxels-1 do
      begin
        distance:= sqrt( sqr(x_center_mass - voxels[i].xv) +  sqr(y_center_mass - voxels[i].yv));
        if  distance< distance_min then
         begin
          CM_voxel_index:= i;
          distance_min:=  distance;
         end;
      end; // for
     end; // with
  end; // proc


// sub-sub-routine to add a voxel i, j to CRUi
procedure AddOneVoxelToCRUi;
begin
if NRyRi>0 then
  begin
    inc(voxeli);
    ArCRU[CRUi].voxels[voxeli].xv:=x_CRU+i;
    ArCRU[CRUi].voxels[voxeli].yv:=y_CRU+j;

    if NRyRi>16 then // there will be more voxels
      ArCRU[CRUi].voxels[voxeli].nRyRv:=16
    else // if number of RyRs =16 or less (dSTORM), then this is the last voxel
     ArCRU[CRUi].voxels[voxeli].nRyRv:= NRyRi; // recording the last voxel created above
    NRyRi:= NRyRi - 16; // no voxels anymore
    ArCRU[CRUi].voxels[voxeli].Rotationv:=  RandomRotation;
  end; // if NRyRi>0;
end;

////////////////////////////////////
begin
    with ArCRU[CRUi] do
   begin
           Nvox:= NRyR div 16;
           if (NRyR mod 16)>0 then inc(Nvox);

           voxels:=nil;
           SetLength(voxels,Nvox); // reserve voxel array to fit voxels in the grid

           // we try to fit voxels in a square with a side length = SizeMax .
           // If not exact a square, we add remaining voxels on one side of that square
           SizeMax:= trunc(sqrt(Nvox));
           if frac(sqrt(Nvox))>0 then inc(SizeMax);

           voxeli:=-1;   // voxel counter
           NRyRi:= NRyR; // RyR down counter

        // Random Rotation: generates a random number among 1,2,3,4 (not 5)
            RandomRotation:=RandomRange(1, 5);

             case RandomRotation of
            // double loops create CRU with all voxels in different +90 grad rotation
              1: begin
                   for i := 0 to SizeMax-1 do
                   for j := 0 to SizeMax-1 do
                   AddOneVoxelToCRUi;
                 end;

              2: begin
                   for i := SizeMax-1 downto 0 do
                   for j := 0 to SizeMax-1 do
                   AddOneVoxelToCRUi;
                 end;

              3: begin
                   for i := 0 to SizeMax-1 do
                   for j := SizeMax-1 downto 0 do
                   AddOneVoxelToCRUi;
                 end;

              4: begin
                   for i := SizeMax-1 downto 0 do
                   for j := SizeMax-1 downto 0 do
                   AddOneVoxelToCRUi;
                 end;

             end;
    NVoxels:=voxeli+1;  // record N of created voxels in CRU object

    // find  center of mass (before placing CRU on the "donut")
      FindCenterMass;

    //  CRU accomadation onto the cell "donut" (IndexCircling)
    for voxeli := 0 to NVoxels-1 do
     begin
      IndexCircling(xGridLen,voxels[voxeli].xv);
      IndexCircling(yGridLen,voxels[voxeli].yv);
     end;

  // record center mass coordinates after CRU rotation
       x_CM:=  voxels[CM_voxel_index].xv;
       y_CM:=  voxels[CM_voxel_index].yv;
  end;// with CRUi

end; // subroutine create CRU

//////////////////////////////////////


procedure Do_create_All_CRUs;
var Bini, i: integer;
Ntry: integer; // counter of attempts to create CRUi

begin
   CRUi:=-1; // CRUi is the index of i-th CRU that we want to create
  // go bin by bin, from the highest bin to the lowest bin
  // fitting larger CRUs first to vacant voxels is easier
  for Bini := High(CRUdistr_model) downto 0  do
    begin
     for i := 1 to CRUdistr_model[Bini] do // create all CRUs in each bin
       begin

        inc(CRUi); // create  the next CRU (next index)
        Setlength(ArCRU,CRUi+1); // expand array of CRUs to accomadate the CRUi

        with ArCRU[CRUi] do
        begin // for each CRUi
          NRyR:= BINi; // set # of RyRs in this CRUi exactly as in dSTORM
            // try to accomadate this CRU size in the grid
                 Ntry:=0;
                   repeat
                        inc(Ntry); // count attempts
                      // assign starting (seeding) coordinates for this CRU
                      x_CRU:= RandomRange(0, xGridLen);
                      y_CRU:= RandomRange(0, yGridLen);
                      CreateCRUi;
                 until No_overlap or (Ntry>100000); // this CRU must fit vacant voxels, we do 100,000 attempts
         // if the CRU cannot fit vacant voxels
         if Ntry>100000 then
               begin
                     Setlength(ArCRU,CRUi);  // step back
                     dec(CRUi);
     MessageDlg('Cannot create CRUs without overlap. Retry or use different parameters',mtWarning, [mbOK], 0);
                     exit;
               end;
          MarkLocations; // mark occupied voxels to fit next CRU in the remaining empty space
        end; // for CRUi

       end;
    end;

end;



//////////////////////////////////////////////////////////////
// Main procedure to create and set all CRUs
 begin
    Randomize;
    TotalNRyRs:= round(S_cell_mkm2*NRyRs_per_mkm2);
    ReadRyRSizeDistribution_dSTORM;
    Set_vacant_locations;
    Do_create_All_CRUs;
    Calculate_CRU_parameters;
    Vacant_locations:=nil; // free memory
    Show_distr_RyR_cluster_sizes_model;
 end;// proc



//////////////////////////////////////////////////////////////////
procedure Set_Diffusion;
var s_mkm2, distance_mkm: double;
 Tau, Tau1X, Tau1Y, DeltaT :double;
 v2_div_sum_v1_and_v2, Tau1, Tau2: double;
 Sx_mkm2, //   Sx_mkm2,  // boarding area in Y direction - around cell cross section
 Sy_mkm2:  //  Sy_mkm2,  // boarding area in X direction - along cell length
 double;
 CRUi:integer;

begin
// Diffusion within subspace cytosol: v1=v2 and τ1 = τ2
with  VoxelSub  do
  begin
   DeltaT:= TimeTick;
   // for diffusion along X, Ca crosses Y area shaped as a part of the ring
   Sy_mkm2:= (Pi*sqr(R_cell_mkm)- Pi*sqr(R_cell_mkm - Sub_depth_mkm))/ NvoxY;
   Tau1X:=  V1_mkm3 * dX_mkm / (DCyt_mkm2_per_ms * Sy_mkm2);
   FCC_CytSubX:= 0.5*(1- exp(-2*DeltaT/Tau1X));
   //  for diffusion along Y, Ca crosses X area shaped as as a rectangle
   Sx_mkm2:= Sub_depth_mkm * (SzX * GridSz_mkm); // exact
   Tau1Y:=  V1_mkm3 * dY_mkm / (DCyt_mkm2_per_ms * Sx_mkm2);
   FCC_CytSubY:= 0.5*(1- exp(-2*DeltaT/Tau1Y));
  end;


with  VoxelRing  do    // v1=v2 and τ1 = τ2,
  begin
   // Diffusion within ring cytosol
   DeltaT:= TimeTick;
  // for diffusion along X, Ca crosses Y area shaped as a part of the ring
   Sy_mkm2:= (Pi*sqr(R_cell_mkm-Sub_depth_mkm)- Pi*sqr(R_core_mkm))/ NvoxY;
   Tau1X:=  V1_mkm3 * dX_mkm / (DCyt_mkm2_per_ms * Sy_mkm2);
   FCC_CytRingX:=0.5*(1- exp(-2*DeltaT/Tau1X));
//  for diffusion along Y, Ca crosses X area shaped as as a rectangle
  Sx_mkm2:= VoxelRing_depth_mkm * SzX * GridSz_mkm;
   Tau1Y:=  V1_mkm3 * dY_mkm / (DCyt_mkm2_per_ms * Sx_mkm2);
   FCC_CytRingY:=0.5*(1- exp(-2*DeltaT/Tau1Y));

 // Diffusion within ring FSR
   DeltaT:= NTicks_Diffu2D_Ring_FSR*TimeTick;
   Tau1X:=  V1_mkm3 * dX_mkm / (DFSR_mkm2_per_ms * Sy_mkm2);
   FCC_FSRRingX:=0.5*(1- exp(-2*DeltaT/Tau1X));
   Tau1Y:=  V1_mkm3 * dY_mkm / (DFSR_mkm2_per_ms * Sx_mkm2);
   FCC_FSRRingY:=0.5*(1- exp(-2*DeltaT/Tau1Y));
  end;


// Diffusion between a subspace voxel and a ring voxel
 DeltaT:= TimeTick;
 distance_mkm:= Sub_depth_mkm/2 + VoxelRing_depth_mkm/2;
 s_mkm2:=   2*Pi*(R_cell_mkm - Sub_depth_mkm)*L_cell_mkm/(VoxelSub.NvoxX*VoxelSub.NvoxY);
 Tau1:=VoxelSub.V1_mkm3*distance_mkm/(DCyt_mkm2_per_ms * s_mkm2);
 Tau2:=VoxelRing.V1_mkm3*distance_mkm/(DCyt_mkm2_per_ms * s_mkm2);
 Tau:= (Tau1*Tau2)/(Tau1+Tau2);
 v2_div_sum_v1_and_v2:=  VoxelRing.V1_mkm3/(VoxelSub.V1_mkm3+VoxelRing.V1_mkm3);
 FCC_CytSubToRing:= v2_div_sum_v1_and_v2*(1- exp(-DeltaT/Tau));
 Volume_ratio_VoxelSub_to_VoxelRing:=  VoxelSub.V1_mkm3/VoxelRing.V1_mkm3;

// Diffusion between ring and the core
with  VoxelRing  do
  begin
   distance_mkm:= R_core_mkm + VoxelRing_depth_mkm/2;
   s_mkm2:= dX_mkm * (2*Pi*R_core_mkm)/NvoxY;
   Volume_ratio_VoxelRing_to_Core:= V1_mkm3/V_core_mkm3;
   // in cytosol
   DeltaT:=  NTicks_Diffu_Ring_to_Core_Cyt*TimeTick;
   Tau1:=V1_mkm3*distance_mkm/(DCyt_mkm2_per_ms * s_mkm2);
   Tau2:= V_core_mkm3*distance_mkm/(DCyt_mkm2_per_ms * s_mkm2);
   Tau:= (Tau1*Tau2)/(Tau1+Tau2);
   v2_div_sum_v1_and_v2:=  V_core_mkm3/(V_core_mkm3+V1_mkm3);
   FCC_CytRingToCore:= v2_div_sum_v1_and_v2*(1- exp(-DeltaT/Tau));
  // in FSR
   DeltaT:=  NTicks_Diffu_Ring_to_Core_FSR*TimeTick;
   Tau1:=V1_mkm3*distance_mkm/(DFSR_mkm2_per_ms * s_mkm2);
   Tau2:= V_core_mkm3*distance_mkm/(DFSR_mkm2_per_ms * s_mkm2);
   Tau:= (Tau1*Tau2)/(Tau1+Tau2);
   v2_div_sum_v1_and_v2:=  V_core_mkm3/(V_core_mkm3+V1_mkm3);
   FCC_FSRRingToCore:= v2_div_sum_v1_and_v2*(1- exp(-DeltaT/Tau));

  // Diffusion between FSR and JSR:
  DeltaT:=   NTicks_Diffu_FSR_to_JSR*TimeTick;
  FOR CRUi:=0 to nCRUs-1 do
with ArCRU[CRUi] do
    begin
     Volume_ratio_jSR_to_FSR_in_VoxelRing1:= JSR1_volume_mkm3/(V1_mkm3*V_fSR_part);
     v2_div_sum_v1_and_v2:=  V1_mkm3*V_fSR_part/(JSR1_volume_mkm3+V1_mkm3*V_fSR_part);
     Tau:= Tau_FSR_JSR_ML_model * v2_div_sum_v1_and_v2;
     // old formulation
     //     Tau:=  NVoxels * Tau;
     // new formulation
     Tau:=  NRyR * Tau;
     FCC_FSRtoJSR1_per_1RyR:= v2_div_sum_v1_and_v2*(1- exp(-DeltaT/Tau));
    end;
  end;
end; // proc Set_Diffusion


procedure Set_SERCA_tabulation;
var i:integer;
begin
// We use tabulated SERCA formulation because calclulation of power function is very slow
for i:=1 to SERCA_tab_max do
begin
//             SERCA_i :=  power(Ca_cytosol/Kmf, H_SERCA);
//          	 SERCA_SR := power(Ca_in_SR/Kmr, H_SERCA);
  SERCA_i_tab[i]:= power(i*1e-6/Kmf, H_SERCA);
  SERCA_SR_tab[i]:=  power(i*1e-5/Kmr, H_SERCA);
end;
end; // proc




procedure Set_CRU_activation_border_effect;
var i : integer;
y, y144: double;

function FitToCaAtNearestNeighbor(Nryr1: integer):double;
begin
result:= -15.1187*EXP(-(Nryr1-9)/50.5692)+26.4344;
end;

begin

// let's find border effect
y144:=  FitToCaAtNearestNeighbor(144);
for i:=1 to 500 do
  begin
       y:= FitToCaAtNearestNeighbor(i);
       y:= y/y144;
       y:= Power(y, 3);
       BorderEffect[i]:=y;
  end;
end;




procedure Set_electrophysiology;
var CRUi:integer;

  begin
       // Electrical capacitance
    Cm:=  C_pF_per_mkm2 *S_cell_mkm2;

    EK:=  RTdivF * ln(Ko/Ki);   //   Equilibrium potential for K+, mV
    EKs:= RTdivF * ln((Ko + 0.12* Nao)/(Ki + 0.12 * Nai)); //   Reversal potential of IKs, mV
    ENa:= RTdivF * ln(Nao/Nai); //   Equilibrium potential for Na+, mV
    // Maximum Cav1.3 and Cav1.2 ICaL conductance of cell membrane facing the dyadic space of one CRU

        FOR CRUi:=0 to nCRUs-1 do
        with ArCRU[CRUi] do
        begin
           CRUgCav12:= Cm*gCaL*frac12_gCaL*NVoxels/NvoxelsInAllCRUs;
           CRUgCav13:= Cm*gCaL*frac13_gCaL*NVoxels/NvoxelsInAllCRUs;
        end;

    // Maximum INCX current of 1 grid area
     INCX_max_1_voxel:=kNCX*Cm/Num_Sub_voxels;
    // Constant part of INaK
    kNaK:= Cm*InaKmax /((1 + power(KmKp/Ko,1.2))*(1+ power(KmNap/Nai,1.3)));
    Iext:=0;

  end;

Procedure Set_Tick_Counters;
  begin
    // set tick counters for integration of slow diffusion
    iTicks_Diffu2D_Ring_fSR:=0;
    iTicks_Diffu_FSR_to_JSR:=0;
    iTicks_Diffu_Ring_to_Core_FSR:=0;
    iTicks_Diffu_Ring_to_Core_Cyt:=0;
    iTicks_SERCA:=0;
  end;

// procedure to set initial values
procedure Set_initial_values;
var CRUi:integer;
begin
// [Ca] in mM
  Initial_Ca_Cyt:= 120*1e-6; // Initial Ca concentration in cytosol
  Initial_Ca_fSR:=1; //1; // Initial  Ca concentration of free SR
  Initial_Ca_jSR:=1; // // Initial Ca concentration in junctional SR
  Initial_fCM_cyt:= 0.0787; //Fractional occupancy of calmodulin by Ca in myoplasm
  Initial_fCM_sub:=0.0575; //Fractional occupancy of calmodulin by Ca in submembrane space
  Initial_fCQ_jsr:=0.6; //Fractional occupancy of calsequestrin by Ca in junctional SR
  Initial_fCa:=1; // ICaL availablity  via Ca-dependent inactivation


  // FCQ is balanced with Ca_jSR
  Initial_fCQ_jsr:=  kfCQ *Initial_Ca_jSR/(kfCQ *Initial_Ca_jSR+kbCQ);


// set initial values in cell compartments
  Ar2D_Set_Value(ArSubCyt, Initial_Ca_Cyt); // subspace Ca
  Ar2D_Set_Value(ArRingCyt, Initial_Ca_Cyt); // cytosol Ca
  Ar2D_Set_Value(ArRingFSR,  Initial_Ca_fSR); // free SR Ca

// set initial values in calmodulin local variables
  Ar2D_Set_Value(ArRingfCM, Initial_fCM_cyt); // Fractional occupancy of calmodulin by Ca in myoplasm
  Ar2D_Set_Value(ArSubfCM, Initial_fCM_sub); // Fractional occupancy of calmodulin by Ca in submembrane space

// set initial values in the core
  CoreCyt:= Initial_Ca_Cyt;
  CoreFSR:=Initial_Ca_fSR;
  CorefCM:=Initial_fCM_cyt;

// CRU ini values
    for CRUi:=0 to nCRUs -1 do
  with ArCRU[CRUi] do
  begin
         TimeOpen :=0;
         TimeClosed :=0;
         Open := false;
         CajSR1:=  Initial_Ca_jSR;
         fCQ :=   Initial_fCQ_jsr;
         fCa:=Initial_fCa;
         Ispark:=0;
         Ispark_before:=0;
         activation:=0;
         inactivation:=0;
  end; // with

  // set default ini values for ion currents
  Vm:=	-57.9639346865;
  dL13:=	0.000584545564405;
  fL13:=	0.862381249774;

  dL12:=dL13;
  fL12:=fL13;

  //Note: fCa is local and it is a property of the CRU object
  paF:=	0.144755091176;
  paS:=	0.453100576739;
  pi_:=	0.849409822329;
  n:=	0.0264600410928;
  y:=	0.113643187247;
  dT:=	0.00504393374639;
  fT:=	0.420757825415;
  q:=	0.694241313965;
  r:=	0.00558131733359;

end; // proc set ini values



//  Model execution pocedures

procedure Do_SERCA_puming_ring;
var
xi, yi: integer;
dCa :double;
Ca_cytosol_tab, Ca_in_SR_tab:integer;
SERCA_i, SERCA_SR:double;
begin
with VoxelRing do
  begin
          for xi:=0 to   NvoxX -1 do
          for yi:=0 to   NvoxY -1 do
    begin
       Ca_cytosol_tab:= round(ArRingCyt[yi,xi]/1e-6);
       SERCA_i := SERCA_i_tab[Ca_cytosol_tab];
       Ca_in_SR_tab:= round( ArRingFSR[yi,xi]/1e-5);
       SERCA_SR:=  SERCA_SR_tab[Ca_in_SR_tab];
       dCa:= NTicks_SERCA*TimeTick * Pup *(SERCA_i - SERCA_SR)/(1+SERCA_i +SERCA_SR);
       ArRingfSR_dCa[yi,xi]:=ArRingfSR_dCa[yi,xi] + dCa;
       ArRingCyt_dCa[yi,xi]:= ArRingCyt_dCa[yi,xi] - dCa* Volume_ratio_fSR_to_cyt;
     end; // for xi... for yi
   end;// with Voxel
end; // proc


procedure Do_SERCA_pumping_core;
var
SERCA_i, SERCA_SR:double;
dCa:double;
  begin
     SERCA_i :=  power(CoreCyt/Kmf, H_SERCA);
     SERCA_SR:=  power(CoreFSR/Kmr, H_SERCA);
     dCa:= NTicks_SERCA*TimeTick * Pup *(SERCA_i - SERCA_SR)/(1+SERCA_i +SERCA_SR);
     CoreFSR_dCa:=CoreFSR_dCa + dCa;
     CoreCyt_dCa:= CoreCyt_dCa - dCa* Volume_ratio_fSR_to_cyt;
  end; // proc


procedure Do_BufferCM(Voxel:VoxelType; Ar_Ca:Ar2Dtype; var Ar_fCM, Ar_dCa:Ar2Dtype);
var
  xi, yi: integer;
  fCMs1, dfCMsdt :double;
begin
 for xi:=0 to   Voxel.NvoxX -1 do
 for yi:=0 to   Voxel.NvoxY -1 do
  begin
      fCMs1:=Ar_fCM[yi,xi];
      dfCMsdt:= kfCM *Ar_Ca[yi,xi]*(1 - fCMs1) - kbCM * fCMs1;
      Ar_fCM[yi,xi]:=fCMs1+dfCMsdt*TimeTick;
      Ar_dCa[yi,xi]:=  Ar_dCa[yi,xi] -CM_total *dfCMsdt*TimeTick;
  end; // for xi... for yi
end; // proc


procedure Do_Buffer_CQ_jSR;
var CRUi: integer;
dfCQdt, dCadt :double;
begin
  for CRUi:=0 to  nCRUs -1 do
   begin
     with ArCRU[CRUi] do
     begin
       dfCQdt:=   kfCQ *CajSR1*(1- fCQ) -  kbCQ * fCQ;
       fCQ:=fCQ+dfCQdt*TimeTick;
       dCadt:=  - CQtot * dfCQdt;
       CajSR1:=CajSR1+ dCadt*TimeTick;
     end;// with
   end; // for
end;// proc


procedure Do_Buffer_CM_Core;
var
dfCMdt_core :double;
  begin
      dfCMdt_core:= kfCM *CoreCyt*(1 - CorefCM) - kbCM * CorefCM;
      CorefCM:=CorefCM+dfCMdt_core*TimeTick;
      CoreCyt_dCa:= CoreCyt_dCa - CM_total*dfCMdt_core*TimeTick;
  end; // proc


Procedure Do_Diffusion2D(Voxel:VoxelType;FCCx,FCCy:double;ArCa:Ar2Dtype;var ArdCa:Ar2Dtype);
var
xi, yi, xi_next, yi_next: integer;
DeltaCa:double;

begin
  with Voxel do
  begin
     for xi:=0 to   NvoxX -1 do
       begin
        // Find xi_next and  then yi_next, indexes of right and top neighboring voxels
        xi_next:=xi+1;
        if  xi_next = NvoxX then xi_next:=0;

           for yi:=0 to   NvoxY -1 do
           begin
          // diffusion along X
          // recieving voxel is [yi, xi]
              DeltaCa:= ArCa[yi,xi_next] - ArCa[yi,xi];
              ArdCa[yi,xi]:= ArdCa[yi,xi]+ DeltaCa * FCCx;
          // Because voxels are of same volume,
          // dCa value is the same for two neighboring voxels, but comes with different signs
            ArdCa[yi,xi_next]:= ArdCa[yi,xi_next] - DeltaCa * FCCx;

          // diffusion along Y
              yi_next:=yi+1;
                  if  yi_next = NvoxY then yi_next:=0;
              DeltaCa:= ArCa[yi_next,xi] - ArCa[yi,xi];
              ArdCa[yi,xi]:= ArdCa[yi,xi]+ DeltaCa *FCCy;
              ArdCa[yi_next,xi]:= ArdCa[yi_next,xi] - DeltaCa *FCCy;

           end; // for yi
         end; // for xi
   end; // with Voxel
end; // proc


//  Diffusion between Cytosol ring and cell Core
Procedure Do_Diffusion_ring_and_core_Cyt;
var xi, yi: integer;
dCa:double;
begin
  with VoxelRing do
  begin
          for xi:=0 to   NvoxX -1 do
          for yi:=0 to   NvoxY -1 do
   begin
    dCa := (CoreCyt - ArRingCyt[yi,xi])* FCC_CytRingToCore;
    ArRingCyt_dCa[yi,xi]:= ArRingCyt_dCa[yi,xi] + dCa;
    CoreCyt:= CoreCyt - dCa*Volume_ratio_VoxelRing_to_Core;
   end;  // for xi, yi
  end; // with Voxel
end; // proc


//  Diffusion between fSR ring and cell Core
Procedure Do_Diffusion_ring_and_core_fSR;
var xi, yi: integer;
dCa:double;
begin
with VoxelRing do
  begin
          for xi:=0 to   NvoxX -1 do
          for yi:=0 to   NvoxY -1 do
   begin
    dCa := (CoreFSR - ArRingFSR[yi,xi]) * FCC_FSRRingToCore;
    ArRingfSR_dCa[yi,xi]:= ArRingfSR_dCa[yi,xi] + dCa;
    CoreFSR:= CoreFSR - dCa*Volume_ratio_VoxelRing_to_Core;
   end;  // for xi, yi
  end; // with Voxel
end; // proc


Procedure Do_Diffusion_Sub_and_Ring_Cyt;
var
xi_sub, yi_sub: integer;
xi_ring, yi_ring: integer;
DifferenceCa, dCa:double;
begin
  with VoxelSub do
  begin
    for xi_sub:=0 to   NvoxX -1 do
    for yi_sub:=0 to   NvoxY -1 do
     begin
        // find receiving voxel in ring
        xi_ring:= xi_sub div VoxelRing.SzX;
        yi_ring:= yi_sub div VoxelRing.SzY;
        //find dCa
        DifferenceCa:= ArRingCyt[yi_ring,xi_ring] - ArSubCyt[yi_sub,xi_sub];
        dCa:=  DifferenceCa*FCC_CytSubToRing;
        //update Ca arrays
        ArSubCyt_dCa[yi_sub,xi_sub]:= ArSubCyt_dCa[yi_sub,xi_sub] + dCa;
        ArRingCyt_dCa[yi_ring,xi_ring]:=
        ArRingCyt_dCa[yi_ring,xi_ring]- dCa*Volume_ratio_VoxelSub_to_VoxelRing;
     end; // for xi... for yi
  end; // with VoxelSub
end; // proc


Procedure Do_Diffusion_fSR_jSR;
var CRUi:integer;
var xx, yy: integer;
var yy_Ring, xx_Ring: integer;
//CajSR1_begin :double;
dCa, DeltaCa:double;
voxeli:integer;
begin
  for CRUi:=0 to  nCRUs -1 do
     with ArCRU[CRUi], VoxelRing do
     begin
       for voxeli := 0 to NVoxels-1 do
         begin
          // FCC_FSRtoJSR1_per_1RyR describes Ca diffusion per 1 RyR of JSR volume
          // from 1 ring voxel (FSR part) to the entire JSR
          // We have NRyR total such connections
          // Each CRU voxel has nRyRv such connections. nRyRv=16 for fully filled voxels
          // Let's find the ring voxel that connected to a given CRU voxel
          // then do diffusion via nRyRv connections each of wich described
          // by FCC_FSRtoJSR1_per_1RyR

           xx:= voxels[voxeli].xv;
           yy:= voxels[voxeli].yv;
           xx_Ring:= xx div SzX;
           yy_Ring:= yy div SzY;
           IndexCircling(NvoxX,xx_Ring);
           IndexCircling(NvoxY,yy_Ring);
          // Then find the Ca gradient
            DeltaCa := ArRingFSR[yy_Ring,xx_Ring] - CajSR1;

          // find dCa during time tick in the JSR
          //old formulation was diffusion per voxel, i.e. per 16 RyRs
//            dCa:= DeltaCa*FCC_FSRtoJSR1;
//        new formulation for dSTORM (individual RyRs) is per 1 RyR
            dCa:= DeltaCa*FCC_FSRtoJSR1_per_1RyR*voxels[voxeli].nRyRv;

          // update Ca_in_JSR after the change
            CajSR1 := CajSR1 + dCa;
           // new_Ca_in_FSR:
            ArRingfSR_dCa[yy_Ring,xx_Ring]:= ArRingfSR_dCa[yy_Ring,xx_Ring]
           - dCa* Volume_ratio_jSR_to_FSR_in_VoxelRing1;
       end;
     end;// for CRUi with ArCRU[i], VoxelRing
end;// proc



// This procedure distributes injected Ca to a CRU evenly among
// voxels of subspace (dyadic space) of that CRUi
// Ca injected via either ICaL or RyRs
procedure Do_dCa_dyadic_space(CRUi: integer; inject_Ca_mM: double);
var xx_temp, yy_temp: integer;
dCa_mM_per_liter: double;
voxeli: integer;

begin
   with ArCRU[CRUi] do
  begin
    dCa_mM_per_liter:=  inject_Ca_mM / Dyadic_volume_liter;
    for voxeli := 0 to NVoxels -1 do
    begin
      xx_temp:= voxels[voxeli].xv;
      yy_temp:=voxels[voxeli].yv;
      ArSubCyt_dCa[yy_temp,xx_temp]:= ArSubCyt_dCa[yy_temp,xx_temp] + dCa_mM_per_liter
    end;
  end;
end; // proc


//////////////////////////////
Procedure Do_CRUs;
var CRUi: integer;
Casub_local,
ionsCa_released_in_mM,
p, // probability of firing
random0: double;
Ispark_Termination_now: double;
I_one_RyR: double;


begin
for CRUi:=0 to  nCRUs -1  do // for loop for all CRUs
  with ArCRU[CRUi] do // process CRU with index CRUi
     begin
       Casub_local:= ArSubCyt[y_CM,x_CM];  // voxel of Ca sensor

           if not Open then // try to open this CRU
         begin
             inc(TimeClosed);
                 if CajSR1>=CaJSR_spark_activation then      // if CaJSR reaches a critical value for activation phase transition
                   begin
                      p:= (CRU_ProbConst/144) * NRyR* power((Casub_local/CRU_Casens ), CRU_ProbPower)*BorderEffect[NRyR]*TimeTick;
                     random0 := Random; // generates a random real number within the range of [0, 1)
                     if (random0 < p) then
                       begin // firing begins
                          Open:=true;
                          TimeOpen:=0;
                          Ispark:=0;
                       end;// if random
                   end; // id CajSR1>=CaJSR_spark_activation
         end; //if not open, i.e. if closed


           if Open then // CRU generates Ispark and may close if the current is too small
            begin
               inc(TimeOpen);
            // activation kinetics of Ispark
              activation:= 1- exp(-TimeOpen/Ispark_activation_tau_in_timeticks); // simple exponential =0 at t=0 and =1 at t=infinity
              inactivation:= exp(-TimeOpen/Ispark_inactivation_tau_in_timeticks); // simple exponential =1 at 0 and = 0 at t=infinity
              Ispark:=activation*inactivation*Ispark_at_1mM_CaJSR1 * (CajSR1 - Casub_local);
              I_one_RyR:= Iryr_at_1mM_CaJSR *  (CajSR1 - Casub_local);
            // Let's find released Ca ammount in mM
            // current in pA, factor e-12, and TimeTick in ms
             ionsCa_released_in_mM:= Ispark*TimeTick *(1e-12)/FaradayConst_x_2;
            // Deplete Ca JSR for the time tick
            // but not more than CaJSR realy has now to avoid Ca leak from the system
            // testing if all Ca ions in jSR is released
             CajSR1 :=  CajSR1 - ionsCa_released_in_mM/ JSR1_volume_liter;
              if  CajSR1<0 then
              begin
                CajSR1:=0;
                ionsCa_released_in_mM :=   CajSR1*JSR1_volume_liter;
                Ispark:= ionsCa_released_in_mM/(TimeTick *(1e-12)/FaradayConst_x_2);
              end;
              // inject Ca released by the CRU to its dyadic space
              Do_dCa_dyadic_space(CRUi, ionsCa_released_in_mM);


     // Terminate spark only when Ispark becomes decaying
            if Ispark < Ispark_before then
                  begin
                   Ispark_Termination_now:= I_one_RyR*Ispark_Termination_scale;
                      // try to terminate the spark
                  if  Ispark < Ispark_Termination_now then
                     begin
                       Open:=false;
                       TimeClosed:=0;
                       Ispark:=0;
                       activation:=0;
                       inactivation:=0;
                     end;

                  end; //// if Ispark < Ispark_before

             Ispark_before:=Ispark; // save current Ispark for next tendency check

          end;// if open

      end; // for CRUi, with CRUi,
end; // proc


/////////////////////////////////////////////////////////////
Procedure Do_Update_Ca;
var xi, yi:  integer;
begin
 // local Ca is updated each time tick by adding dCa
          for xi:=0 to   VoxelSub.NvoxX -1 do
          for yi:=0 to   VoxelSub.NvoxY -1 do
     begin
         ArSubCyt[yi,xi]:= ArSubCyt[yi,xi] + ArSubCyt_dCa[yi,xi];
     end; // xi, yi

         for xi:=0 to   VoxelRing.NvoxX -1 do
         for yi:=0 to   VoxelRing.NvoxY -1 do
     begin
         ArRingCyt[yi,xi]:= ArRingCyt[yi,xi] + ArRingCyt_dCa[yi,xi];
         ArRingFSR[yi,xi]:= ArRingFSR[yi,xi] + ArRingfSR_dCa[yi,xi];
      end; // xi, yi

    CoreFSR:=CoreFSR + CoreFSR_dCa;
    CoreCyt:= CoreCyt+ CoreCyt_dCa;
end;// proc


// procedures for Electrophysiology in run time

// A common procedure to find ion current gating variables:
// x = dL, fL, fCa, dT, fT, etc.
procedure Find_Gating(x_inf, tau_x:double; var x:double);
var dxdt:double;
begin
  dxdt:=(x_inf - x)/tau_x;
  x:= x+ dxdt*TimeTick;
end;

procedure Find_ICaL(V:double); // total L-type Ca2+ current
var CRUi: longint;
tau_dL, tau_fL, tau_fCa :double;
DL_inf, FL_inf, fCa_inf, alfa_dL, beta_dL: double;
ICaL12_CRUi, ICaL13_CRUi :double;
inject_Ca_in_mM: double;

  begin
      ICaL12:=0;
      ICaL13:=0;
  // First calculate voltage-dependent parameters common for Cav1.3 and Cav1.2
  // Voltage-dependent activation
     if V=0 then V:=0.00001;  // avoiding 0/0
     alfa_dL:= -0.02839*(V+ 35)/ (exp(-(V+35)/2.5 )- 1)-0.0849 * V / (exp(-V/4.8)- 1);
     if V=5 then  V:=5.00001; // avoiding 0/0
     beta_dL:= 0.01143 * (V - 5)/ (exp((V- 5)/2.5) -1);
     tau_dL:=1/(alfa_dL+beta_dL);
  // Voltage-dependent inactivation
     tau_fL:=  k_TauFL*(257.1 * exp(-sqr((V+ 32.5)/13.9)) + 44.3); // sqr(x)=x*x

         // specific for Cav1.2
      // Voltage-dependent pat
         DL_inf:=1/(1+ exp(-(V+6.6)/6));   // GJP
         Find_Gating(dL_inf, tau_dL, dL12);
         FL_inf:=1/(1+exp((V +35)/7.3));
         Find_Gating(FL_inf, tau_fL, fL12);

         // specific for Cav1.3
      // Voltage-dependent part
         DL_inf:=1/(1+ exp(-(V+13.5)/6));   // M-L model
         Find_Gating(dL_inf, tau_dL, dL13);
         FL_inf:=1/(1+exp((V +35)/7.3));
         Find_Gating(FL_inf, tau_fL, fL13);

  // Cav1.2 and Cav1.3 are located in CRUs
    for CRUi:=0 to  nCRUs -1 do // for-loop to find ICaLi in each CRUi
         with ArCRU[CRUi] do
        begin
         //ArCRU[CRUi].

        // Ca-dependent inactivation of ICaL_local in each CRU
            fCa_inf:=1/(1 + ArSubCyt[y_CM,x_CM]/KmfCa);   //ArSubCyt[y,x] is the voxel of Ca sensor
            tau_fCa:= fCa_inf/alfafCa;
            Find_Gating(fCa_inf, tau_fCa, fCa);// find new fCa

            ICaL12_CRUi:=CRUgCav12*(V- ECaL)* dL12*fL12 * fCa;
            ICaL13_CRUi:=CRUgCav13*(V- ECaL)* dL13*fL13 * fCa;

        //integration of local currents to get whole-cell ICaL for Cav1.2 and Cav1.3
            ICaL12:= ICaL12 + ICaL12_CRUi;
            ICaL13:= ICaL13 + ICaL13_CRUi;
            // Now let's find Ca injected into CRUi via local ICaL
            // Current is in pA. With the factor 1e-12 and time in ms, [Ca] is in mM.
            // Inward ICaL is negative, and factor -1 gives positive flux
            // and increase of [Ca] in the dyadic space
            inject_Ca_in_mM := - (1e-12)*((ICaL12_CRUi + ICaL13_CRUi)/FaradayConst_x_2)*TimeTick;
            // change [Ca] in dyadic space due to Ca  influx of ICaL_local
            Do_dCa_dyadic_space(CRUi, inject_Ca_in_mM);
       end;// with

 ICaL:=  ICaL12+ICaL13;
end;



procedure Find_INCX(V:double);//  NCX current
var
  di, do_,k43,k12, k14, k41, k34, k21, k23, k32, x1, x2, x3, x4: double;
  xi, yi: integer;
  Casub_voxel, INCX_voxel :double;
  Add_Ca_mM_per_liter:double;
  di_1,  di_2,  k12_1,  k14_1: double;
begin
// NOTE   Qco =0 in Kurata model
  do_:=1+(Cao/Kco)*(1+exp(Qco * V/RTdivF))+(Nao/K1no)*
    (1+(Nao/K2no)*(1+Nao/K3no));
  k43:=Nai/(K3ni +Nai);
  k41 := exp(-Qn * V /(2*RTdivF));
  k34 :=Nao/(K3no+Nao);
  k21:=(Cao/Kco)*exp(Qco * V/RTdivF) /do_;
  k23 := (Nao/K1no)*(Nao/K2no)*(1+Nao/K3no)* exp(-Qn* V/(2*RTdivF))/do_;
  k32:=exp(Qn * V/(2*RTdivF));
  x1:= k34 * k41 *(k23 + k21) + k21 * k32 *(k43 + k41);

//let's first find  voltage dependent component common for all patches
  di_1:= (1/Kci)*(1 + exp(-Qci * V /RTdivF)+Nai/Kcni);
  di_2:= (Nai/K1ni)*(1 +(Nai/K2ni)*(1 +Nai/K3ni));
  k12_1:= (1/Kci)* exp(-Qci* V/RTdivF);
  k14_1:= (Nai/K1ni)*(Nai/K2ni)*
    (1 +Nai/K3ni)* exp(Qn * V /(2*RTdivF));

// now local Ca-dependent part
 INCX:=0;
 for xi:=0 to   VoxelSub.NvoxX -1 do
 for yi:=0 to   VoxelSub.NvoxY -1 do
 begin
  Casub_voxel:= ArSubCyt[yi,xi];

    di:=1+ Casub_voxel*di_1+di_2;
    k12:= Casub_voxel*k12_1/di;
    k14:= k14_1/di;

  x2:= k43* k32  *(k14 + k12) + k41* k12 *(k34 + k32);
  x3:= k43 * k14 *(k23 + k21) + k12 * k23*(k43 + k41);
  x4:= k34 * k23 *(k14 + k12) + k21 * k14* (k34+ k32);
  INCX_voxel:= INCX_max_1_voxel *(k21 * x2 - k12 * x1) / (x1 + x2 + x3 + x4);

//integration of whole-cell INCX from local currents
  INCX:=INCX + INCX_voxel;

 // Impact of NCX on local subspace Ca:
 // Ca current via NCX = 2*INCX because each net NCX transfer with ratio
 // of 3Na to 1Ca results in one elementary charge transfer, but
 // associated with one Ca ion transfer that has 2 elementary charges
 // Faraday constant should be doubled becuase Ca2+ has two elementary +charges
 // picoAmpers match picoliters and ms will give mM, no scaling factor is needed

 Add_Ca_mM_per_liter:=
 (2*INCX_voxel/FaradayConst_x_2)*TimeTick/(VoxelSub.V1_liters*V_cyt_part*1e12);
      ArSubCyt_dCa[yi,xi] := ArSubCyt_dCa[yi,xi] + Add_Ca_mM_per_liter;
 end; // for xi... for yi
end; // proc




// T-type Ca2+ current and background Ca current
procedure find_ICaT_and_IbCa(V:double);
var DT_inf, tau_dT, FT_inf, tau_fT:double;
dCa_mM_per_liter:double;
xi, yi:integer;
begin
// find ICaT
 DT_inf:=1/ (1 + exp(-(V + 26.3)/6.0));
 FT_inf:= 1/(1+  exp(  (V+ 61.7)/5.6));
 tau_dT:= 1/( 1.068  * exp(  (V+ 26.3)/30   ) + 1.068 * exp(-(V + 26.3)/30 ) );
 tau_fT :=1/( 0.0153 * exp(- (V + 61.7)/83.3) + 0.015 * exp( (V + 61.7)/15.38));
 Find_Gating(dT_inf, tau_dT, dT);
 Find_Gating(fT_inf, tau_fT, fT);
 ICaT:= Cm*gCaT * (V- ECaT)* dT* fT;
 // find IbCa
 IbCa:= Cm*gbCa*(V - ECaL);
// find local Ca change via ICaT and IbCa that is the same in each voxel
 dCa_mM_per_liter:= - ((ICaT+IbCa)/FaradayConst_x_2)*TimeTick/V_sub_picoliter;
 for xi:=0 to   VoxelSub.NvoxX -1 do
 for yi:=0 to   VoxelSub.NvoxY -1 do
 begin
    ArSubCyt_dCa[yi,xi]:= ArSubCyt_dCa[yi,xi]+ dCa_mM_per_liter;
 end; // for xi... for yi
end;  // proc

// Rapidly activating delayed rectifier K+ current
procedure find_IKr(V:double);
var Pa_inf, Pi_inf, tau_paF, tau_paS, tau_pi:double;
begin
  Pa_inf:=1/ (1  +  exp(-(V+23.2)/10.6));
  Pi_inf:= 1/ (1 + exp(   (V + 28.6)/17.1));
  tau_paF:= k_IKr_Tau*(0.84655354/(0.0372 * exp((V)/15.9) + 0.00096 * exp(-(V)/22.5)));
  tau_paS:= k_IKr_Tau*(0.84655354/(0.0042 * exp((V)/17.0) +  0.00015  * exp(-(V)/21.6)));
  tau_pi:= 1/(0.1 * exp(-V/54.645) + 0.656 * exp(V/106.157));
  Find_Gating(pa_inf, tau_paF, paF);
  Find_Gating(pa_inf, tau_paS, paS);
  Find_Gating(pi_inf, tau_pi, pi_);
  IKr:=Cm*gKr*(V - EK)*(0.6* paF + 0.4 * paS)*  pi_;
end;  // proc

// Slowly activating delayed rectifier K+ current
procedure find_IKs(V:double);
var n_inf, alfa_n, beta_n,tau_n:double;
begin
  alfa_n:= 0.014/ (1 + exp(-(V- 40)/9));
  beta_n:= 0.001 * exp(-V/45);
  n_inf:= alfa_n/(alfa_n +beta_n);
  tau_n:=1/(alfa_n+beta_n);
  Find_Gating(n_inf, tau_n, n);
  IKs:= Cm*gKs*(V - Eks)*sqr(n); // sqr(n)=n*n
end;   // proc

// 4-AP-sensitive currents
procedure find_Ito_and_Isus(V:double);
var q_inf, r_inf, tau_q, tau_r:double;
begin
  q_inf:=1/(1 + exp((V+ 49)/13));
  r_inf:=1/(1 + exp(-(V - 19.3)/15));
 tau_q:= 39.102/(0.57*exp(-0.08*(V+44))+0.065*exp(0.1*(V+45.93)))+ 6.06;
 tau_r:=14.40516/(1.037*exp(0.09*(V+30.61))+0.369*exp(-0.12*(V+23.84)))+2.75352;
  Find_Gating(q_inf, tau_q, q);
  Find_Gating(r_inf, tau_r, r);
  Ito:= Cm*gto*(V- EK)* q* r;
  Isus:= Cm*gsus * (V - EK)* r;
end;   // proc

// Hyperpolarization-activated current
procedure find_If(V:double);
var
IhNa,   //  Na+ part of I_f
IhK:    //  K+ part of I_f
double;
y_inf, tau_y: double;
begin
  y_inf:= 1/(1 + exp((V-V_Ih12)/13.5));
  tau_y:= 0.7166529/(exp(-(V+ 386.9)/45.302) + exp((V - 73.08)/19.231));
  Find_Gating(y_inf, tau_y, y);
  IhNa:=Cm*0.3833 * gh *(V - ENa)*sqr(y) ; // sqr(y)=y*y
  IhK:= Cm*0.6167 * gh *(V -  EK)*sqr(y);
  I_f:=IhNa+ IhK;
end;   // proc


//  Na+/K+ pump current
procedure find_INaK(V:double);
begin
//INaK:= Cm*InaKmax /((1 + power(KmKp/Ko,1.2))*
//  (1+ power(KmNap/Nai,1.3))*(1+ exp(-(V- ENa+ 120)/30)));
// kNaK:= Cm*InaKmax /((1 + power(KmKp/Ko,1.2))*(1+ power(KmNap/Nai,1.3)));
 INaK:= kNaK/(1+ exp(-(V- ENa+ 120)/30));
end;   // proc




////////////////////////////////////////////////
procedure Model_setup;
var s: string;
begin

if Stop_simulations<>3 then // re-run with same parameters
      begin
       // free memory
        ArCRU:=nil;
        Ar2D_free_memory;

      // Randomize sets random CRU firing and CRU distribution.
      // It initiates the built-in random number generator with a random
      // value obtained from the system clock
        Randomize;
        Read_Interface;
        Set_geometry;
        Ar2D_Set_Size;
        Set_CRUs;
        Stop_simulations:=0;
        fPlotVm.Series1.clear;
      end;

  Set_Diffusion; // must be after Set_CRUs
  Set_SERCA_tabulation;
  Set_CRU_activation_border_effect;
  Set_electrophysiology;
  Set_initial_values;
  Set_Tick_Counters;

// set output
  Set_image;

 // Set simulation duration and output
  SimTime:=0;
  SimOutputSampling_ticks:= round(SimOutputSampling_ms/TimeTick);

  SimOutputTick_counter:=0;
  Stop_simulations:=0; // new simulation

// outpout key parameters and model state at t=0
  WriteParams;
//  set first point in the plot at t=0
 fPlotVm.Series1.AddXY(SimTime, Vm);
// set image 0
  Update_Image;

  // Set controls
  Form1.Enabled:=true;
  Form1.BringToFront;
  Form1.label8.Caption:='None'; // reset file loading with a new CRU distribution
  // specify Form caption to separate multiple parallel program runs
  if bAR_stimulation_apply then s:='bAR' else s:='Basal state';
  Form1.Caption:=s;

end; // proc

///////////////////////////////////////////

Procedure Model_Exit;
begin
// reset program for a new simulation
  Form1.Button1.Enabled:= false;
  Form1.label8.Caption:='None';
end;   // proc


///////////////// COMPUTING THE MODEL AND OUTPUT ////////////////
procedure Model_Run;
var CRUi:integer;
time_save: Ttime;

begin ////////////

if Stop_simulations=1 then // if it was stop
    begin
      Stop_simulations:=0;
    end else
    begin
      time_save:= time;
      Clock_start:= time;
      fPlotVm.Series1.Clear;
    end;

 repeat // main integration loop

   SimTime:= SimTime+TimeTick;

  // bAR stimulation
   if bAR_stimulation_apply then
    if SimTime>= bAR_onset then
      begin
        gCaL := gCaL*(1 +(1.75-1)*bAR_percent/100);

        FOR CRUi:=0 to nCRUs-1 do
        begin
           ArCRU[CRUi].CRUgCav12:= Cm*gCaL*frac12_gCaL*ArCRU[CRUi].NVoxels/NvoxelsInAllCRUs;
           ArCRU[CRUi].CRUgCav13:= Cm*gCaL*frac13_gCaL*ArCRU[CRUi].NVoxels/NvoxelsInAllCRUs;
        end;

        V_Ih12 := -64 +7.8*bAR_percent/100;    //-56.2;
        gKr := gKr*(1 + (1.5-1)*bAR_percent/100);
        Pup := Pup*(1 + (2-1)*bAR_percent/100);

        bAR_stimulation_apply:= false; // apply only once, not every timetick
      end;


  // zeroing dCa arrays
   Ar2D_Set_Value(ArSubCyt_dCa, 0);
   Ar2D_Set_Value(ArRingCyt_dCa, 0);
   Ar2D_Set_Value(ArRingfSR_dCa, 0);
   CoreCyt_dCa:=0;
   CoreFSR_dCa:=0;


// Electrophysiology
// Find all membrane currents and their respective local Ca changes
   Find_ICaL(Vm);
   Find_INCX(Vm);
   find_ICaT_and_IbCa(Vm);
   find_IKr(Vm);
   find_If(Vm);
   find_Ito_and_Isus(Vm);
   find_INaK(Vm);
   find_IKs(Vm);

// Update total membrane current Im
      Im:=ICaL+ICaT+IKr+IKs+Ito+Isus+I_f+INaK+INCX+IbCa+Iext;
// Find Vm
      dVdt:= -Im/Cm;
      Vm := Vm + dVdt * TimeTick;

// Ca buffers
// Buffer CaM in subspace
    Do_BufferCM(VoxelSub, ArSubCyt, ArSubfCM, ArSubCyt_dCa);
// Buffer CaM in ring
    Do_BufferCM(VoxelRing, ArRingCyt, ArRingfCM, ArRingCyt_dCa);
// Buffer CaM in the core
   Do_Buffer_CM_Core;

//Buffer Calsequestrin in JSR
   Do_Buffer_CQ_jSR;

 // Ca Diffusion within 2D layers
 // Ca Diffusion wthin subspace cytosol
  Do_Diffusion2D(VoxelSub,FCC_CytSubX, FCC_CytSubY, ArSubCyt, ArSubCyt_dCa);

  // Ca Diffusion within ring cytosol
  Do_Diffusion2D(VoxelRing,FCC_CytRingX, FCC_CytRingY, ArRingCyt, ArRingCyt_dCa);

// Ca Diffusion within ring FSR
   inc(iTicks_Diffu2D_Ring_fSR);    // tick counter
   if  iTicks_Diffu2D_Ring_fSR = NTicks_Diffu2D_Ring_FSR then
   begin
    Do_Diffusion2D(VoxelRing, FCC_FSRRingX, FCC_FSRRingY, ArRingFSR, ArRingfSR_dCa);
     iTicks_Diffu2D_Ring_fSR:=0;
     end;

// Radial Ca diffusion between layers
//Ca Diffusion Subspace - Ring in Cytosol
  Do_Diffusion_Sub_and_Ring_Cyt;

// Ca Diffusion ring - core in FSR
 inc(iTicks_Diffu_Ring_to_Core_FSR);  // tick counter
  if   iTicks_Diffu_Ring_to_Core_FSR =  NTicks_Diffu_Ring_to_Core_FSR then
 begin
  Do_Diffusion_ring_and_core_fSR;
  iTicks_Diffu_Ring_to_Core_FSR:=0;
 end;

 // Ca Diffusion ring - core in Cytosol
inc(iTicks_Diffu_Ring_to_Core_Cyt);   // tick counter
 if iTicks_Diffu_Ring_to_Core_Cyt =   NTicks_Diffu_Ring_to_Core_Cyt then
 begin
  Do_Diffusion_ring_and_core_Cyt;
  iTicks_Diffu_Ring_to_Core_Cyt:=0;
 end;

//  Ca Diffusion  FSR - JSR
 inc(iTicks_Diffu_FSR_to_JSR); // tick counter
 if  iTicks_Diffu_FSR_to_JSR= NTicks_Diffu_FSR_to_JSR then
 begin
   Do_Diffusion_fSR_jSR;
   iTicks_Diffu_FSR_to_JSR:=0;
 end;

 // Ca pumping by SERCA
 inc(iTicks_SERCA); // tick counter
if iTicks_SERCA = NTicks_SERCA then
 begin
   Do_SERCA_puming_ring;
   Do_SERCA_pumping_core;
   iTicks_SERCA:=0;
 end;

 // Ca Release
   Do_CRUs;

// Add dCa arrays to arrays of local Ca
  Do_Update_Ca;

  // Output
     // update plot
       inc(SimOutputTick_counter);

      if SimOutputTick_counter >= SimOutputSampling_ticks then // output tick counter
       begin
        SimOutputTick_counter:=0;
        //Update_Plot_Vm;
         fPlotVm.Series1.AddXY(SimTime, Vm);
       end;

      // update image
          if SecondOf(time - time_save) >= 1 then // update image and time output each second
            begin
              // show compute time
             Form1.label6.Caption:= 'Compute time='+ FormatDateTime('hh:nn:ss', time-Clock_start);
              // show simulation time
             Form1.label1.Caption:= 'Time='+ FloatToStrF(SimTime, ffgeneral, 8, 8);
             // show image
             if Form1.CheckBox2.Checked then Update_Image; // update image only if box2 checked
             Application.ProcessMessages;
             time_save:= time;
            end;
  until (SimTime >= SimTotalDuration_ms) or (Stop_simulations>0);

end; // proc


// show parameter form
procedure TForm1.Button18Click(Sender: TObject);
begin
 fParams.Visible:=true;
 fParams.BringToFront;
end;

// show plot form
procedure TForm1.Button2Click(Sender: TObject);
begin
    FplotVm.Visible:=true;
    FplotVm.BringToFront;
end;

// show image form
procedure TForm1.Button3Click(Sender: TObject);
begin
 fImage2.Visible:= true;
 fImage2.BringToFront;
end;



///////////////
Procedure FreeMemory1;
begin
 Stop_simulations:=2; // terminate
 Sleep(100);
// CRU network
 if ArCRU<>nil then ArCRU:=nil;
// Image
 Free_Memory_image;
 CRUdistr_model:=nil;
 CRUdistr_dSTORM:= nil;
 end;

///////////////////////////
procedure TForm1.FormDestroy(Sender: TObject);
begin
 FreeMemory1;
end;

///////////////////////
procedure TForm1.Button4Click(Sender: TObject);
begin
// repaint Ca and CRUs
  Set_image;
  Update_image;
end;


/////////////////////////////
procedure TForm1.FormCreate(Sender: TObject);
begin
 nCRUs:=0;
end;


///////////////////////
procedure TForm1.Button11Click(Sender: TObject); // stop simulations;
begin
  Stop_simulations:=1;
  Button27.Enabled:= true; //  continue
  Button11.Enabled:= false; //  stop
end;

////////////////////////////////////////////////////////////////
procedure TForm1.Button27Click(Sender: TObject); // continue simulations
begin
   Stop_simulations:=1;// stop
   Button27.Enabled:= false; //  stop
   Button11.Enabled:= true; //  continue
 model_run;
end;

//////////////////////////////////
procedure TForm1.Button33Click(Sender: TObject); // halt simulations
begin
  Stop_simulations:=2; // terminate
  Button33.Enabled:= false; //  terminate
  Button11.Enabled:= false; //  stop
  Button27.Enabled:= false; //  continue
  Button6.Enabled:= true; //  preview
end;

////////////////////////////////
procedure TForm1.Button6Click(Sender: TObject); // create model and set controls
begin
  Model_setup;
  Form1.Button1.Enabled:= true;  // allow model to run
  Button32.Enabled:= false; //  re-run
  Button33.Enabled:= false; //  terminate
  Button11.Enabled:= false; //  stop
  Button27.Enabled:= false; //  continue
  Form1.Label1.Caption:= 'SimTime=0';
end;

///////////////////////
procedure TForm1.Button1Click(Sender: TObject); // run model
begin
  Form1.Button1.Enabled:= false;
  Button33.Enabled:= true; //  terminate
  Button11.Enabled:= true; //  stop
  Button32.Enabled:= true; //  re-run
  Button6.Enabled:= false; //  preview
  Model_Run;
end;

/////////////////////////
procedure TForm1.Button32Click(Sender: TObject); // re-run same model
begin
   Stop_simulations:=3; // re-run
  Button33.Enabled:= true; //  terminate
  Button11.Enabled:= true; //  stop
  Button27.Enabled:= false; //  continue
  Button6.Enabled:= false; //  preview

   model_setup;
   model_run;
end;

////////////////////////
//procedure FreeMemory and halt
procedure TForm1.Button5Click(Sender: TObject);
begin
 FreeMemory1;
// Form1.Close;
 Application.Terminate;
// halt;
end;





///////////////////////////
procedure savemodel;
var F: TextFile;
voxeli, CRUi:integer;
var ExportDirStr, s: string;
DirAndFnameStr: string;

begin

  s:=Form1.Edit4.Text;
  ExportDirStr:= Form1.edit31.Text;
  ExportDirStr:= IncludeTrailingPathDelimiter(ExportDirStr);
  DirAndFnameStr:= ExportDirStr+s;

if nCRUs=0 then exit;
AssignFile(F,DirAndFnameStr);
rewrite(F);
writeln(F,'nCRUs');
writeln(F,nCRUs);
writeln(F,'TotalNRyRs');
writeln(F,TotalNRyRs);
writeln(F,'NvoxelsInAllCRUs');
writeln(F,NvoxelsInAllCRUs);
writeln(F,'Parameters of CRUs');

for CRUi:=0 to nCRUs-1 do
with ArCRU[CRUi] do
 Begin
   Writeln(F,'CRU #'+#9+ intTostr(CRUi));
   Writeln(F,'x'+#9+intTostr(x_CM));
   Writeln(F,'y'+#9+ intTostr(y_CM));
   Writeln(F,'NRyR'+#9+intTostr(NRyR));
   Writeln(F,'NVoxels'+#9+intTostr(NVoxels));
  for voxeli := 0 to NVoxels-1 do
  with Voxels[voxeli] do
  begin
   Writeln(F,'Voxel#'+#9+intTostr(voxeli));
   Writeln(F,'xv'+#9+intTostr(xv));
   Writeln(F,'yv'+#9+intTostr(yv));
   Writeln(F,'nRyRv'+#9+intTostr(nRyRv));
   Writeln(F,'Rotationv'+#9+intTostr(Rotationv));

  end; // for voxeli
 end; // for CRUi
CloseFile(F);

end;



procedure readmodel;
var s:string; F: TextFile;
voxeli, CRUi:integer;
nCRUs_test,
TotalNRyRs_test:integer;

begin
// load model
//  OpenDialog1.InitialDir:='C:\users\Public\';
  Form1.OpenDialog1.Filter:=  'CRU file(*.txt)|*.txt';

  if Form1.OpenDialog1.Execute then
   begin
     s := Form1.OpenDialog1.FileName;
         AssignFile(F,s);
         Reset(F);
    readln(F,s); readln(F,nCRUs_test);
    readln(F,s); readln(F,TotalNRyRs_test);

     if (nCRUs_test<>nCRUs) or  (TotalNRyRs_test <>TotalNRyRs)
     then
      begin
       MessageDlg('You are loading a different model', mtError, [mbOK], 0);
             CloseFile(F);
       exit;
      end;

    readln(F,s); readln(F,NvoxelsInAllCRUs);
    readln(F,s);
    for CRUi:=0 to nCRUs-1 do
      with ArCRU[CRUi] do
       begin
        readln(F,s);
        readln(F,s); s:= Tabstr(s,2); x_CM:= StrToInt(s);
        readln(F,s); s:= Tabstr(s,2); y_CM:= StrToInt(s);
        readln(F,s); s:= Tabstr(s,2); NRyR:= StrToInt(s);
        readln(F,s); s:= Tabstr(s,2); NVoxels:= StrToInt(s);
            setlength(Voxels, NVoxels);
          for voxeli := 0 to NVoxels-1 do
          with Voxels[voxeli] do
          begin
            readln(F,s);
            readln(F,s); s:= Tabstr(s,2); xv:= StrToInt(s);
            readln(F,s); s:= Tabstr(s,2); yv:= StrToInt(s);
            readln(F,s); s:= Tabstr(s,2); nRyRv:= StrToInt(s);
            readln(F,s); s:= Tabstr(s,2); Rotationv:= StrToInt(s);
          end;

        // ini values
         TimeOpen :=0;
         TimeClosed :=0;
         Open := false;
         CajSR1:=  Initial_Ca_jSR;
         fCQ :=   Initial_fCQ_jsr;
         fCa:=Initial_fCa;
         Ispark:=0;
         Ispark_before:=0;
         activation:=0;

     end; // with, for CRUi

         Calculate_CRU_parameters;

     Ispark_activation_tau_in_timeticks:=  Ispark_activation_tau_ms/TimeTick;

       s:=ExtractFileName(Form1.OpenDialog1.FileName);
       Form1.label8.Caption:=s;

      CloseFile(F);
     Update_Image;
   end;// if Open

end; // proc


  // Save model
procedure TForm1.Button7Click(Sender: TObject);
var ExportDirStr, s: string;
begin
  if nCRUs=0 then exit; //if CRUs are not created yet, then exit
  savemodel;
end;

// read model
procedure TForm1.Button8Click(Sender: TObject);
begin
  // the CRU model must be loaded on a CRU network with the same parameters
  if nCRUs=0 then exit; //if the CRUs are not created yet, then exit
   readmodel;
end;




end.

