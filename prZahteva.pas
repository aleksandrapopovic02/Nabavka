unit prZahteva;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Grid, FMX.Edit, FMX.Controls.Presentation,
  FMX.ScrollBox,db;

type
  TForm9 = class(TForm)
    StringGrid1: TStringGrid;
    Button1: TButton;
    menjajeEdit: TEdit;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    Label1: TLabel;
    StringColumn4: TStringColumn;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form9: TForm9;
  broj:integer;
implementation

{$R *.fmx}

procedure TForm9.Button1Click(Sender: TObject);
begin
DbForm.FDQuery2.Sql.Text:='update zahtevi set status = 1 where id_zahteva ='''+menjajeEdit.text+'''';
DbForm.FDQuery2.ExecSQL;

menjajeEdit.text:='';

DbForm.FDQuery1.Sql.Text:='SELECT * FROM zahtevi';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_zahteva').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('opis').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('datum_zahtevanja').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('status').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;
end;

procedure TForm9.FormShow(Sender: TObject);
begin
DbForm.FDQuery1.Sql.Text:='SELECT * FROM zahtevi';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_zahteva').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('opis').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('datum_zahtevanja').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('status').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

end.
