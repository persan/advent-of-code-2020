procedure Adventofcode.Day_8.Main is
   C : Computer_Type;
begin
   C.Load ("src/day-8/input.test");
   for I of C.Storage loop
      C.Reset;
      C.Trace := True;

      if I.Code in Nop | Jmp then
         if I.Code = Nop then
            I.Code := Jmp;
            C.Run;
            I.Code := Nop;
         elsif I.Code = Nop then
            I.Code := Jmp;
            C.Run;
            I.Code := Nop;
         end if;
      end if;

      if C.Execution_OK then
         C.Print;
      end if;
   end loop;

end Adventofcode.Day_8.Main;
