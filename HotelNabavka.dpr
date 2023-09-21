program HotelNabavka;

uses
  System.StartUpCopy,
  FMX.Forms,
  login in 'login.pas' {Form1},
  meni in 'meni.pas' {Form2},
  zahtev in 'zahtev.pas' {Form3},
  dobavljaci in 'dobavljaci.pas' {Form4},
  magacin in 'magacin.pas' {Form5},
  narucivanje in 'narucivanje.pas' {Form6},
  Pregled in 'Pregled.pas' {Form7},
  DB in 'DB.pas' {DBForm},
  snabdevaci in 'snabdevaci.pas' {Form8},
  prZahteva in 'prZahteva.pas' {Form9};

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TForm2, Form2);
  Application.CreateForm(TForm3, Form3);
  Application.CreateForm(TForm4, Form4);
  Application.CreateForm(TForm5, Form5);
  Application.CreateForm(TForm6, Form6);
  Application.CreateForm(TForm7, Form7);
  Application.CreateForm(TDBForm, DBForm);
  Application.CreateForm(TForm8, Form8);
  Application.CreateForm(TForm9, Form9);
  Application.Run;
end.
