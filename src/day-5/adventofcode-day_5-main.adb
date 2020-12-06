with Ada.Exceptions;
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Assertions;
with Adventofcode.File_Line_Readers;
procedure Adventofcode.Day_5.Main is
   procedure Test (Pattern : String; Expected : Seat_Id_Type) is
      Actual : constant Seat_Id_Type := Get_Seat_Id (From => Pattern);
   begin
      Ada.Assertions.Assert (Actual = Expected, "Got => " & Actual'Img & ", Expected => " & Expected'Img);
   exception
      when E : others =>
         Put_Line (Ada.Exceptions.Exception_Information (E));
   end;

begin
   Test ("FBFBBFFRLR", 357);
   Test ("BFFFBBFRRR", 567);
   Test ("FFFBBBFRRR", 119);
   Test ("BBFFBBFRLL", 820);

   Part_1            : declare
      Max_Seat_Id_Found : Seat_Id_Type := 0;
   begin
      for Line of Adventofcode.File_Line_Readers.Read_Lines ("src/day-5/input") loop
         if Get_Seat_Id (From => Line) > Max_Seat_Id_Found then
            Max_Seat_Id_Found := Get_Seat_Id (From => Line);
         end if;
      end loop;
      Put_Line ("Max_Seat_Id_Found=>" & Max_Seat_Id_Found'Img);
   end Part_1;

   Part_2 : declare
      Seats : array (Seat_Id_Type) of Boolean  := (others => False);
   begin
      for Line of Adventofcode.File_Line_Readers.Read_Lines ("src/day-5/input") loop
         Seats (Get_Seat_Id (From => Line)) := True;
      end loop;
      for I in Seats'First + 1 .. Seats'Last - 1 loop
         if Seats (I - 1) and then Seats (I + 1) and then (not Seats (I)) then
            Put_Line ("Free Seat=>" & I'Img);
         end if;
      end loop;
   end Part_2;
end Adventofcode.Day_5.Main;
