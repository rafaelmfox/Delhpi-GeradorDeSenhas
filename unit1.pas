unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls;

type

  { TfrmPrincipal }

  TfrmPrincipal = class(TForm)
    btnGerar: TButton;
    btnLimpar: TButton;
    btnMenos: TButton;
    btnSair: TButton;
    btnMais: TButton;
    chkboxCaractersEspeciais: TCheckBox;
    chkboxNumerais: TCheckBox;
    chkboxUperCase: TCheckBox;
    chkboxLowCase: TCheckBox;
    tedtControle: TEdit;
    tEdtCaractersSpeciais: TEdit;
    tEdtNumerais: TEdit;
    tEdtResultado: TEdit;
    lblQuantia: TLabel;
    tEdtQuantia: TEdit;
    tEdtUperCase: TEdit;
    tEdtLowCase: TEdit;
    procedure btnGerarClick(Sender: TObject);
    procedure btnLimparClick(Sender: TObject);
    procedure btnMaisClick(Sender: TObject);
    procedure btnMenosClick(Sender: TObject);
    procedure btnSairClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure montarStringDeResultado();
    procedure limparEdits();
  private

  public
    vStr : string;
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.lfm}

{ TfrmPrincipal }

procedure TfrmPrincipal.btnSairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
  //comeca com as checkbox checadas
  chkboxLowCase.Checked:= true;
  chkboxNumerais.Checked:= true;
  chkboxUperCase.Checked:= true;
end;

procedure TfrmPrincipal.montarStringDeResultado();
begin
  //monta string de acordo com o que esta checado
   vStr:= '';


  if (chkboxUperCase.Checked = true) then
  begin
  vStr:= vStr+tEdtUperCase.Text;
  end;
  if (chkboxLowCase.Checked = true) then
  begin
  vStr:= vStr+tEdtLowCase.Text;
  end;
  if (chkboxNumerais.Checked = true) then
  begin
  vStr:= vStr+tEdtNumerais.Text;
  end;
  if (chkboxCaractersEspeciais.Checked = true) then
  begin
  vStr:= vStr+tEdtCaractersSpeciais.Text;
  end;

  //TEdit de controle para ver se a str esta certa
  //tedtControle.Text:=vStr;







end;

procedure TfrmPrincipal.limparEdits();
begin
  //limpa a tedit Resultado
    tEdtResultado.Clear;



end;

procedure TfrmPrincipal.btnLimparClick(Sender: TObject);
begin
  limparEdits();
end;

procedure TfrmPrincipal.btnMaisClick(Sender: TObject);
var
  auxiliar: integer;
begin
     auxiliar := StrToInt(tEdtQuantia.Text);
     auxiliar := auxiliar + 1;
     tEdtQuantia.Text := IntToStr(auxiliar);






end;

procedure TfrmPrincipal.btnMenosClick(Sender: TObject);
var
  auxiliar: integer;
begin
     auxiliar := StrToInt(tEdtQuantia.Text);
     auxiliar := auxiliar - 1;
     tEdtQuantia.Text := IntToStr(auxiliar);
end;

procedure TfrmPrincipal.btnGerarClick(Sender: TObject);
var
  aux: integer;
  //vQuantia: integer;
  // vStr = '1234567890ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz';
begin
    // vai gerar a senha
    montarStringDeResultado();
    limparEdits();
    //testar se esta faltanodo algum campo checado ou e vazio a quantia de caracters
    if (tEdtQuantia.Text = '') then
      begin
      ShowMessage('Por favor informe uma quantia de caracters');
      end
    else if (vStr = '') then
      begin
      ShowMessage('Por favor selecione uma checkbox');
      end
    else
      begin
        for aux:=1 to StrToInt(tEdtQuantia.Text) do
        begin
        tEdtResultado.Text := tEdtResultado.Text + vStr[Random(Length(vStr))+1];
        //tEdtResultado.Focused;
        //tEdtResultado.SelectAll;
        //tEdtResultado.SelStart:=0;
        //tEdtResultado.SelLength:=StrToInt(tEdtQuantia.Text);
        //tEdtResultado.CopyToClipboard;
        end;
      end;



end;

end.

