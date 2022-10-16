unit Input;


interface

uses GraphWPF;

/// Возвращает значение -1, если игрок хочет двигаться влево или 1, если вправо. 0 - движения нет
function GetAxisHorizontal() : integer; 

/// Возвращает значение 1, если игрок хочет двигаться вниз или -1, если вверх. 0 - движения нет
function GetAxisVertical() : integer;


implementation

var holdingUp, holdingDown, holdingLeft, holdingRight : boolean;
var up, down, left, right : boolean;

procedure KeyDown(Key : Key);
begin
  if (Key = System.Windows.Input.Key.W) or (Key = System.Windows.Input.Key.Up) then
  begin
    up := true;
    holdingUp := true
  end
  
  else if (Key = System.Windows.Input.Key.S) or (Key = System.Windows.Input.Key.Down) then
  begin
    down := true;
    holdingDown := true;
  end
  
  else if (Key = System.Windows.Input.Key.A) or (Key = System.Windows.Input.Key.Left) then
  begin
    left := true;
    holdingLeft := true;  
  end
  
  else if (Key = System.Windows.Input.Key.D) or (Key = System.Windows.Input.Key.Right) then
  begin
    right := true;
    holdingRight := true;
  end
end;

procedure KeyUp(Key : Key);
begin 
  if (Key = System.Windows.Input.Key.W) or (Key = System.Windows.Input.Key.Up) then
  begin
    if holdingDown then
      down := true;
    holdingUp := false;
    up := false;
  end;
  
  if (Key = System.Windows.Input.Key.S) or (Key = System.Windows.Input.Key.Down) then
  begin
    if holdingUp then
      up := true;
    holdingDown := false;
    down := false;
  end;
  
  if (Key = System.Windows.Input.Key.A) or (Key = System.Windows.Input.Key.Left) then
  begin
    if holdingRight then
      right := true;
    holdingLeft := false;
    left := false;
  end;  
  
  if (Key = System.Windows.Input.Key.D) or (Key = System.Windows.Input.Key.Right) then
  begin
    if holdingLeft then
      left := true;
    holdingRight := false;
    right := false;
  end;    
end;

function GetAxisHorizontal() := holdingLeft ? -1 : holdingRight ? 1 : 0;

function GetAxisVertical() := holdingUp ? -1 : holdingDown ? 1 : 0;

begin
  OnKeyDown += KeyDown;
  OnKeyUp += KeyUp;
end.