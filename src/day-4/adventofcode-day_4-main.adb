with Ada.Text_IO; use Ada.Text_IO;
procedure Adventofcode.Day_4.Main is
   procedure Check (Path : String) is
      Passports : Passport_Vector;
   begin
      Passports.Read (Path);
      Put_Line ("Valid_Passports =>" & Passports.Count_Valid'Img);
   end Check;
begin
   Check ("src/day-4/input.test");
   Check ("src/day-4/input");
end Adventofcode.Day_4.Main;
