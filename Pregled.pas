unit Pregled;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.Controls.Presentation, FMX.ScrollBox, FMX.Grid,db,
  FMX.StdCtrls, FMX.Edit;

type
  TForm7 = class(TForm)
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Button1: TButton;
    StringGrid2: TStringGrid;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    StringColumn8: TStringColumn;
    StringColumn9: TStringColumn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form7: TForm7;
  broj:integer;
implementation

{$R *.fmx}

procedure TForm7.Button1Click(Sender: TObject);
begin
DbForm.FDQuery1.Sql.Text:='SELECT * FROM stavke_narudzbenice where id_narudzbenice ='''+edit1.text+'''';
DbForm.FDQuery1.Open;

StringGrid2.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid2.RowCount := StringGrid2.RowCount + 1;
StringGrid2.Cells[0,StringGrid2.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_stavke').asString;
StringGrid2.Cells[1,StringGrid2.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid2.Cells[2,StringGrid2.RowCount-1]:=DbForm.FDQuery1.FieldByName('vrsta').asString;
StringGrid2.Cells[3,StringGrid2.RowCount-1]:=DbForm.FDQuery1.FieldByName('kolicina').asString;
StringGrid2.Cells[4,StringGrid2.RowCount-1]:=DbForm.FDQuery1.FieldByName('cena_kom').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

procedure TForm7.FormShow(Sender: TObject);
begin
DbForm.FDQuery1.Sql.Text:='SELECT * FROM narudzbenice';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_narudzbenice').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('datum').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_dobavljaca').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_snabdevaca').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;
end;

end.
