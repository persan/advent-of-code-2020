pragma Ada_2012;
with GNAT.Regpat;
package body Adventofcode.Day_2 is
   use GNAT.Strings;
   -----------
   -- Valid --
   -----------

   function Valid (Self : Password_Entry) return Boolean is
      Count : Natural := 0;
   begin
      for C of Self.Password.all loop
         if C = Self.Key then
            Count := Count + 1;
         end if;
      end loop;
      return Self.Min <= Count and then  Count <= Self.Max;
   end Valid;

   function Valid2 (Self : Password_Entry) return Boolean is
   begin
      return (Self.Password.all (Self.Password.all'First - 1 + Self.Min) = Self.Key) xor
        (Self.Password.all (Self.Password.all'First - 1 + Self.Max) = Self.Key);
   end Valid2;

   -----------
   -- Parse --
   -----------

   function Parse (Line : String) return Password_Entry is
      Matcher : constant GNAT.Regpat.Pattern_Matcher := GNAT.Regpat.Compile ("(\d+)-(\d+)\s*(\w)\s*:\s*(\w+)");
      Matches : GNAT.Regpat.Match_Array (1 .. GNAT.Regpat.Paren_Count (Matcher));
   begin
      GNAT.Regpat.Match (Matcher, Line, Matches);
      return Password_Entry'(Ada.Finalization.Controlled with
                               Min      => Natural'Value (Line (Matches (1).First .. Matches (1).Last)),
                             Max      =>  Natural'Value (Line (Matches (2).First .. Matches (2).Last)),
                             Key      => Line (Matches (3).First),
                             Password =>  new String'(Line (Matches (4).First .. Matches (4).Last)));
   end Parse;
   overriding procedure Finalize   (Object : in out Password_Entry) is
   begin
      GNAT.Strings.Free (Object.Password);
   end;
   overriding procedure Adjust   (Object : in out Password_Entry) is
   begin
      Object.Password := new String'(Object.Password.all);
   end;

end Adventofcode.Day_2;
