with Ada.Text_IO; use Ada.Text_IO;
procedure adventofcode.Day_1.Main is
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
      return Buffer (Buffer'First .. Cursor - 1);
   end;
begin
   Put_Line (Eval ((1721, 979, 366, 299, 675, 1456), 2020)'Img);
   Put_Line (Eval (Read ("src/day-1/input"), 2020)'Img);
end adventofcode.Day_1.Main;
