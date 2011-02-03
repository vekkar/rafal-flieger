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

   Ada_Main_Program_Name : constant String := "_ada_ncurses2" & ASCII.NUL;
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
   u00001 : constant Version_32 := 16#d09fbc7b#;
   pragma Export (C, u00001, "ncurses2B");
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
   u00050 : constant Version_32 := 16#f2483fae#;
   pragma Export (C, u00050, "ada__calendar__delaysB");
   u00051 : constant Version_32 := 16#dc2d9adb#;
   pragma Export (C, u00051, "ada__calendar__delaysS");
   u00052 : constant Version_32 := 16#499c33c1#;
   pragma Export (C, u00052, "system__tracesB");
   u00053 : constant Version_32 := 16#8e705356#;
   pragma Export (C, u00053, "system__tracesS");
   u00054 : constant Version_32 := 16#aad02b3d#;
   pragma Export (C, u00054, "ada__calendar__formattingB");
   u00055 : constant Version_32 := 16#aeb09f88#;
   pragma Export (C, u00055, "ada__calendar__formattingS");
   u00056 : constant Version_32 := 16#94f0a15f#;
   pragma Export (C, u00056, "ada__calendar__time_zonesB");
   u00057 : constant Version_32 := 16#47117e84#;
   pragma Export (C, u00057, "ada__calendar__time_zonesS");
   u00058 : constant Version_32 := 16#0255db5c#;
   pragma Export (C, u00058, "system__img_intB");
   u00059 : constant Version_32 := 16#f913b5f9#;
   pragma Export (C, u00059, "system__img_intS");
   u00060 : constant Version_32 := 16#294c3b74#;
   pragma Export (C, u00060, "system__val_intB");
   u00061 : constant Version_32 := 16#dc5caf17#;
   pragma Export (C, u00061, "system__val_intS");
   u00062 : constant Version_32 := 16#647de85b#;
   pragma Export (C, u00062, "system__val_unsB");
   u00063 : constant Version_32 := 16#2fa8111e#;
   pragma Export (C, u00063, "system__val_unsS");
   u00064 : constant Version_32 := 16#0d0a8d0c#;
   pragma Export (C, u00064, "system__val_utilB");
   u00065 : constant Version_32 := 16#5440dba9#;
   pragma Export (C, u00065, "system__val_utilS");
   u00066 : constant Version_32 := 16#895f8c1e#;
   pragma Export (C, u00066, "system__case_utilB");
   u00067 : constant Version_32 := 16#10ed8c5f#;
   pragma Export (C, u00067, "system__case_utilS");
   u00068 : constant Version_32 := 16#e72b98e7#;
   pragma Export (C, u00068, "system__val_realB");
   u00069 : constant Version_32 := 16#eaa89c96#;
   pragma Export (C, u00069, "system__val_realS");
   u00070 : constant Version_32 := 16#e0683b80#;
   pragma Export (C, u00070, "system__exn_llfB");
   u00071 : constant Version_32 := 16#49bc21ce#;
   pragma Export (C, u00071, "system__exn_llfS");
   u00072 : constant Version_32 := 16#2eb14fc1#;
   pragma Export (C, u00072, "system__powten_tableS");
   u00073 : constant Version_32 := 16#cc1134cf#;
   pragma Export (C, u00073, "ada__charactersS");
   u00074 : constant Version_32 := 16#05f3507e#;
   pragma Export (C, u00074, "ada__characters__handlingB");
   u00075 : constant Version_32 := 16#8cddb9b3#;
   pragma Export (C, u00075, "ada__characters__handlingS");
   u00076 : constant Version_32 := 16#b9828a2f#;
   pragma Export (C, u00076, "ada__characters__latin_1S");
   u00077 : constant Version_32 := 16#1bc9f0e1#;
   pragma Export (C, u00077, "ada__stringsS");
   u00078 : constant Version_32 := 16#eccbd1ca#;
   pragma Export (C, u00078, "ada__strings__mapsB");
   u00079 : constant Version_32 := 16#3c09e836#;
   pragma Export (C, u00079, "ada__strings__mapsS");
   u00080 : constant Version_32 := 16#b6cefd2f#;
   pragma Export (C, u00080, "system__bit_opsB");
   u00081 : constant Version_32 := 16#668486d6#;
   pragma Export (C, u00081, "system__bit_opsS");
   u00082 : constant Version_32 := 16#ec7a3063#;
   pragma Export (C, u00082, "ada__strings__maps__constantsS");
   u00083 : constant Version_32 := 16#2da62ab7#;
   pragma Export (C, u00083, "ada__command_lineB");
   u00084 : constant Version_32 := 16#f70022ec#;
   pragma Export (C, u00084, "ada__command_lineS");
   u00085 : constant Version_32 := 16#4be846ff#;
   pragma Export (C, u00085, "ada__finalization__list_controllerB");
   u00086 : constant Version_32 := 16#e42a19e8#;
   pragma Export (C, u00086, "ada__finalization__list_controllerS");
   u00087 : constant Version_32 := 16#1a3a7ed3#;
   pragma Export (C, u00087, "ada__finalizationB");
   u00088 : constant Version_32 := 16#37a7e042#;
   pragma Export (C, u00088, "ada__finalizationS");
   u00089 : constant Version_32 := 16#6d0998e1#;
   pragma Export (C, u00089, "system__finalization_rootB");
   u00090 : constant Version_32 := 16#7f2a6758#;
   pragma Export (C, u00090, "system__finalization_rootS");
   u00091 : constant Version_32 := 16#a8d17654#;
   pragma Export (C, u00091, "ada__streamsS");
   u00092 : constant Version_32 := 16#8b4d300d#;
   pragma Export (C, u00092, "ada__tagsB");
   u00093 : constant Version_32 := 16#89667d4f#;
   pragma Export (C, u00093, "ada__tagsS");
   u00094 : constant Version_32 := 16#9801f8ef#;
   pragma Export (C, u00094, "system__finalization_implementationB");
   u00095 : constant Version_32 := 16#7fae2656#;
   pragma Export (C, u00095, "system__finalization_implementationS");
   u00096 : constant Version_32 := 16#d4614e59#;
   pragma Export (C, u00096, "system__restrictionsB");
   u00097 : constant Version_32 := 16#00ce3b9f#;
   pragma Export (C, u00097, "system__restrictionsS");
   u00098 : constant Version_32 := 16#bf6c093b#;
   pragma Export (C, u00098, "system__stream_attributesB");
   u00099 : constant Version_32 := 16#0aa29e81#;
   pragma Export (C, u00099, "system__stream_attributesS");
   u00100 : constant Version_32 := 16#b9796a38#;
   pragma Export (C, u00100, "ada__io_exceptionsS");
   u00101 : constant Version_32 := 16#03bc737c#;
   pragma Export (C, u00101, "ada__integer_text_ioB");
   u00102 : constant Version_32 := 16#efa41264#;
   pragma Export (C, u00102, "ada__integer_text_ioS");
   u00103 : constant Version_32 := 16#22e6f3e8#;
   pragma Export (C, u00103, "ada__text_ioB");
   u00104 : constant Version_32 := 16#03466475#;
   pragma Export (C, u00104, "ada__text_ioS");
   u00105 : constant Version_32 := 16#62e56d2b#;
   pragma Export (C, u00105, "interfaces__c_streamsB");
   u00106 : constant Version_32 := 16#5ac694a5#;
   pragma Export (C, u00106, "interfaces__c_streamsS");
   u00107 : constant Version_32 := 16#7f0a16b0#;
   pragma Export (C, u00107, "system__crtlS");
   u00108 : constant Version_32 := 16#af90b312#;
   pragma Export (C, u00108, "system__file_ioB");
   u00109 : constant Version_32 := 16#6d6b6b5e#;
   pragma Export (C, u00109, "system__file_ioS");
   u00110 : constant Version_32 := 16#c2f59d50#;
   pragma Export (C, u00110, "interfaces__c__stringsB");
   u00111 : constant Version_32 := 16#6c09f761#;
   pragma Export (C, u00111, "interfaces__c__stringsS");
   u00112 : constant Version_32 := 16#7c698ebf#;
   pragma Export (C, u00112, "system__crtl__runtimeS");
   u00113 : constant Version_32 := 16#a8758ccd#;
   pragma Export (C, u00113, "system__os_libB");
   u00114 : constant Version_32 := 16#77f99f4f#;
   pragma Export (C, u00114, "system__os_libS");
   u00115 : constant Version_32 := 16#cc47afb0#;
   pragma Export (C, u00115, "system__stringsB");
   u00116 : constant Version_32 := 16#c6d1a624#;
   pragma Export (C, u00116, "system__stringsS");
   u00117 : constant Version_32 := 16#06c40887#;
   pragma Export (C, u00117, "system__file_control_blockS");
   u00118 : constant Version_32 := 16#6ffd7991#;
   pragma Export (C, u00118, "ada__text_io__integer_auxB");
   u00119 : constant Version_32 := 16#56404473#;
   pragma Export (C, u00119, "ada__text_io__integer_auxS");
   u00120 : constant Version_32 := 16#f346ff5c#;
   pragma Export (C, u00120, "ada__text_io__generic_auxB");
   u00121 : constant Version_32 := 16#a1d04422#;
   pragma Export (C, u00121, "ada__text_io__generic_auxS");
   u00122 : constant Version_32 := 16#d9f6bc78#;
   pragma Export (C, u00122, "system__img_biuB");
   u00123 : constant Version_32 := 16#1acb98ae#;
   pragma Export (C, u00123, "system__img_biuS");
   u00124 : constant Version_32 := 16#8ab10de5#;
   pragma Export (C, u00124, "system__img_llbB");
   u00125 : constant Version_32 := 16#fcd6b425#;
   pragma Export (C, u00125, "system__img_llbS");
   u00126 : constant Version_32 := 16#17c88cd6#;
   pragma Export (C, u00126, "system__img_lliB");
   u00127 : constant Version_32 := 16#ee360a5d#;
   pragma Export (C, u00127, "system__img_lliS");
   u00128 : constant Version_32 := 16#76b10c12#;
   pragma Export (C, u00128, "system__img_llwB");
   u00129 : constant Version_32 := 16#06e6ef50#;
   pragma Export (C, u00129, "system__img_llwS");
   u00130 : constant Version_32 := 16#91b7530a#;
   pragma Export (C, u00130, "system__img_wiuB");
   u00131 : constant Version_32 := 16#4c1a6f15#;
   pragma Export (C, u00131, "system__img_wiuS");
   u00132 : constant Version_32 := 16#3131a464#;
   pragma Export (C, u00132, "system__val_lliB");
   u00133 : constant Version_32 := 16#45a56406#;
   pragma Export (C, u00133, "system__val_lliS");
   u00134 : constant Version_32 := 16#5056e8dd#;
   pragma Export (C, u00134, "system__val_lluB");
   u00135 : constant Version_32 := 16#32cc4e27#;
   pragma Export (C, u00135, "system__val_lluS");
   u00136 : constant Version_32 := 16#2b690524#;
   pragma Export (C, u00136, "ada__real_timeB");
   u00137 : constant Version_32 := 16#c59c6f02#;
   pragma Export (C, u00137, "ada__real_timeS");
   u00138 : constant Version_32 := 16#9e7c905a#;
   pragma Export (C, u00138, "system__arith_64B");
   u00139 : constant Version_32 := 16#7627ffbb#;
   pragma Export (C, u00139, "system__arith_64S");
   u00140 : constant Version_32 := 16#ff72e115#;
   pragma Export (C, u00140, "system__taskingB");
   u00141 : constant Version_32 := 16#f9f60538#;
   pragma Export (C, u00141, "system__taskingS");
   u00142 : constant Version_32 := 16#523b8fc0#;
   pragma Export (C, u00142, "system__task_primitivesS");
   u00143 : constant Version_32 := 16#990ca8c6#;
   pragma Export (C, u00143, "system__os_interfaceS");
   u00144 : constant Version_32 := 16#aea6a7ce#;
   pragma Export (C, u00144, "system__task_primitives__operationsB");
   u00145 : constant Version_32 := 16#dc8ade2e#;
   pragma Export (C, u00145, "system__task_primitives__operationsS");
   u00146 : constant Version_32 := 16#3f288a63#;
   pragma Export (C, u00146, "system__interrupt_managementB");
   u00147 : constant Version_32 := 16#90f7ef9d#;
   pragma Export (C, u00147, "system__interrupt_managementS");
   u00148 : constant Version_32 := 16#2d9562d4#;
   pragma Export (C, u00148, "system__task_infoB");
   u00149 : constant Version_32 := 16#ba479222#;
   pragma Export (C, u00149, "system__task_infoS");
   u00150 : constant Version_32 := 16#9644d19d#;
   pragma Export (C, u00150, "system__tasking__debugB");
   u00151 : constant Version_32 := 16#23de3b06#;
   pragma Export (C, u00151, "system__tasking__debugS");
   u00152 : constant Version_32 := 16#80e564ae#;
   pragma Export (C, u00152, "system__concat_2B");
   u00153 : constant Version_32 := 16#3346551f#;
   pragma Export (C, u00153, "system__concat_2S");
   u00154 : constant Version_32 := 16#7903ab8c#;
   pragma Export (C, u00154, "system__concat_3B");
   u00155 : constant Version_32 := 16#ac661806#;
   pragma Export (C, u00155, "system__concat_3S");
   u00156 : constant Version_32 := 16#433495b0#;
   pragma Export (C, u00156, "system__concat_6B");
   u00157 : constant Version_32 := 16#1db7bf5e#;
   pragma Export (C, u00157, "system__concat_6S");
   u00158 : constant Version_32 := 16#e6bedf82#;
   pragma Export (C, u00158, "system__concat_5B");
   u00159 : constant Version_32 := 16#ea5b790e#;
   pragma Export (C, u00159, "system__concat_5S");
   u00160 : constant Version_32 := 16#fa8631cb#;
   pragma Export (C, u00160, "system__concat_4B");
   u00161 : constant Version_32 := 16#437ec74a#;
   pragma Export (C, u00161, "system__concat_4S");
   u00162 : constant Version_32 := 16#dd19c62c#;
   pragma Export (C, u00162, "system__img_enum_newB");
   u00163 : constant Version_32 := 16#e1500669#;
   pragma Export (C, u00163, "system__img_enum_newS");
   u00164 : constant Version_32 := 16#9b936ce6#;
   pragma Export (C, u00164, "system__img_unsB");
   u00165 : constant Version_32 := 16#3a821709#;
   pragma Export (C, u00165, "system__img_unsS");
   u00166 : constant Version_32 := 16#76f31c21#;
   pragma Export (C, u00166, "system__stack_usageB");
   u00167 : constant Version_32 := 16#765bc4ab#;
   pragma Export (C, u00167, "system__stack_usageS");
   u00168 : constant Version_32 := 16#218c434b#;
   pragma Export (C, u00168, "system__ioB");
   u00169 : constant Version_32 := 16#0c7c4759#;
   pragma Export (C, u00169, "system__ioS");
   u00170 : constant Version_32 := 16#6d2722f0#;
   pragma Export (C, u00170, "ada__strings__fixedB");
   u00171 : constant Version_32 := 16#f0ddc3f6#;
   pragma Export (C, u00171, "ada__strings__fixedS");
   u00172 : constant Version_32 := 16#c3f70255#;
   pragma Export (C, u00172, "ada__strings__searchB");
   u00173 : constant Version_32 := 16#54ed61ee#;
   pragma Export (C, u00173, "ada__strings__searchS");
   u00174 : constant Version_32 := 16#1bde34e3#;
   pragma Export (C, u00174, "ada__strings__unboundedB");
   u00175 : constant Version_32 := 16#9a61d341#;
   pragma Export (C, u00175, "ada__strings__unboundedS");
   u00176 : constant Version_32 := 16#cc1b1855#;
   pragma Export (C, u00176, "system__compare_array_unsigned_8B");
   u00177 : constant Version_32 := 16#65f37710#;
   pragma Export (C, u00177, "system__compare_array_unsigned_8S");
   u00178 : constant Version_32 := 16#a7af1709#;
   pragma Export (C, u00178, "system__address_operationsB");
   u00179 : constant Version_32 := 16#382b73e1#;
   pragma Export (C, u00179, "system__address_operationsS");
   u00180 : constant Version_32 := 16#67bbfe55#;
   pragma Export (C, u00180, "ansi_termB");
   u00181 : constant Version_32 := 16#5f3dc344#;
   pragma Export (C, u00181, "ansi_termS");
   u00182 : constant Version_32 := 16#6f03c6a8#;
   pragma Export (C, u00182, "nt_consoleB");
   u00183 : constant Version_32 := 16#36f89425#;
   pragma Export (C, u00183, "nt_consoleS");
   u00184 : constant Version_32 := 16#43aaa423#;
   pragma Export (C, u00184, "system__tasking__protected_objectsB");
   u00185 : constant Version_32 := 16#dcb6ad01#;
   pragma Export (C, u00185, "system__tasking__protected_objectsS");
   u00186 : constant Version_32 := 16#d93f4108#;
   pragma Export (C, u00186, "system__soft_links__taskingB");
   u00187 : constant Version_32 := 16#7069514a#;
   pragma Export (C, u00187, "system__soft_links__taskingS");
   u00188 : constant Version_32 := 16#d857218c#;
   pragma Export (C, u00188, "ada__exceptions__is_null_occurrenceB");
   u00189 : constant Version_32 := 16#85a7bdd4#;
   pragma Export (C, u00189, "ada__exceptions__is_null_occurrenceS");
   u00190 : constant Version_32 := 16#99cb3040#;
   pragma Export (C, u00190, "system__tasking__stagesB");
   u00191 : constant Version_32 := 16#1cc5c839#;
   pragma Export (C, u00191, "system__tasking__stagesS");
   u00192 : constant Version_32 := 16#91f9f4f9#;
   pragma Export (C, u00192, "system__address_imageB");
   u00193 : constant Version_32 := 16#dd979c43#;
   pragma Export (C, u00193, "system__address_imageS");
   u00194 : constant Version_32 := 16#4106471c#;
   pragma Export (C, u00194, "system__tasking__initializationB");
   u00195 : constant Version_32 := 16#f7d1c658#;
   pragma Export (C, u00195, "system__tasking__initializationS");
   u00196 : constant Version_32 := 16#a1cca884#;
   pragma Export (C, u00196, "system__tasking__queuingB");
   u00197 : constant Version_32 := 16#96b167cf#;
   pragma Export (C, u00197, "system__tasking__queuingS");
   u00198 : constant Version_32 := 16#bbfdbf62#;
   pragma Export (C, u00198, "system__tasking__protected_objects__entriesB");
   u00199 : constant Version_32 := 16#a8989934#;
   pragma Export (C, u00199, "system__tasking__protected_objects__entriesS");
   u00200 : constant Version_32 := 16#27b5dc00#;
   pragma Export (C, u00200, "system__tasking__rendezvousB");
   u00201 : constant Version_32 := 16#f5be327f#;
   pragma Export (C, u00201, "system__tasking__rendezvousS");
   u00202 : constant Version_32 := 16#b98dd160#;
   pragma Export (C, u00202, "system__tasking__entry_callsB");
   u00203 : constant Version_32 := 16#aa1b7c11#;
   pragma Export (C, u00203, "system__tasking__entry_callsS");
   u00204 : constant Version_32 := 16#9809597e#;
   pragma Export (C, u00204, "system__tasking__protected_objects__operationsB");
   u00205 : constant Version_32 := 16#be01252f#;
   pragma Export (C, u00205, "system__tasking__protected_objects__operationsS");
   u00206 : constant Version_32 := 16#78f9987a#;
   pragma Export (C, u00206, "system__tasking__utilitiesB");
   u00207 : constant Version_32 := 16#be7d1b29#;
   pragma Export (C, u00207, "system__tasking__utilitiesS");
   u00208 : constant Version_32 := 16#a9b1294b#;
   pragma Export (C, u00208, "system__traces__taskingB");
   u00209 : constant Version_32 := 16#4a6a2a68#;
   pragma Export (C, u00209, "system__traces__taskingS");
   u00210 : constant Version_32 := 16#3ab61ed3#;
   pragma Export (C, u00210, "system__memoryB");
   u00211 : constant Version_32 := 16#c8eda076#;
   pragma Export (C, u00211, "system__memoryS");

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
   --  system.htable%s
   --  system.img_enum_new%s
   --  system.img_enum_new%b
   --  system.img_int%s
   --  system.img_int%b
   --  system.img_lli%s
   --  system.img_lli%b
   --  system.io%s
   --  system.io%b
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
   --  system.stack_usage%s
   --  system.string_hash%s
   --  system.string_hash%b
   --  system.htable%b
   --  system.strings%s
   --  system.strings%b
   --  system.traceback_entries%s
   --  system.traceback_entries%b
   --  ada.exceptions%s
   --  system.arith_64%b
   --  ada.exceptions.is_null_occurrence%s
   --  ada.exceptions.is_null_occurrence%b
   --  system.soft_links%s
   --  system.traces%s
   --  system.traces%b
   --  system.unsigned_types%s
   --  system.img_biu%s
   --  system.img_biu%b
   --  system.img_llb%s
   --  system.img_llb%b
   --  system.img_llw%s
   --  system.img_llw%b
   --  system.img_uns%s
   --  system.img_uns%b
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
   --  system.address_image%s
   --  system.bit_ops%s
   --  system.bit_ops%b
   --  system.compare_array_unsigned_8%s
   --  system.compare_array_unsigned_8%b
   --  system.concat_2%s
   --  system.concat_2%b
   --  system.concat_3%s
   --  system.concat_3%b
   --  system.concat_4%s
   --  system.concat_4%b
   --  system.concat_5%s
   --  system.concat_5%b
   --  system.concat_6%s
   --  system.concat_6%b
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
   --  system.os_interface%s
   --  system.interrupt_management%s
   --  system.interrupt_management%b
   --  system.task_info%s
   --  system.task_info%b
   --  system.task_primitives%s
   --  system.tasking%s
   --  system.task_primitives.operations%s
   --  system.tasking%b
   --  system.tasking.debug%s
   --  system.tasking.debug%b
   --  system.traces.tasking%s
   --  system.traces.tasking%b
   --  system.win32.ext%s
   --  system.task_primitives.operations%b
   --  system.os_primitives%b
   --  ada.calendar%s
   --  ada.calendar%b
   --  ada.calendar.delays%s
   --  ada.calendar.delays%b
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
   --  system.stack_usage%b
   --  ada.command_line%b
   --  ada.characters.handling%b
   --  system.secondary_stack%b
   --  ada.calendar.formatting%b
   --  system.address_image%b
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
   --  system.soft_links.tasking%s
   --  system.soft_links.tasking%b
   --  system.tasking.entry_calls%s
   --  system.tasking.initialization%s
   --  system.tasking.initialization%b
   --  system.tasking.protected_objects%s
   --  system.tasking.protected_objects%b
   --  system.tasking.utilities%s
   --  system.traceback%s
   --  ada.exceptions%b
   --  system.traceback%b
   --  ada.real_time%s
   --  ada.real_time%b
   --  ada.text_io%s
   --  ada.text_io%b
   --  ada.text_io.generic_aux%s
   --  ada.text_io.generic_aux%b
   --  ada.text_io.integer_aux%s
   --  ada.text_io.integer_aux%b
   --  ada.integer_text_io%s
   --  ada.integer_text_io%b
   --  system.tasking.protected_objects.entries%s
   --  system.tasking.protected_objects.entries%b
   --  system.tasking.queuing%s
   --  system.tasking.queuing%b
   --  system.tasking.utilities%b
   --  system.tasking.rendezvous%s
   --  system.tasking.protected_objects.operations%s
   --  system.tasking.protected_objects.operations%b
   --  system.tasking.rendezvous%b
   --  system.tasking.entry_calls%b
   --  system.tasking.stages%s
   --  system.tasking.stages%b
   --  ansi_term%s
   --  ansi_term%b
   --  nt_console%s
   --  nt_console%b
   --  ncurses2%b
   --  END ELABORATION ORDER

end ada_main;
