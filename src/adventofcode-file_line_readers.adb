pragma Ada_2012;
package body Adventofcode.File_Line_Readers is
   use Ada.Text_IO;
   ----------------
   -- Read_Lines --
   ----------------

   function Read_Lines (From_Path : String) return File_Reader is
   begin
      return Ret : File_Reader do
         Ada.Text_IO.Open (Ret.F, In_File, From_Path);
      end return;
   end Read_Lines;

   ------------------
   -- First_Cursor --
   ------------------

   function First_Cursor (Cont : File_Reader) return Cursor is
   begin
      return Cursor'(0);
   end First_Cursor;

   -------------
   -- Advance --
   -------------

   function Advance (Cont : File_Reader; Position : Cursor) return Cursor is
   begin
      return Cursor'(0);
   end Advance;

   ------------------------
   -- Cursor_Has_Element --
   ------------------------

   function Cursor_Has_Element
     (Cont : File_Reader; Position : Cursor) return Boolean
   is
   begin
      return not End_Of_File (Cont.F);
   end Cursor_Has_Element;

   -----------------
   -- Get_Element --
   -----------------

   function Get_Element (Cont : File_Reader; Position : Cursor) return String
   is
   begin
      return Get_Line (Cont.F);
   end Get_Element;
   overriding procedure Finalize   (Object : in out File_Reader) is
   begin
      Close (Object.F);
   end;

end Adventofcode.File_Line_Readers;
