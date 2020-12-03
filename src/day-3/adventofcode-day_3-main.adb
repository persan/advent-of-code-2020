with Ada.Text_IO; use Ada.Text_IO;
procedure Adventofcode.Day_3.Main is
   Slope : Slope_Type;
   Result : Long_Long_Integer;
begin
   Slope.Read ("src/day-3/input");
   Result := Slope.Race (1, 1) * Slope.Race (3, 1) * Slope.Race (5, 1) * Slope.Race (7, 1)  * Slope.Race (1, 2);
   Put_Line (Slope.Race (3, 1)'Img);
   Put_Line (Result'Img);
end Adventofcode.Day_3.Main;
