//================= sbs_dfm_indication_library.mqh =======================/

//==================== SBS_DFM_Initiate_Indication =======================/

void     SBS_DFM_Initiate_Indication()
{
   if (sbs_dfm_proc_profile.indication_state == SBS_INDICATION_NOT_INIT_STATE)
   {
//---------------------- Delete ONLINE Indication ------------------------/

      Delete_Labels();

//---------------------- Init_Common_Indication --------------------------/
      
      Init_Common_Indication();

//---------------------- Init_Patterns_Indication ------------------------/
      
      Init_Patterns_Indication();

//---------------------- Set SBS_INDICATION_INITIALIZED_STATE ------------/
      
      sbs_dfm_proc_profile.indication_state = SBS_INDICATION_INITIALIZED_STATE;
   }

//------------------------------------------------------------------------/

   return;
}

//==================== Indicate_SBS_DFM_Processing_State =================/

void     Indicate_SBS_DFM_Processing_State()
{
//------------------------------ Update_SBS_DFM_Proc_Common_Indication ---/
      
   Update_SBS_DFM_Proc_Common_Indication();

//---------------------------- Update_SBS_DFM_Proc_Patterns_Indication ---/
      
   Update_SBS_DFM_Proc_Patterns_Indication();

//------------------------------ Update SEMAFOR Indication ---------------/
      
   Update_SBS_DFM_Semafor_Indication();

//------------------------------ Update TRIANGLE Indication --------------/
      
   Update_SBS_DFM_Triangle_Indication();

//------------------------------ Redraw Chart Window ---------------------/

   WindowRedraw();

//------------------------------------------------------------------------/

   return;
}

//==================== Update_SBS_DFM_Proc_Common_Indication =============/

void     Update_SBS_DFM_Proc_Common_Indication()
{
string   label_name;
string   label_text;

//MqlDateTime    date_time_data;
//double         case_profit;

//------------------------------ Common Label 1 (Context, General Data) ---/

   label_name = label_common_prefix + IntegerToString(1,0,'0');
   
   label_text =   "SBS: " +
                  "PCX=" + IntegerToString(sbs_dfm_proc_profile.processing_context,0,'0') + "; " +
                  "TCX=" + sbs_dfm_proc_profile.tester_context + "; " +
                  "BRS=" + IntegerToString(Bars(NULL,0),0,'0') + "; " +
                  "WK="  + IntegerToString(ss_wk_number,0,'0') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------------------ Common Label 2 (Processing Parameters) ---/

   label_name = label_common_prefix + IntegerToString(2,0,'0');
   
   label_text =   "PPM: " +
                  "DGT=" + IntegerToString(Digits,0,'0') + "; " +
                  "PT="  + DoubleToStr(Point,Digits) + "; " +
                  "NPT=" + DoubleToStr(n_Point,Digits) + "; " +
                  "OST=" + IntegerToString(sbs_dfm_proc_profile.order_state,0,'0') + "; " +
                  "SFH=" + IntegerToString(sbs_dfm_proc_profile.order_state_fhandle,0,'0') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------------------ Common Label (Current Order State) -----/
/*
   label_name = label_common_prefix + IntegerToString(3,0,'0');
   
   TimeToStruct(sbs_dfm_order_state.time_stamp,date_time_data);
   
   label_text =   "ORD: " +
                  "S=" + IntegerToString(sbs_dfm_order_state.status,0,'0') + "; " +
                  "T=" + IntegerToString(date_time_data.year,4,'0') + "." +
                         IntegerToString(date_time_data.mon, 2,'0') + "." +
                         IntegerToString(date_time_data.day, 2,'0') + " " +
                         IntegerToString(date_time_data.hour,2,'0') + ":" +
                         IntegerToString(date_time_data.min, 2,'0') + "; " +
                  "P=" + DoubleToStr(sbs_dfm_order_state.price,Digits) + "; " +
                  "SL="+ DoubleToStr(sbs_dfm_order_state.stoploss,Digits) + "; " +
                  "TG="+ DoubleToStr(ilnd_order_session_state.initial_stage_price_target,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/
//------------------------------ Common Label 3 (Current DFM Patterns Session State) -----/

   label_name = label_common_prefix + IntegerToString(3,0,'0');

//--- Get case_profit ---/
/*
   case_profit = 0;
   
   if (sbs_dfm_order_state.status == SELL_ORDER)
   {
//      case_profit = sbs_dfm_order_state.price - Close[0];

      if (ilnd_order_session_state.order_type_1_state.signal == SELL_ORDER)
      {
         case_profit = ilnd_order_session_state.order_type_1_state.order_price - Close[0];
      }
      
      if (ilnd_order_session_state.order_type_2_state.signal == SELL_ORDER)
      {
         case_profit = case_profit + (ilnd_order_session_state.order_type_2_state.order_price - Close[0]);
      }
   }
   
   if (sbs_dfm_order_state.status == BUY_ORDER)
   {
//      case_profit = Close[0] - sbs_dfm_order_state.price;

      if (ilnd_order_session_state.order_type_1_state.signal == BUY_ORDER)
      {
         case_profit = Close[0] - ilnd_order_session_state.order_type_1_state.order_price;
      }
      
      if (ilnd_order_session_state.order_type_2_state.signal == BUY_ORDER)
      {
         case_profit = case_profit + (Close[0] - ilnd_order_session_state.order_type_2_state.order_price);
      }
   }
*/
   label_text =   "PSS: " +
                  "SPR=" + IntegerToString(sbs_dfm_proc_profile.dfms_spread,0) + "; " +
/*
                  "OP="  + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[0].pos_orders_number + 
                                           sbs_patterns_order_session.sbs_patterns_order_state[1].pos_orders_number,0,'0') + "; " +
                  "ON="  + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[0].neg_orders_number + 
                                           sbs_patterns_order_session.sbs_patterns_order_state[1].neg_orders_number,0,'0') + "; " +
                  "PFT=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[0].orders_total_profit + 
                                       sbs_patterns_order_session.sbs_patterns_order_state[1].orders_total_profit,Digits) + "; "
*/

                  "OP="  + IntegerToString(sbs_triangle_order_data.statistics.positive_stages_no,0) + "; " +
                  "ON="  + IntegerToString(sbs_triangle_order_data.statistics.negative_stages_no,0) + "; " +
                  "PFT=" +     DoubleToStr(sbs_triangle_order_data.statistics.total_profit,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

/*
//------------------------------ Common Label 4 (Session order TYPE1(1) state) ---/

   label_name = label_common_prefix + IntegerToString(4,0,'0');

//--- Get case_profit ---/

   case_profit = 0;

   if (sbs_patterns_order_session.sbs_patterns_order_state[0].signal == SELL_ORDER)
   {
      case_profit = sbs_patterns_order_session.sbs_patterns_order_state[0].order_price - Close[0] - sbs_patterns_order_session.spread_val;
   }

   if (sbs_patterns_order_session.sbs_patterns_order_state[0].signal == BUY_ORDER)
   {
      case_profit = Close[0] - sbs_patterns_order_session.sbs_patterns_order_state[0].order_price - sbs_patterns_order_session.spread_val;
   }

   label_text =   "SO1: " +
                  "STG=" + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[0].stage,0,'0') + "; " +
                  "SG="  + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[0].signal,0,'0') + "; " +
                  "C="   + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[0].case_number,0,'0') + "; " +
                  "SC="  + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[0].case_subnumber,0,'0') + "; " +
                  "PRC=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[0].order_price,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/

//------------------------------ Common Label 4 (Description[0] state) -----/

   label_name = label_common_prefix + IntegerToString(4,0,'0');

   label_text =   "D0: " +
                  "S=" + IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[0].signal.signal,0) + "; " +
                  "C=" + IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[0].signal.case_number,0) + "(" +
                         IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[0].signal.case_subnumber,0) + ")" + "; " +
                 "ST=" + IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[0].state,0) + ";"
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------------------ Common Label 5 (Session order TYPE1(2) state) ---/
/*
   label_name = label_common_prefix + IntegerToString(5,0,'0');
   
   label_text =   ">" +
                  "SL=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[0].stoploss,Digits) + "; " +
                  "TG=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[0].target,Digits) + "; " +
                  "PFT=" + DoubleToStr(case_profit,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/

//------------------------------ Common Label 5 (Description[0] profit) ----/

   label_name = label_common_prefix + IntegerToString(5,0,'0');
   
   label_text =   "PFT0:" +
                           DoubleToStr(sbs_triangle_order_data.triangle_order_descriptor[0].order_profit[0],Digits) + "/" +
                           DoubleToStr(sbs_triangle_order_data.triangle_order_descriptor[0].order_profit[1],Digits) + "/" +
                           DoubleToStr(sbs_triangle_order_data.triangle_order_descriptor[0].order_profit[2],Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------------------ Common Label 6 (Session order TYPE2(1) state) ---/
/*
   label_name = label_common_prefix + IntegerToString(6,0,'0');

//--- Get case_profit ---/

   case_profit = 0;

   if (sbs_patterns_order_session.sbs_patterns_order_state[1].signal == SELL_ORDER)
   {
      case_profit = sbs_patterns_order_session.sbs_patterns_order_state[1].order_price - Close[0] - sbs_patterns_order_session.spread_val;
   }

   if (sbs_patterns_order_session.sbs_patterns_order_state[1].signal == BUY_ORDER)
   {
      case_profit = Close[0] - sbs_patterns_order_session.sbs_patterns_order_state[1].order_price - sbs_patterns_order_session.spread_val;
   }

   label_text =   "SO2: " +
                  "STG=" + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[1].stage,0,'0') + "; " +
                  "SG="  + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[1].signal,0,'0') + "; " +
                  "C="   + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[1].case_number,0,'0') + "; " +
                  "SC="  + IntegerToString(sbs_patterns_order_session.sbs_patterns_order_state[1].case_subnumber,0,'0') + "; " +
                  "PRC=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[1].order_price,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/

//------------------------------ Common Label 6 (Description[1] state) -----/

   label_name = label_common_prefix + IntegerToString(6,0,'0');

   label_text =   "D1: " +
                  "S=" + IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[1].signal.signal,0) + "; " +
                  "C=" + IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[1].signal.case_number,0) + "(" +
                         IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[1].signal.case_subnumber,0) + ")" + "; " +
                 "ST=" + IntegerToString(sbs_triangle_order_data.triangle_order_descriptor[1].state,0) + ";"
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------------------ Common Label 7 (Session order TYPE2(2) state) ---/
/*
   label_name = label_common_prefix + IntegerToString(7,0,'0');
   
   label_text =   ">" +
                  "SL=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[1].stoploss,Digits) + "; " +
                  "TG=" + DoubleToStr(sbs_patterns_order_session.sbs_patterns_order_state[1].target,Digits) + "; " +
                  "PFT=" + DoubleToStr(case_profit,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/

//------------------------------ Common Label 7 (Description[1] profit) ----/

   label_name = label_common_prefix + IntegerToString(7,0,'0');
   
   label_text =   "PFT1:" +
                           DoubleToStr(sbs_triangle_order_data.triangle_order_descriptor[1].order_profit[0],Digits) + "/" +
                           DoubleToStr(sbs_triangle_order_data.triangle_order_descriptor[1].order_profit[1],Digits) + "/" +
                           DoubleToStr(sbs_triangle_order_data.triangle_order_descriptor[1].order_profit[2],Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------------------ Common Label 8 (Semafor Indi state) -----/
/*
   label_name = label_common_prefix + IntegerToString(8,0,'0');

   label_text =   "SMF: " +
                  "HT="  + IntegerToString(sbs_alx_fxi3_semafor_signal.HP_trend,0,'0') + "; " +
                  "NT="  + IntegerToString(sbs_alx_fxi3_semafor_signal.NP_trend,0,'0') + "; " +
                  "FT="  + IntegerToString(sbs_alx_fxi3_semafor_signal.FP_trend,0,'0') + "; "
//                  "NTT=" + IntegerToString(sbs_alx_fxi3_semafor_signal.NP_trend_type,0,'0') + "; " +
//                  "NTM=" + IntegerToString(sbs_alx_fxi3_semafor_signal.NP_trend_mixture,0,'0') + "; " +
//                  "NST=" + IntegerToString(sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type,0,'0') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/
//------------------------------ Common Label (Summary Indis state) ----/
/*
   label_name = label_common_prefix + IntegerToString(8,0,'0');

   label_text =   "SMI: " +
   
                  "TZ=("  + IntegerToString(sbs_alx_trend_zone_signal.trend,0,'0') + "-" +
                            IntegerToString(sbs_alx_trend_zone_signal.cross_bar,0,'0') + // "-" +
//                            IntegerToString(sbs_alx_trend_zone_signal.heigth_move_direction,0,'0') + 
                       "); " +
                            
//                  "IL=("  + IntegerToString(sbs_alx_islands_signal.trend,0,'0') + "-" +
//                            IntegerToString(sbs_alx_islands_signal.cross_bar,0,'0') + "); "

                  "CC=("  + DoubleToStr(sbs_alx_trend_cci_signal.sma_val,Digits) + " " +
                            DoubleToStr(sbs_alx_trend_cci_signal.fast_cci_val,Digits) + " " +
                            DoubleToStr(sbs_alx_trend_cci_signal.slow_cci_val,Digits) + "); "

                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/
//------------------------------------------------------------------------/

   return;
}

//==================== Update_SBS_DFM_Semafor_Indication =================/

void     Update_SBS_DFM_Semafor_Indication()
{
int      i;
string   semafor_obj_name;
double   semafor_obj_price;

//-------------------- Update HP_trend Indication ------------------------/

//------ Delete Object Arrows ------/

   for (i = 1; i <= 3; i++)
   {
      semafor_obj_name = semafor_indicate_prefix + semafor_HP_prefix + IntegerToString(i,0,'0');
      ObjectDelete(0,semafor_obj_name);
      
      semafor_obj_name = semafor_indicate_prefix + semafor_NP_prefix + IntegerToString(i,0,'0');
      ObjectDelete(0,semafor_obj_name);
   }

//------ Create Object Arrows ------/

//   if (sbs_alx_fxi3_semafor_signal.HP_trend != SBS_ALX_TREND_NONE)
//   {
//--- SEMAFOR HP 1 ---/

      i = 1;
      semafor_obj_name = semafor_indicate_prefix + semafor_HP_prefix + IntegerToString(i,0,'0');
      
      ObjectCreate(0,semafor_obj_name,OBJ_ARROW,0,0,0,0,0);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_ARROWCODE,140);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_TIME,Time[sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1]);
      
      semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_1;
      
      if (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 == FXI3_SEMAFOR_DN_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_1 + (SBS_DFM_SEMAFOR_HP_SHIFT_POINTS * n_Point);
      }

      if (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 == FXI3_SEMAFOR_UP_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_1 - (SBS_DFM_SEMAFOR_HP_SHIFT_POINTS * n_Point);
      }

      ObjectSetDouble(0,semafor_obj_name,OBJPROP_PRICE,semafor_obj_price);

//--- SEMAFOR HP 2 ---/

      i = 2;
      semafor_obj_name = semafor_indicate_prefix + semafor_HP_prefix + IntegerToString(i,0,'0');
      
      ObjectCreate(0,semafor_obj_name,OBJ_ARROW,0,0,0,0,0);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_ARROWCODE,141);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_TIME,Time[sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2]);
      
      semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_2;
      
      if (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 == FXI3_SEMAFOR_DN_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_2 + (SBS_DFM_SEMAFOR_HP_SHIFT_POINTS * n_Point);
      }

      if (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 == FXI3_SEMAFOR_UP_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_2 - (SBS_DFM_SEMAFOR_HP_SHIFT_POINTS * n_Point);
      }

      ObjectSetDouble(0,semafor_obj_name,OBJPROP_PRICE,semafor_obj_price);

//--- SEMAFOR HP 3 ---/

      i = 3;
      semafor_obj_name = semafor_indicate_prefix + semafor_HP_prefix + IntegerToString(i,0,'0');
      
      ObjectCreate(0,semafor_obj_name,OBJ_ARROW,0,0,0,0,0);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_ARROWCODE,142);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_TIME,Time[sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3]);
      
      semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_3;
      
      if (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 == FXI3_SEMAFOR_DN_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_3 + (SBS_DFM_SEMAFOR_HP_SHIFT_POINTS * n_Point);
      }

      if (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 == FXI3_SEMAFOR_UP_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.HP_semafor.val_3 - (SBS_DFM_SEMAFOR_HP_SHIFT_POINTS * n_Point);
      }

      ObjectSetDouble(0,semafor_obj_name,OBJPROP_PRICE,semafor_obj_price);
      
//   }  // EOF Update HP_trend Indication
   
//-------------------- Update NP_trend Indication ------------------------/
   
//   if (sbs_alx_fxi3_semafor_signal.NP_trend != SBS_ALX_TREND_NONE)
//   {
//--- SEMAFOR NP 1 ---/

      i = 1;
      semafor_obj_name = semafor_indicate_prefix + semafor_NP_prefix + IntegerToString(i,0,'0');
      
      ObjectCreate(0,semafor_obj_name,OBJ_ARROW,0,0,0,0,0);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_ARROWCODE,129);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_TIME,Time[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]);
      
      semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_1;
      
      if (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 == FXI3_SEMAFOR_DN_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 + (SBS_DFM_SEMAFOR_NP_SHIFT_POINTS * n_Point);
      }

      if (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 == FXI3_SEMAFOR_UP_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 - (SBS_DFM_SEMAFOR_NP_SHIFT_POINTS * n_Point);
      }

      ObjectSetDouble(0,semafor_obj_name,OBJPROP_PRICE,semafor_obj_price);

//--- SEMAFOR NP 2 ---/

      i = 2;
      semafor_obj_name = semafor_indicate_prefix + semafor_NP_prefix + IntegerToString(i,0,'0');
      
      ObjectCreate(0,semafor_obj_name,OBJ_ARROW,0,0,0,0,0);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_ARROWCODE,130);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_TIME,Time[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]);
      
      semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_2;
      
      if (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 == FXI3_SEMAFOR_DN_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 + (SBS_DFM_SEMAFOR_NP_SHIFT_POINTS * n_Point);
      }

      if (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 == FXI3_SEMAFOR_UP_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 - (SBS_DFM_SEMAFOR_NP_SHIFT_POINTS * n_Point);
      }

      ObjectSetDouble(0,semafor_obj_name,OBJPROP_PRICE,semafor_obj_price);

//--- SEMAFOR NP 3 ---/

      i = 3;
      semafor_obj_name = semafor_indicate_prefix + semafor_NP_prefix + IntegerToString(i,0,'0');
      
      ObjectCreate(0,semafor_obj_name,OBJ_ARROW,0,0,0,0,0);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_ARROWCODE,131);
      ObjectSetInteger(0,semafor_obj_name,OBJPROP_TIME,Time[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]);
      
      semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_3;
      
      if (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 == FXI3_SEMAFOR_DN_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 + (SBS_DFM_SEMAFOR_NP_SHIFT_POINTS * n_Point);
      }

      if (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 == FXI3_SEMAFOR_UP_DIRECTION)
      {
         semafor_obj_price = sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 - (SBS_DFM_SEMAFOR_NP_SHIFT_POINTS * n_Point);
      }

      ObjectSetDouble(0,semafor_obj_name,OBJPROP_PRICE,semafor_obj_price);
      
//   }  // EOF Update NP_trend Indication
   
//------------------------------------------------------------------------/

   return;
}

//================================== Init_Patterns_Indication ============/

void     Init_Patterns_Indication()
{
int      i;
string   label_name;

//---------------------------- Init Patters Labels -----------------------/

   for (i = 1; i <= label_patterns_number; i++)
   {
//--- Get Common Label Name ---/

      label_name = label_patterns_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);

//--- Create Common Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set Corner ---/

      ObjectSet(label_name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_patterns_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_patterns_y_distance);
      
      label_patterns_y_distance = label_patterns_y_distance + label_patterns_y_step;
      
      if (
            (i == 4) ||
            (i == 5) ||
            (i == 9)
/*
            (i == 8) ||
            (i == 9) ||
            (i == 11) ||
            (i == 13) ||
            (i == 15)
*/
         )
      {
         label_patterns_y_distance = label_patterns_y_distance + label_patterns_y_step;
      }

//--- Reset Label Text ---/
      
      ObjectSetText(label_name,"",label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

   }

//-------------------------------------------------------------------------/

   return;
}

//================================== DeInit_Patterns_Indication ===========/

void     DeInit_Patterns_Indication()
{
int      i;
string   label_name;

//---------------------------- DeInit Common Labels -----------------------/

   for (i = 1; i <= label_patterns_number; i++)
   {
//--- Get Common Label Name ---/

      label_name = label_patterns_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);
   }

//-------------------------------------------------------------------------/

   return;
}

//==================== Update_SBS_DFM_Proc_Patterns_Indication ============/

void     Update_SBS_DFM_Proc_Patterns_Indication()
{
string   label_name;
string   label_text;

//----------------- Patterns Label 1 (Chart Pattern Description Trends) ---/

   label_name = label_patterns_prefix + IntegerToString(1,0);
   
   label_text =   "CPD: " +
//                  "DIR=" + IntegerToString(sbs_chart_pattern_description.direction,0) + "; " +
//                  "52T=" + sbs_chart_pattern_description.trend_510_280 + "; " +
                  "SNT=" + sbs_chart_pattern_description.trend_SUNs + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//------------------ Patterns Label 2 (Chart Pattern Description SUNs) ---/
/*
   label_name = label_patterns_prefix + IntegerToString(2,0);
   
   label_text =   "S52=" + sbs_chart_pattern_description.SUNs_vs_510_280_Cross + "; " +
                  "Sv5=" + sbs_chart_pattern_description.SUNs_vs_510 + "; " +
                  "Sv2=" + sbs_chart_pattern_description.SUNs_vs_280 + "; " +
                  "SvT=" + sbs_chart_pattern_description.SUNs_vs_TMA15 + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//----------------- Patterns Label 2(3) (Chart Pattern Description BDots) ---/

   label_name = label_patterns_prefix + IntegerToString(2,0);
   
   label_text =   "BDP=" + sbs_chart_pattern_description.BDots_Pattern + "; " +
                  "BDT=" + sbs_chart_pattern_description.trend_BDots + "; " //+
//                  "B52=" + sbs_chart_pattern_description.BDots_vs_510_280_Cross + "; " +
//                  "Bv5=" + sbs_chart_pattern_description.BDots_vs_510 + "; " +
//                  "Bv2=" + sbs_chart_pattern_description.BDots_vs_280 + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//-------------- Patterns Label 3 (4) (Chart Pattern Description Last Smf) ---/

   label_name = label_patterns_prefix + IntegerToString(3,0);
   
   label_text =   "LDP=" + sbs_chart_pattern_description.Last_Smf_Pattern + "; " +
                  "LDT=" + sbs_chart_pattern_description.trend_Last_Smf + "; " //+
//                  "L52=" + sbs_chart_pattern_description.Last_Smf_vs_510_280_Cross + "; " +
//                  "Lv5=" + sbs_chart_pattern_description.Last_Smf_vs_510 + "; " +
//                  "Lv2=" + sbs_chart_pattern_description.Last_Smf_vs_280 + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//-------------- Patterns Label 4 (Chart Pattern Description TDots) --------/

   label_name = label_patterns_prefix + IntegerToString(4,0);
   
   label_text = "TDP=" + sbs_chart_pattern_description.TDots_Pattern + "; " +
                "TDT=" + sbs_chart_pattern_description.trend_TDots + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
   
//----- Patterns Label 5 (triangle_descriptor[0]) --------------------------/

   label_name = label_patterns_prefix + IntegerToString(5,0);
   
   label_text =   "TD0: " +
                  "T=" + IntegerToString(sbs_triangle_data.triangle_descriptor[0].trend,0) + "; " +
                  "S=" + IntegerToString(sbs_triangle_data.triangle_descriptor[0].signal.signal,0) + "; " +
                  "C=" + IntegerToString(sbs_triangle_data.triangle_descriptor[0].signal.case_number,0) + "(" +
                         IntegerToString(sbs_triangle_data.triangle_descriptor[0].signal.case_subnumber,0) + ")"
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//----- Patterns Label 6 (triangle_descriptor[1]) --------------------------/

   label_name = label_patterns_prefix + IntegerToString(6,0);
   
   label_text =   "TD1: " +
                  "T=" + IntegerToString(sbs_triangle_data.triangle_descriptor[1].trend,0) + "; " +
                  "S=" + IntegerToString(sbs_triangle_data.triangle_descriptor[1].signal.signal,0) + "; " +
                  "C=" + IntegerToString(sbs_triangle_data.triangle_descriptor[1].signal.case_number,0) + "(" +
                         IntegerToString(sbs_triangle_data.triangle_descriptor[1].signal.case_subnumber,0) + ")"
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//----- Patterns Label 5 (Chart Pattern Normalized Description Trends) ---/
/*
   label_name = label_patterns_prefix + IntegerToString(5,0);
   
   label_text =   "CPND: " +
                  "DIR=" + IntegerToString(sbs_chart_pattern_normalized_description.direction,0) + "; " +
                  "52T=" + sbs_chart_pattern_normalized_description.trend_510_280 + "; " +
                  "SNT=" + sbs_chart_pattern_normalized_description.trend_SUNs + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//------- Patterns Label 6 (Chart Pattern Normalized Description SUNs) ---/

   label_name = label_patterns_prefix + IntegerToString(6,0);
   
   label_text =   "S52=" + sbs_chart_pattern_normalized_description.SUNs_vs_510_280_Cross + "; " +
                  "Sv5=" + sbs_chart_pattern_normalized_description.SUNs_vs_510 + "; " +
                  "Sv2=" + sbs_chart_pattern_normalized_description.SUNs_vs_280 + "; " +
                  "SvT=" + sbs_chart_pattern_normalized_description.SUNs_vs_TMA15 + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//------- Patterns Label 7 (Chart Pattern Normalized Description BDots) ---/

   label_name = label_patterns_prefix + IntegerToString(7,0);
   
   label_text =   "BDP=" + sbs_chart_pattern_normalized_description.BDots_Pattern + "; " +
                  "BDT=" + sbs_chart_pattern_normalized_description.trend_BDots + "; " +
                  "B52=" + sbs_chart_pattern_normalized_description.BDots_vs_510_280_Cross + "; " +
                  "Bv5=" + sbs_chart_pattern_normalized_description.BDots_vs_510 + "; " +
                  "Bv2=" + sbs_chart_pattern_normalized_description.BDots_vs_280 + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 8 (Chart Pattern Normalized Description Last Smf) ---/

   label_name = label_patterns_prefix + IntegerToString(8,0);
   
   label_text =   "LDP=" + sbs_chart_pattern_normalized_description.Last_Smf_Pattern + "; " +
                  "LDT=" + sbs_chart_pattern_normalized_description.trend_Last_Smf + "; " +
                  "L52=" + sbs_chart_pattern_normalized_description.Last_Smf_vs_510_280_Cross + "; " +
                  "Lv5=" + sbs_chart_pattern_normalized_description.Last_Smf_vs_510 + "; " +
                  "Lv2=" + sbs_chart_pattern_normalized_description.Last_Smf_vs_280 + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//---- Patterns Label 5 (9) (Chart Pattern Last P_Condition Case Data) ------/
/*
   label_name = label_patterns_prefix + IntegerToString(5,0);
   
   label_text =   "S=" + IntegerToString(sbs_alx_signal.sbs_post_condition.signal,0) + "; " +
                  "C=" + IntegerToString(sbs_alx_signal.sbs_post_condition.case_number,0) + "(" + IntegerToString(sbs_alx_signal.sbs_post_condition.case_subnumber,0) + ")" + "; " +
                  "PCND=" + IntegerToString(sbs_alx_signal.sbs_post_condition.action,0) + "-" +
                            IntegerToString(sbs_alx_signal.sbs_post_condition.type,0) + "-" +
                            IntegerToString(sbs_alx_signal.sbs_post_condition.target_type,0) + "-" +
                            IntegerToString(sbs_alx_signal.sbs_post_condition.stoploss_type,0) + "-" +
                            IntegerToString(sbs_alx_signal.sbs_post_condition.order_close_type,0) + 
                  "; " //+
//                 "RT=" + IntegerToString(sbs_chart_pattern_normalized_case.ref_type,0) + "; " +
//                 "RC=" + IntegerToString(sbs_chart_pattern_normalized_case.ref_subcase_no,0) + "; " +
//                 "DL=" + IntegerToString(sbs_alx_dlrb_signal.dlrb_proc_data.case_no,0) + "; "
//                "D55=" + IntegerToString(sbs_chart_pattern_55_description.direction,0) + "; " +
//                "TLN=" + IntegerToString(sbs_chart_pattern_55_description.tl_number,0) + "; " +
//                "CC5=" + DoubleToString(sbs_alx_trend_cci_signal.fast_05_cci_val,0) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/

//---- Patterns Label 6 (SDot Zero Values) ------------------------------/
/*
   label_name = label_patterns_prefix + IntegerToString(6,0);
   
   label_text =   "SU=" + DoubleToString(sbs_alx_fxi3_semafor_HP_Up_data[0],Digits) + "; " +
                  "SD=" + DoubleToString(sbs_alx_fxi3_semafor_HP_Dn_data[0],Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 7 (BDot Zero Values) ------------------------------/

   label_name = label_patterns_prefix + IntegerToString(7,0);
   
   label_text =   "BU=" + DoubleToString(sbs_alx_fxi3_semafor_NP_Up_data[0],Digits) + "; " +
                  "BD=" + DoubleToString(sbs_alx_fxi3_semafor_NP_Dn_data[0],Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 8 (MDot Zero Values) ------------------------------/

   label_name = label_patterns_prefix + IntegerToString(8,0);
   
   label_text =   "MU=" + DoubleToString(sbs_alx_fxi3_semafor_FP_Up_data[0],Digits) + "; " +
                  "MD=" + DoubleToString(sbs_alx_fxi3_semafor_FP_Dn_data[0],Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 9 (TDot Zero Values) ------------------------------/

   label_name = label_patterns_prefix + IntegerToString(9,0);
   
   label_text =   "TU=" + DoubleToString(sbs_alx_fxi3_semafor_05_FP_Up_data[0],Digits) + "; " +
                  "TD=" + DoubleToString(sbs_alx_fxi3_semafor_05_FP_Dn_data[0],Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
   
//---- Patterns Label 10 (alx_signal + Pre-Dots) ------------------------------/

   label_name = label_patterns_prefix + IntegerToString(10,0);
   
   label_text =   "AS=" + IntegerToString(sbs_alx_signal.case_number,0) + "(" + IntegerToString(sbs_alx_signal.case_subnumber,0) + ")" + "; " +
                  "PD=" + IntegerToString(sbs_last_pre_dots_data.bdot_pre_dots.pre_dots_no,0) + "-"
                        + IntegerToString(sbs_last_pre_dots_data.mdot_pre_dots.pre_dots_no,0) + "-"
                        + IntegerToString(sbs_last_pre_dots_data.tdot_pre_dots.pre_dots_no,0) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 11 (B-Pre-Dots) -----------------------------------------/

   label_name = label_patterns_prefix + IntegerToString(11,0);
   
   label_text =   "PBD=" + IntegerToString(sbs_last_pre_dots_data.bdot_pre_dots.dot_1_bar,0) + "-"
                         + IntegerToString(sbs_last_pre_dots_data.bdot_pre_dots.dot_2_bar,0) + "; "
                         + DoubleToString(sbs_last_pre_dots_data.bdot_pre_dots.dot_1_val,Digits) + "-"
                         + DoubleToString(sbs_last_pre_dots_data.bdot_pre_dots.dot_2_val,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
   
//---- Patterns Label 12 (M-Pre-Dots) -----------------------------------------/

   label_name = label_patterns_prefix + IntegerToString(12,0);
   
   label_text =   "PMD=" + IntegerToString(sbs_last_pre_dots_data.mdot_pre_dots.dot_1_bar,0) + "-"
                         + IntegerToString(sbs_last_pre_dots_data.mdot_pre_dots.dot_2_bar,0) + "; "
                         + DoubleToString(sbs_last_pre_dots_data.mdot_pre_dots.dot_1_val,Digits) + "-"
                         + DoubleToString(sbs_last_pre_dots_data.mdot_pre_dots.dot_2_val,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 13 (T-Pre-Dots) -----------------------------------------/

   label_name = label_patterns_prefix + IntegerToString(13,0);
   
   label_text =   "PTD=" + IntegerToString(sbs_last_pre_dots_data.tdot_pre_dots.dot_1_bar,0) + "-"
                         + IntegerToString(sbs_last_pre_dots_data.tdot_pre_dots.dot_2_bar,0) + "; "
                         + DoubleToString(sbs_last_pre_dots_data.tdot_pre_dots.dot_1_val,Digits) + "-"
                         + DoubleToString(sbs_last_pre_dots_data.tdot_pre_dots.dot_2_val,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/

//---- Patterns Label 10 (Chart Pattern KC_Trend_28 Data) ---------------/
/*
   label_name = label_patterns_prefix + IntegerToString(10,0);
   
   label_text = "KCT28=" + IntegerToString(sbs_alx_kc_trend_signal.trend_28.trend,0) + "; " +
                   "FM=" + IntegerToString(sbs_alx_kc_trend_signal.trend_28.first_marker_bar,0) + "; " +
                   "LM=" + IntegerToString(sbs_alx_kc_trend_signal.trend_28.last_marker_bar,0) + "; " +
                   "RM=" + IntegerToString(sbs_alx_kc_trend_signal.trend_28.last_reverse_marker_bar,0) + "; " +
                   "RB=" + IntegerToString(sbs_alx_kc_trend_signal.trend_28.reverse_bounces,0) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 11 (Chart Pattern KC_Trend_56 Data) -----------------/

   label_name = label_patterns_prefix + IntegerToString(11,0);
   
   label_text = "KCT56=" + IntegerToString(sbs_alx_kc_trend_signal.trend_56.trend,0) + "; " +
                   "FM=" + IntegerToString(sbs_alx_kc_trend_signal.trend_56.first_marker_bar,0) + "; " +
                   "LM=" + IntegerToString(sbs_alx_kc_trend_signal.trend_56.last_marker_bar,0) + "; " +
                   "RM=" + IntegerToString(sbs_alx_kc_trend_signal.trend_56.last_reverse_marker_bar,0) + "; " +
                   "RB=" + IntegerToString(sbs_alx_kc_trend_signal.trend_56.reverse_bounces,0) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//---- Patterns Label 12 (sbs_condition_kc56_bounce_dn) -------------------/
/*
   label_name = label_patterns_prefix + IntegerToString(12,0);
   
   label_text = "DNC: BDB=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_kc56_bounce_dn.bounce_dot_bar,0) + "; " +
                     "BEB=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_kc56_bounce_dn.bounce_extreme_bar,0) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//---- Patterns Label 13 (sbs_condition_data_dn) --------------------------/
/*
   label_name = label_patterns_prefix + IntegerToString(13,0);
   
   label_text = "CN=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc_56_condition_no,0) + "; " +
                "CC=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_cross_ml_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_bounce_ml_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_cross_tl1_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_bounce_tl1_tl2_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_cross_tl2_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_extremum_bounce_wl_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_channel_bounce_wl_number,0) + "; " +
                "MS=" + DoubleToString(sbs_pattern_condition_description.sbs_condition_data_dn.kc56_price_moving_space,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//---- Patterns Label 14 (sbs_condition_kc56_bounce_up) -------------------/
/*
   label_name = label_patterns_prefix + IntegerToString(14,0);
   
   label_text = "UPC: BDB=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_kc56_bounce_up.bounce_dot_bar,0) + "; " +
                     "BEB=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_kc56_bounce_up.bounce_extreme_bar,0) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);

//---- Patterns Label 15 (sbs_condition_data_up) --------------------------/

   label_name = label_patterns_prefix + IntegerToString(15,0);
   
   label_text = "CN=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc_56_condition_no,0) + "; " +
                "CC=" + IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_cross_ml_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_bounce_ml_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_cross_tl1_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_bounce_tl1_tl2_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_cross_tl2_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_extremum_bounce_wl_number,0) + "-" +
                        IntegerToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_channel_bounce_wl_number,0) + "; " +
                "MS=" + DoubleToString(sbs_pattern_condition_description.sbs_condition_data_up.kc56_price_moving_space,Digits) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//---- Patterns Label 16 (pic data) ---------------------------------------/
/*
   label_name = label_patterns_prefix + IntegerToString(16,0);
   
   label_text = "TDP=" + sbs_chart_pattern_description.TDots_Pattern + "; " +
                "TDT=" + sbs_chart_pattern_description.trend_TDots + "; " +
                "MWT=" + IntegerToString(sbs_miw_trend_signal.trend,0) + "; " +
                  "W=" + DoubleToString(sbs_alx_wpr_283_data[0],2) + "; " +
                  "M=" + DoubleToString(sbs_alx_mass_index_data[0],2) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//---- Patterns Label 17 (CCI_30_05 data) ---------------------------------/
/*
   label_name = label_patterns_prefix + IntegerToString(17,0);
   
   label_text = "DIF=" + DoubleToString(sbs_trend_cci_30_05_signal.diff,2) + "; " +
                "M05=" + DoubleToString(sbs_alx_MA_5_PS_data[0],2) + "; " +
                "C30=" + DoubleToString(sbs_alx_cci_30_data[0],2) + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_patterns_font_size,label_patterns_font_name,label_patterns_font_color);
*/
//-------------------------------------------------------------------------/

   return;
}

//==================== Update_SBS_DFM_Triangle_Indication =================/

void     Update_SBS_DFM_Triangle_Indication()
{
int      i;

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
//--- triangle_descriptor ---/

      SBS_Delete_Triangle(i,0,SBS_ALX_TREND_UP,  sbs_triangle_data.triangle_descriptor[i].dot);
      SBS_Delete_Triangle(i,0,SBS_ALX_TREND_DOWN,sbs_triangle_data.triangle_descriptor[i].dot);

//--- Draw ---/

      if (
            (sbs_triangle_data.triangle_descriptor[i].trend == SBS_ALX_TREND_UP) ||
            (sbs_triangle_data.triangle_descriptor[i].trend == SBS_ALX_TREND_DOWN)
         )
      {
         SBS_Draw_Triangle(i,0,sbs_triangle_data.triangle_descriptor[i].trend,sbs_triangle_data.triangle_descriptor[i].dot);
      }

//--- triangle_order_descriptor ---/

      SBS_Delete_Triangle(i,1,SBS_ALX_TREND_UP,  sbs_triangle_order_data.triangle_order_descriptor[i].dot);
      SBS_Delete_Triangle(i,1,SBS_ALX_TREND_DOWN,sbs_triangle_order_data.triangle_order_descriptor[i].dot);

//--- Draw ---/

      if (
            (sbs_triangle_order_data.triangle_order_descriptor[i].signal.signal == SELL_ORDER)
         )
      {
         SBS_Draw_Triangle(i,1,SBS_ALX_TREND_DOWN,sbs_triangle_order_data.triangle_order_descriptor[i].dot);
      }
      
      if (
            (sbs_triangle_order_data.triangle_order_descriptor[i].signal.signal == BUY_ORDER)
         )
      {
         SBS_Draw_Triangle(i,1,SBS_ALX_TREND_UP,sbs_triangle_order_data.triangle_order_descriptor[i].dot);
      }
   }

//-------------------------------------------------------------------------/

   return;
}

//==================== SBS_Draw_Triangle ===================================/

void     SBS_Draw_Triangle(int descriptor_no, int triangle_seq_no, int triangle_trend, sbs_triangle_dot_structure &triangle_dot[])
{
string      triangle_obj_name;

//--- triangle_obj_name ---/

   triangle_obj_name = SBS_TRIANGLE_INDICATION_NAME_PREFIX + 
                       IntegerToString(descriptor_no,0) + "_" +
                       IntegerToString(triangle_seq_no,0) + "_" +
                       IntegerToString(triangle_trend,0)
                       ;
                       
   ObjectDelete(0,triangle_obj_name);

   ObjectCreate(0,triangle_obj_name,OBJ_TRIANGLE,0,
                  triangle_dot[0].dot_time,NormalizeDouble(triangle_dot[0].dot_val,Digits),
                  triangle_dot[1].dot_time,NormalizeDouble(triangle_dot[1].dot_val,Digits),
                  triangle_dot[2].dot_time,NormalizeDouble(triangle_dot[2].dot_val,Digits)
               );

//--- color ---/
   
   if (triangle_trend == SBS_ALX_TREND_UP)
   {
      ObjectSetInteger(0,triangle_obj_name,OBJPROP_COLOR,MediumSlateBlue);
   }
   else
   {
      ObjectSetInteger(0,triangle_obj_name,OBJPROP_COLOR,Tomato);
   }

//--- width ---/

   ObjectSetInteger(0,triangle_obj_name,OBJPROP_STYLE,STYLE_SOLID);
   
   if (descriptor_no == 0)
   {
      ObjectSetInteger(0,triangle_obj_name,OBJPROP_WIDTH,2);
   }
   else
   {
      ObjectSetInteger(0,triangle_obj_name,OBJPROP_WIDTH,4);
   }

//--- background ---/

   ObjectSetInteger(0,triangle_obj_name,OBJPROP_BACK,false);

//-------------------------------------------------------------------------/

   return;
}

//==================== SBS_Draw_Triangle ===================================/

void     SBS_Delete_Triangle(int descriptor_no, int triangle_seq_no, int triangle_trend, sbs_triangle_dot_structure &triangle_dot[])
{
string      triangle_obj_name;

   triangle_obj_name = SBS_TRIANGLE_INDICATION_NAME_PREFIX + 
                       IntegerToString(descriptor_no,0) + "_" +
                       IntegerToString(triangle_seq_no,0) + "_" +
                       IntegerToString(triangle_trend,0)
                       ;
                       
   ObjectDelete(0,triangle_obj_name);

//-------------------------------------------------------------------------/

   return;
}

//================= eof sbs_dfm_indication_library.mqh ====================/