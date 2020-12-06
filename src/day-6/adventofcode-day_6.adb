pragma Ada_2012;
package body Adventofcode.Day_6 is

   -----------
   -- Value --
   -----------

   function Value (Item : String) return Reply_Type is
   begin
      return Ret : Reply_Type do
         for C of Item loop
            Ret (Question_Id (C)) := True;
         end loop;
      end return;
   end Value;

   -----------
   -- Count --
   -----------

   function Count (Item : Reply_Type) return Natural is
   begin
      return Ret : Natural := 0  do
         for I of Item loop
            Ret := Ret + (if I then 1 else 0);
         end loop;
      end return;
   end Count;

   -----------
   -- Image --
   -----------

   function Image (Item : Reply_Type) return String is
      Ret : String (1 .. Item'Length);
      Cursor : Natural := Ret'First;
   begin
      for Index in Item'Range loop
         if Item (Index) then
            Ret (Cursor) := Character (Index);
            Cursor := Cursor + 1;
         end if;
      end  loop;
      return Ret (Ret'First .. Cursor - 1);
   end Image;

   -----------
   -- Count --
   -----------

   function Count (Replies : Group_Replie) return Natural is
      Temp : Reply_Type := (others => True);
   begin
      for R of Replies loop
         Temp := Temp and R;
      end loop;
      return Count (Temp);
   end Count;

end Adventofcode.Day_6;
