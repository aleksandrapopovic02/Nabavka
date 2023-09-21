unit magacin;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Edit, FMX.Grid, FMX.Controls.Presentation,
  FMX.ScrollBox,db;

type
  TForm5 = class(TForm)
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    KolicinaEdit: TEdit;
    VrstaEdit: TEdit;
    NazivEdit: TEdit;
    BrisanjeEdit: TEdit;
    Brisanje: TButton;
    dodavanjeButton: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    procedure FormShow(Sender: TObject);
    procedure dodavanjeButtonClick(Sender: TObject);
    procedure BrisanjeClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form5: TForm5;
  broj:integer;
implementation

{$R *.fmx}

procedure TForm5.BrisanjeClick(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'delete from inventar where id_artikla ='''+brisanjeedit.text+'''';
dbform.FDquery2.ExecSQL;
brisanjeedit.Text:='';

DbForm.FDQuery1.Sql.Text:='SELECT * FROM inventar';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_artikla').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('vrsta').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('kolicina').asString;
DbForm.FDQuery1.next;
end;
end;

procedure TForm5.dodavanjeButtonClick(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'INSERT INTO inventar (naziv, vrsta, kolicina) ' +
                     'VALUES ('''+ nazivEdit.Text+ ''', '''+vrstaEdit.Text+''','''+kolicinaedit.text +''')';
 dbform.FDquery2.ExecSQL;
 nazivEdit.text:='';
 vrstaEdit.Text:='';
 kolicinaEdit.Text:='';

DbForm.FDQuery1.Sql.Text:='SELECT * FROM inventar';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_artikla').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('vrsta').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('kolicina').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

procedure TForm5.FormShow(Sender: TObject);
begin
DbForm.FDQuery1.Sql.Text:='SELECT * FROM inventar';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_artikla').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('vrsta').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('kolicina').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

end.
