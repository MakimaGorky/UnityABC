unit GameObject;

uses GraphWPF;

type GO = class
  private
    x, y : real;
  public 
    components: List<integer>;
    
    constructor Create(xx, yy: real);
    begin
      x := xx;
      y := yy;
    end;
    
    procedure RenderCircle();
    
    procedure RenderSquare();
    
    procedure Move(dx, dy: real);
    
    procedure Print();
end;

procedure GO.RenderCircle();
begin
  FillCircle(x, y, 10, clRandom());
end;

procedure GO.RenderSquare();
begin
  FillRectangle(x, y, 20, 20, clRandom());
end;

procedure GO.Move(dx, dy: real);
begin
  x += dx;
  y += dy;
end;

procedure GO.Print();
begin
  Println($'({x},{y})');
end;

end.