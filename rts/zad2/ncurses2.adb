with NT_Console;              use NT_Console;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Strings.Fixed;       use Ada.Strings.Fixed;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Characters.Latin_1;  use Ada.Characters.Latin_1;
with Ada.Command_Line; -- not used;
with ANSI_Term;
with Ada.Calendar;		use Ada.Calendar;
with Ada.Calendar.Formatting;
with Ada.Strings.Unbounded;
with Ada.Exceptions;
with Ada.IO_Exceptions;
with System;

procedure Ncurses2 is
   Default_Text : Ada.Strings.Unbounded.Unbounded_String
     := Ada.Strings.Unbounded.To_Unbounded_String(Source => "Test Text");
   Text : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
   Default_Line : Positive := 2;
   Next : Time;
   Interval : Duration := 1.0;
   Position : Natural := 0;
   Terminate_Program : Boolean := False;
   Edited_Text : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;

   task task1;
   task task2;

   protected type Writable_Object is
      procedure Write;
   end Writable_Object;

   WO : Writable_Object;


   procedure Show_Menu is
   begin
      Goto_XY(0,18);
      Ada.Text_IO.Put(Item => "Menu:");
      Goto_XY(0,19);
      Ada.Text_IO.Put(Item => "[ 1 ] Zmiana testu");
      Goto_XY(0,20);
      Ada.Text_IO.Put(Item => "[ 2 ] Zmiana lini");
      Goto_XY(0,21);
      Ada.Text_IO.Put(Item => "[ 3 ] Zawies wyswietlanie tekstu");
      Goto_XY(0,22);
      Ada.Text_IO.Put(Item => "[Esc] Wyjscie");
      Goto_XY(0,23);
      Ada.Text_IO.Put(Item => Ada.Strings.Unbounded.To_String(Source => Edited_Text));
   end Show_Menu;

   procedure Show_Edited(edited : in Ada.Strings.Unbounded.Unbounded_String) is
   begin
      Goto_XY(0,23);
      Ada.Text_IO.Put(Item => Ada.Strings.Unbounded.To_String(Source => edited));
   end Show_Edited;

   procedure Show_Text(changePosition : in Boolean) is
   begin
      Set_Cursor (False);
      Clear_Screen(Black);
      Set_Foreground(Yellow);
      Set_Background(Black);

      if changePosition then

      if Position = 0 then
            Position := 79 - Ada.Strings.Unbounded.Length(Source => Text);
      else
         Position := Position - 1;
         end if;
      end if;

      Goto_XY(Position,Default_Line);
      Ada.Text_IO.Put(Item => Ada.Strings.Unbounded.To_String(Source => Text));
      Show_Menu;
   end Show_Text;

   protected body Writable_Object is
      procedure Write is
          begin
             Show_Text(changePosition => True);
      end Write;
   end Writable_Object;

   task body task1 is
   begin
      Next := Clock + Interval;
      if Ada.Strings.Unbounded.Length(Source => Text) = 0 then
         Ada.Strings.Unbounded.Append(Source => Text, New_Item => Default_Text);
      end if;
      loop
         if not Terminate_Program then
         	WO.Write;
        	delay until Next;
            Next := Next + Interval;
         else
            exit;
         end if;
      end loop;
   end task1;


   task body task2 is
      Key    	: Character := 'X';
      Ava : Boolean := True;
   begin
      while Key /= ASCII.ESC and not Terminate_Program loop
         Get_Immediate(Item => Key, Available => Ava);
         if Ava and Key = '1' then -- appending
            declare
               temp : String(1..1);
               S : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
               T : Ada.Strings.Trim_End := Ada.Strings.Right;
            begin
               Edited_Text := Text;
               while Key /= ASCII.CR loop
                  Get_Immediate(Item => Key, Available => Ava);
                  if Ava and ((Key >= 'a' and Key <= 'z') or Key = ASCII.BS or (Key >= 'A' and Key <= 'Z')) then
                     if Key = ASCII.BS and Ada.Strings.Unbounded.Length(Edited_Text) > 0 then
                        declare
                           St1 : String := Ada.Strings.Unbounded.To_String(Source => Edited_Text);
                        begin
                           Edited_Text := Ada.Strings.Unbounded.To_Unbounded_String(St1(St1'First..St1'Last-1));
                           Text := Edited_Text;
                        end;
                     elsif Key /= ASCII.BS and Ada.Strings.Unbounded.Length(Edited_Text) < 78 then
                  	temp(1) := Key;
                  	S := Ada.Strings.Unbounded.To_Unbounded_String(Source => temp);
                  	Ada.Strings.Unbounded.Append(Source => Text, New_Item =>S);
                  	Ada.Strings.Unbounded.Append(Source => Edited_Text, New_Item =>S);
                     end if;
        	        --WO.Write;
                        --Show_Edited(edited => Edited_Text);
                  end if;
               end loop;
               Edited_Text := Ada.Strings.Unbounded.Null_Unbounded_String;
               --Show_Edited(edited => Edited_Text);
            end;
         elsif Key = '2' then
            declare
               S : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
               temp : String(1..1);
               Temp_Int : Natural := 0;
            begin
               Edited_Text := Ada.Strings.Unbounded.Null_Unbounded_String;
               while Key /= ASCII.CR loop
                  Get_Immediate(Item => Key, Available => Ava);
                  if Key /= ASCII.CR and ((Key >= '0' and Key <= '9') or Key = ASCII.BS) then
                     if Key = ASCII.BS and Ada.Strings.Unbounded.Length(Edited_Text) > 0 then
                        declare
                           St1 : String := Ada.Strings.Unbounded.To_String(Source => Edited_Text);
                        begin
                           Edited_Text := Ada.Strings.Unbounded.To_Unbounded_String(St1(St1'First..St1'Last-1));
                        end;
                     else
                     	temp(1) := Key;
                        Ada.Strings.Unbounded.Append(Source => Edited_Text,New_Item => temp);
                     end if;
                     --Show_Edited(edited => Edited_Text);
                  end if;
               end loop;
               if Ada.Strings.Unbounded.Length(Edited_Text) > 0 then
                  Temp_Int := Integer'Value(Ada.Strings.Unbounded.To_String(Edited_Text));
                  if Temp_Int > 0 and Temp_Int < 17 then
                     Default_Line := Temp_Int;
                  end if;
               end if;
               Edited_Text := Ada.Strings.Unbounded.Null_Unbounded_String;
               --Show_Text(changePosition => True);
            exception
                  when others => Terminate_Program := True;
            end;
         elsif Key = '3' then
            declare
               S : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
               temp : String(1..1);
               i : Float;
               f : Duration;
            begin
               Edited_Text := Ada.Strings.Unbounded.Null_Unbounded_String;
               while Key /= ASCII.CR loop
                  Get_Immediate(Item => Key, Available => Ava);
                  if Key /= ASCII.CR and ((Key >= '0' and Key <= '9') or Key = '.' or Key = ASCII.BS) then
                     if Key = ASCII.BS and Ada.Strings.Unbounded.Length(Edited_Text) > 0 then
                        declare
                           St1 : String := Ada.Strings.Unbounded.To_String(Source => Edited_Text);
                        begin
                           Edited_Text := Ada.Strings.Unbounded.To_Unbounded_String(St1(St1'First..St1'Last-1));
                           end;
                        else
                           temp(1) := Key;
                           Ada.Strings.Unbounded.Append(Source => Edited_Text,New_Item => temp);
                     end if;
                     --Show_Edited(edited => Edited_Text);
                  end if;
               end loop;
               if Ada.Strings.Unbounded.Length(Edited_Text) > 0 then
                   i := Float'Value(Ada.Strings.Unbounded.To_String(Edited_Text));
               	   f := Duration(Float(i));
                   Interval := f;
                   Show_Text(changePosition => True);
               end if;
              Edited_Text := Ada.Strings.Unbounded.Null_Unbounded_String;
              --Show_Edited(edited => Edited_Text);
            exception
               when Standard.Constraint_Error =>
                  Show_Edited(Ada.Strings.Unbounded.To_Unbounded_String("Improper value"));
               when Ex: others =>
                  Show_Edited(Ada.Strings.Unbounded.To_Unbounded_String(Ada.Exceptions.Exception_Name(Ex)));
                  Terminate_Program := True;
            end;
         elsif Key = ASCII.ESC then
            begin
               Terminate_Program := True;
            end;
         end if;
      end loop;
   end task2;

begin
   null;
end Ncurses2;
