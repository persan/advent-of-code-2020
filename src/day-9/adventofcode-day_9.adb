pragma Ada_2012;
with Adventofcode.File_Line_Readers;
package body Adventofcode.Day_9 is

   ----------
   -- Read --
   ----------

   procedure Read (Self : in out Decoder; From_Path : String) is
   begin
      Self.Last := 0;
      Self.Data := (others => 0);
      for Line of Adventofcode.File_Line_Readers.Read_Lines (From_Path) loop
         Self.Data (Self.Last + 1) := Long_Integer'Value (Line);
         Self.Last := Self.Last + 1;
      end loop;
   end Read;

   ----------
   -- Scan --
   ----------

   procedure Scan
     (Self         : in out Decoder;
      Premble_Size : Natural := 25;
      Result       : out Long_Integer)
   is
      Found : Boolean := False;
      procedure Scan (Map : Data_Array; Target : Long_Integer) is
      begin
         for A in Map'Range loop
            for B in Map'Range loop
               if  Map (A) /= Map (B) and then Map (A) + Map (B) = Target then
                  Found := True;
               end if;
            end loop;
         end loop;
      end;
   begin
      for Cursor in Premble_Size + 1 .. Self.Last loop
         Found := False;
         Scan (Self.Data (Cursor - Premble_Size  .. Cursor - 1), Self.Data (Cursor));
         if not Found then
            Result := Self.Data (Cursor);
            return;
         end if;
      end loop;
      Result := -1;
   end Scan;

   procedure Scan2
     (Self         : in out Decoder;
      Key          : Long_Integer;
      Result       : out Long_Integer) is
   begin
      for Start_Cursor in Self.Data'First .. Self.Last loop
         for End_Cursor in Start_Cursor + 1 .. Self.Last loop
            declare
               Sum : Long_Integer := 0;
            begin
               for Ix in Start_Cursor .. End_Cursor loop
                  Sum := Sum + Self.Data (Ix);
               end loop;
               if Sum = Key then
                  declare
                     Min : Long_Integer := Self.Data (Start_Cursor);
                     Max : Long_Integer := Self.Data (Start_Cursor);
                  begin
                     for I in Start_Cursor .. End_Cursor loop
                        Min := Long_Integer'Min (Min, Self.Data (I));
                        Max := Long_Integer'Max (Max, Self.Data (I));
                     end loop;
                     Result := Min + Max;
                  end;

               end if;
            end;
         end loop;
      end loop;
   end Scan2;

end Adventofcode.Day_9;
