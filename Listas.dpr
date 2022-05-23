program Listas;

uses
  System.StartUpCopy,
  FMX.Forms,
  Form_Principal in 'Form_Principal.pas' {Frm_Principal},
  Data_Module in 'Data_Module.pas' {dm: TDataModule},
  Form_Loading in 'Form_Loading.pas' {Frm_Loading};

{$R *.res}

begin
  ReportMemoryLeaksOnShutdown := true;
  Application.Initialize;
  Application.CreateForm(TFrm_Principal, Frm_Principal);
  Application.CreateForm(Tdm, dm);
  Application.CreateForm(TFrm_Loading, Frm_Loading);
  Application.Run;
end.
