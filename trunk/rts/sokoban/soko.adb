with NT_Console;              use NT_Console;
with Ada.Text_IO;             use Ada.Text_IO;
with Ada.Strings.Fixed;       use Ada.Strings.Fixed;
with Ada.Characters.Handling; use Ada.Characters.Handling;
with Ada.Integer_Text_IO;     use Ada.Integer_Text_IO;
with Ada.Characters.Latin_1;  use Ada.Characters.Latin_1;
with Ada.Command_Line;
with ANSI_Term;
with Ada.Calendar;		use Ada.Calendar;
with Ada.Calendar.Formatting;
with Ada.Strings.Unbounded;
with Ada.Exceptions;
with Ada.IO_Exceptions;

procedure soko is

   type Point is
      record
         X:	Natural;
         Y:	Natural;
      end record;

   type Target is
      record
         Coordinates: Point;
         Is_Full: Boolean;
      end record;

   type Board is array(Natural range <>, Natural range <>) of Character;
   type Points is array(Natural range <>) of Point;
   type Targets_Set is array(Natural range <>) of Target;

   Again   : Boolean := True;
   Max_Width : Natural := 70;
   Max_Height : Natural := 24;
   Initial_Player_Position : Point;
   Game_Board : Board (1 .. Max_Width, 1 .. Max_Height);
   Readed_Width : Natural;
   Readed_Height : Natural;
   Key    	: Character := 'X';
   Key_Avaliable : Boolean := False;
   Actual_Player_Position : Point;
   Readed_Boxes : Natural := 0;
   Readed_Targets : Natural := 0;
   Player_Moves : Natural := 0;
   Game_State : Natural := 0;
   Start_Time : Ada.Calendar.Time;
   Year,Month,Day : Integer;
   Start,Seconds  : Day_Duration;
   Fullfilled_Targets : Natural := 0;
   Redraw_Board : Boolean := True;
   Exc_Box_Tar : exception;

   i : Integer := 0;

   procedure Display_Board(boxes : in out Points; targets : in out Targets_Set) is
   begin
      Clear_Screen(Blue);
      Set_Foreground(Blue);
      Set_Background(Yellow);
      for I in 1..Readed_Width loop
         for J in 1..Readed_Height loop
            Goto_XY(I, J);
            Put(Game_Board(I,J));
         end loop;
      end loop;
      Set_Foreground(Red);
      Set_Background(Yellow);
      Goto_XY(Actual_Player_Position.X, Actual_Player_Position.Y);
      Put('i');

      Set_Foreground(Gray);
      Set_Background(Brown);
      for Ind in boxes'Range loop
         Goto_XY(X => boxes(Ind).X, Y => boxes(Ind).Y);
         Put('b');
      end loop;


      Set_Foreground(Gray);
      Set_Background(Green);
      for Ind in targets'Range loop
         Goto_XY(X => targets(Ind).Coordinates.X, Y => targets(Ind).Coordinates.Y);
         if targets(Ind).Is_Full then
            Put('X');
         else
            Put('p');
         end if;
      end loop;

   end Display_Board;

   procedure Read_Configuration(Path : in String) is
      In_Data : Ada.Text_IO.File_Type;
      Next_Ch : Character;
      Next_V : Integer;
      Next_S : String := "";
      Readed_Items : Integer := 1;
      P_1 : array(1..4) of Integer;
   begin
      Ada.Text_IO.Open(File=>In_Data, Mode=>Ada.Text_IO.In_File, Name=>Path);

      while Readed_Items <= 4 and not Ada.Text_IO.End_Of_File(File => In_Data) loop
         while not Ada.Text_IO.End_Of_Line(File => In_Data) loop
            begin
            Ada.Integer_Text_IO.Get(File => In_Data, Item => Next_V);
            if Next_V >= 0 then
                  P_1(Readed_Items) := Next_V;
                  Readed_Items := Readed_Items + 1;
               end if;
            exception
               when others => Ada.Text_IO.Get(File => In_Data, Item => Next_Ch);
                  if Next_Ch /= ',' then
                     raise;
                  end if;
            end;
         end loop;
         Ada.Text_IO.New_Line;
         Skip_Line(File => In_Data,Spacing => 1);
      end loop;

      declare
         Vector : Board (1 .. P_1(1), 1 .. P_1(2));
         Width : Integer := 1;
         Height : Integer := 1;
      begin
         while Width <= P_1(1) and Height <= P_1(2) and not Ada.Text_IO.End_Of_File(File => In_Data) loop
            while not Ada.Text_IO.End_Of_Line(File => In_Data) loop
            	begin
                  Ada.Text_IO.Get(File => In_Data, Item => Next_Ch);
                  if Next_Ch = 'b' then
                     Readed_Boxes := Readed_Boxes + 1;
                  elsif Next_Ch = 'p' then
                     Readed_Targets := Readed_Targets + 1;
                  end if;
                  Vector(Width,Height) := Next_Ch;
                  Width := Width + 1;
                exception
               		when others => Ada.Text_IO.Get(File => In_Data, Item => Next_Ch);
                  		if Next_Ch /= ',' then
                     			Ada.Text_IO.Put(Item => Next_Ch);
                  		end if;
            	end;

            end loop;

            if not Ada.Text_IO.End_Of_File(File => In_Data) then
            	Ada.Text_IO.New_Line;
            	Skip_Line(File => In_Data,Spacing => 1);
            	Width := 1;
                Height := Height + 1;
            else
               if Height /= P_1(2) then
                  Ada.Text_IO.Put_Line(Item => "Bledny plik konfiguracyjny.");
               end if;
            end if;
         end loop;

      Ada.Text_IO.Close(In_Data);
      Readed_Width := P_1(1);
      Readed_Height := P_1(2);
      Initial_Player_Position := (P_1(3)+1, P_1(4)+1);
      Actual_Player_Position := (P_1(3)+1, P_1(4)+1);

      for I in Vector'Range(1) loop
         for J in Vector'Range(2) loop
            Game_Board(I,J) := Vector(I, J);
         end loop;
      end loop;

      end;

   end Read_Configuration;

   procedure Clean_Main_Board is
   begin
      for I in Game_Board'Range(1) loop
         for J in Game_Board'Range(2) loop
            Game_Board(I,J) := ' ';
         end loop;
      end loop;
   end Clean_Main_Board;

   procedure Check_Avaliability(key : in Character; key_avaliable : in out Boolean) is
   begin
      if key = 'W' or key = 'A' or key = 'S' or key = 'D' then
         key_avaliable := True;
      else
         key_avaliable := False;
      end if;
   end Check_Avaliability;

   procedure Set_Redraw_Board(redraw : in Boolean) is
   begin
      Redraw_Board := redraw;
   end Set_Redraw_Board;

   procedure Make_Move_Up(boxes : in out Points; targets : in out Targets_Set) is
      obj : Character := Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-1);
   begin
      if obj = ' ' then
         Actual_Player_Position.Y := Actual_Player_Position.Y - 1;
         Set_Redraw_Board(redraw => True);
      elsif obj = 'b' then
            if Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-2) = ' ' then
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-1) := ' ';
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-2) := 'b';
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X and boxes(Int).Y = Actual_Player_Position.Y-1 then
                     boxes(Int).Y := Actual_Player_Position.Y-2;
                  end if;
               end loop;
            	Actual_Player_Position.Y := Actual_Player_Position.Y - 1;
            	Set_Redraw_Board(redraw => True);
            elsif Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-2) = 'p' then
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-1) := ' ';
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y-2) := 'X';

               Boxes_Loop:
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X and boxes(Int).Y = Actual_Player_Position.Y-1 then
                     boxes(Int).Y := Actual_Player_Position.Y-2;
                     exit Boxes_Loop;
                  end if;
               end loop Boxes_Loop;

               Targets_Loop:
               for Int in targets'Range loop
                  if targets(Int).Coordinates.X = Actual_Player_Position.X and targets(Int).Coordinates.Y = Actual_Player_Position.Y-2 then
                     targets(Int).Is_Full := True;
                     exit Targets_Loop;
                  end if;
               end loop Targets_Loop;
            	Actual_Player_Position.Y := Actual_Player_Position.Y - 1;
            	Set_Redraw_Board(redraw => True);
            else
            	Set_Redraw_Board(redraw => False);
         end if;
      else
         Set_Redraw_Board(redraw => False);
         end if;
   end Make_Move_Up;

   procedure Make_Move_Down(boxes : in out Points; targets : in out Targets_Set) is
      obj : Character := Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+1);
   begin
      if obj = ' ' then
         Actual_Player_Position.Y := Actual_Player_Position.Y + 1;
         Set_Redraw_Board(redraw => True);
      elsif obj = 'b' then
            if Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+2) = ' ' then
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+1) := ' ';
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+2) := 'b';
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X and boxes(Int).Y = Actual_Player_Position.Y+1 then
                     boxes(Int).Y := Actual_Player_Position.Y+2;
                  end if;
               end loop;
            	Actual_Player_Position.Y := Actual_Player_Position.Y + 1;
            	Set_Redraw_Board(redraw => True);
            elsif Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+2) = 'p' then
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+1) := ' ';
               Game_Board(Actual_Player_Position.X, Actual_Player_Position.Y+2) := 'X';

               Boxes_Loop:
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X and boxes(Int).Y = Actual_Player_Position.Y+1 then
                     boxes(Int).Y := Actual_Player_Position.Y+2;
                     exit Boxes_Loop;
                  end if;
               end loop Boxes_Loop;

               Targets_Loop:
               for Int in targets'Range loop
                  if targets(Int).Coordinates.X = Actual_Player_Position.X and targets(Int).Coordinates.Y = Actual_Player_Position.Y+2 then
                     targets(Int).Is_Full := True;
                     exit Targets_Loop;
                  end if;
               end loop Targets_Loop;
            	Actual_Player_Position.Y := Actual_Player_Position.Y + 1;
            	Set_Redraw_Board(redraw => True);
         else
            Set_Redraw_Board(redraw => False);
         end if;
      else
         Set_Redraw_Board(redraw => False);
      end if;
   end Make_Move_Down;

   procedure Make_Move_Left(boxes : in out Points; targets : in out Targets_Set) is
      obj : Character := Game_Board(Actual_Player_Position.X-1, Actual_Player_Position.Y);
   begin
      if obj = ' ' then
         Actual_Player_Position.X := Actual_Player_Position.X - 1;
         Set_Redraw_Board(redraw => True);
         elsif obj = 'b' then
            if Game_Board(Actual_Player_Position.X-2, Actual_Player_Position.Y) = ' ' then
               Game_Board(Actual_Player_Position.X-1, Actual_Player_Position.Y) := ' ';
               Game_Board(Actual_Player_Position.X-2, Actual_Player_Position.Y) := 'b';
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X-1 and boxes(Int).Y = Actual_Player_Position.Y then
                     boxes(Int).X := Actual_Player_Position.X-2;
                  end if;
               end loop;
            Actual_Player_Position.X := Actual_Player_Position.X - 1;
            Set_Redraw_Board(redraw => True);
            elsif Game_Board(Actual_Player_Position.X-2, Actual_Player_Position.Y) = 'p' then
               Game_Board(Actual_Player_Position.X-1, Actual_Player_Position.Y) := ' ';
               Game_Board(Actual_Player_Position.X-2, Actual_Player_Position.Y) := 'X';

               Boxes_Loop:
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X-1 and boxes(Int).Y = Actual_Player_Position.Y then
                     boxes(Int).X := Actual_Player_Position.X-2;
                     exit Boxes_Loop;
                  end if;
               end loop Boxes_Loop;

               Targets_Loop:
               for Int in targets'Range loop
                  if targets(Int).Coordinates.X = Actual_Player_Position.X-2 and targets(Int).Coordinates.Y = Actual_Player_Position.Y then
                     targets(Int).Is_Full := True;
                     exit Targets_Loop;
                  end if;
               end loop Targets_Loop;
            Actual_Player_Position.X := Actual_Player_Position.X - 1;
            Set_Redraw_Board(redraw => True);
         else
            Set_Redraw_Board(redraw => False);
         end if;
      else
         Set_Redraw_Board(redraw => False);
         end if;
   end Make_Move_Left;

   procedure Make_Move_Right(boxes : in out Points; targets : in out Targets_Set) is
      obj : Character := Game_Board(Actual_Player_Position.X+1, Actual_Player_Position.Y);
   begin
      if obj = ' ' then
         Actual_Player_Position.X := Actual_Player_Position.X + 1;
         Set_Redraw_Board(redraw => True);
         elsif obj = 'b' then
            if Game_Board(Actual_Player_Position.X+2, Actual_Player_Position.Y) = ' ' then
               Game_Board(Actual_Player_Position.X+1, Actual_Player_Position.Y) := ' ';
               Game_Board(Actual_Player_Position.X+2, Actual_Player_Position.Y) := 'b';
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X+1 and boxes(Int).Y = Actual_Player_Position.Y then
                     boxes(Int).X := Actual_Player_Position.X+2;
                  end if;
               end loop;
            Actual_Player_Position.X := Actual_Player_Position.X + 1;
            Set_Redraw_Board(redraw => True);
            elsif Game_Board(Actual_Player_Position.X+2, Actual_Player_Position.Y) = 'p' then
               Game_Board(Actual_Player_Position.X+1, Actual_Player_Position.Y) := ' ';
               Game_Board(Actual_Player_Position.X+2, Actual_Player_Position.Y) := 'X';

               Boxes_Loop:
               for Int in boxes'Range loop
                  if boxes(Int).X = Actual_Player_Position.X+1 and boxes(Int).Y = Actual_Player_Position.Y then
                     boxes(Int).X := Actual_Player_Position.X+2;
                     exit Boxes_Loop;
                  end if;
               end loop Boxes_Loop;

               Targets_Loop:
               for Int in targets'Range loop
                  if targets(Int).Coordinates.X = Actual_Player_Position.X+2 and targets(Int).Coordinates.Y = Actual_Player_Position.Y then
                     targets(Int).Is_Full := True;
                     exit Targets_Loop;
                  end if;
               end loop Targets_Loop;
            Actual_Player_Position.X := Actual_Player_Position.X + 1;
            Set_Redraw_Board(redraw => True);
         else
            Set_Redraw_Board(redraw => False);
         end if;
      else
         Set_Redraw_Board(redraw => False);
         end if;
   end Make_Move_Right;

   procedure Make_Move(key : in Character; boxes : in out Points; targets : in out Targets_Set) is
   begin
      if key = 'W' then
         Make_Move_Up(boxes => boxes, targets => targets);
      elsif key = 'S' then
         Make_Move_Down(boxes => boxes, targets => targets);
      elsif key = 'A' then
         Make_Move_Left(boxes => boxes, targets => targets);
      elsif key = 'D' then
         Make_Move_Right(boxes => boxes, targets => targets);
      end if;
   end Make_Move;

   procedure Update_Boxes_And_Targets(boxes : in out Points; targets : in out Targets_Set) is
      point_temp : Point;
      tar_temp : Target;
      box_temp : Natural := 1;
      target_temp : Natural := 1;
   begin
      for I in Game_Board'Range(1) loop
         for J in Game_Board'Range(2) loop
            if Game_Board(I,J) = 'b' then
               point_temp := (I,J);
               boxes(box_temp) := point_temp;
               box_temp := box_temp + 1;
            elsif Game_Board(I,J) = 'p' then
               tar_temp := ((I,J), False);
               targets(target_temp) := tar_temp;
               target_temp := target_temp + 1;
            end if;
         end loop;
      end loop;
   end Update_Boxes_And_Targets;

   procedure Print_Counters is
   	package Fix_IO is new Ada.Text_IO.Fixed_IO(Day_Duration);
   	use Fix_IO;
      S : String := Integer'Image(Player_Moves);
   begin
      Set_Foreground(White);
      Set_Background(Blue);
      Goto_XY(X => Max_Width+2, Y => 1);
      Ada.Text_IO.Put(Item => "Moves:");
      Goto_XY(X => Max_Width+2, Y => 2);
      Ada.Text_IO.Put(Item => S);
      Goto_XY(X => Max_Width+2, Y => 4);
      Ada.Text_IO.Put(Item => "Time:");
      Goto_XY(X => Max_Width+2, Y => 5);
      if Game_State = 0 then
         Ada.Calendar.Split(Ada.Calendar.Clock, Year, Month, Day, Seconds);
      end if;
      Put(Seconds - Start, 4, 2, 0);
      Goto_XY(X => Max_Width+2, Y => 7);
      Ada.Text_IO.Put(Item => "State:");
      Goto_XY(X => Max_Width+2, Y => 8);
      if Game_State = 0 then
        Ada.Text_IO.Put(Item => "Play");
      elsif Game_State = 1 then
         Ada.Text_IO.Put(Item => "You win!");
      elsif Game_State = 2 then
         Ada.Text_IO.Put(Item => "You lose");
      end if;
   end Print_Counters;

   procedure Check_End_Of_Game(targets : in Targets_Set) is
      Counter : Natural := 0;
   begin
      for Ind in targets'Range loop
         if targets(Ind).Is_Full then
            Counter := Counter + 1;
         end if;
      end loop;
      if Readed_Targets = Counter then
         Game_State := 1;
      else
         Counter := 0;
         I_Loop:
         for I in Game_Board'Range(1) loop
            J_Loop:
       	    for J in Game_Board'Range(2) loop
               if Game_Board(I,J) = 'b' then
                  Counter := 0;
                  if Game_Board(I-1,J) = '|' or Game_Board(I+1,J) = '|' then
                     Counter := Counter + 1;
                  end if;
                  if Game_Board(I,J-1) = '-' or Game_Board(I,J+1) = '-' then
                     Counter := Counter + 1;
                  end if;
                  if Counter = 2 then
                     Game_State := 2;
                     exit I_Loop;
                  end if;
               end if;
            end loop J_Loop;
         end loop I_Loop;
      end if;
   end Check_End_Of_Game;

   function Get_Whole_Line return String is
     BufferSize : constant := 2000;
     Retval     : Ada.Strings.Unbounded.Unbounded_String := Ada.Strings.Unbounded.Null_Unbounded_String;
     Item       : String (1 .. BufferSize);
     Last       : Natural;
  begin
     Get_Whole_Line :
        loop
           Ada.Text_IO.Get_Line (Item => Item, Last => Last);

           Ada.Strings.Unbounded.Append (Source => Retval, New_Item => Item (1 .. Last));

           exit Get_Whole_Line when Last < Item'Last;
        end loop Get_Whole_Line;
        return Ada.Strings.Unbounded.To_String(Source => Retval);
  end Get_Whole_Line;

begin
   Clean_Main_Board;
   if Ada.Command_Line.Argument_Count /= 1 then
      Put("Podaj nazwe pliku zawierajacego plansze:");
      ANSI_Term.Bell;
      New_Line;
      Read_Configuration(Get_Whole_Line);
   else
      Read_Configuration(Ada.Command_Line.Argument(1));
   end if;
   if Readed_Boxes <= 0 or Readed_Targets <= 0 or Readed_Targets < Readed_Boxes then
      raise Exc_Box_Tar;
   end if;

   declare
         Boxes_List : Points(1 .. Readed_Boxes);
      Targets_List : Targets_Set(1 .. Readed_Targets);
      Ava : Boolean := True;
      begin
        Update_Boxes_And_Targets(boxes => Boxes_List, targets => Targets_List);
      	Set_Cursor (False);
        Display_Board(boxes => Boxes_List, targets => Targets_List);
         Start_Time := Ada.Calendar.Clock;
         Ada.Calendar.Split(Start_Time, Year, Month, Day, Start);
      while Key /= ASCII.ESC loop
         	Get_Immediate(Item => Key, Available => Ava);
         	Key := To_Upper(Key);
         Check_Avaliability(key => Key, key_avaliable => Key_Avaliable);
         if Key_Avaliable and Game_State = 0 then
            Make_Move(key => Key, boxes => Boxes_List, targets => Targets_List);
            if Redraw_Board then
               Display_Board(boxes => Boxes_List, targets => Targets_List);
            end if;
            Player_Moves := Player_Moves + 1;
            end if;
         Check_End_Of_Game(targets => Targets_List);
         Print_Counters;
         end loop;
      end;

   Set_Foreground (Gray);
   Clear_Screen;
   Goto_XY;
   Set_Cursor (True);

exception
   when Ada.IO_Exceptions.Data_Error =>
      Ada.Text_IO.Put_Line(Item => "Podany plik ma nieprawidlowa budowe.");
      Ada.Text_IO.Get(Item => Key);
   when Ada.IO_Exceptions.Name_Error =>
      Ada.Text_IO.Put_Line(Item => "Podana nazwa pliku jest nieprawidlowa.");
      Ada.Text_IO.Get(Item => Key);
   when Exc_Box_Tar =>
      Ada.Text_IO.Put_Line(Item => "Nieprawidlowa ilosc skrzyn lub miejsc na skrzynie.");
      Ada.Text_IO.Get(Item => Key);
   when C_Ex: others => Ada.Text_IO.Put_Line(Item => "XXX");
      Ada.Text_IO.Put_Line(Ada.Exceptions.Exception_Name(C_Ex));
      Ada.Text_IO.Get(Item => Key);

end soko;
