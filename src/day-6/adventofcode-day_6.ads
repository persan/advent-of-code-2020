--  --- Day 6: Custom Customs ---
--
--  As your flight approaches the regional airport where you'll switch to a much larger plane,
--  customs declaration forms are distributed to the passengers.
--
--  The form asks a series of 26 yes-or-no questions marked a through z.
--  All you need to do is identify the questions for which anyone in your group answers "yes".
--  Since your group is just you, this doesn't take very long.
--
--  However, the person sitting next to you seems to be experiencing a language barrier and asks if you can help.
--  For each of the people in their group, you write down the questions for which they answer "yes", one per line. For example:
--
--  abcx
--  abcy
--  abcz
--
--  In this group, there are 6 questions to which anyone answered "yes": a, b, c, x, y, and z.
--  (Duplicate answers to the same question don't count extra; each question counts at most once.)
--
--  Another group asks for your help, then another,
--  and eventually you've collected answers from every group on the plane (your puzzle input).
--  Each group's answers are separated by a blank line,
--  and within each group, each person's answers are on a single line. For example:
--
--  abc
--
--  a
--  b
--  c
--
--  ab
--  ac
--
--  a
--  a
--  a
--  a
--
--  b
--
--  This list represents answers from five groups:
--
--      The first group contains one person who answered "yes" to 3 questions: a, b, and c.
--      The second group contains three people; combined, they answered "yes" to 3 questions: a, b, and c.
--      The third group contains two people; combined, they answered "yes" to 3 questions: a, b, and c.
--      The fourth group contains four people; combined, they answered "yes" to only 1 question, a.
--      The last group contains one person who answered "yes" to only 1 question, b.
--
--  In this example, the sum of these counts is 3 + 3 + 3 + 1 + 1 = 11.
--
--  For each group, count the number of questions to which anyone answered "yes". What is the sum of those counts?
--  =================================================================================================================
--  =================================================================================================================

with Ada.Containers.Vectors;
package Adventofcode.Day_6 is

   type Question_Id is new Character range 'a' .. 'z';

   type Reply_Type is array (Question_Id) of Boolean
     with Default_Component_Value => False;

   function "+" (L, R : Reply_Type) return Reply_Type is
     (L or R);

   function No_Replies return Reply_Type is (others => False);

   function Value (Item : String) return Reply_Type with
     Pre => (for all I in Item'Range => (Question_Id (Item (I)) in Question_Id) or else (Item (I) = ' '));

   function Count (Item : Reply_Type) return Natural;

   function Image (Item : Reply_Type) return String;
   package Group_Replies_Impl is new Ada.Containers.Vectors (Natural, Reply_Type);

   type Group_Replie is new Group_Replies_Impl.Vector with null record;
   function Count (Replies : Group_Replie) return Natural;
   function "+" (L : Group_Replie; R : Reply_Type) return Group_Replie is
     (L & R);
   function No_Replies return Group_Replie is (Group_Replies_Impl.Vector with others => <>);

end Adventofcode.Day_6;
