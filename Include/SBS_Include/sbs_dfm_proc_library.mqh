//================= sbs_dfm_proc_library.mqh =============================/

//==================== Reset_SBS_DFM_Processing_Profile ==================/

void     Reset_SBS_DFM_Processing_Profile()
{
   sbs_dfm_proc_profile.processing_context   = SBS_NO_PROCESSING_CONTEXT;
   sbs_dfm_proc_profile.indication_state     = SBS_INDICATION_NOT_INIT_STATE;
   sbs_dfm_proc_profile.tester_context       = "U";                        // UNDEFINED
   
   sbs_dfm_proc_profile.dfms_resp_label_name = "";                         // UNDEFINED
   sbs_dfm_proc_profile.dfms_resp_label_name = ""; 
   
   sbs_dfm_proc_profile.dfms_resp_chart_id   = (long) (-1);
   
   sbs_dfm_proc_profile.order_state         = SBS_ORDER_NOT_ACTVE;      // Order Processing is NOT ACTIVE
   sbs_dfm_proc_profile.order_state_fhandle = INVALID_HANDLE;
   sbs_dfm_proc_profile.order_state_fname   = "";

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Get_Processing_Parameters =================/

void     SBS_DFM_Get_Processing_Parameters(long l_param,double d_param,string sparam)
{
ushort   submessage_sep;
string   submessage[];
int      submessage_number;
int      submessage_spread;

//------------------------- Get sparam SubMessages -----------------------/

//--- submessage_number ---/

   submessage_sep = StringGetCharacter(";",0);

   submessage_number = StringSplit(sparam,submessage_sep,submessage);
   
   if (submessage_number >= 2)
   {

//--- tester_context ---/

      sbs_dfm_proc_profile.tester_context = submessage[0];

//--- dfms_resp_label_name ---/
   
      sbs_dfm_proc_profile.dfms_resp_label_name = submessage[1];

   }

//--- dfms_spread ---/

   submessage_spread = 0;
   
   if (submessage_number >= 3)
   {
      submessage_spread = (int) StringToInteger(submessage[2]);
   }
   
   if (submessage_spread > 0)         // if NO Spread data OR inconsistent Previous Spread Value Remains
   {
      sbs_dfm_proc_profile.dfms_spread = submessage_spread;
   }

//------------------------- Get l_param Value ----------------------------/

//--- dfms_resp_chart_id ---/
   
   sbs_dfm_proc_profile.dfms_resp_chart_id = l_param;
   
//   Print("tester_context=" + sbs_dfm_proc_profile.tester_context + ", dfms_resp_label_name=" + sbs_dfm_proc_profile.dfms_resp_label_name +
//            ", dfms_resp_chart_id=" + sbs_dfm_proc_profile.dfms_resp_chart_id);

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Set_PHF_Response_Signal ===================/

void     SBS_DFM_Set_PHF_Response_Signal(string rsp_signal)
{
   ResetLastError();
   
//   Print("RESP_SIG: dfms_resp_chart_id=" + sbs_dfm_proc_profile.dfms_resp_chart_id + ", dfms_resp_label_name=" + sbs_dfm_proc_profile.dfms_resp_label_name +
//            ", rsp_signal=" + rsp_signal);
   
   if (ObjectSetString(sbs_dfm_proc_profile.dfms_resp_chart_id,sbs_dfm_proc_profile.dfms_resp_label_name,OBJPROP_TEXT,rsp_signal) == False)
   {
      Print("SBS_DFM_Set_PHF_Response_Signal() ERROR: Code=" + GetLastError() + 
                                                   ",Chart=" + sbs_dfm_proc_profile.dfms_resp_chart_id + ",L_Name=" + sbs_dfm_proc_profile.dfms_resp_label_name);
   }
   
   ChartRedraw(sbs_dfm_proc_profile.dfms_resp_chart_id);    // to update the LABEL
   
   Sleep(1);

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Process_PHF_Response_Signal ===============/

void     SBS_DFM_Process_PHF_Response_Signal()
{
int      i;
int      transfer_signal;
string   response_signal;

MqlDateTime mql_time;

   response_signal = "";
   
   TimeToStruct(sbs_patterns_order_session.sbs_patterns_order_state[i].order_time,mql_time);
   
   response_signal = IntegerToString(sbs_patterns_order_session.order_session_id,2,'0') + ",";           // Session ID  (3)

   for (i = 0; i < SBS_MAX_PATTERNS_ORDER_TYPES; i++)
   {
//--- transfer_signal ---/

      transfer_signal = sbs_patterns_order_session.sbs_patterns_order_state[i].signal;    
   
//--- Check for MODIFY_SELL_ORDER ---/
   
      if (
            (transfer_signal == SELL_ORDER) &&
         
            (
               (sbs_alx_signal.signal != SELL_ORDER) ||
            
               (
                  (sbs_alx_signal.signal == SELL_ORDER) &&
               
                  (
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].case_number    != sbs_alx_signal.case_number) ||
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].case_subnumber != sbs_alx_signal.case_subnumber) ||
                  
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_USh_Pattern[0] != StringGetChar(sbs_chart_pattern_description.Last_Smf_Pattern,0)) ||
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_USh_Pattern[1] != StringGetChar(sbs_chart_pattern_description.Last_Smf_Pattern,1)) ||
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_USh_Pattern[2] != StringGetChar(sbs_chart_pattern_description.Last_Smf_Pattern,2)) ||
                     
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_Dot3_Time != Time[sbs_alx_fxi3_semafor_signal.FP_semafor.bar_3]) // ||
                  
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.BDot_USh_Pattern[0] != StringGetChar(sbs_chart_pattern_description.BDots_Pattern,0)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.BDot_USh_Pattern[1] != StringGetChar(sbs_chart_pattern_description.BDots_Pattern,1)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.BDot_USh_Pattern[2] != StringGetChar(sbs_chart_pattern_description.BDots_Pattern,2)) ||
                  
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.TDot_USh_Pattern[0] != StringGetChar(sbs_chart_pattern_description.TDots_Pattern,0)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.TDot_USh_Pattern[1] != StringGetChar(sbs_chart_pattern_description.TDots_Pattern,1)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.TDot_USh_Pattern[2] != StringGetChar(sbs_chart_pattern_description.TDots_Pattern,2))
                  )
               )
            )
         )
      {
         transfer_signal = MODIFY_SELL_ORDER;
      }

//--- Check for MODIFY_BUY_ORDER ---/
   
      if (
            (transfer_signal == BUY_ORDER) &&
         
            (
               (sbs_alx_signal.signal != BUY_ORDER) ||
            
               (
                  (sbs_alx_signal.signal == BUY_ORDER) &&
               
                  (
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].case_number    != sbs_alx_signal.case_number) ||
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].case_subnumber != sbs_alx_signal.case_subnumber) ||
                  
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_USh_Pattern[0] != StringGetChar(sbs_chart_pattern_description.Last_Smf_Pattern,0)) ||
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_USh_Pattern[1] != StringGetChar(sbs_chart_pattern_description.Last_Smf_Pattern,1)) ||
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_USh_Pattern[2] != StringGetChar(sbs_chart_pattern_description.Last_Smf_Pattern,2)) ||
                     
                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.Last_Smf_Dot3_Time != Time[sbs_alx_fxi3_semafor_signal.FP_semafor.bar_3]) // ||
                  
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.BDot_USh_Pattern[0] != StringGetChar(sbs_chart_pattern_description.BDots_Pattern,0)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.BDot_USh_Pattern[1] != StringGetChar(sbs_chart_pattern_description.BDots_Pattern,1)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.BDot_USh_Pattern[2] != StringGetChar(sbs_chart_pattern_description.BDots_Pattern,2)) ||
                  
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.TDot_USh_Pattern[0] != StringGetChar(sbs_chart_pattern_description.TDots_Pattern,0)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.TDot_USh_Pattern[1] != StringGetChar(sbs_chart_pattern_description.TDots_Pattern,1)) ||
//                     (sbs_patterns_order_session.sbs_patterns_order_state[i].sbs_post_condition.TDot_USh_Pattern[2] != StringGetChar(sbs_chart_pattern_description.TDots_Pattern,2))
                  )
               )
            )
         )
      {
         transfer_signal = MODIFY_BUY_ORDER;
      }
   
//--- response_signal construction---/

      response_signal = response_signal + 
      
//                        IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[i].signal,0) + "," +                          //  2
                        
                        IntegerToString(transfer_signal,0) + "," +                          //  2
                        
                        DoubleToString(sbs_patterns_order_session.sbs_patterns_order_state[i].order_price,Digits) + "," +                 //  8
                        
//                        TimeToString(sbs_patterns_order_session.sbs_patterns_order_state[i].order_time,TIME_DATE|TIME_MINUTES) + "," +    // 17
                        
                        IntegerToString(mql_time.mon,2,'0') +                                                                             //  9
                        IntegerToString(mql_time.day,2,'0') +
                        IntegerToString(mql_time.hour,2,'0') +
                        IntegerToString(mql_time.min,2,'0') + "," + 
                        
                        DoubleToString(sbs_patterns_order_session.sbs_patterns_order_state[i].stoploss,Digits)                            //  7
                        ;                                                                                                                 // 26
      if (i < (SBS_MAX_PATTERNS_ORDER_TYPES - 1))
      {
         response_signal = response_signal + ",";
      }
   }

   SBS_DFM_Set_PHF_Response_Signal(response_signal);

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Initiate_Order_State ======================/

void     SBS_DFM_Initiate_Order_State()
{
string      os_fname;
int         os_fhandle;
//int         bytes_read;
int         bytes_read_dfm;
int         bytes_read_ilnd;

//-------------------- Process SBS_ORDER_NOT_ACTVE -----------------------/

   if (sbs_dfm_proc_profile.order_state == SBS_ORDER_NOT_ACTVE)
   {
//-------------------- Reset sbs_dfm_order_state -------------------------/

      SBS_DFM_Reset_Order_State();

//-------------------- Get os_fname --------------------------------------/

      os_fname = "t_shots\\" + Symbol() + "\\ORDER_STATE\\" +"Order_State_" + Symbol() + "_" + IntegerToString(Period(),0,'0') + ".ost";
      
//-------------------- Create/Open os_fname ------------------------------/
      
      if (FileIsExist(os_fname,0) == False)
      {
//-------------------- Create os_fname -----------------------------------/

         os_fhandle = FileOpen(os_fname,FILE_BIN|FILE_WRITE|FILE_SHARE_READ|FILE_ANSI);
         
         if (os_fhandle == INVALID_HANDLE)
         {
            Print("SBS_DFM_Initiate_Order_State() Create File ERROR: os_fhandle=" + IntegerToString(os_fhandle,0,'0') + ", os_fname=" + os_fname);
            return;
         }

//--- Set order state parameters ---/

         sbs_dfm_proc_profile.order_state         = SBS_ORDER_ACTVE;
         sbs_dfm_proc_profile.order_state_fhandle = os_fhandle;
         sbs_dfm_proc_profile.order_state_fname   = os_fname;

//--- Write Order State ---/

         SBS_DFM_Write_Order_State();
         
         return;
      }
      else
      {
//-------------------- Open os_fname -------------------------------------/

         os_fhandle = FileOpen(os_fname,FILE_BIN|FILE_READ|FILE_WRITE|FILE_SHARE_READ|FILE_ANSI);
         
         if (os_fhandle == INVALID_HANDLE)
         {
            Print("SBS_DFM_Initiate_Order_State() Open File ERROR: os_fhandle=" + IntegerToString(os_fhandle,0,'0') + ", os_fname=" + os_fname);
            return;
         }

//--- Set order state parameters ---/

         sbs_dfm_proc_profile.order_state         = SBS_ORDER_ACTVE;
         sbs_dfm_proc_profile.order_state_fhandle = os_fhandle;
         sbs_dfm_proc_profile.order_state_fname   = os_fname;

//--- Read Order State ---/

         bytes_read_dfm  = FileReadStruct(os_fhandle,sbs_dfm_order_state);
//         bytes_read_ilnd = FileReadStruct(os_fhandle,ilnd_order_session_state);
         bytes_read_ilnd = FileReadStruct(os_fhandle,sbs_patterns_order_session);

         if (
               (bytes_read_dfm  != sizeof(sbs_dfm_order_state)) ||
               (bytes_read_ilnd != sizeof(sbs_patterns_order_session))
            )
         {
            Print("SBS_DFM_Initiate_Order_State() Read ERROR: bytes_read_dfm=" + IntegerToString(bytes_read_dfm,0,'0') + 
                  ", sizeof=" + IntegerToString(sizeof(sbs_dfm_order_state),0,'0') + "; bytes_read_ilnd=" + IntegerToString(bytes_read_ilnd,0,'0') + 
                  ", sizeof=" + IntegerToString(sizeof(sbs_patterns_order_session),0,'0'));

//--- Reset Order State ---/

            SBS_DFM_Reset_Order_State();
            
//--- Write Order State ---/
         
            SBS_DFM_Write_Order_State();
         
         }

         return;
      }
   }

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Reset_Order_State =========================/

void     SBS_DFM_Reset_Order_State()
{
//-------------------- Process SBS_GLOBAL_EXPERT_PATTERNS_PROFILE --------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
      Reset_Patterns_Order_Session_State();
      
      return;
   }
   
//-------------------- Reset sbs_dfm_order_state -------------------------/

   sbs_dfm_order_state.status         = NO_ORDER;
   sbs_dfm_order_state.time_stamp     = Time[0];
   sbs_dfm_order_state.price          = 0;
   sbs_dfm_order_state.stoploss       = 0;
   sbs_dfm_order_state.case_number    = 0;
   sbs_dfm_order_state.subcase_number = 0;
   sbs_dfm_order_state.last_points    = 0;

//------------------------- Check if ISLANDS Profile Activated -----------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
      )
   {
      Reset_ILND_Order_Session_State();
   }

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Write_Order_State =========================/

void     SBS_DFM_Write_Order_State()
{
int   bytes_written;

   if (sbs_dfm_proc_profile.order_state == SBS_ORDER_ACTVE)
   {
//--- Set file pointer to ZERO ---/

      FileSeek(sbs_dfm_proc_profile.order_state_fhandle,0,SEEK_SET);

//--- Write sbs_dfm_order_state ---/
   
      bytes_written = FileWriteStruct(sbs_dfm_proc_profile.order_state_fhandle,sbs_dfm_order_state);
   
      if (bytes_written != sizeof(sbs_dfm_order_state))
      {
         Print("SBS_DFM_Write_Order_State() ERROR: bytes_written_dfm=" + IntegerToString(bytes_written,0,'0') + 
               ", sizeof=" + IntegerToString(sizeof(sbs_dfm_order_state),0,'0'));
         return;
      }

//--- Write ilnd_order_session_state ---/
/*
      bytes_written = FileWriteStruct(sbs_dfm_proc_profile.order_state_fhandle,ilnd_order_session_state);
   
      if (bytes_written != sizeof(ilnd_order_session_state))
      {
         Print("SBS_DFM_Write_Order_State() ERROR: bytes_written_ilnd=" + IntegerToString(bytes_written,0,'0') + 
               ", sizeof=" + IntegerToString(sizeof(ilnd_order_session_state),0,'0'));
         return;
      }
*/

//--- Write sbs_patterns_order_session ---/

      bytes_written = FileWriteStruct(sbs_dfm_proc_profile.order_state_fhandle,sbs_patterns_order_session);
   
      if (bytes_written != sizeof(sbs_patterns_order_session))
      {
         Print("SBS_DFM_Write_Order_State() ERROR: bytes_written_ilnd=" + IntegerToString(bytes_written,0,'0') + 
               ", sizeof=" + IntegerToString(sizeof(sbs_patterns_order_session),0,'0'));
         return;
      }

//--- Flush the File ---/
         
      FileFlush(sbs_dfm_proc_profile.order_state_fhandle);
      
      return;
   }
   else
   {
      sbs_dfm_proc_profile.order_state = SBS_ORDER_NOT_ACTVE;
   }

//------------------------------------------------------------------------/

   return;
}

//==================== SBS_DFM_Order_Processing ==========================/

void     SBS_DFM_Order_Processing()
{
//---------------------------- Check processing_context & order_state ----/

   if (
         (sbs_dfm_proc_profile.processing_context != SBS_OFFLINE_PROCESSING_CONTEXT) ||
         (sbs_dfm_proc_profile.order_state        != SBS_ORDER_ACTVE)
      )
   {
      return;
   }
   
//============================ SBS_GLOBAL_EXPERT_PATTERNS_PROFILE ========/
   
   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
      SBS_DFM_Patterns_Order_Processing();
      
      return;
   }

//============================ OTHERS ====================================/
   
//---------------------------- NO_ORDER ----------------------------------/

   if ((order_status == NO_ORDER) && (sbs_order.state == BUY_ORDER))
   {
      SBS_DFM_Set_Order_State();
      Indicate_SBS_Case();
      
      sbs_screen_shot_cnt = 1;
      return;
   }
   
   if ((order_status == NO_ORDER) && (sbs_order.state == SELL_ORDER))
   {
      SBS_DFM_Set_Order_State();
      Indicate_SBS_Case();
      
      sbs_screen_shot_cnt = 1;
      return;
   }
   
//---------------------------- BUY_ORDER ------------------------------------/

   if ((order_status == BUY_ORDER) && (sbs_order.state == SELL_ORDER))
   {
      SBS_DFM_Close_Order();
      SBS_DFM_Set_Order_State();
      Indicate_SBS_Case();
      
      sbs_screen_shot_cnt = 1;
      return;
   }
   
   if ((order_status == BUY_ORDER) && ((sbs_order.state == CLOSE_BUY_ORDER) ||(sbs_order.state == CLOSE_ANY_ORDER)))
   {
      SBS_DFM_Close_Order();
      SBS_DFM_Set_Order_State();
      Indicate_SBS_Case();
      
      sbs_screen_shot_cnt = 1;
      return;
   }
   
   if ((order_status == BUY_ORDER) && (sbs_order.state == BUY_ORDER))
   {
//--- TYPE1 CLOSE_BUY_ORDER ---/

      if (
            (ilnd_order_session_state.order_type_1_state.signal         == CLOSE_BUY_ORDER) &&
            (ilnd_order_session_state.order_type_1_state.case_number    == 399) &&
            (ilnd_order_session_state.order_type_1_state.case_subnumber == 1)
         )
      {
         ILND_Close_Order_Type1();
         Indicate_SBS_Case_Type(1);
         
         sbs_screen_shot_cnt = 1;
      }

//--- TYPE2 CLOSE_BUY_ORDER ---/

      if (
            (ilnd_order_session_state.order_type_2_state.signal         == CLOSE_BUY_ORDER) &&
            (ilnd_order_session_state.order_type_2_state.case_number    == 399) &&
            (ilnd_order_session_state.order_type_2_state.case_subnumber == 1)
         )
      {
         ILND_Close_Order_Type2();
         Indicate_SBS_Case_Type(2);
         
         sbs_screen_shot_cnt = 1;
      }

//------/

      return;
   }
   
   if ((order_status == BUY_ORDER) && (sbs_order.state == NO_ORDER))
   {
//      SBS_Trail_Order_State();
      return;
   }

//---------------------------- SELL_ORDER ------------------------------------/

   if ((order_status == SELL_ORDER) && (sbs_order.state == BUY_ORDER))
   {
      SBS_DFM_Close_Order();
      SBS_DFM_Set_Order_State();
      Indicate_SBS_Case();
      
      sbs_screen_shot_cnt = 1;
      return;
   }
   
   if ((order_status == SELL_ORDER) && ((sbs_order.state == CLOSE_SELL_ORDER) || (sbs_order.state == CLOSE_ANY_ORDER)))
   {
      SBS_DFM_Close_Order();
      SBS_DFM_Set_Order_State();
      Indicate_SBS_Case();
      
      sbs_screen_shot_cnt = 1;
      return;
   }
   
   if ((order_status == SELL_ORDER) && (sbs_order.state == SELL_ORDER))
   {
//--- TYPE1 CLOSE_SELL_ORDER ---/

      if (
            (ilnd_order_session_state.order_type_1_state.signal         == CLOSE_SELL_ORDER) &&
            (ilnd_order_session_state.order_type_1_state.case_number    == 499) &&
            (ilnd_order_session_state.order_type_1_state.case_subnumber == 1)
         )
      {
         ILND_Close_Order_Type1();
         Indicate_SBS_Case_Type(1);
         
         sbs_screen_shot_cnt = 1;
      }

//--- TYPE2 CLOSE_SELL_ORDER ---/

      if (
            (ilnd_order_session_state.order_type_2_state.signal         == CLOSE_SELL_ORDER) &&
            (ilnd_order_session_state.order_type_2_state.case_number    == 499) &&
            (ilnd_order_session_state.order_type_2_state.case_subnumber == 1)
         )
      {
         ILND_Close_Order_Type2();
         Indicate_SBS_Case_Type(2);
         
         sbs_screen_shot_cnt = 1;
      }

//------/

      return;
   }
   
   if ((order_status == SELL_ORDER) && (sbs_order.state == NO_ORDER))
   {
//      SBS_Trail_Order_State();
      return;
   }

//----------------------------------------------------------------------------/
   
   return;
}

//==================== SBS_DFM_Set_Order_State ===============================/

void     SBS_DFM_Set_Order_State()
{
   sbs_dfm_order_state.status         = sbs_order.state;
   sbs_dfm_order_state.time_stamp     = Time[0];
   sbs_dfm_order_state.price          = Close[0];
   sbs_dfm_order_state.case_number    = sbs_order.case_number;
   sbs_dfm_order_state.subcase_number = sbs_order.subcase_number;
   
//   sbs_dfm_order_state.stoploss       = sbs_trail_order.profile_sl;

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
      sbs_dfm_order_state.stoploss = ilnd_order_session_state.order_type_1_state.stoploss;
   }

//----------------------------------------------------------------------------/
   
   return;
}

//==================== SBS_DFM_Close_Order ===================================/

void     SBS_DFM_Close_Order()
{
//---------------------------- If NOT SBS_GLOBAL_EXPERT_M1_ILND_PROFILE ------/

   if (
         (sbs_global_expert_profile != SBS_GLOBAL_EXPERT_M1_ILND_PROFILE) &&
         (sbs_global_expert_profile != SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
      if (order_status == BUY_ORDER)
      {
         sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points + (Close[0] - sbs_dfm_order_state.price);
         return;
      }
      
      if (order_status == SELL_ORDER)
      {
         sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points + (sbs_dfm_order_state.price - Close[0]);
         return;
      }
      
      return;
   }

//-------------------------- Process for SBS_GLOBAL_EXPERT_M1_ILND_PROFILE ---/

   ILND_Close_Order_Type1();
   ILND_Close_Order_Type2();

//----------------------------------------------------------------------------/
   
   return;
}

//==================== SBS_DFM_Check_Stoploss ================================/

void     SBS_DFM_Check_Stoploss()
{
string      marker_name;

//---------------------------- Check processing_context & order_state --------/

   if (
         (sbs_dfm_proc_profile.processing_context != SBS_OFFLINE_PROCESSING_CONTEXT) ||
         (sbs_dfm_proc_profile.order_state        != SBS_ORDER_ACTVE)
      )
   {
      return;
   }

//============================ IF SBS_GLOBAL_EXPERT_PATTERNS_PROFILE =========/
   
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
      SBS_DFM_Patterns_Stoploss_Processing();
      return;
   }

//============================ OTHERS ========================================/

//---------------------------- If NOT SBS_GLOBAL_EXPERT_M1_ILND_PROFILE ------/
   
   if (
         (sbs_global_expert_profile != SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
      )
   {

//--- Check SELL Order Stoploss ---/
   
      if (sbs_dfm_order_state.status == SELL_ORDER)
      {
         if (Close[0] >= (sbs_dfm_order_state.price + (n_Point * sbs_dfm_order_state.stoploss)))
         {
            sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points - (n_Point * sbs_dfm_order_state.stoploss);
         
            SBS_DFM_Proceed_StopLoss_Event();
         }
      }

//--- Check BUY Order Stoploss ---/
   
      if (sbs_dfm_order_state.status == BUY_ORDER)
      {
         if (Close[0] <= (sbs_dfm_order_state.price - (n_Point * sbs_dfm_order_state.stoploss)))
         {
            sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points - (n_Point * sbs_dfm_order_state.stoploss);
      
            SBS_DFM_Proceed_StopLoss_Event();
         }
      }

//------/
      
      return;
   }

//-------------------------- Process for SBS_GLOBAL_EXPERT_M1_ILND_PROFILE ---/
//------------------------- Process for SBS_GLOBAL_EXPERT_PATTERNS_PROFILE ---/

//--- Check SELL Order Stoploss ---/
   
   if (sbs_dfm_order_state.status == SELL_ORDER)
   {
      if (Close[0] >= sbs_dfm_order_state.stoploss)
      {
         SBS_DFM_Close_Order();
         
         ilnd_order_session_state.stage = ILND_ORDER_SESSION_NO_STAGE;
         
         SBS_DFM_Proceed_StopLoss_Event();
      }
   }

//--- Check BUY Order Stoploss ---/
   
   if (sbs_dfm_order_state.status == BUY_ORDER)
   {
      if (Close[0] <= sbs_dfm_order_state.stoploss)
      {
         SBS_DFM_Close_Order();
         
         ilnd_order_session_state.stage = ILND_ORDER_SESSION_NO_STAGE;
         
         SBS_DFM_Proceed_StopLoss_Event();
      }
   }


//----------------------------------------------------------------------------/
   
   return;
}

//==================== SBS_DFM_Proceed_StopLoss_Event ========================/

void     SBS_DFM_Proceed_StopLoss_Event()
{
string      marker_name;

//-------------------------- Process for SBS_GLOBAL_EXPERT_M1_ILND_PROFILE ---/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
   {


//--- Process Order Type1 Stoploss ---/


   }
   
//------------------------- Reset sbs_dfm_order_state ------------------------/

   sbs_dfm_order_state.status         = NO_ORDER;
   sbs_dfm_order_state.time_stamp     = Time[0];
   sbs_dfm_order_state.price          = 0;
   sbs_dfm_order_state.case_number    = 0;
   sbs_dfm_order_state.subcase_number = 0;
   sbs_dfm_order_state.stoploss       = 0;

//------------------------- Indicate OFFLINE Stoploss Marker -----------------/

   marker_name = "SBS_DFM_SLE_"+DoubleToStr(Time[0],0) + "_" + IntegerToString(sbs_dfm_proc_profile.sequence_object_no++,0,'0');

   ObjectDelete(marker_name);
   ObjectCreate(marker_name,OBJ_ARROW,0,Time[0],Close[0]);
   ObjectSet(marker_name,OBJPROP_ARROWCODE,SYMBOL_STOPSIGN);
   ObjectSet(marker_name,OBJPROP_COLOR,LightCoral);
   ObjectSet(marker_name,OBJPROP_WIDTH,3);

//----------------------------------------------------------------------------/
   
   return;
}

//================= eof sbs_dfm_proc_library.mqh =========================/