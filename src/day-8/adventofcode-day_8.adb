pragma Ada_2012;
with Adventofcode.File_Line_Readers;
with Ada.Strings.Fixed;
with Ada.Text_IO; use Ada.Text_IO;
with GNAT.Source_Info; use GNAT.Source_Info;
package body Adventofcode.Day_8 is

   ----------
   -- Load --
   ----------

   procedure Load (Memory : in out Memory_Type; From_Path : String) is
   begin
      Memory.Clear;
      for Line of  Adventofcode.File_Line_Readers.Read_Lines (From_Path) loop
         Memory.Assemble (Line);
      end loop;
   end Load;

   ----------
   -- Load --
   ----------

   overriding procedure Load (Self : in out Computer_Type; From_Path : String) is
   begin
      Self.Reset;
      Self.Storage.Load (From_Path);
   end Load;

   --------------
   -- Assemble --
   --------------

   procedure Assemble (Self : in out Memory_Type; Line : String)
   is
      Index : constant Natural := Ada.Strings.Fixed.Index (Line, " ");
   begin
      Self.Append (Instruction_Type'
                     (Executed => False,
                      Code     => Op_Code'Value (Line (Line'First .. Index - 1)),
                      Value    => Integer'Value (Line (Index + 1 .. Line'Last))));
   end Assemble;

   -----------
   -- Reset --
   -----------

   procedure Reset (Self : in out Computer_Type) is
   begin
      Self.Print_Trace;
      Self.Runing := True;
      Self.Execution_OK  := False;
      Self.Accumulator := 0;
      Self.Program_Counter := 0;
      for I of Self.Storage loop
         I.Executed := False;
      end loop;
   end Reset;

   ------------
   -- Acc_Op --
   ------------

   procedure Acc_Op (Self : in out Computer_Type) is
   begin
      Self.Print_Trace;
      Self.Storage (Self.Program_Counter).Executed := True;
      Self.Accumulator := Self.Accumulator + Self.Storage (Self.Program_Counter).Value;
      Self.Program_Counter := Self.Program_Counter + 1;
   end Acc_Op;

   ------------
   -- Jmp_Op --
   ------------

   procedure Jmp_Op (Self : in out Computer_Type) is
   begin
      Self.Print_Trace;
      Self.Storage (Self.Program_Counter).Executed := True;
      if Self.Storage (Self.Program_Counter).Value /= 0 then
         Self.Program_Counter := Self.Program_Counter + Self.Storage (Self.Program_Counter).Value;
      else
         Self.Program_Counter := Self.Program_Counter + 1;
      end if;
   end Jmp_Op;

   ------------
   -- Nop_Op --
   ------------

   procedure Nop_Op (Self : in out Computer_Type) is
   begin
      Self.Print_Trace;
      Self.Storage (Self.Program_Counter).Executed := True;
      Self.Program_Counter := Self.Program_Counter + 1;
   end Nop_Op;

   ----------
   -- Step --
   ----------

   procedure Step (Self : in out Computer_Type) is
   begin
      Self.Print_Trace;
      if not Self.Storage (Self.Program_Counter).Executed  or else Self.Program_Counter > Integer (Self.Storage.Length) then
         Decoder (Self.Storage (Self.Program_Counter).Code) (Self);
      else
         if Self.Program_Counter > Integer (Self.Storage.Length) then
            Self.Execution_OK := True;
         end if;
         Self.Runing := False;
      end if;
   end Step;

   ---------
   -- Run --
   ---------
   overriding procedure Run (Self : in out Computer_Type) is
   begin
      Self.Print_Trace;
      while Self.Runing loop
         Self.Step;
      end loop;
   end Run;

   -----------
   -- Print --
   -----------

   overriding procedure Print (Self : in out Computer_Type) is
   begin
      Put_Line ("Accumulator     =>" & Self.Accumulator'Img);
      Put_Line ("Program_Counter =>" & Self.Program_Counter'Img);
      Put_Line ("Execution_OK    =>" & Self.Execution_OK'Img);
   end Print;

   procedure Print_Trace (Self : in out Computer_Type; Location : String := GNAT.Source_Info.Enclosing_Entity) is
   begin
      if Self.Trace then
         Put_Line (Location &
                     "(PC  => " & Self.Program_Counter'Img &
                     ",ACC => " & Self.Accumulator'Img & ")");
      end if;
   end;
end Adventofcode.Day_8;
