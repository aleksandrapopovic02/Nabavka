unit narucivanje;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Edit, FMX.ListBox, FMX.DateTimeCtrls, FMX.Controls.Presentation,pregled,przahteva,db;

type
  TForm6 = class(TForm)
    popunjavanjelabel: TLabel;
    Datumlabel: TLabel;
    narudzbenicadate: TDateEdit;
    Dcombobox: TComboBox;
    dobavljaclabel: TLabel;
    nazivlabel: TLabel;
    brojlabel: TLabel;
    kolicinalabel: TLabel;
    cenalabel: TLabel;
    cenaedit: TEdit;
    vrstaedit: TEdit;
    kolicinaedit: TEdit;
    nazivedit: TEdit;
    Label1: TLabel;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    ScomboBox: TComboBox;
    Label2: TLabel;
    Button5: TButton;
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button5Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form6: TForm6;
  I:integer;
  max:string;
  dob:String;
  snab:String;
implementation

{$R *.fmx}

procedure TForm6.Button1Click(Sender: TObject);
begin

dob:=copy(Dcombobox.Selected.Text,0,3);
 snab:=copy(Scombobox.Selected.Text,0,3);

dbform.FDQuery2.SQL.Text := 'INSERT INTO narudzbenice (id_dobavljaca, id_snabdevaca, datum) ' +
                     'VALUES ('''+ dob+ ''', '''+snab+''','''+narudzbenicaDate.text +''')';
dbform.FDquery2.ExecSQL;
showmessage('Narudzbenica kreirana!');

end;

procedure TForm6.Button2Click(Sender: TObject);
begin

dbform.FDQuery2.SQL.Text := 'SELECT * FROM narudzbenice WHERE id_narudzbenice = (SELECT max(id_narudzbenice) FROM narudzbenice)';
dbform.FDQuery2.Open;

max:= dbform.FDQuery2.fieldbyname('id_narudzbenice').asString;

dbform.FDQuery1.SQL.Text := 'INSERT INTO stavke_narudzbenice (id_narudzbenice,naziv,vrsta,kolicina,cena_kom) VALUES ('''+ max+ ''', '''+nazivedit.Text+''','''+vrstaedit.Text+''','''+kolicinaedit.text +''','''+cenaedit.Text +''')';
dbform.FDquery1.ExecSQL;

 nazivEdit.text:='';
 cenaEdit.Text:='';
 kolicinaEdit.Text:='';
 vrstaEdit.Text:='';

end;

procedure TForm6.Button3Click(Sender: TObject);
begin
pregled.Form7.Show;
end;

procedure TForm6.Button4Click(Sender: TObject);
begin
przahteva.Form9.show;
end;

procedure TForm6.Button5Click(Sender: TObject);
begin
showmessage('narudzbenica kompletirana');
end;

procedure TForm6.FormShow(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'SELECT * FROM dobavljaci ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
DComboBox.items.Add(dbform.FDQuery2.FieldByName('id_dobavljaca').AsString + '  - ' +dbform.FDQuery2.FieldByName('naziv').AsString);
dbform.FDQuery2.next;
end;

dbform.FDQuery2.close;

dbform.FDQuery2.SQL.Text := 'SELECT * FROM snabdevaci ';
dbform.FDQuery2.Open;

for I := 1 to dbform.FDQuery2.RecordCount do
begin
SComboBox.items.Add(dbform.FDQuery2.FieldByName('id_snabdevaca').AsString+'  - '+dbform.FDQuery2.FieldByName('naziv').AsString);
dbform.FDQuery2.next;
end;

dbform.FDQuery2.close;

end;

end.
