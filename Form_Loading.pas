unit Form_Loading;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Layouts,
  FMX.Objects, FMX.Ani;

type
  TFrm_Loading = class(TForm)
    Layout1: TLayout;
    Rectangle1: TRectangle;
    FloatAnimation1: TFloatAnimation;
    Rectangle2: TRectangle;
    FloatAnimation2: TFloatAnimation;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frm_Loading: TFrm_Loading;

implementation

{$R *.fmx}

end.
