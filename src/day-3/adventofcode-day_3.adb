pragma Ada_2012;
with Adventofcode.File_Line_Readers;
package body Adventofcode.Day_3 is
   Tree : constant Character := '#';
   ----------
   -- Race --
   ----------
   function Race (Slope : Slope_Type; Right : Natural := 3; Down : Natural := 1) return Long_Long_Integer is
      Count  : Long_Long_Integer := 0;
      Cursor : Natural := 0;
      L      : Natural := 0;
   begin
      while L < Natural (Slope.Length) loop
         declare
            Line : constant String := Slope (L);
         begin
            if Line (Line'First + (Cursor mod Line'Length)) = Tree then
               Count := Count + 1;
            end if;
            for C in 1 .. Right loop
               Cursor := Cursor + 1;
            end loop;
         end;
         L := L + Down;
      end loop;
      return Count;
   end Race;

   ----------
   -- Read --
   ----------

   procedure Read (Into_Slope : in out Slope_Type; Path : String) is
   begin
      Into_Slope.Clear;
      for Line of Adventofcode.File_Line_Readers.Read_Lines (Path) loop
         if Line'Length > 0 and then Line (Line'First) in '.' | '#' then
            Into_Slope.Append (Line);
         end if;
      end loop;
   end Read;

end Adventofcode.Day_3;
