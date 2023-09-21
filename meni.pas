unit meni;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs,
  FMX.Controls.Presentation, FMX.StdCtrls,dobavljaci,magacin,narucivanje;

type
  TForm2 = class(TForm)
    DobavljaciButton: TButton;
    PorucivanjeButton: TButton;
    MagacinButton: TButton;
    procedure DobavljaciButtonClick(Sender: TObject);
    procedure MagacinButtonClick(Sender: TObject);
    procedure PorucivanjeButtonClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TForm2;

implementation

{$R *.fmx}

procedure TForm2.DobavljaciButtonClick(Sender: TObject);
begin
     dobavljaci.Form4.Show;
end;

procedure TForm2.MagacinButtonClick(Sender: TObject);
begin
magacin.Form5.show;
end;

procedure TForm2.PorucivanjeButtonClick(Sender: TObject);
begin
narucivanje.Form6.show;
end;

end.
