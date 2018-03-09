unit UnitVoz;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Imaging.jpeg, Vcl.ExtCtrls,
  Vcl.StdCtrls, comobj, Vcl.Mask, Vcl.ComCtrls, Vcl.Buttons;

type
  TfmVoz = class(TForm)
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Image4: TImage;
    mt_: TMonthCalendar;
    Bevel1: TBevel;
    Label1: TLabel;
    MaskEdit1: TMaskEdit;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    Panel1: TPanel;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    R_texto: TRichEdit;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Timer2: TTimer;
    lb_hora: TLabel;
    procedure Timer1Timer(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure mt_Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Timer2Timer(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  fmVoz: TfmVoz;
  voz: olevariant;

implementation

{$R *.dfm}

procedure TfmVoz.BitBtn1Click(Sender: TObject);
begin
  if BitBtn1.Caption='&LIGAR' then
    begin
      BitBtn1.Caption:='&DESLIGAR';
      timer2.Enabled:=true;
      MaskEdit1.SetFocus;
    end
    else
      begin
        if BitBtn1.Caption='&DESLIGAR' then
          begin
            BitBtn1.Caption:='&LIGAR';
            timer2.Enabled:=false;
            MaskEdit1.SetFocus;
          end
      end

end;

procedure TfmVoz.BitBtn2Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  if MaskEdit1.Text='00:00:00' then
    begin
      voz.speak('O despertador já está zerado');
    end
    else
      voz.speak('Zerando o despertador');
      MaskEdit1.Text:='00:00:00';
      BitBtn1.Caption:='&LIGAR';
end;

procedure TfmVoz.BitBtn3Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  voz.speak(R_texto.Text);
end;

procedure TfmVoz.BitBtn4Click(Sender: TObject);
begin
   voz:=createOleobject('Sapi.spVoice');
   if R_texto.Text=' ' then
    begin
      voz.speak('O campo de texto já está vazio');
    end
      else
      voz.speak('Limpando o campo');
      R_texto.Clear;
end;

procedure TfmVoz.BitBtn5Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  if messagedlg('Deseja sair do sistema?', mtConfirmation,[mbOk,mbNo],0)=mrOk then
    begin
      voz.speak('Saindo do sistema');
      close;
    end
    else
      abort;
end;

procedure TfmVoz.Image1Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  voz.speak('Estou com sede');
end;

procedure TfmVoz.Image2Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  voz.speak('Preciso de remédio');
end;

procedure TfmVoz.Image3Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  voz.speak('Quero tomar banho');
end;

procedure TfmVoz.Image4Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  voz.speak('Estou com fome');
end;

procedure TfmVoz.mt_Click(Sender: TObject);
begin
  voz:=createOleobject('Sapi.spVoice');
  voz.speak(' Agora são exatamente ' + timetostr(now) + ' do dia ' + datetostr(now));
end;

procedure TfmVoz.Timer1Timer(Sender: TObject);
begin
  lb_hora.Caption:=timetostr(now);
  statusbar1.Panels[0].Text:=timetostr(now);
  statusbar1.Panels[1].Text:=datetostr(now);
  statusbar1.Panels[2].Text:=' Sistema de Voz';
end;

procedure TfmVoz.Timer2Timer(Sender: TObject);
begin
  if strtotime(MaskEdit1.Text)<=time then
    begin
      voz:=createOleobject('Sapi.spVoice');
      voz.speak('Hora de acordar');
    end
    else
      abort;
end;

end.
