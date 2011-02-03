with Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Latin_1;
use  Ada.Text_IO, Ada.Integer_Text_IO, Ada.Characters.Latin_1;

package body ANSI_Term IS
-- Wojciech Complak, 2006, v. 002

-- Sound (EAX ;-))
procedure Bell is
begin
  Put (BEL);
end Bell;

-- Terminal setup
procedure Enable_Line_Wrap is
begin
  Put(ESC & "[7h");
end Enable_Line_Wrap;

procedure Disable_Line_Wrap is
begin
  Put(ESC & "[7l");
end Disable_Line_Wrap;

-- Cursor control
procedure Cursor_Home(Row, Column : in Positive := 1) is
begin
  Put(ESC & '[');
  Put(Row,1);
  Put(';');
  Put(Column,1);
  Put('H');
end Cursor_Home;

procedure Cursor_Up(Rows : in Positive := 1) is
begin
  Put(ESC & '[');
  Put(Rows,1);
  Put('A');
end Cursor_Up;

procedure Cursor_Down(Rows : in Positive := 1) is
begin
  Put(ESC & '[');
  Put(Rows,1);
  Put('B');
end Cursor_Down;

procedure Cursor_Forward(Columns : in Positive := 1) is
begin
  Put(ESC & '[');
  Put(Columns,1);
  Put('C');
end Cursor_Forward;

procedure Cursor_Backward(Columns : in Positive := 1) is
begin
  Put(ESC & '[');
  Put(Columns,1);
  Put('D');
end Cursor_Backward;

procedure Save_Cursor is
begin
  Put(ESC & "[s");
end Save_Cursor;

procedure Unsave_Cursor is
begin
  Put(ESC & "[u");
end Unsave_Cursor;

-- Scrolling
procedure Scroll_Screen is
begin
  Put(ESC & "[r");
end Scroll_Screen;

procedure Scroll_Screen(Start, The_End : in Positive) is
begin
  Put(ESC & '[');
  Put(Start,1);
  Put(';');
  Put(The_End,1);
  Put('r');
end Scroll_Screen;

procedure Scroll_Down is
begin
  Put(ESC & 'D');
end Scroll_Down;

procedure Scroll_Up is
begin
  Put(ESC & 'M');
end Scroll_Up;

-- Tab control
procedure Set_Tab is
begin
  Put(ESC & 'H');
end Set_Tab;

procedure Clear_Tab is
begin
  Put(ESC & "[g");
end Clear_Tab;

procedure Clear_All_Tabs is
begin
  Put(ESC & "[3g");
end Clear_All_Tabs;

-- Erasing text
procedure Erase_End_Of_Line is
begin
  Put(ESC & "[K");
end Erase_End_Of_Line;

procedure Erase_Start_Of_Line is
begin
  Put(ESC & "[1K");
end Erase_Start_Of_Line;

procedure Erase_Line is
begin
  Put(ESC & "[2K");
end Erase_Line;

procedure Erase_Down is
begin
  Put(ESC & "[J");
end Erase_Down;

procedure Erase_Up is
begin
  Put(ESC & "[J");
end Erase_Up;

procedure Erase_Screen is
begin
  Put(ESC & "[2J");
end Erase_Screen;


-- Display attributes
procedure Display_Attribute(Attr : in Natural) is
begin
  Put(ESC & '[');
  Put(Attr,1);
  Put('m');
end Display_Attribute;

end ANSI_Term;