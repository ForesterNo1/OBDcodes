unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls,
  Menus, ComCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    ComboBox2: TComboBox;
    ComboBox3: TComboBox;
    ComboBox4: TComboBox;
    ComboBox5: TComboBox;
    Edit1: TEdit;
    Image1: TImage;
    Image2: TImage;
    Image3: TImage;
    Label1: TLabel;
    Memo1: TMemo;
    Memo2: TMemo;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    procedure Button2Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure ComboBox3Change(Sender: TObject);
    procedure ComboBox5Change(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Label1Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;  x:string; SFile:Tstrings; S2File:Tstrings; y:string; Inp:integer;
  sub:string; subname:string; Leng:integer; i:integer;

implementation

{$R *.lfm}

{ TForm1 }


procedure TForm1.ComboBox1Change(Sender: TObject);
begin
  case ComboBox1.ItemIndex of
  0: begin Image1.Picture.LoadFromFile('img\honda.jpg'); x:='honda' ;
  end;
  1: begin Image1.Picture.LoadFromFile('img\mitsubishi.jpg'); x:='mitsubishi';
  end;
  2: begin Image1.Picture.LoadFromFile('img\toyota.jpg'); x:='toyota';
  end;
  end;
  ComboBox2.Items.LoadFromFile('codes\list.txt');
end;


procedure TForm1.ComboBox2Change(Sender: TObject);
begin
  SFile := TStringList.Create;
  SFile.LoadFromFile('codes\'+x+'.txt');
case ComboBox2.ItemIndex of
  0..85: Memo1.Lines.Text:=SFile.Strings[Combobox2.ItemIndex] ; end;

end;

procedure TForm1.ComboBox3Change(Sender: TObject);
begin

   case ComboBox3.ItemIndex of
   0: begin label1.Caption:=' B'; ComboBox4.Enabled:=True;y:='Bxxxx'; end;
   1: begin label1.Caption:=' C'; ComboBox4.Enabled:=True;y:='Cxxxx'; end;
   2: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=0; ComboBox4.Enabled:=False; y:='P0xxx'; end;
   3: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Acura'; end;
   4: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Audi'; end;
   5: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx BMW'; end;
   6: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Chevy'; end;
   7: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Chrysler&Jeep'; end;
   8: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Dodge'; end;
   9: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Ford'; end;
   10:begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx GM'; end;
   11:begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Honda'; end;
   12:begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Infiniti&Nissan';  end;
   13:begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx KIA'; end;
   14:begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Mazda'; end;
   15:begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Mitsubishi'; end;
   16: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx RAM'; end;
   17: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=1; ComboBox4.Enabled:=False; y:='P1xxx Toyota'; end;
   18: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=2; ComboBox4.Enabled:=False;y:='P2xxx'; end;
   19: begin label1.Caption:=' P'; ComboBox4.ItemIndex:=3; ComboBox4.Enabled:=False; y:='P3xxx'; end;
   20: begin label1.Caption:=' U'; ComboBox4.Enabled:=True;y:='Uxxx'; end;
   end;
end;
  procedure TForm1.Button2Click(Sender: TObject);
begin

 S2File := TStringList.Create;
 sub:= concat(ComboBox4.Text,Edit1.Text);
   try
  S2File.LoadFromFile('obd2codes\'+y+'.txt');
     for i:=0 to S2File.Count-1 do
     if Pos(sub,S2File[i]) > 0 then
     begin
      Memo2.Lines.Text:=Trim(Copy(S2File[i],Length(sub)+2,Length(S2File[i])- Length(sub)));
      Break;
     end;
   finally
   S2File.Free;
   end;
     end;
    { if ComboBox5.Itemindex = 0 then
     Memo2.Lines.Text:='No Such Code'
     else if ComboBox5.Itemindex = 1 then
     Memo2.Lines.Text:='Такого кода нет';}
  //sub := concat(Label1.Caption,ComboBox4.Text,Edit1.Text);

   //Memo2.Lines.Text:=S2File.Strings[StrtoInt(Edit1.Text)];

   {for i:=0 to S2File.Count-1 do
  begin
  Inp:= Pos(sub, S2File.Strings[i]);
    end; }

 {Leng:=Length(sub); //Вычисляем длину строки
 for i:=0 to S2File.Count-1 do
  begin
  Inp:= Pos(sub, S2File.Strings[i]); //Ищем позицию строки
  if Inp >= 0  then Memo2.Lines.Add(Copy(S2File.Strings[i],Inp)); //else Memo2.Lines.Text:='No such Code';  //Если Inp возвращает номер строки то она выводится в Memo2, если возвращает 0 то пишет что такого кода нет }
  //while not(eof(t, 'obd2codes\'+y+'.txt'))do
  //begin
  //Inp:= Pos(sub, S2File.Strings[i]);
  //if Inp > 0  then subname:= Copy(S2File.Strings[i],Inp,(Leng)) else Memo2.Lines.Text:='No such Code';
    // Memo2.Lines.Add(subname);
    // end;

// if Pos(sub, subname) > 0 then
//SFile.Strings[StrToInt(subname)] ;
// Memo2.Lines.Text:=S2File.Strings[StrToInt(Edit1.Text)];
//Memo2.Lines.Text:=SFile.Strings[StrtoInt(s)] ;
// Memo2.Lines.Add(s);
//Memo2.Lines.Text:=(Edit1.Text);
//end;
procedure TForm1.ComboBox5Change(Sender: TObject);
begin
 case ComboBox5.ItemIndex of
 0: begin ComboBox1.Text:='Select car mark'; ComboBox2.Text:='Code';
    Memo1.lines.Text:='Fault info';ComboBox3.Text:='Select code type';
   Memo2.lines.Text:='Fault info; Write code according to OBD scanner'; Form1.Caption:='OBD Fault codes v.2.2.2'
 end;
 1: begin ComboBox1.Text:='Выберете марку авто'; ComboBox2.Text:='Код';
     Memo1.lines.Text:='Значение кода'; ComboBox3.Text:='Выберете тип кода';
     Memo2.lines.Text:='Значение кода; Введите код согласно OBD сканеру'; Form1.Caption:='Коды ошибок OBD v.2.2.2';
 end;
end;
end;

procedure TForm1.Image2Click(Sender: TObject);
begin

end;



procedure TForm1.Image4Click(Sender: TObject);
begin

end;

procedure TForm1.Label1Click(Sender: TObject);
begin

end;

end.

