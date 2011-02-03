package  ANSI_Term IS
-- Wojciech Complak, 2006, v. 002

-- beep
procedure Bell;

--Terminal setup
-- enable text wrapping to next line if longer than the length of the display area
procedure Enable_Line_Wrap;
-- disable text wrapping to next line if longer than the length of the display area
procedure Disable_Line_Wrap;

-- Cursor control
-- set the cursor position
procedure Cursor_Home(Row, Column : in Positive := 1);
-- move the cursor up
procedure Cursor_Up(Rows : in Positive := 1);
-- move the cursor down
procedure Cursor_Down(Rows : in Positive := 1);
-- move the cursor to the right
procedure Cursor_Forward(Columns : in Positive := 1);
-- move the cursor to the left
procedure Cursor_Backward(Columns : in Positive := 1);
-- save current cursor position
procedure Save_Cursor;
-- restore cursor position after Save_Cursor
procedure Unsave_Cursor;

-- Scrolling
-- enable scrolling for entire display.
procedure Scroll_Screen;
-- enable scrolling from row Start to row The_End
procedure Scroll_Screen(Start, The_End : in Positive);
-- scroll down one line
procedure Scroll_Down;
-- scroll up one line
procedure Scroll_Up;


-- Tab control
-- set a tab at the current position
procedure Set_Tab;
-- clear the tab at the current position
procedure Clear_Tab;
-- clears all tabs
procedure Clear_All_Tabs;

-- Erasing text
-- erase from the current position 
procedure Erase_End_Of_Line;
procedure Erase_Start_Of_Line;
procedure Erase_Line;
procedure Erase_Down;
procedure Erase_Up;
procedure Erase_Screen;

-- Display attributes
procedure Display_Attribute(Attr : in Natural);
-- standard attributes (Attr) : 
-- 0 Normal/Reset all attributes
-- 1 Bold
-- 2 Faint
-- 3 Standout
-- 4 Underscore
-- 5 Blink
-- 7 Reverse
-- 8 Hidden

-- Foreground Colours (Fore) :
-- 30 Black
-- 31 Red
-- 32 Green
-- 33 Yellow
-- 34 Blue
-- 35 Magenta
-- 36 Cyan
-- 37 White
-- 39 Default
    
-- Background Colours (Back) :
-- 40 Black
-- 41 Red
-- 42 Green
-- 43 Yellow
-- 44 Blue
-- 45 Magenta
-- 46 Cyan
-- 47 White
-- 49 Default

end ANSI_Term;