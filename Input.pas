unit Input;


interface

uses GraphABC;

/// Возвращает значение -1, если игрок хочет двигаться влево или 1, если вправо. 0 - движения нет
function GetAxisHorizontal() : integer; 

/// Возвращает значение 1, если игрок хочет двигаться вниз или -1, если вверх. 0 - движения нет
function GetAxisVertical() : integer;


implementation

var up, down : boolean;
var left, right : boolean;

procedure KeyDown(Key : integer);
begin
  if (Key = VK_W) or (Key = VK_Up) then
    up := true;
  if (Key = VK_S) or (Key = VK_Down) then
    down := true;
  if (Key = VK_A) or (Key = VK_Left) then
    left := true;
  if (Key = VK_D) or (Key = VK_Right) then
    right := true;
end;

procedure KeyUp(Key : integer);
begin
  if (Key = VK_W) or (Key = VK_Up) then
    up := false;
  if (Key = VK_S) or (Key = VK_Down) then
    down := false;
  if (Key = VK_A) or (Key = VK_Left) then
    left := false;
  if (Key = VK_D) or (Key = VK_Right) then
    right := false;
end;

function GetAxisHorizontal() := left ? -1 : right ? 1 : 0;

function GetAxisVertical() := up ? -1 : down ? 1 : 0;

begin
  OnKeyDown += KeyDown;
  OnKeyUp += KeyUp;
end.