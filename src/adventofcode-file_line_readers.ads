with Ada.Finalization;
with Ada.Text_IO;
package Adventofcode.File_Line_Readers is
   type Cursor (<>) is private;
   type File_Reader (<>) is tagged limited private with
     Iterable => (First        => First_Cursor,
                  Next         => Advance,
                  Has_Element  => Cursor_Has_Element,
                  Element      => Get_Element);
   function Read_Lines (From_Path : String) return File_Reader;
   function First_Cursor (Cont : File_Reader) return Cursor;
   function Advance (Cont : File_Reader; Position : Cursor) return Cursor;
   function Cursor_Has_Element (Cont : File_Reader; Position : Cursor) return Boolean;
   function Get_Element (Cont : File_Reader; Position : Cursor) return String;
private
   type Cursor is new Integer;
   type File_Reader is new Ada.Finalization.Limited_Controlled with record
      F : Ada.Text_IO.File_Type;
   end record;
   overriding procedure Finalize   (Object : in out File_Reader);
end Adventofcode.File_Line_Readers;
