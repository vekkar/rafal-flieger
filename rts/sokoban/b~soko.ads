pragma Ada_95;
with System;
package ada_main is
   pragma Warnings (Off);

   gnat_argc : Integer;
   gnat_argv : System.Address;
   gnat_envp : System.Address;

   pragma Import (C, gnat_argc);
   pragma Import (C, gnat_argv);
   pragma Import (C, gnat_envp);

   gnat_exit_status : Integer;
   pragma Import (C, gnat_exit_status);

   GNAT_Version : constant String :=
                    "GNAT Version: GPL 2010 (20100603)" & ASCII.NUL;
   pragma Export (C, GNAT_Version, "__gnat_version");

   Ada_Main_Program_Name : constant String := "_ada_soko" & ASCII.NUL;
   pragma Export (C, Ada_Main_Program_Name, "__gnat_ada_main_program_name");

   procedure adafinal;
   pragma Export (C, adafinal, "adafinal");

   procedure adainit;
   pragma Export (C, adainit, "adainit");

   procedure Break_Start;
   pragma Import (C, Break_Start, "__gnat_break_start");

   function main
     (argc : Integer;
      argv : System.Address;
      envp : System.Address)
      return Integer;
   pragma Export (C, main, "main");

   type Version_32 is mod 2 ** 32;
   u00001 : constant Version_32 := 16#543e3392#;
   pragma Export (C, u00001, "sokoB");
   u00002 : constant Version_32 := 16#6385d640#;
   pragma Export (C, u00002, "system__standard_libraryB");
   u00003 : constant Version_32 := 16#c332087d#;
   pragma Export (C, u00003, "system__standard_libraryS");
   u00004 : constant Version_32 := 16#9c7dd3ea#;
   pragma Export (C, u00004, "adaS");
   u00005 : constant Version_32 := 16#7f248156#;
   pragma Export (C, u00005, "ada__calendarB");
   u00006 : constant Version_32 := 16#8535bfda#;
   pragma Export (C, u00006, "ada__calendarS");
   u00007 : constant Version_32 := 16#370c0967#;
   pragma Export (C, u00007, "ada__exceptionsB");
   u00008 : constant Version_32 := 16#a187a4c1#;
   pragma Export (C, u00008, "ada__exceptionsS");
   u00009 : constant Version_32 := 16#ba011fb9#;
   pragma Export (C, u00009, "ada__exceptions__last_chance_handlerB");
   u00010 : constant Version_32 := 16#62eb6abe#;
   pragma Export (C, u00010, "ada__exceptions__last_chance_handlerS");
   u00011 : constant Version_32 := 16#0e6ea6c5#;
   pragma Export (C, u00011, "systemS");
   u00012 : constant Version_32 := 16#fc53e595#;
   pragma Export (C, u00012, "system__soft_linksB");
   u00013 : constant Version_32 := 16#13ec91a3#;
   pragma Export (C, u00013, "system__soft_linksS");
   u00014 : constant Version_32 := 16#155c2ca5#;
   pragma Export (C, u00014, "system__parametersB");
   u00015 : constant Version_32 := 16#62b04be0#;
   pragma Export (C, u00015, "system__parametersS");
   u00016 : constant Version_32 := 16#873439f6#;
   pragma Export (C, u00016, "system__secondary_stackB");
   u00017 : constant Version_32 := 16#78788d18#;
   pragma Export (C, u00017, "system__secondary_stackS");
   u00018 : constant Version_32 := 16#2ce209da#;
   pragma Export (C, u00018, "system__storage_elementsB");
   u00019 : constant Version_32 := 16#aabbdae3#;
   pragma Export (C, u00019, "system__storage_elementsS");
   u00020 : constant Version_32 := 16#892f4d5b#;
   pragma Export (C, u00020, "system__stack_checkingB");
   u00021 : constant Version_32 := 16#e2a4447e#;
   pragma Export (C, u00021, "system__stack_checkingS");
   u00022 : constant Version_32 := 16#2f60aa04#;
   pragma Export (C, u00022, "system__exception_tableB");
   u00023 : constant Version_32 := 16#d9ad4092#;
   pragma Export (C, u00023, "system__exception_tableS");
   u00024 : constant Version_32 := 16#e43c4f3d#;
   pragma Export (C, u00024, "system__htableB");
   u00025 : constant Version_32 := 16#56db7cfd#;
   pragma Export (C, u00025, "system__htableS");
   u00026 : constant Version_32 := 16#cc0e9903#;
   pragma Export (C, u00026, "system__string_hashB");
   u00027 : constant Version_32 := 16#668b0bd3#;
   pragma Export (C, u00027, "system__string_hashS");
   u00028 : constant Version_32 := 16#88c8686c#;
   pragma Export (C, u00028, "system__exceptionsB");
   u00029 : constant Version_32 := 16#4a31e901#;
   pragma Export (C, u00029, "system__exceptionsS");
   u00030 : constant Version_32 := 16#6997f8be#;
   pragma Export (C, u00030, "system__tracebackB");
   u00031 : constant Version_32 := 16#8d294e8f#;
   pragma Export (C, u00031, "system__tracebackS");
   u00032 : constant Version_32 := 16#ce975c20#;
   pragma Export (C, u00032, "system__unsigned_typesS");
   u00033 : constant Version_32 := 16#08a5f9f2#;
   pragma Export (C, u00033, "system__wch_conB");
   u00034 : constant Version_32 := 16#3eaa2b04#;
   pragma Export (C, u00034, "system__wch_conS");
   u00035 : constant Version_32 := 16#776b72d1#;
   pragma Export (C, u00035, "system__wch_stwB");
   u00036 : constant Version_32 := 16#badd64f5#;
   pragma Export (C, u00036, "system__wch_stwS");
   u00037 : constant Version_32 := 16#906233be#;
   pragma Export (C, u00037, "system__wch_cnvB");
   u00038 : constant Version_32 := 16#954a6cef#;
   pragma Export (C, u00038, "system__wch_cnvS");
   u00039 : constant Version_32 := 16#a69cad5c#;
   pragma Export (C, u00039, "interfacesS");
   u00040 : constant Version_32 := 16#093802d2#;
   pragma Export (C, u00040, "system__wch_jisB");
   u00041 : constant Version_32 := 16#1dd92a55#;
   pragma Export (C, u00041, "system__wch_jisS");
   u00042 : constant Version_32 := 16#fe5e1c6e#;
   pragma Export (C, u00042, "system__traceback_entriesB");
   u00043 : constant Version_32 := 16#a80054a5#;
   pragma Export (C, u00043, "system__traceback_entriesS");
   u00044 : constant Version_32 := 16#88008fef#;
   pragma Export (C, u00044, "system__os_primitivesB");
   u00045 : constant Version_32 := 16#46b49d08#;
   pragma Export (C, u00045, "system__os_primitivesS");
   u00046 : constant Version_32 := 16#f94060a8#;
   pragma Export (C, u00046, "system__win32S");
   u00047 : constant Version_32 := 16#59507545#;
   pragma Export (C, u00047, "interfaces__cB");
   u00048 : constant Version_32 := 16#767cb61b#;
   pragma Export (C, u00048, "interfaces__cS");
   u00049 : constant Version_32 := 16#328e1a17#;
   pragma Export (C, u00049, "system__win32__extS");
   u00050 : constant Version_32 := 16#aad02b3d#;
   pragma Export (C, u00050, "ada__calendar__formattingB");
   u00051 : constant Version_32 := 16#aeb09f88#;
   pragma Export (C, u00051, "ada__calendar__formattingS");
   u00052 : constant Version_32 := 16#94f0a15f#;
   pragma Export (C, u00052, "ada__calendar__time_zonesB");
   u00053 : constant Version_32 := 16#47117e84#;
   pragma Export (C, u00053, "ada__calendar__time_zonesS");
   u00054 : constant Version_32 := 16#0255db5c#;
   pragma Export (C, u00054, "system__img_intB");
   u00055 : constant Version_32 := 16#f913b5f9#;
   pragma Export (C, u00055, "system__img_intS");
   u00056 : constant Version_32 := 16#294c3b74#;
   pragma Export (C, u00056, "system__val_intB");
   u00057 : constant Version_32 := 16#dc5caf17#;
   pragma Export (C, u00057, "system__val_intS");
   u00058 : constant Version_32 := 16#647de85b#;
   pragma Export (C, u00058, "system__val_unsB");
   u00059 : constant Version_32 := 16#2fa8111e#;
   pragma Export (C, u00059, "system__val_unsS");
   u00060 : constant Version_32 := 16#0d0a8d0c#;
   pragma Export (C, u00060, "system__val_utilB");
   u00061 : constant Version_32 := 16#5440dba9#;
   pragma Export (C, u00061, "system__val_utilS");
   u00062 : constant Version_32 := 16#895f8c1e#;
   pragma Export (C, u00062, "system__case_utilB");
   u00063 : constant Version_32 := 16#10ed8c5f#;
   pragma Export (C, u00063, "system__case_utilS");
   u00064 : constant Version_32 := 16#e72b98e7#;
   pragma Export (C, u00064, "system__val_realB");
   u00065 : constant Version_32 := 16#eaa89c96#;
   pragma Export (C, u00065, "system__val_realS");
   u00066 : constant Version_32 := 16#e0683b80#;
   pragma Export (C, u00066, "system__exn_llfB");
   u00067 : constant Version_32 := 16#49bc21ce#;
   pragma Export (C, u00067, "system__exn_llfS");
   u00068 : constant Version_32 := 16#2eb14fc1#;
   pragma Export (C, u00068, "system__powten_tableS");
   u00069 : constant Version_32 := 16#cc1134cf#;
   pragma Export (C, u00069, "ada__charactersS");
   u00070 : constant Version_32 := 16#05f3507e#;
   pragma Export (C, u00070, "ada__characters__handlingB");
   u00071 : constant Version_32 := 16#8cddb9b3#;
   pragma Export (C, u00071, "ada__characters__handlingS");
   u00072 : constant Version_32 := 16#b9828a2f#;
   pragma Export (C, u00072, "ada__characters__latin_1S");
   u00073 : constant Version_32 := 16#1bc9f0e1#;
   pragma Export (C, u00073, "ada__stringsS");
   u00074 : constant Version_32 := 16#eccbd1ca#;
   pragma Export (C, u00074, "ada__strings__mapsB");
   u00075 : constant Version_32 := 16#3c09e836#;
   pragma Export (C, u00075, "ada__strings__mapsS");
   u00076 : constant Version_32 := 16#b6cefd2f#;
   pragma Export (C, u00076, "system__bit_opsB");
   u00077 : constant Version_32 := 16#668486d6#;
   pragma Export (C, u00077, "system__bit_opsS");
   u00078 : constant Version_32 := 16#ec7a3063#;
   pragma Export (C, u00078, "ada__strings__maps__constantsS");
   u00079 : constant Version_32 := 16#2da62ab7#;
   pragma Export (C, u00079, "ada__command_lineB");
   u00080 : constant Version_32 := 16#f70022ec#;
   pragma Export (C, u00080, "ada__command_lineS");
   u00081 : constant Version_32 := 16#03bc737c#;
   pragma Export (C, u00081, "ada__integer_text_ioB");
   u00082 : constant Version_32 := 16#efa41264#;
   pragma Export (C, u00082, "ada__integer_text_ioS");
   u00083 : constant Version_32 := 16#8b4d300d#;
   pragma Export (C, u00083, "ada__tagsB");
   u00084 : constant Version_32 := 16#89667d4f#;
   pragma Export (C, u00084, "ada__tagsS");
   u00085 : constant Version_32 := 16#22e6f3e8#;
   pragma Export (C, u00085, "ada__text_ioB");
   u00086 : constant Version_32 := 16#03466475#;
   pragma Export (C, u00086, "ada__text_ioS");
   u00087 : constant Version_32 := 16#a8d17654#;
   pragma Export (C, u00087, "ada__streamsS");
   u00088 : constant Version_32 := 16#62e56d2b#;
   pragma Export (C, u00088, "interfaces__c_streamsB");
   u00089 : constant Version_32 := 16#5ac694a5#;
   pragma Export (C, u00089, "interfaces__c_streamsS");
   u00090 : constant Version_32 := 16#7f0a16b0#;
   pragma Export (C, u00090, "system__crtlS");
   u00091 : constant Version_32 := 16#af90b312#;
   pragma Export (C, u00091, "system__file_ioB");
   u00092 : constant Version_32 := 16#6d6b6b5e#;
   pragma Export (C, u00092, "system__file_ioS");
   u00093 : constant Version_32 := 16#1a3a7ed3#;
   pragma Export (C, u00093, "ada__finalizationB");
   u00094 : constant Version_32 := 16#37a7e042#;
   pragma Export (C, u00094, "ada__finalizationS");
   u00095 : constant Version_32 := 16#6d0998e1#;
   pragma Export (C, u00095, "system__finalization_rootB");
   u00096 : constant Version_32 := 16#7f2a6758#;
   pragma Export (C, u00096, "system__finalization_rootS");
   u00097 : constant Version_32 := 16#9801f8ef#;
   pragma Export (C, u00097, "system__finalization_implementationB");
   u00098 : constant Version_32 := 16#7fae2656#;
   pragma Export (C, u00098, "system__finalization_implementationS");
   u00099 : constant Version_32 := 16#d4614e59#;
   pragma Export (C, u00099, "system__restrictionsB");
   u00100 : constant Version_32 := 16#00ce3b9f#;
   pragma Export (C, u00100, "system__restrictionsS");
   u00101 : constant Version_32 := 16#bf6c093b#;
   pragma Export (C, u00101, "system__stream_attributesB");
   u00102 : constant Version_32 := 16#0aa29e81#;
   pragma Export (C, u00102, "system__stream_attributesS");
   u00103 : constant Version_32 := 16#b9796a38#;
   pragma Export (C, u00103, "ada__io_exceptionsS");
   u00104 : constant Version_32 := 16#c2f59d50#;
   pragma Export (C, u00104, "interfaces__c__stringsB");
   u00105 : constant Version_32 := 16#6c09f761#;
   pragma Export (C, u00105, "interfaces__c__stringsS");
   u00106 : constant Version_32 := 16#7c698ebf#;
   pragma Export (C, u00106, "system__crtl__runtimeS");
   u00107 : constant Version_32 := 16#a8758ccd#;
   pragma Export (C, u00107, "system__os_libB");
   u00108 : constant Version_32 := 16#77f99f4f#;
   pragma Export (C, u00108, "system__os_libS");
   u00109 : constant Version_32 := 16#cc47afb0#;
   pragma Export (C, u00109, "system__stringsB");
   u00110 : constant Version_32 := 16#c6d1a624#;
   pragma Export (C, u00110, "system__stringsS");
   u00111 : constant Version_32 := 16#06c40887#;
   pragma Export (C, u00111, "system__file_control_blockS");
   u00112 : constant Version_32 := 16#4be846ff#;
   pragma Export (C, u00112, "ada__finalization__list_controllerB");
   u00113 : constant Version_32 := 16#e42a19e8#;
   pragma Export (C, u00113, "ada__finalization__list_controllerS");
   u00114 : constant Version_32 := 16#6ffd7991#;
   pragma Export (C, u00114, "ada__text_io__integer_auxB");
   u00115 : constant Version_32 := 16#56404473#;
   pragma Export (C, u00115, "ada__text_io__integer_auxS");
   u00116 : constant Version_32 := 16#f346ff5c#;
   pragma Export (C, u00116, "ada__text_io__generic_auxB");
   u00117 : constant Version_32 := 16#a1d04422#;
   pragma Export (C, u00117, "ada__text_io__generic_auxS");
   u00118 : constant Version_32 := 16#d9f6bc78#;
   pragma Export (C, u00118, "system__img_biuB");
   u00119 : constant Version_32 := 16#1acb98ae#;
   pragma Export (C, u00119, "system__img_biuS");
   u00120 : constant Version_32 := 16#8ab10de5#;
   pragma Export (C, u00120, "system__img_llbB");
   u00121 : constant Version_32 := 16#fcd6b425#;
   pragma Export (C, u00121, "system__img_llbS");
   u00122 : constant Version_32 := 16#17c88cd6#;
   pragma Export (C, u00122, "system__img_lliB");
   u00123 : constant Version_32 := 16#ee360a5d#;
   pragma Export (C, u00123, "system__img_lliS");
   u00124 : constant Version_32 := 16#76b10c12#;
   pragma Export (C, u00124, "system__img_llwB");
   u00125 : constant Version_32 := 16#06e6ef50#;
   pragma Export (C, u00125, "system__img_llwS");
   u00126 : constant Version_32 := 16#91b7530a#;
   pragma Export (C, u00126, "system__img_wiuB");
   u00127 : constant Version_32 := 16#4c1a6f15#;
   pragma Export (C, u00127, "system__img_wiuS");
   u00128 : constant Version_32 := 16#3131a464#;
   pragma Export (C, u00128, "system__val_lliB");
   u00129 : constant Version_32 := 16#45a56406#;
   pragma Export (C, u00129, "system__val_lliS");
   u00130 : constant Version_32 := 16#5056e8dd#;
   pragma Export (C, u00130, "system__val_lluB");
   u00131 : constant Version_32 := 16#32cc4e27#;
   pragma Export (C, u00131, "system__val_lluS");
   u00132 : constant Version_32 := 16#6d2722f0#;
   pragma Export (C, u00132, "ada__strings__fixedB");
   u00133 : constant Version_32 := 16#f0ddc3f6#;
   pragma Export (C, u00133, "ada__strings__fixedS");
   u00134 : constant Version_32 := 16#c3f70255#;
   pragma Export (C, u00134, "ada__strings__searchB");
   u00135 : constant Version_32 := 16#54ed61ee#;
   pragma Export (C, u00135, "ada__strings__searchS");
   u00136 : constant Version_32 := 16#1bde34e3#;
   pragma Export (C, u00136, "ada__strings__unboundedB");
   u00137 : constant Version_32 := 16#9a61d341#;
   pragma Export (C, u00137, "ada__strings__unboundedS");
   u00138 : constant Version_32 := 16#cc1b1855#;
   pragma Export (C, u00138, "system__compare_array_unsigned_8B");
   u00139 : constant Version_32 := 16#65f37710#;
   pragma Export (C, u00139, "system__compare_array_unsigned_8S");
   u00140 : constant Version_32 := 16#a7af1709#;
   pragma Export (C, u00140, "system__address_operationsB");
   u00141 : constant Version_32 := 16#382b73e1#;
   pragma Export (C, u00141, "system__address_operationsS");
   u00142 : constant Version_32 := 16#3a4fe8af#;
   pragma Export (C, u00142, "ada__text_io__float_auxB");
   u00143 : constant Version_32 := 16#be4f0f26#;
   pragma Export (C, u00143, "ada__text_io__float_auxS");
   u00144 : constant Version_32 := 16#b9bae38f#;
   pragma Export (C, u00144, "system__img_realB");
   u00145 : constant Version_32 := 16#d4e6143a#;
   pragma Export (C, u00145, "system__img_realS");
   u00146 : constant Version_32 := 16#eeb3fe26#;
   pragma Export (C, u00146, "system__fat_llfS");
   u00147 : constant Version_32 := 16#3e7d115b#;
   pragma Export (C, u00147, "system__img_lluB");
   u00148 : constant Version_32 := 16#033da8fd#;
   pragma Export (C, u00148, "system__img_lluS");
   u00149 : constant Version_32 := 16#9b936ce6#;
   pragma Export (C, u00149, "system__img_unsB");
   u00150 : constant Version_32 := 16#3a821709#;
   pragma Export (C, u00150, "system__img_unsS");
   u00151 : constant Version_32 := 16#67bbfe55#;
   pragma Export (C, u00151, "ansi_termB");
   u00152 : constant Version_32 := 16#5f3dc344#;
   pragma Export (C, u00152, "ansi_termS");
   u00153 : constant Version_32 := 16#6f03c6a8#;
   pragma Export (C, u00153, "nt_consoleB");
   u00154 : constant Version_32 := 16#36f89425#;
   pragma Export (C, u00154, "nt_consoleS");
   u00155 : constant Version_32 := 16#9e7c905a#;
   pragma Export (C, u00155, "system__arith_64B");
   u00156 : constant Version_32 := 16#7627ffbb#;
   pragma Export (C, u00156, "system__arith_64S");
   u00157 : constant Version_32 := 16#0c1f6bec#;
   pragma Export (C, u00157, "system__exn_lliB");
   u00158 : constant Version_32 := 16#83032d8e#;
   pragma Export (C, u00158, "system__exn_lliS");
   u00159 : constant Version_32 := 16#3ab61ed3#;
   pragma Export (C, u00159, "system__memoryB");
   u00160 : constant Version_32 := 16#c8eda076#;
   pragma Export (C, u00160, "system__memoryS");

   --  BEGIN ELABORATION ORDER
   --  ada%s
   --  ada.characters%s
   --  ada.characters.handling%s
   --  ada.characters.latin_1%s
   --  ada.command_line%s
   --  interfaces%s
   --  system%s
   --  system.address_operations%s
   --  system.address_operations%b
   --  system.arith_64%s
   --  system.case_util%s
   --  system.case_util%b
   --  system.exn_llf%s
   --  system.exn_llf%b
   --  system.exn_lli%s
   --  system.exn_lli%b
   --  system.htable%s
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.img_real%s
   --  system.os_primitives%s
   --  system.parameters%s
   --  system.parameters%b
   --  system.crtl%s
   --  interfaces.c_streams%s
   --  interfaces.c_streams%b
   --  system.powten_table%s
   --  system.restrictions%s
   --  system.restrictions%b
   --  system.standard_library%s
   --  system.exceptions%s
   --  system.exceptions%b
   --  system.storage_elements%s
   --  system.storage_elements%b
   --  system.stack_checking%s
   --  system.stack_checking%b
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.arith_64%b
   --  system.soft_links%s
   --  system.unsigned_types%s
   --  system.fat_llf%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llu%s
   --  system.img_llu%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
   --  system.img_real%b
   --  system.img_wiu%s
   --  system.img_wiu%b
   --  system.val_int%s
   --  system.val_lli%s
   --  system.val_llu%s
   --  system.val_real%s
   --  system.val_uns%s
   --  system.val_util%s
   --  system.val_util%b
   --  system.val_uns%b
   --  system.val_real%b
   --  system.val_llu%b
   --  system.val_lli%b
   --  system.val_int%b
   --  system.wch_con%s
   --  system.wch_con%b
   --  system.wch_cnv%s
   --  system.wch_jis%s
   --  system.wch_jis%b
   --  system.wch_cnv%b
   --  system.wch_stw%s
   --  system.wch_stw%b
   --  ada.exceptions.last_chance_handler%s
   --  ada.exceptions.last_chance_handler%b
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.exception_table%s
   --  system.exception_table%b
   --  ada.io_exceptions%s
   --  ada.strings%s
   --  ada.strings.maps%s
   --  ada.strings.fixed%s
   --  ada.strings.maps.constants%s
   --  ada.strings.search%s
   --  ada.strings.search%b
   --  ada.tags%s
   --  ada.streams%s
   --  interfaces.c%s
   --  interfaces.c.strings%s
   --  system.crtl.runtime%s
   --  system.stream_attributes%s
   --  system.stream_attributes%b
   --  system.win32%s
   --  system.win32.ext%s
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.time_zones%s
   --  ada.calendar.time_zones%b
   --  ada.calendar.formatting%s
   --  system.memory%s
   --  system.memory%b
   --  system.standard_library%b
   --  system.secondary_stack%s
   --  interfaces.c.strings%b
   --  interfaces.c%b
   --  ada.tags%b
   --  ada.strings.fixed%b
   --  ada.strings.maps%b
   --  system.soft_links%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  ada.calendar.formatting%b
   --  system.finalization_root%s
   --  system.finalization_root%b
   --  system.finalization_implementation%s
   --  system.finalization_implementation%b
   --  ada.finalization%s
   --  ada.finalization%b
   --  ada.strings.unbounded%s
   --  ada.strings.unbounded%b
   --  ada.finalization.list_controller%s
   --  ada.finalization.list_controller%b
   --  system.file_control_block%s
   --  system.file_io%s
   --  system.os_lib%s
   --  system.os_lib%b
   --  system.file_io%b
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.float_aux%s
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.float_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  ansi_term%s
   --  ansi_term%b
   --  nt_console%s
   --  nt_console%b
   --  soko%b
   --  END ELABORATION ORDER

end ada_main;
