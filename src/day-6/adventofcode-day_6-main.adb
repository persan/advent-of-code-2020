with Ada.Text_IO; use Ada.Text_IO;
with Adventofcode.File_Line_Readers;
procedure Adventofcode.Day_6.Main is

   procedure Part1 (Input_Path : String) is
      Group_Reply  : Reply_Type;
      Totals       : Natural := 0;

   begin
      for Line of Adventofcode.File_Line_Readers.Read_Lines (Input_Path) loop
         if Line'Length > 0 then
            Group_Reply := Group_Reply + Value (Line);
         else
            Totals := Totals + Count (Group_Reply);
            Group_Reply := No_Replies;
         end if;
      end loop;
      Totals := Totals + Count (Group_Reply);
      Put_Line (Totals'Img);
   end;

   procedure Part2 (Input_Path : String) is
      Group_Reply  : Group_Replie;
      Totals       : Natural := 0;
   begin
      for Line of Adventofcode.File_Line_Readers.Read_Lines (Input_Path) loop
         if Line'Length > 0 then
            Group_Reply := Group_Reply + Value (Line);
         else
            Totals := Totals + Count (Group_Reply);
            Group_Reply := No_Replies;
         end if;
      end loop;
      Totals := Totals + Count (Group_Reply);
      Put_Line (Totals'Img);
   end;

begin
   Part1 ("src/day-6/input.test");
   Part1 ("src/day-6/input");
   Part2 ("src/day-6/input.test");
   Part2 ("src/day-6/input");

end Adventofcode.Day_6.Main;
