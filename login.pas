unit login;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Controls.Presentation, FMX.Edit, meni,zahtev,DB;

type
  TForm1 = class(TForm)
    SifraEdit: TEdit;
    login: TButton;
    ZhatevButton: TButton;
    Label1: TLabel;
    procedure loginClick(Sender: TObject);
    procedure ZhatevButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  radnik:string;
implementation

{$R *.fmx}

procedure TForm1.loginClick(Sender: TObject);
begin

  dbForm.FDQuery2.Sql.Text:='SELECT * FROM radnici WHERE sifra LIKE'''+SifraEdit.Text+'''' ;
  dbForm.FDQuery2.Open;
  radnik:= dbform.FDQuery2.FieldByName('id_radnika').AsString;

 if not(radnik.IsEmpty) then
  begin

  meni.Form2.Show;
  dbForm.FDQuery2.Close;

  end
else
  begin

  ShowMessage('Uneti podaci su neispravni');

  end;


end;

procedure TForm1.ZhatevButtonClick(Sender: TObject);
begin
    zahtev.form3.show;
end;

end.
