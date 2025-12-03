unit uImage2;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls,

  uParams,
  math
  ;



type
  TfImage2 = class(TForm)
    Image1: TImage;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fImage2: TfImage2;


procedure Free_Memory_image;
procedure Update_Image;
procedure Set_image;


implementation

{$R *.dfm}


uses
uSANCmodel;

var
Max_JSR,
Max_display_sub, Min_display_sub:double;
Bitmap1_has_been_created:boolean;
Bitmap1:TBitmap;

/////////////////////////////////
// painting Ca and JSR
var
Pixels_per_RyR, Pixels_per_voxel:integer;
JSR_pixel_size_paint: integer;

// free image memory
procedure Free_Memory_image;
begin
    if Bitmap1_has_been_created then Bitmap1.free;
    Bitmap1_has_been_created:=false;
end;



////////////////////////////////////////
// create bitmap
Procedure CreateBitMap(var Bitmap:TBitmap; Image:TImage);
  begin
    Image.Width:= xGridLen*Pixels_per_voxel;
    Image.Height:=yGridLen*Pixels_per_voxel+ 30;  // + for text size

    fImage2.Width:=  Image.Width +25;
//    16 pixels is equal to 12 points.
    fImage2.Height:=Image.Height +60; // form size including top of the form


  Bitmap := TBitmap.Create;
    Bitmap.PixelFormat := pf24bit;
    Bitmap.Width  := Image.Width;
    Bitmap.Height := Image.Height;
//  Bitmapi.Canvas.Font.Name := 'Arial';
    Bitmap1.Canvas.Font.Color := clBlack; //clWhite;
    Bitmap1.Canvas.Font.Size := 12; //
    Bitmap1.Canvas.Font.Style:=[fsBold];
//  Bitmap.Canvas.Font.Style := [fsItalic];
    Bitmap1.Canvas.Brush.Color:= clWhite;
    Bitmap1.Canvas.Pen.Color:= clWhite;
  end;  // proc

//////////////////////////////
procedure Set_image;
var
jSR_Xsize_in_pixels,
//jSR_Ysize_in_pixels,
X_offset_to_CRU_center_pixels, Y_offset_to_CRU_center_pixels: integer;
begin
 if  Bitmap1_has_been_created then Free_Memory_image;
with Form1 do
  begin
  Max_JSR:=StrToFloat(edit10.Text);
  Pixels_per_voxel:= StrToInt(Edit5.Text);
  // fine structure will be accurately painted only with Pixels_per_voxel =4  or 8 or 16, etc
  // (Pixels_per_voxel mod 4) must be 0
  Pixels_per_RyR:=  Pixels_per_voxel div 4;

  Max_display_sub:=StrToFloat(Edit7.Text)*(1E-3);
  Min_display_sub:= StrToFloat(Edit8.Text)*(1E-3);
  CreateBitMap(Bitmap1,fImage2.Image1);

   Bitmap1_has_been_created:=true;
  end;// with
end;// proc


/////////////////////////////////////
// color CRUs
Procedure ColorCRUs(var Bitmap:TBitmap);
var
color1, intens1_int:integer;
CRUi: integer;
voxeli:integer;
i, j, y1, y2, x1, x2:integer;
N : integer;

// sub-program to show fine CRU struture
// coloring each RyR in the last voxel if it is not fully filled with 16 RyRs
procedure colorOneRyR;
begin
   dec(N);
   if N>=0 then
   begin
    if Pixels_per_RyR = 1 then
     Bitmap.Canvas.Pixels[x2+i, y2+j]:=Color1
     else
     Bitmap.Canvas.FillRect(Rect(x2+i*Pixels_per_RyR, y2+j*Pixels_per_RyR, x2+(i+1)*Pixels_per_RyR, y2+(j+1)*Pixels_per_RyR))
   end;
end;

begin   // main program
//   color each CRU
//   fine structure
//   SizeMax2:=4;   // full voxel of CRU is 4 x 4 RyR. So, one side is always 4 RyR

  FOR CRUi:=0 to nCRUs-1 do
  begin
       // find and set intensity reflecting Ca in each jSR
          intens1_int:= round(255*ArCRU[CRUi].CajSR1/Max_JSR);
          if intens1_int>255 then intens1_int:=255;
          if intens1_int<0 then intens1_int:=0;

    //The value $00FF0000 represents full-intensity pure blue,
    // $0000FF00 is pure green,
    // and $000000FF is pure red.
    // $00000000 (Delphi) is black
    // and $00FFFFFF is white.

        // find color refelecting functional state
               // if not open but ready to fire
              if (not ArCRU[CRUi].Open) and (ArCRU[CRUi].CajSR1>= CaJSR_spark_activation) then
                 color1:=  $0000FF00 // paint in green
               else
              // if open
             if  ArCRU[CRUi].Open then
                 // paint on white shades reflecting SR Ca load (depletion)
               color1:=$00010101* intens1_int
             else
               // closed in refractory period
               // paint on blue shades reflecting SR Ca re-load (repleneshment)
                color1:= $00010000*intens1_int; // blue

       // set brush color
       Bitmap.Canvas.Brush.Color := Color1;

      // do paint
        for voxeli := 0 to ArCRU[CRUi].NVoxels -1 do
      with  ArCRU[CRUi].Voxels[voxeli] do
      begin
        y1:=  yv;
        x1:=  xv;
        y2:=y1*Pixels_per_voxel;
        x2:=x1 *Pixels_per_voxel;

            if nRyRv =16 then // voxel full of RyRs
             Bitmap.Canvas.FillRect(Rect(x2, y2, x2+Pixels_per_voxel, y2+Pixels_per_voxel))
            else    // // voxel is partially filled with RyRs
            begin
                N:= nRyRv; // let's color each RyR
                  case Rotationv of
                  // each double loop creates a finer part of the CRU in the last smaller JSR voxel with less than 16 RyRs
                  //  all these RyRs are displayed at same rotation as other larger voxels and shown attached to the CRU
                    1: begin
                         for i := 0 to 3 do
                         for j := 0 to 3  do
                          colorOneRyR;
                       end;

                    2: begin
                         for i := 3 downto 0 do
                         for j := 0 to 3 do
                         colorOneRyR;
                       end;

                    3: begin
                         for i := 0 to 3 do
                         for j := 3 downto 0 do
                         colorOneRyR;
                       end;

                    4: begin
                         for i :=3 downto 0 do
                         for j :=3 downto 0 do
                         colorOneRyR;
                       end;

                   end;  // case rotation
             end

       end; // for vixeli

    end; // for CRUi

end;  // proc




///////////////////////////////////////////////////////
// color Ca concentration in each submembrane voxel
procedure UpdateBitmap(Voxel:VoxelType;min, max: double;var Bitmap:TBitmap;Ar:Ar2Dtype);
  VAR
  x1,y1, x2,y2  :  INTEGER;
  intens: integer;
  Amplitude:double;
  Color1: integer;

begin
with Voxel do
begin
    Amplitude:= max-min;
    if Amplitude=0 then exit; // avoding div to zero

  FOR y1 := 0 TO yGridLen-1 DO
  BEGIN
  y2:=y1*Pixels_per_voxel;

    FOR x1:= 0  TO NvoxX-1 DO
    BEGIN
      // check max min
       if Ar[y1,x1] <= min then intens:=0
       else
       begin
         intens:=  round(255*(Ar[y1,x1] -min)/Amplitude);
         if intens>255 then intens:=255;
         if intens<0 then intens:=0;
       end;

       Color1:= intens;  //    Color1:= $00000001*intens; red shades

       x2:=x1 *Pixels_per_voxel;
      // set color
       Bitmap.Canvas.Brush.Color := Color1;
      // do color
      Bitmap.Canvas.FillRect(Rect(x2, y2,x2+Pixels_per_voxel, y2+Pixels_per_voxel));
    END; // for x
  END;// for y
end; // with voxel
end;


///////////////////////////////
procedure Update_Image;
var s, stime, s1, s2:string;
i, i1:integer;
FnameStr: string;
begin
// show Ca
    UpdateBitmap(VoxelSub, Min_display_sub, Max_display_sub,  Bitmap1, ArSubCyt);

// color CRUs on Image 1
   ColorCRUs(Bitmap1);

// Write Time  and voltage
    s1:= FloatToStrF(SimTime,ffGeneral, 8,8);
   if not s1.contains('.') then s1:= s1+'.000';
    i1:= s1.indexOf('.');
    for i := length(s1) to i1+3 do s1:=s1+'0';
    s1:= 'Time(ms)='+s1;//+#9+#9;
    s2:= 'V(mV)='+FloatToStrF(Vm,ffGeneral, 5,5)+'    ';
    s:= s1+'  '+s2 + '    ';
    Bitmap1.Canvas.Brush.Color:= clWhite;//  clBlack;
    Bitmap1.Canvas.TextOut(1, Bitmap1.Height - 30, s);

// Display on screen
   FImage2.Image1.Picture.Graphic := Bitmap1;

end; // proc


////////////////////////////////////////



procedure TfImage2.FormCreate(Sender: TObject);
begin
 Bitmap1_has_been_created:=false;
end;

end.
