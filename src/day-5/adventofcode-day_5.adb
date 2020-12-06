pragma Ada_2012;
package body Adventofcode.Day_5 is

   -----------------
   -- Get_Seat_Id --
   -----------------

   function Get_Seat_Id (From : String) return Seat_Id_Type is
      Row : Seat_Row_Type := 0;
      Seat_On_Row : Seat_On_Row_Type := 0;

   begin
      declare
         F : Seat_Row_Type := 64;
      begin
         for I in 0 .. 6 loop
            Row := Row  + (if From (From'First + I) = 'B' then 1
                           elsif From (From'First + I) = 'F' then 0
                           else raise Constraint_Error with "invalid char:" & From (From'First + I)) * F;
            F := F / 2;
         end loop;
      end;
      declare
         F : Seat_On_Row_Type := 4;
      begin
         for I in 7 .. 9 loop
            Seat_On_Row := Seat_On_Row  + (if From (From'First + I) = 'R' then 1
                                           elsif From (From'First + I) = 'L' then 0
                                           else raise Constraint_Error with "invalid char:" & From (From'First + I)) *  F;
            F := F / 2;
         end loop;
      end;
      return Seat_Id_Type (Row * 8) + Seat_Id_Type (Seat_On_Row);
   end Get_Seat_Id;

end Adventofcode.Day_5;
