pragma Ada_2012;
package body Adventofcode.Day_1 is

   ----------
   -- Eval --
   ----------

   function Eval (Book : Expenses; To : Currency) return Currency is
   begin
      for A in Book'Range loop
         for B in A + 1 .. Book'Last loop
            if Book (A) + Book (B) = To then
               return Book (A) * Book (B);
            end if;
         end loop;
      end loop;
      return 0;
   end Eval;

   function Eval3 (Book : Expenses; To : Currency) return Currency is
   begin
      for A in Book'Range loop
         for B in A + 1 .. Book'Last loop
            for C in B + 1 .. Book'Last loop
               if Book (A) + Book (B) + Book (C) = To then
                  return Book (A) * Book (B) * Book (C);
               end if;
            end loop;
         end loop;
      end loop;
      return 0;
   end Eval3;
end Adventofcode.Day_1;
