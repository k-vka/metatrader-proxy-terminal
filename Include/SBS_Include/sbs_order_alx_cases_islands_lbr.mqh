//================== sbs_order_alx_cases_islands_lbr.mqh =================/

//========================== Process_ISLANDS_Cases =======================/
//--- ISLANDS signals 365/465 ---/

void     Process_ISLANDS_Cases()
{
   Process_ISLANDS_Case_123_322_Open();               // Cases Open (10X, 11X) AND 332 TOO
   
//   Process_ISLANDS_Case_123_333_Global_Open();        // Cases Open (20X)
   
   Process_ISLANDS_Session_State_Stage();             // Cases Close ()

//------------------------------------------------------------------------/

   return;
}

//========================= Reset_ILND_Order_Session_State ===============/

void  Reset_ILND_Order_Session_State()
{
//------------------------- Reset ilnd_order_session_state ---------------/

   ilnd_order_session_state.stage                      = ILND_ORDER_SESSION_NO_STAGE;
   ilnd_order_session_state.initial_stage_price_target = 0;

//--- Reset order_type_1_state ---/

   ilnd_order_session_state.order_type_1_state.order_time  = 0;
   ilnd_order_session_state.order_type_1_state.order_price = 0;
   ilnd_order_session_state.order_type_1_state.stoploss    = 0;
     
   ilnd_order_session_state.order_type_1_state.signal         = NO_ORDER;
   ilnd_order_session_state.order_type_1_state.case_number    = 0;
   ilnd_order_session_state.order_type_1_state.case_subnumber = 0;

//--- Reset order_type_2_state ---/

   ilnd_order_session_state.order_type_2_state.order_time  = 0;
   ilnd_order_session_state.order_type_2_state.order_price = 0;
   ilnd_order_session_state.order_type_2_state.stoploss    = 0;
      
   ilnd_order_session_state.order_type_2_state.signal         = NO_ORDER;
   ilnd_order_session_state.order_type_2_state.case_number    = 0;
   ilnd_order_session_state.order_type_2_state.case_subnumber = 0;

//------------------------------------------------------------------------/

   return;
}

//========================== Set_SBS_ALX_ILND_Order_Profile ==============/

void     Set_SBS_ALX_ILND_Order_Profile(int order_t, int case_no, int case_subno)
{
//------------------- Check if "NO_STAGE" or "order_type_1 not active" ---/

   if (
         (
            (order_t == SELL_ORDER) ||
            (order_t == BUY_ORDER)
         ) &&
            
         (
            (ilnd_order_session_state.stage == ILND_ORDER_SESSION_NO_STAGE) ||
         
            (
               (ilnd_order_session_state.stage == ILND_ORDER_SESSION_CCI_CONTROL_STAGE) &&
               (ilnd_order_session_state.order_type_1_state.signal != SELL_ORDER) &&
               (ilnd_order_session_state.order_type_1_state.signal != BUY_ORDER)
            )
         )
      )
   {
//------------------- Set initial_stage_price_target & Type_1 stoploss ---/

      Set_ILND_Initial_Stage_Target_and_Stop(order_t, case_no, case_subno);
      
//-------------------------- Set order_type_1_state ----------------------/

      Set_ILND_Order_Type1_Session_Profile(order_t, case_no, case_subno);

//-------------------------- Set order_type_2_state ----------------------/

      Set_ILND_Order_Type2_Session_Profile(order_t, case_no, case_subno);

//-------------------------- Set ILND_ORDER_SESSION_INITIAL_STAGE --------/
      
      ilnd_order_session_state.stage = ILND_ORDER_SESSION_INITIAL_STAGE;

   }

//------------------------------------------------------------------------/

   return;
}

//========================== Set_ILND_Initial_Stage_Target_and_Stop ======/

void     Set_ILND_Initial_Stage_Target_and_Stop(int order_t, int case_no, int case_subno)
{
sbs_patterns_target_data_struct  tgt_data;

//-------------------------- Filter not SELL & not BUY Orders ------------/

   if (
         (order_t != SELL_ORDER) &&
         (order_t != BUY_ORDER)
      )
   {
      return;
   }

//---------------------- Set initial_stage_price_target for SELL & BUY ---/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
//--- initial_stage_price_target ---/

      tgt_data = SBS_Pattern_Get_Order_Target_Price();    // Following "Target Price Pattern" + "Target Price Value"

      ilnd_order_session_state.initial_stage_price_target  = tgt_data.t_price;

//--- order_type_1_state.stoploss ---/

//      ilnd_order_session_state.order_type_1_state.stoploss = SBS_Pattern_Get_Order_Stoploss();        // Following "Stoploss Pattern" + "Stoploss Value"
      
      return;
   }

//-------------------------- For Process_ISLANDS_Case_123_322_Open -------/

//--- For SELL_ORDER & BUY_ORDER ---/

   if (
//--- Cases ---/

         (
            (case_no == 365) ||
            (case_no == 465)
         ) &&

//--- SubCases ---/

         (
            (
               (case_subno >= 101) &&
               (case_subno <= 103)
            ) ||
            
            (
               (case_subno >= 111) &&
               (case_subno <= 113)
            )
         )
      )
   {
//--- initial_stage_price_target ---/

      ilnd_order_session_state.initial_stage_price_target  = sbs_alx_fxi3_semafor_signal.NP_semafor.val_2;  // Second BIG_DOT Price

//--- order_type_1_state.stoploss ---/

      ilnd_order_session_state.order_type_1_state.stoploss = sbs_alx_fxi3_semafor_signal.NP_semafor.val_3;  // Third BIG_DOT Price
      
      return;
      
   }  // EOF For Process_ISLANDS_Case_123_322_Open

//------------------------------------------------------------------------/

   return;
}

//========================== Set_ILND_Order_Type1_Session_Profile ========/

void     Set_ILND_Order_Type1_Session_Profile(int order_t, int case_no, int case_subno)
{
//-------------------------- Set order_type_1_state data -----------------/

   ilnd_order_session_state.order_type_1_state.order_time  = Time[0];
   ilnd_order_session_state.order_type_1_state.order_price = Close[0];
     
   ilnd_order_session_state.order_type_1_state.signal         = order_t;
   ilnd_order_session_state.order_type_1_state.case_number    = case_no;
   ilnd_order_session_state.order_type_1_state.case_subnumber = case_subno;

//------------------------------------------------------------------------/

   return;
}

//========================== Set_ILND_Order_Type2_Session_Profile ========/

void     Set_ILND_Order_Type2_Session_Profile(int order_t, int case_no, int case_subno)
{
//-------------------------- Set order_type_2_state data -----------------/

   ilnd_order_session_state.order_type_2_state.stoploss = ilnd_order_session_state.order_type_1_state.stoploss;

//--- If Order Type 2 NOT Continued ---/
   
   if (
         (ilnd_order_session_state.order_type_2_state.signal != SELL_ORDER) &&
         (ilnd_order_session_state.order_type_2_state.signal != BUY_ORDER)
      )
   {
      ilnd_order_session_state.order_type_2_state.order_time  = ilnd_order_session_state.order_type_1_state.order_time;
      ilnd_order_session_state.order_type_2_state.order_price = ilnd_order_session_state.order_type_1_state.order_price;

      ilnd_order_session_state.order_type_2_state.signal         = ilnd_order_session_state.order_type_1_state.signal;
      ilnd_order_session_state.order_type_2_state.case_number    = ilnd_order_session_state.order_type_1_state.case_number;
      ilnd_order_session_state.order_type_2_state.case_subnumber = ilnd_order_session_state.order_type_1_state.case_subnumber;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== ILND_Close_Order_Type1 ======================/

void     ILND_Close_Order_Type1()
{
//--- BUY_ORDER ---/

   if (order_status == BUY_ORDER)
   {
      if (
            (ilnd_order_session_state.order_type_1_state.signal         == CLOSE_BUY_ORDER) &&
            (ilnd_order_session_state.order_type_1_state.case_number    == 399) &&
            (ilnd_order_session_state.order_type_1_state.case_subnumber == 2)
         )
      {
         return;
      }
         
      sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points + (Close[0] - ilnd_order_session_state.order_type_1_state.order_price);
      
      ilnd_order_session_state.order_type_1_state.signal         = CLOSE_BUY_ORDER;
      ilnd_order_session_state.order_type_1_state.case_number    = 399;
      ilnd_order_session_state.order_type_1_state.case_subnumber = 2;
               
      return;
   }

//--- SELL_ORDER ---/

   if (order_status == SELL_ORDER)
   {
      if (
            (ilnd_order_session_state.order_type_1_state.signal         == CLOSE_SELL_ORDER) &&
            (ilnd_order_session_state.order_type_1_state.case_number    == 499) &&
            (ilnd_order_session_state.order_type_1_state.case_subnumber == 2)
         )
      {
         return;
      }
      
      sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points + (ilnd_order_session_state.order_type_1_state.order_price - Close[0]);
      
      ilnd_order_session_state.order_type_1_state.signal         = CLOSE_SELL_ORDER;
      ilnd_order_session_state.order_type_1_state.case_number    = 499;
      ilnd_order_session_state.order_type_1_state.case_subnumber = 2;
      
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== ILND_Close_Order_Type2 ======================/

void     ILND_Close_Order_Type2()
{
//--- BUY_ORDER ---/

   if (order_status == BUY_ORDER)
   {
      if (
            (ilnd_order_session_state.order_type_2_state.signal         == CLOSE_BUY_ORDER) &&
            (ilnd_order_session_state.order_type_2_state.case_number    == 399) &&
            (ilnd_order_session_state.order_type_2_state.case_subnumber == 2)
         )
      {
         return;
      }
      
      sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points + (Close[0] - ilnd_order_session_state.order_type_2_state.order_price);
      
      ilnd_order_session_state.order_type_2_state.signal         = CLOSE_BUY_ORDER;
      ilnd_order_session_state.order_type_2_state.case_number    = 399;
      ilnd_order_session_state.order_type_2_state.case_subnumber = 2;
      
      return;
   }

//--- SELL_ORDER ---/
   
   if (order_status == SELL_ORDER)
   {
      if (
            (ilnd_order_session_state.order_type_2_state.signal         == CLOSE_SELL_ORDER) &&
            (ilnd_order_session_state.order_type_2_state.case_number    == 499) &&
            (ilnd_order_session_state.order_type_2_state.case_subnumber == 2)
         )
      {
         return;
      }
      
      sbs_dfm_order_state.last_points = sbs_dfm_order_state.last_points + (ilnd_order_session_state.order_type_2_state.order_price - Close[0]);
      
      ilnd_order_session_state.order_type_2_state.signal         = CLOSE_SELL_ORDER;
      ilnd_order_session_state.order_type_2_state.case_number    = 499;
      ilnd_order_session_state.order_type_2_state.case_subnumber = 2;
      
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================= Process_ISLANDS_Session_State_Stage ==========/

void  Process_ISLANDS_Session_State_Stage()
{
//-------------------------- Filter not SELL & not BUY OPEN Orders -------/

   if (
         (sbs_dfm_order_state.status != SELL_ORDER) &&
         (sbs_dfm_order_state.status != BUY_ORDER)
      )
   {
      return;
   }

//----------------------- Process for ILND_ORDER_SESSION_INITIAL_STAGE ---/

   if (ilnd_order_session_state.stage == ILND_ORDER_SESSION_INITIAL_STAGE)
   {
//--- SELL_ORDER ---/

      if (sbs_dfm_order_state.status == SELL_ORDER)
      {
         if (ilnd_order_session_state.order_type_1_state.signal == SELL_ORDER)
         {
            if (Close[0] <= ilnd_order_session_state.initial_stage_price_target)
            {
/*
               if ((ilnd_order_session_state.order_type_1_state.stoploss - Close[0]) >= (ILND_ORDER_SESSION_MIN_SL_DIFF_POINTS * n_Point))
               {
                  ilnd_order_session_state.order_type_1_state.stoploss = ilnd_order_session_state.order_type_1_state.stoploss -
                                                                          (ILND_ORDER_SESSION_INITIAL_SL_JUMP_POINTS * n_Point);
               }
               
               if (ilnd_order_session_state.order_type_2_state.signal == SELL_ORDER)
               {
                  ilnd_order_session_state.order_type_2_state.stoploss = ilnd_order_session_state.order_type_1_state.stoploss;
               }
*/
         
               ilnd_order_session_state.stage = ILND_ORDER_SESSION_CCI_CONTROL_STAGE;
            }
            
         }
      }

//--- BUY_ORDER ---/

      if (sbs_dfm_order_state.status == BUY_ORDER)
      {
         if (ilnd_order_session_state.order_type_1_state.signal == BUY_ORDER)
         {
            if (Close[0] >= ilnd_order_session_state.initial_stage_price_target)
            {
/*
               if ((Close[0] - ilnd_order_session_state.order_type_1_state.stoploss) >= (ILND_ORDER_SESSION_MIN_SL_DIFF_POINTS * n_Point))
               {
                  ilnd_order_session_state.order_type_1_state.stoploss = ilnd_order_session_state.order_type_1_state.stoploss +
                                                                          (ILND_ORDER_SESSION_INITIAL_SL_JUMP_POINTS * n_Point);
               }
               
               if (ilnd_order_session_state.order_type_2_state.signal == BUY_ORDER)
               {
                  ilnd_order_session_state.order_type_2_state.stoploss = ilnd_order_session_state.order_type_1_state.stoploss;
               }
*/
         
               ilnd_order_session_state.stage = ILND_ORDER_SESSION_CCI_CONTROL_STAGE;
            }
            
         }
      }

   }  // EOF "if (ilnd_order_session_state.stage == ILND_ORDER_SESSION_INITIAL_STAGE)"

//------------------- Process for ILND_ORDER_SESSION_CCI_CONTROL_STAGE ---/

   if (ilnd_order_session_state.stage == ILND_ORDER_SESSION_CCI_CONTROL_STAGE)
   {
//------ DFM SELL_ORDER ------/

      if (sbs_dfm_order_state.status == SELL_ORDER)
      {
//--- SELL_ORDER TYPE1 ---/

         if (ilnd_order_session_state.order_type_1_state.signal == SELL_ORDER)
         {
            if (
//--- TREND_CCI TYPE1 ---/

                  (sbs_alx_trend_cci_signal.fast_cci_val > sbs_alx_trend_cci_signal.sma_val)
//                  (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
               )
            {
//               ilnd_order_session_state.order_type_1_state.order_time  = Time[0];
//               ilnd_order_session_state.order_type_1_state.order_price = Close[0];
//               ilnd_order_session_state.order_type_1_state.stoploss    = 0;
     
               ilnd_order_session_state.order_type_1_state.signal         = CLOSE_SELL_ORDER;
               ilnd_order_session_state.order_type_1_state.case_number    = 499;
               ilnd_order_session_state.order_type_1_state.case_subnumber = 1;
            }
         }
         
//--- SELL_ORDER TYPE2 ---/

         if (ilnd_order_session_state.order_type_2_state.signal == SELL_ORDER)
         {
            if (
//--- TREND_CCI TYPE2 ---/

                  (sbs_alx_trend_cci_signal.slow_cci_val > sbs_alx_trend_cci_signal.sma_val)
//                  (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
               )
            {
//               ilnd_order_session_state.order_type_2_state.order_time  = Time[0];
//               ilnd_order_session_state.order_type_2_state.order_price = Close[0];
//               ilnd_order_session_state.order_type_2_state.stoploss    = 0;
     
               ilnd_order_session_state.order_type_2_state.signal         = CLOSE_SELL_ORDER;
               ilnd_order_session_state.order_type_2_state.case_number    = 499;
               ilnd_order_session_state.order_type_2_state.case_subnumber = 1;
            }
         }

//--- Check to Close the WHOLE SESSION/
         
         if (
               (ilnd_order_session_state.order_type_1_state.signal == CLOSE_SELL_ORDER) &&
               (ilnd_order_session_state.order_type_2_state.signal == CLOSE_SELL_ORDER)
            )
         {
            ilnd_order_session_state.stage = ILND_ORDER_SESSION_NO_STAGE;
            Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,499,1);
         }
         
      }  // EOF //------ DFM SELL_ORDER ------/

//------ DFM BUY_ORDER ------/

      if (sbs_dfm_order_state.status == BUY_ORDER)
      {
//--- BUY_ORDER TYPE1 ---/

         if (ilnd_order_session_state.order_type_1_state.signal == BUY_ORDER)
         {
            if (
//--- TREND_CCI TYPE1 ---/

                  (sbs_alx_trend_cci_signal.fast_cci_val < sbs_alx_trend_cci_signal.sma_val)
//                  (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
               )
            {
//               ilnd_order_session_state.order_type_1_state.order_time  = Time[0];
//               ilnd_order_session_state.order_type_1_state.order_price = Close[0];
//               ilnd_order_session_state.order_type_1_state.stoploss    = 0;
     
               ilnd_order_session_state.order_type_1_state.signal         = CLOSE_BUY_ORDER;
               ilnd_order_session_state.order_type_1_state.case_number    = 399;
               ilnd_order_session_state.order_type_1_state.case_subnumber = 1;
            }
         }
         
//--- BUY_ORDER TYPE2 ---/

         if (ilnd_order_session_state.order_type_2_state.signal == BUY_ORDER)
         {
            if (
//--- TREND_CCI TYPE2 ---/

                  (sbs_alx_trend_cci_signal.slow_cci_val < sbs_alx_trend_cci_signal.sma_val)
//                  (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
               )
            {
               ilnd_order_session_state.order_type_2_state.order_time  = Time[0];
               ilnd_order_session_state.order_type_2_state.order_price = Close[0];
               ilnd_order_session_state.order_type_2_state.stoploss    = 0;
     
//               ilnd_order_session_state.order_type_2_state.signal         = CLOSE_BUY_ORDER;
//               ilnd_order_session_state.order_type_2_state.case_number    = 399;
//               ilnd_order_session_state.order_type_2_state.case_subnumber = 1;
            }
         }

//--- Check to Close the WHOLE SESSION/
         
         if (
               (ilnd_order_session_state.order_type_1_state.signal == CLOSE_BUY_ORDER) &&
               (ilnd_order_session_state.order_type_2_state.signal == CLOSE_BUY_ORDER)
            )
         {
            ilnd_order_session_state.stage = ILND_ORDER_SESSION_NO_STAGE;
            Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,499,1);
         }
         
      }  // EOF //------ DFM BUY_ORDER ------/
      
   }  // EOF "if (ilnd_order_session_state.stage == ILND_ORDER_SESSION_CCI_CONTROL_STAGE)"

//------------------------------------------------------------------------/

   return;
}

//================== eof sbs_order_alx_cases_islands_lbr.mqh =============/
