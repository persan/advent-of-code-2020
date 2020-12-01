with Ada.Text_IO; use Ada.Text_IO;
with Ada.Assertions;
procedure Adventofcode.Day_1.Main is
   use Ada.Assertions;
   function Read (Path : String) return Expenses is
      Inf : File_Type;
      Buffer : Expenses (1 .. 1024); -- 1024 lines in the book;
      Cursor : Natural := Buffer'First;
   begin
      Open (Inf, In_File, Path);
      while not End_Of_File (Inf) loop
         Buffer (Cursor) := Currency'Value (Get_Line (Inf));
         Cursor := Cursor + 1;
      end loop;
      Close (Inf);
      return Buffer (Buffer'First .. Cursor - 1);
   end;

begin
   Put_Line (Eval (Read ("src/day-1/input"), 2020)'Img);

   Assert (514579 = Eval ((1721, 979, 366, 299, 675, 1456), 2020), "Invalid");
   Assert (731731 = Eval (Read ("src/day-1/input"), 2020), "invalid");
   Assert (241861950 = Eval3 ((1721, 979, 366, 299, 675, 1456), 2020), "Invalid");

   Put_Line (Eval3 (Read ("src/day-1/input"), 2020)'Img);

end Adventofcode.Day_1.Main;
