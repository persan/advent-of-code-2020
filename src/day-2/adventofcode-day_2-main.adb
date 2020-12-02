with Adventofcode.File_Line_Readers;
with Ada.Text_IO; use Ada.Text_IO;
procedure Adventofcode.Day_2.Main is
   procedure Eval (Path : String) is
      Count : Natural := 0;
   begin
      for Line of Adventofcode.File_Line_Readers.Read_Lines (Path) loop
         if Parse (Line).Valid then
            Count := Count + 1;
         end if;
      end loop;
      Put_Line (Count'Img);
   end;
begin

   Eval ("src/day-2/input.test");
   Eval ("src/day-2/input");

end Adventofcode.Day_2.Main;
