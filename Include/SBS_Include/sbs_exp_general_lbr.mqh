//================== sbs_exp_history_log_lbr.mqh =======================/

//========================== Set_Processing_Parameters =================/

void  Set_Processing_Parameters()
{
int i_cnt;

//-------------------------- Point Normalization -----------------------/
   
//   norm_pr = 1.0 / Point * 0.0001;
//   n_Point = Point * norm_pr;
/*
   if (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT)
   {
      n_Point = 0.00001;
   
      if (Digits > 4)
      {
         for (i_cnt = 0; i_cnt < (Digits - 4); i_cnt++)
         {
            n_Point = n_Point * 10;
         }
      }
   
      return;
   }
*/

//--- n_Point ---/

   n_Point = Point;
   
   if (Digits > 4)
   {
      for (i_cnt = 0; i_cnt < (Digits - 4); i_cnt++)
      {
         n_Point = n_Point * 10;
      }
   }

   if (
         (Symbol() == "USDJPY") ||
         (Symbol() == "CHFJPY") ||
         (Symbol() == "EURJPY") ||
         (Symbol() == "AUDJPY")
      )
   {
      n_Point = Point * 10;
   }

   if (Symbol() == "#AAPL")                 //
   {
      n_Point = Point * 10;
   }
   
   if (Symbol() == "#IBM")                 //
   {
      n_Point = Point * 10;
   }

   
//--- spread_val ---/
   
   if (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT)
   {

      sbs_patterns_order_session.spread_val = Point * sbs_dfm_proc_profile.dfms_spread;
   
//      Print("Reset_Patterns_Order_Session_State() spread_val=" + DoubleToStr(sbs_patterns_order_session.spread_val,Digits));
   }

//---------------------------------------------------------------------/

   return;
}

//========================== Test Zero Divide Code ====================/

int   Test_ZD_Code()
{
int   code;

   code = zd_code;
   zd_code = 0;

   if (code != 0)
   {
      Print("SBS_EXP_04 Zero Divide Error: zd_code = " + code);
   
   }
   
   return(code);
}

//================== eof ssbs_exp_history_log_lbr.mqh ==================/