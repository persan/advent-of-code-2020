with Ada.Text_IO; use Ada.Text_IO;
procedure Adventofcode.Day_9.Main is
   D : Decoder (1024);
   Key : Long_Integer := 0;
   Answer : Long_Integer := 0;

begin

   D.Read ("src/day-9/input.test");
   D.Scan (5, Key);
   Put_Line (Key'Img);

   D.Read ("src/day-9/input.test.2");
   D.Scan2 (Key, Answer);
   Put_Line (Answer'Img);

   D.Read ("src/day-9/input");
   D.Scan (25, Key);
   Put_Line (Key'Img);

   D.Read ("src/day-9/input");
   D.Scan2 (Key, Answer);
   Put_Line (Answer'Img);

end Adventofcode.Day_9.Main;
