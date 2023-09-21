unit zahtev;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Edit,
  FMX.StdCtrls, FMX.DateTimeCtrls, FMX.Controls.Presentation,db;

type
  TForm3 = class(TForm)
    Label1: TLabel;
    DateEdit1: TDateEdit;
    PosaljiButton: TButton;
    ZahtevEdit: TEdit;
    Label2: TLabel;
    procedure PosaljiButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TForm3;

implementation

{$R *.fmx}

procedure TForm3.PosaljiButtonClick(Sender: TObject);
begin
dbform.FDQuery2.SQL.Text := 'INSERT INTO zahtevi (opis, datum_zahtevanja) ' +
                     'VALUES ('''+ zahtevedit.Text+ ''', '''+dateedit1.Text+''')';
dbform.FDquery2.ExecSQL;

zahtevedit.Text:='';

end;

end.
