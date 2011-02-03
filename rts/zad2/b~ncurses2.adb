pragma Ada_95;
pragma Source_File_Name (ada_main, Spec_File_Name => "b~ncurses2.ads");
pragma Source_File_Name (ada_main, Body_File_Name => "b~ncurses2.adb");

with System.Restrictions;

package body ada_main is
   pragma Warnings (Off);

   procedure Do_Finalize;
   pragma Import (C, Do_Finalize, "system__standard_library__adafinal");

   Local_Priority_Specific_Dispatching : constant String := "";
   Local_Interrupt_States : constant String := "";

   procedure adainit is
      E013 : Boolean; pragma Import (Ada, E013, "system__soft_links_E");
      E023 : Boolean; pragma Import (Ada, E023, "system__exception_table_E");
      E100 : Boolean; pragma Import (Ada, E100, "ada__io_exceptions_E");
      E077 : Boolean; pragma Import (Ada, E077, "ada__strings_E");
      E079 : Boolean; pragma Import (Ada, E079, "ada__strings__maps_E");
      E082 : Boolean; pragma Import (Ada, E082, "ada__strings__maps__constants_E");
      E093 : Boolean; pragma Import (Ada, E093, "ada__tags_E");
      E091 : Boolean; pragma Import (Ada, E091, "ada__streams_E");
      E048 : Boolean; pragma Import (Ada, E048, "interfaces__c_E");
      E111 : Boolean; pragma Import (Ada, E111, "interfaces__c__strings_E");
      E149 : Boolean; pragma Import (Ada, E149, "system__task_info_E");
      E006 : Boolean; pragma Import (Ada, E006, "ada__calendar_E");
      E051 : Boolean; pragma Import (Ada, E051, "ada__calendar__delays_E");
      E057 : Boolean; pragma Import (Ada, E057, "ada__calendar__time_zones_E");
      E017 : Boolean; pragma Import (Ada, E017, "system__secondary_stack_E");
      E090 : Boolean; pragma Import (Ada, E090, "system__finalization_root_E");
      E095 : Boolean; pragma Import (Ada, E095, "system__finalization_implementation_E");
      E088 : Boolean; pragma Import (Ada, E088, "ada__finalization_E");
      E175 : Boolean; pragma Import (Ada, E175, "ada__strings__unbounded_E");
      E086 : Boolean; pragma Import (Ada, E086, "ada__finalization__list_controller_E");
      E117 : Boolean; pragma Import (Ada, E117, "system__file_control_block_E");
      E109 : Boolean; pragma Import (Ada, E109, "system__file_io_E");
      E114 : Boolean; pragma Import (Ada, E114, "system__os_lib_E");
      E195 : Boolean; pragma Import (Ada, E195, "system__tasking__initialization_E");
      E185 : Boolean; pragma Import (Ada, E185, "system__tasking__protected_objects_E");
      E137 : Boolean; pragma Import (Ada, E137, "ada__real_time_E");
      E104 : Boolean; pragma Import (Ada, E104, "ada__text_io_E");
      E199 : Boolean; pragma Import (Ada, E199, "system__tasking__protected_objects__entries_E");
      E197 : Boolean; pragma Import (Ada, E197, "system__tasking__queuing_E");
      E191 : Boolean; pragma Import (Ada, E191, "system__tasking__stages_E");
      E181 : Boolean; pragma Import (Ada, E181, "ansi_term_E");
      E183 : Boolean; pragma Import (Ada, E183, "nt_console_E");

      Main_Priority : Integer;
      pragma Import (C, Main_Priority, "__gl_main_priority");
      Time_Slice_Value : Integer;
      pragma Import (C, Time_Slice_Value, "__gl_time_slice_val");
      WC_Encoding : Character;
      pragma Import (C, WC_Encoding, "__gl_wc_encoding");
      Locking_Policy : Character;
      pragma Import (C, Locking_Policy, "__gl_locking_policy");
      Queuing_Policy : Character;
      pragma Import (C, Queuing_Policy, "__gl_queuing_policy");
      Task_Dispatching_Policy : Character;
      pragma Import (C, Task_Dispatching_Policy, "__gl_task_dispatching_policy");
      Priority_Specific_Dispatching : System.Address;
      pragma Import (C, Priority_Specific_Dispatching, "__gl_priority_specific_dispatching");
      Num_Specific_Dispatching : Integer;
      pragma Import (C, Num_Specific_Dispatching, "__gl_num_specific_dispatching");
      Interrupt_States : System.Address;
      pragma Import (C, Interrupt_States, "__gl_interrupt_states");
      Num_Interrupt_States : Integer;
      pragma Import (C, Num_Interrupt_States, "__gl_num_interrupt_states");
      Unreserve_All_Interrupts : Integer;
      pragma Import (C, Unreserve_All_Interrupts, "__gl_unreserve_all_interrupts");
      Zero_Cost_Exceptions : Integer;
      pragma Import (C, Zero_Cost_Exceptions, "__gl_zero_cost_exceptions");
      Detect_Blocking : Integer;
      pragma Import (C, Detect_Blocking, "__gl_detect_blocking");
      Default_Stack_Size : Integer;
      pragma Import (C, Default_Stack_Size, "__gl_default_stack_size");
      Leap_Seconds_Support : Integer;
      pragma Import (C, Leap_Seconds_Support, "__gl_leap_seconds_support");

      procedure Install_Handler;
      pragma Import (C, Install_Handler, "__gnat_install_handler");

      Handler_Installed : Integer;
      pragma Import (C, Handler_Installed, "__gnat_handler_installed");
   begin
      Main_Priority := -1;
      Time_Slice_Value := -1;
      WC_Encoding := 'b';
      Locking_Policy := ' ';
      Queuing_Policy := ' ';
      Task_Dispatching_Policy := ' ';
      System.Restrictions.Run_Time_Restrictions :=
        (Set =>
          (False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False, False, False, 
           False, False, False, False, False, False),
         Value => (0, 0, 0, 0, 0, 0, 0),
         Violated =>
          (False, False, True, True, False, True, True, True, 
           True, True, False, False, True, False, False, True, 
           True, False, True, True, True, True, True, True, 
           False, False, True, False, True, False, True, True, 
           False, True, True, False, False, False, True, False, 
           False, True, False, False, False, False, True, False, 
           True, False, True, True, True, False, False, True, 
           False, True, True, False, True, True, False, False, 
           False, False, True, False, True, False),
         Count => (0, 0, 0, 1, 0, 1, 0),
         Unknown => (False, False, False, True, False, True, False));
      Priority_Specific_Dispatching :=
        Local_Priority_Specific_Dispatching'Address;
      Num_Specific_Dispatching := 0;
      Interrupt_States := Local_Interrupt_States'Address;
      Num_Interrupt_States := 0;
      Unreserve_All_Interrupts := 0;
      Zero_Cost_Exceptions := 1;
      Detect_Blocking := 0;
      Default_Stack_Size := -1;
      Leap_Seconds_Support := 0;

      if Handler_Installed = 0 then
         Install_Handler;
      end if;

      System.Exception_Table'Elab_Body;
      E023 := True;
      Ada.Io_Exceptions'Elab_Spec;
      E100 := True;
      Ada.Strings'Elab_Spec;
      E077 := True;
      Ada.Strings.Maps'Elab_Spec;
      Ada.Strings.Maps.Constants'Elab_Spec;
      E082 := True;
      Ada.Tags'Elab_Spec;
      Ada.Streams'Elab_Spec;
      E091 := True;
      Interfaces.C'Elab_Spec;
      Interfaces.C.Strings'Elab_Spec;
      System.Task_Info'Elab_Spec;
      E149 := True;
      Ada.Calendar'Elab_Spec;
      Ada.Calendar'Elab_Body;
      E006 := True;
      Ada.Calendar.Delays'Elab_Body;
      E051 := True;
      Ada.Calendar.Time_Zones'Elab_Spec;
      E057 := True;
      E111 := True;
      E048 := True;
      Ada.Tags'Elab_Body;
      E093 := True;
      E079 := True;
      System.Soft_Links'Elab_Body;
      E013 := True;
      System.Secondary_Stack'Elab_Body;
      E017 := True;
      System.Finalization_Root'Elab_Spec;
      E090 := True;
      System.Finalization_Implementation'Elab_Spec;
      System.Finalization_Implementation'Elab_Body;
      E095 := True;
      Ada.Finalization'Elab_Spec;
      E088 := True;
      Ada.Strings.Unbounded'Elab_Spec;
      E175 := True;
      Ada.Finalization.List_Controller'Elab_Spec;
      E086 := True;
      System.File_Control_Block'Elab_Spec;
      E117 := True;
      System.Os_Lib'Elab_Body;
      E114 := True;
      System.File_Io'Elab_Body;
      E109 := True;
      System.Tasking.Initialization'Elab_Body;
      E195 := True;
      System.Tasking.Protected_Objects'Elab_Body;
      E185 := True;
      Ada.Real_Time'Elab_Spec;
      Ada.Real_Time'Elab_Body;
      E137 := True;
      Ada.Text_Io'Elab_Spec;
      Ada.Text_Io'Elab_Body;
      E104 := True;
      System.Tasking.Protected_Objects.Entries'Elab_Spec;
      E199 := True;
      System.Tasking.Queuing'Elab_Body;
      E197 := True;
      System.Tasking.Stages'Elab_Body;
      E191 := True;
      E181 := True;
      Nt_Console'Elab_Body;
      E183 := True;
   end adainit;

   procedure adafinal is
   begin
      Do_Finalize;
   end adafinal;

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer
   is
      procedure initialize (Addr : System.Address);
      pragma Import (C, initialize, "__gnat_initialize");

      procedure finalize;
      pragma Import (C, finalize, "__gnat_finalize");

      procedure Ada_Main_Program;
      pragma Import (Ada, Ada_Main_Program, "_ada_ncurses2");

      SEH : aliased array (1 .. 2) of Integer;

      Ensure_Reference : aliased System.Address := Ada_Main_Program_Name'Address;
      pragma Volatile (Ensure_Reference);

   begin
      gnat_argc := argc;
      gnat_argv := argv;
      gnat_envp := envp;

      Initialize (SEH'Address);
      adainit;
      Break_Start;
      Ada_Main_Program;
      Do_Finalize;
      Finalize;
      return (gnat_exit_status);
   end;

--  BEGIN Object file/option list
   --   C:\Documents and Settings\Administrator\Pulpit\ada\ncurses2\ansi_term.o
   --   C:\Documents and Settings\Administrator\Pulpit\ada\ncurses2\nt_console.o
   --   C:\Documents and Settings\Administrator\Pulpit\ada\ncurses2\ncurses2.o
   --   -LC:\Documents and Settings\Administrator\Pulpit\ada\ncurses2\
   --   -LC:/GNAT/2010/lib/gcc/i686-pc-mingw32/4.3.6/adalib/
   --   -luser32
   --   -static
   --   -lgnarl
   --   -lgnat
   --   -Xlinker
   --   --stack=0x200000,0x1000
   --   -mthreads
   --   -Wl,--stack=0x2000000
--  END Object file/option list   

end ada_main;
