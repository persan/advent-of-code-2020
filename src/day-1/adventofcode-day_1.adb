pragma Ada_2012;
package body adventofcode.Day_1 is

   ----------
   -- Eval --
   ----------

   function Eval (Book : Expenses; To : Currency) return Currency is
   begin
      for A in Book'Range loop
         for B in Book'Range loop
            if A /= B then
               if Book (A) + Book (B) = To then
                  return Book (A) * Book (B);
               end if;
            end if;
         end loop;
      end loop;
      return 0;
   end Eval;

end adventofcode.Day_1;
