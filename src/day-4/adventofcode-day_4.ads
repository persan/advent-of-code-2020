with Ada.Containers.Vectors;
--  ---------------------------------------------------------------------------
--  https://adventofcode.com/2020/day/4
--  ---------------------------------------------------------------------------
--- Day 4: Passport Processing ---

--  You arrive at the airport only to realize that you grabbed your North Pole Credentials instead of your passport.
--  While these documents are extremely similar,
--  North Pole Credentials aren't issued by a country and therefore
--  aren't actually valid documentation for travel in most of the world.
--
--  It seems like you're not the only one having problems, though;
--  a very long line has formed for the automatic passport scanners,
--  and the delay could upset your travel itinerary.
--
--  Due to some questionable network security, you realize you might be able to solve both of these problems at the same time.
--
--  The automatic passport scanners are slow because they're having trouble detecting which passports have all required fields. The expected fields are as follows:
--
--      byr (Birth Year)
--      iyr (Issue Year)
--      eyr (Expiration Year)
--      hgt (Height)
--      hcl (Hair Color)
--      ecl (Eye Color)
--      pid (Passport ID)
--      cid (Country ID)
--
--  Passport data is validated in batch files (your puzzle input).
--  Each passport is represented as a sequence of key:value pairs separated by spaces or newlines.
--  Passports are separated by blank lines.
--
--  Here is an example batch file containing four passports:
--
--  ecl:gry pid:860033327 eyr:2020 hcl:#fffffd
--  byr:1937 iyr:2017 cid:147 hgt:183cm
--
--  iyr:2013 ecl:amb cid:350 eyr:2023 pid:028048884
--  hcl:#cfa07d byr:1929
--
--  hcl:#ae17e1 iyr:2013
--  eyr:2024
--  ecl:brn pid:760753108 byr:1931
--  hgt:179cm
--
--  hcl:#cfa07d eyr:2025 pid:166559648
--  iyr:2011 ecl:brn hgt:59in
--
--  The first passport is valid - all eight fields are present.
--  The second passport is invalid - it is missing hgt (the Height field).
--
--  The third passport is interesting; the only missing field is cid,
--  so it looks like data from North Pole Credentials, not a passport at all! Surely,
--  nobody would mind if you made the system temporarily ignore missing cid fields. Treat this "passport" as valid.
--
--  The fourth passport is missing two fields, cid and byr.
--  Missing cid is fine, but missing any other field is not, so this passport is invalid.
--
--  According to the above rules, your improved system would report 2 valid passports.
--
--  Count the number of valid passports - those that have all required fields.
--  Treat cid as optional. In your batch file, how many passports are valid?
with GNAT.Strings;
with Ada.Finalization;
package Adventofcode.Day_4 is

   type Hair_Color_Type is new GNAT.Strings.String_Access;
   type Eye_Color_Type is new GNAT.Strings.String_Access;
   type Passport_ID_Type is new GNAT.Strings.String_Access;
   type Heigth_Type is new GNAT.Strings.String_Access;

   type Country_ID_Type is new Integer with Default_Value => -1;
   type Year_Type is range 0 .. 3000 with Default_Value => 0;
   type Boolean is new Standard.Boolean  with Default_Value => False;

   type Passport is new Ada.Finalization.Controlled with record
      Is_Valid        : Boolean;
      Birth_Year      : Year_Type; -- byr
      Issue_Year      : Year_Type; -- iyr
      Expiration_Year : Year_Type; -- eyr
      Height          : Heigth_Type;     -- hgt
      Hair_Color      : Hair_Color_Type; -- hcl
      Eye_Color       : Eye_Color_Type;  -- ecl
      Passport_ID     : Passport_ID_Type;  -- pid
      Country_ID      : Country_ID_Type;  -- cid
   end record;

   overriding procedure Adjust     (P : in out Passport);
   overriding procedure Finalize   (P : in out Passport);
   procedure Append (Self : in out Passport; Fields : String);
   procedure Check_Validty (P : in out Passport);

   Null_Passport : constant Passport := Passport'(Ada.Finalization.Controlled with others => <>);

   package Passport_Vectors is new Ada.Containers.Vectors (Index_Type => Natural, Element_Type => Passport);
   type Passport_Vector is new Passport_Vectors.Vector with null record;
   function Count_Valid (Passports : Passport_Vector) return Natural;
   procedure Read (Passports : in out Passport_Vector; From_Path : String);

end Adventofcode.Day_4;
