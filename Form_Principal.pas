unit Form_Principal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls, FMX.ListView.Types,
  FMX.ListView.Appearances, FMX.ListView.Adapters.Base, FMX.ListView,
  FMX.Objects, Data.DB, Data_Module, System.Threading, System.SyncObjs, IdHTTP,
  FMX.Layouts, FMX.TreeView, Vcl.Imaging.jpeg;

type
  TFrm_Principal = class(TForm)
    ListView: TListView;
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
  private
    function LimparString(str: String): String;
    procedure AddItemDados(number, name, species, types, abilities,
        eggGroups, gender, height, weight, family, starter, legendary,
        mythical, ultraBeast, mega, gen, sprite, description: string);
    { Private declarations }
  public
    { Public declarations }
  end;

  Thread = class(TThread)

  end;

var
  Frm_Principal: TFrm_Principal;

implementation

{$R *.fmx}

uses Form_Loading, Winapi.Windows;

procedure TFrm_Principal.AddItemDados(number, name, species, types, abilities,
        eggGroups, gender, height, weight, family, starter, legendary,
        mythical, ultraBeast, mega, gen, sprite, description: string);
//var
//  FStream: TMemoryStream;
//  FIdHTTP : TIdHTTP;
begin
    with ListView.Items.Add do
    begin
      TListItemText(Objects.FindDrawable('lblnumber')).Text     := 'Número';
      TListItemText(Objects.FindDrawable('number')).Text        := number;
      TListItemText(Objects.FindDrawable('lblname')).Text       := 'Nome';
      TListItemText(Objects.FindDrawable('name')).Text          := name;
      TListItemText(Objects.FindDrawable('lblspecies')).Text    := 'Espécie';
      TListItemText(Objects.FindDrawable('species')).Text       := species;
      TListItemText(Objects.FindDrawable('lbltypes')).Text      := 'Tipos';
      TListItemText(Objects.FindDrawable('types')).Text         := LimparString(types);
      TListItemText(Objects.FindDrawable('lblabilities')).Text  := 'Habilidades';
      TListItemText(Objects.FindDrawable('abilities')).Text     := LimparString(abilities);
      TListItemText(Objects.FindDrawable('lbleggGroups')).Text  := 'Grupo de Ovos';
      TListItemText(Objects.FindDrawable('eggGroups')).Text     := LimparString(eggGroups);
      TListItemText(Objects.FindDrawable('lblgender')).Text     := 'Gênero';
      TListItemText(Objects.FindDrawable('gender')).Text        := gender;
      TListItemText(Objects.FindDrawable('lblheight')).Text     := 'Altura';
      TListItemText(Objects.FindDrawable('height')).Text        := IntToStr(height);
      TListItemText(Objects.FindDrawable('lblweight')).Text     := 'Peso';
      TListItemText(Objects.FindDrawable('weight')).Text        := weight;
      TListItemText(Objects.FindDrawable('lblfamily')).Text     := 'Família';
      TListItemText(Objects.FindDrawable('family')).Text        := LimparString(family);
      TListItemText(Objects.FindDrawable('lblstarter')).Text    := 'Iniciante';
      TListItemText(Objects.FindDrawable('starter')).Text       := starter;
      TListItemText(Objects.FindDrawable('lbllegendary')).Text  := 'Lendário';
      TListItemText(Objects.FindDrawable('legendary')).Text     := legendary;
      TListItemText(Objects.FindDrawable('lblmythical')).Text   := 'Mítico';
      TListItemText(Objects.FindDrawable('mythical')).Text      := mythical;
      TListItemText(Objects.FindDrawable('lblultrabeast')).Text := 'UltraFera';
      TListItemText(Objects.FindDrawable('ultraBeast')).Text    := ultraBeast;
      TListItemText(Objects.FindDrawable('lblmega')).Text       := 'Mega';
      TListItemText(Objects.FindDrawable('mega')).Text          := mega;
      TListItemText(Objects.FindDrawable('lblgen')).Text        := 'Geração';
      TListItemText(Objects.FindDrawable('gen')).Text           := gen;
      TListItemText(Objects.FindDrawable('description')).Text   := description;

//      FStream := TMemoryStream.Create;
//      FIdHTTP := TIdHTTP.Create(nil);
//      try
//        FIdHTTP.Get(sprite, FStream);
//        if (FStream.Size > 0) then
//          TListItemImage(Objects.FindDrawable('sprite')).Bitmap.LoadFromStream(FStream);
//      finally
//          FStream.Free;
//          FIdHTTP.Free;
//      end;
    end;
end;

procedure TFrm_Principal.Button1Click(Sender: TObject);
begin
  ListView.Items.Clear;
  Frm_Loading.Show;
  Thread.CreateAnonymousThread(
    procedure
    begin
        Thread.Sleep(1000);
        TThread.Synchronize(TThread.CurrentThread,
        procedure
        begin
          dm.RESTRequest1.Execute;
          ListView.BeginUpdate;

          while NOT dm.MemTable.Eof do
          begin
              AddItemDados(dm.MemTable.FieldByName('number').AsString,
                           dm.MemTable.FieldByName('name').AsString,
                           dm.MemTable.FieldByName('species').AsString,
                           dm.MemTable.FieldByName('types').AsString,
                           dm.MemTable.FieldByName('abilities').AsString,
                           dm.MemTable.FieldByName('eggGroups').AsString,
                           dm.MemTable.FieldByName('gender').AsString,
                           dm.MemTable.FieldByName('height').AsString,
                           dm.MemTable.FieldByName('weight').AsString,
                           dm.MemTable.FieldByName('family').AsString,
                           dm.MemTable.FieldByName('starter').AsString,
                           dm.MemTable.FieldByName('legendary').AsString,
                           dm.MemTable.FieldByName('mythical').AsString,
                           dm.MemTable.FieldByName('ultraBeast').AsString,
                           dm.MemTable.FieldByName('mega').AsString,
                           dm.MemTable.FieldByName('gen').AsString,
                           dm.MemTable.FieldByName('sprite').AsString,
                           dm.MemTable.FieldByName('description').AsString);

              dm.MemTable.Next;
          end;
          ListView.EndUpdate;
          Frm_Loading.Close;
        end);
    end).Start;
end;

function TFrm_Principal.LimparString(str: String): String;
begin
  str := StringReplace(str, '{', ' ', [rfReplaceAll,rfIgnoreCase]);
  str := StringReplace(str, '}', ' ', [rfReplaceAll,rfIgnoreCase]);
  str := StringReplace(str, '"', ' ', [rfReplaceAll,rfIgnoreCase]);
  str := StringReplace(str, '[', ' ', [rfReplaceAll,rfIgnoreCase]);
  str := StringReplace(str, ']', ' ', [rfReplaceAll,rfIgnoreCase]);
  str := StringReplace(str, '''', ' ', [rfReplaceAll,rfIgnoreCase]);

  Result := str;
end;

end.
