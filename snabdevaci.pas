unit snabdevaci;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, System.Rtti,
  FMX.Grid.Style, FMX.StdCtrls, FMX.Grid, FMX.ScrollBox, FMX.Edit,
  FMX.Controls.Presentation,db;

type
  TForm8 = class(TForm)
    Adresa: TLabel;
    AdresaEdit: TEdit;
    brisanjeEdit: TEdit;
    BrTelEdit: TEdit;
    DrzavaEdit: TEdit;
    GradEdit: TEdit;
    Label1: TLabel;
    label17: TLabel;
    Label2: TLabel;
    Label4: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    mailEdit: TEdit;
    NazivEdit: TEdit;
    StringGrid1: TStringGrid;
    StringColumn1: TStringColumn;
    StringColumn2: TStringColumn;
    StringColumn3: TStringColumn;
    StringColumn4: TStringColumn;
    StringColumn5: TStringColumn;
    StringColumn6: TStringColumn;
    StringColumn7: TStringColumn;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form8: TForm8;
  broj:integer;
implementation

{$R *.fmx}

procedure TForm8.Button1Click(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'INSERT INTO snabdevaci (naziv, zemlja, grad,adresa,brtel,email) ' +
                     'VALUES ('''+ nazivEdit.Text+ ''', '''+drzavaEdit.Text+''','''+gradedit.text +''','''+adresaedit.text +''','''+brteledit.text +''','''+mailedit.text +''')';
 dbform.FDquery2.ExecSQL;
 nazivEdit.text:='';
 drzavaEdit.Text:='';
 gradEdit.Text:='';
 adresaEdit.Text:='';
 brtelEdit.Text:='';
 mailEdit.Text:='';

DbForm.FDQuery1.Sql.Text:='SELECT * FROM snabdevaci';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_snabdevaca').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('zemlja').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('grad').asString;
StringGrid1.Cells[4,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('adresa').asString;
StringGrid1.Cells[5,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('brtel').asString;
StringGrid1.Cells[6,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('email').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

procedure TForm8.Button2Click(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'delete from snabdevaci where id_snabdevaca ='''+brisanjeedit.text+'''';
dbform.FDquery2.ExecSQL;
brisanjeedit.Text:='';

DbForm.FDQuery1.Sql.Text:='SELECT * FROM snabdevaci';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_snabdevaca').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('zemlja').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('grad').asString;
StringGrid1.Cells[4,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('adresa').asString;
StringGrid1.Cells[5,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('brtel').asString;
StringGrid1.Cells[6,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('email').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

procedure TForm8.FormShow(Sender: TObject);
begin
DbForm.FDQuery1.Sql.Text:='SELECT * FROM snabdevaci';
DbForm.FDQuery1.Open;

StringGrid1.RowCount:= 0;

for broj := 1 to DbForm.FDquery1.RecordCount do
begin

StringGrid1.RowCount := StringGrid1.RowCount + 1;
StringGrid1.Cells[0,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('id_snabdevaca').asString;
StringGrid1.Cells[1,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('naziv').asString;
StringGrid1.Cells[2,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('zemlja').asString;
StringGrid1.Cells[3,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('grad').asString;
StringGrid1.Cells[4,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('adresa').asString;
StringGrid1.Cells[5,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('brtel').asString;
StringGrid1.Cells[6,StringGrid1.RowCount-1]:=DbForm.FDQuery1.FieldByName('email').asString;
DbForm.FDQuery1.next;

end;

DbForm.FDquery1.close;

end;

end.
