uses Input, GraphWPF, Timers, GameObject, Colliders, BasicTypes, GlobalGameConfig;

var framePassed := 0;

var Player: GO;

var Gos: array of GO;

procedure Update();
begin
  var hAxis := GetAxisHorizontal();
  var vAxis := GetAxisVertical();
  
  Player.Move(PlayerSpeed * hAxis, PlayerSpeed * vAxis);
  
  if framePassed > FramesBeforeClear then
  begin
    framePassed := 0;
    Window.Clear();
  end;
  
  Gos[1].RenderSquare();  
  Gos[0].RenderCircle();
  
  framePassed += 1;
end;

begin
  Player := GO.Create(3, 5);
  var Obstacle := GO.Create(100, 100);
  
  Gos := new GO[2];
  Gos[0] := Player;
  Gos[1] := Obstacle;
  
  Window.Title := 'Паскаль юнити';
  
  FillCircle(600, 600, 10); 
  
  Timers.CreateTimerAndStart(MSPerFrame, Update);
end.