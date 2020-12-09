pragma Ada_2012;
with Ada.Strings.Fixed;
with Adventofcode.File_Line_Readers;
with GNAT.String_Split;
package body Adventofcode.Day_4 is
   use Ada.Strings.Fixed;
   ------------
   -- Adjust --
   ------------

   overriding procedure Adjust (P : in out Passport) is
   begin
      P.Hair_Color := (if P.Hair_Color /= null then new String'(P.Hair_Color.all) else null);
      P.Eye_Color := (if P.Eye_Color /= null then new String'(P.Eye_Color.all) else null);
      P.Passport_ID := (if P.Passport_ID /= null then new String'(P.Passport_ID.all) else null);
      P.Height := (if P.Height /= null then new String'(P.Height.all) else null);
   end Adjust;

   --------------
   -- Finalize --
   --------------

   overriding procedure Finalize (P : in out Passport) is
   begin
      Free (P.Hair_Color);
      Free (P.Eye_Color);
      Free (P.Passport_ID);
      Free (P.Height);
   end Finalize;

   procedure Check_Validty (P : in out Passport) is
   begin
      null;
   end Check_Validty;

   ----------
   -- Read --
   ----------

   procedure Read (Passports : in out Passport_Vector; From_Path : String) is
      Temp : Passport;
   begin
      Temp := Null_Passport;
      for Line of Adventofcode.File_Line_Readers.Read_Lines (From_Path) loop
         if Line'Length > 0 then
            Temp.Append (Line);
         else
            Temp.Check_Validty;
            Passports.Append (Temp);
            Temp := Null_Passport;
         end if;
      end loop;
      if Temp /= Null_Passport then
         Temp.Check_Validty;
         Passports.Append (Temp);
      end if;

   end Read;

   procedure Append (Self : in out Passport; Fields : String) is
   begin
      --  for F of GNAT.String_Split.Create (Fields, " " & ASCII.LF & ASCII.CR) loop
      --     declare
      --        Separator_Index : constant Natural := Index (F, ":");
      --        Key             : constant String := F (F'First .. Separator_Index - 1);
      --        Value           : constant String := F (Separator_Index + 1 .. F'Last);
      --     begin
      --        if Key = "byr" then
      --           Self.Birth_Year := Year_Type'Value (Value);
      --
      --        elsif Key = "iyr" then
      --           Self.Issue_Year := Year_Type'Value (Value);
      --
      --        elsif Key = "eyr" then
      --           Self.Expiration_Year := Year_Type'Value (Value);
      --
      --        elsif Key = "hgt" then
      --           Self.Height := new String'(Value);
      --
      --        elsif Key = "hcl" then
      --           Self.Hair_Color := new String'(Value);
      --
      --        elsif Key = "ecl" then
      --           Self.Eye_Color := new String'(Value);
      --
      --        elsif Key = "pid" then
      --           Self.Passport_ID := new String'(Value);
      --
      --        elsif Key = "cid" then
      --           Self.Country_ID := Country_ID_Type'Value (Value);
      --
      --        else
      --           raise Constraint_Error with "invalid Key:" & Key;
      --        end if;
      --     end;
      --  end loop;
      null;
   end;

   function Count_Valid (Passports : Passport_Vector) return Natural is
   begin
      return Valid_Passports : Natural := 0 do
         for Passport of Passports loop
            if Passport.Is_Valid then
               Valid_Passports := Valid_Passports + 1;
            end if;
         end loop;
      end return;
   end;

end Adventofcode.Day_4;
