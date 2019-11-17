//================== sbs_exp_history_log_lbr.mqh ======================/

//====================== Create History Log ===========================/

void  Create_History_Log()
{
string   f_name;
string   s_day, s_hour, s_min, s_sec;

   s_day  = "00" + DoubleToStr(Day(),0);
   s_hour = "00" + DoubleToStr(Hour(),0);
   s_min  = "00" + DoubleToStr(Minute(),0);
   s_sec  = "00" + DoubleToStr(Seconds(),0);
   
   s_day  = StringSubstr(s_day, StringLen(s_day) - 2, 2);
   s_hour = StringSubstr(s_hour, StringLen(s_hour) - 2, 2);
   s_min  = StringSubstr(s_min, StringLen(s_min) - 2, 2);
   s_sec  = StringSubstr(s_sec, StringLen(s_sec) - 2, 2);
   
   f_name = "t_shots\\" + Symbol() + "\\HST_LOG\\" +
            "History_Log_" +
            DoubleToStr(Year(),0) + "-" +
            MO[Month() - 1] + "-" +
            s_day + "-" +
            s_hour +
            s_min +
            s_sec +
            ".csv";
   
   history_log_fhandle  = FileOpen(f_name, FILE_CSV|FILE_WRITE|FILE_SHARE_READ, ",");
   
   if (history_log_fhandle != INVALID_HANDLE)
   {
      Print("History Log File Created: "+f_name);
   }
   else
   {
      PrintFormat("ERROR: History Log File Not Created: "+f_name+", code = %d",GetLastError());
   }

   return;
}

//====================== Write History Log ================================/

void  Write_History_Log(string file_name)
{
   FileWrite(history_log_fhandle,file_name,Close[0],StopLoss);
   FileFlush(history_log_fhandle);

   return;
}

//====================== Close History Log ================================/

void  Close_History_Log()
{
   FileClose(history_log_fhandle);

   return;
}

//====================== SBS_Patterns_Create_Transaction_Log ===============/

void  SBS_Patterns_Create_Transaction_Log()
{
string      f_name;

string      ss_date_time;
datetime    local_time;
MqlDateTime date_time_data;

//--- Open Transaction Log File ---/

   local_time = TimeLocal(date_time_data);

   ss_date_time = IntegerToString(date_time_data.year,4,'0') + "-" + 
                  IntegerToString(date_time_data.mon, 2,'0') + "-" + 
                  IntegerToString(date_time_data.day, 2,'0') + "-" + 
                  IntegerToString(date_time_data.hour,2,'0') +
                  IntegerToString(date_time_data.min, 2,'0') +
                  IntegerToString(date_time_data.sec, 2,'0')
                  ;
   
   f_name = "t_shots\\" + Symbol() + "\\HST_LOG\\" + "PTRNS_TRN_LOG_" +
            ss_date_time +
            ".csv";
   
   history_log_fhandle  = FileOpen(f_name, FILE_CSV|FILE_WRITE|FILE_SHARE_READ, ",");
   
   if (history_log_fhandle != INVALID_HANDLE)
   {
      Print("SBS_Patterns_Create_Transaction_Log() Transaction Log File Created: " + f_name);
   }
   else
   {
      PrintFormat("SBS_Patterns_Create_Transaction_Log() ERROR: Transaction Log File NOT Created: " + f_name + "; LastError = %d",GetLastError());
      return;
   }

//--- Write Transaction Log Header ---/

   FileWrite(history_log_fhandle,
   
               "Signal",
               "Case",
               "SubCase",
               "PC_Cls_Type",
               
//               "Ref_Type",
//               "Ref_SubCase",
               
               "Profit",
               
               "Order Type",
               "Stage",
               
               "Open Price",
               "Open Date",
               "Close Date",
               
               "Stoploss",
               "Target",
               "Target_Eff",
               
               "Condition",
//               "C_Counters",
//               "Moving_Space",
               
               "PC_MDot",
               
               "PC_BDot",
               "PC_TDot",
//               "PC_Diff",
//               "PC_WPR",
               
               "PC_Action",
               "PC_Type",
               "PC_TGT_Type",
               "PC_SL_Type",
               "PC_OC_Type"
               
            );

   return;
}

//====================== SBS_Patterns_Close_Transaction_Log ===============/

void  SBS_Patterns_Close_Transaction_Log()
{
   FileClose(history_log_fhandle);

//-------------------------------------------------------------------------/

   return;
}

//====================== SBS_Patterns_Write_Transaction_Log ===============/

void  SBS_Patterns_Write_Transaction_Log(sbs_patterns_transaction_log_data_struct &ptl_data)
{
int      i;

string   condition_str;
string   c_counters_str;
string   moving_space_str;
string   post_condition_mdot_str;
string   post_condition_bdot_str;
string   post_condition_tdot_str;

//--- Reset Condition Description Data ---/

   condition_str    = "";
   c_counters_str   = "";
   moving_space_str = "";

//--- Get Condition Description Data ---/

   condition_str = ptl_data.condition_open_data.kc_56_condition_no;
      
   c_counters_str = IntegerToString(ptl_data.condition_open_data.kc56_cross_ml_number,2,'0') + "-" +
                    IntegerToString(ptl_data.condition_open_data.kc56_bounce_ml_number,2,'0') + "-" +
                    IntegerToString(ptl_data.condition_open_data.kc56_cross_tl1_number,2,'0') + "-" +
                    IntegerToString(ptl_data.condition_open_data.kc56_bounce_tl1_tl2_number,2,'0') + "-" +
                    IntegerToString(ptl_data.condition_open_data.kc56_cross_tl2_number,2,'0') + "-" +
                    IntegerToString(ptl_data.condition_open_data.kc56_extremum_bounce_wl_number,2,'0') + "-" +
                    IntegerToString(ptl_data.condition_open_data.kc56_channel_bounce_wl_number,2,'0')
                    ;
      
   moving_space_str = DoubleToString(ptl_data.condition_open_data.kc56_price_moving_space,Digits);
   
   post_condition_mdot_str = "---";
   for (i = 0; i < 3; i++)
   {
      StringSetCharacter(post_condition_mdot_str,i,ptl_data.sbs_post_condition.Last_Smf_USh_Pattern[i]);
   }
   
   post_condition_bdot_str = "---";
   for (i = 0; i < 3; i++)
   {
      StringSetCharacter(post_condition_bdot_str,i,ptl_data.sbs_post_condition.BDot_USh_Pattern[i]);
   }
   
   post_condition_tdot_str = "---";
   for (i = 0; i < 3; i++)
   {
      StringSetCharacter(post_condition_tdot_str,i,ptl_data.sbs_post_condition.TDot_USh_Pattern[i]);
   }

//--- write TL Record ---/

   FileWrite(history_log_fhandle,

//--- sbs_patterns_transaction_log_data ---/
   
               IntegerToString(ptl_data.signal,0),
               IntegerToString(ptl_data.case_number,0),
               IntegerToString(ptl_data.case_subnumber,0),
               
               IntegerToString(ptl_data.sbs_post_condition.post_c_type,0),
               
//               IntegerToString(ptl_data.ref_type,0),
//               IntegerToString(ptl_data.ref_subcase_no,0),
               
               DoubleToString(ptl_data.profit,Digits),
               
               IntegerToString(ptl_data.processing_type,0),
               IntegerToString(ptl_data.stage,0),
               
               DoubleToString(ptl_data.order_price,Digits),
               SBS_DMF_Get_Time_String(ptl_data.order_time),
               SBS_DMF_Get_Time_String(ptl_data.close_time),
               
               DoubleToString(ptl_data.stoploss,Digits),
               DoubleToString(ptl_data.target,Digits),
               DoubleToString(ptl_data.target_effective,Digits),

//--- sbs_pattern_condition_description ---/
               
               condition_str,
//               c_counters_str,
//               moving_space_str,

//--- Set Post Condition Action Data ---/

               post_condition_mdot_str,
               
               post_condition_bdot_str,
               post_condition_tdot_str,
//               DoubleToString(ptl_data.sbs_post_condition.diff,Digits),
//               DoubleToString(ptl_data.sbs_post_condition.wpr,Digits),
               
               IntegerToString(ptl_data.sbs_post_condition.action,0),
               IntegerToString(ptl_data.sbs_post_condition.type,0),
               IntegerToString(ptl_data.sbs_post_condition.target_type,0),
               IntegerToString(ptl_data.sbs_post_condition.stoploss_type,0),
               IntegerToString(ptl_data.sbs_post_condition.order_close_type,0)
            );
   
//--- Flush Log File ---/

   FileFlush(history_log_fhandle);

//-------------------------------------------------------------------------/

   return;
}

//================== eof sbs_exp_history_log_lbr.mqh ==================/