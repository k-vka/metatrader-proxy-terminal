//================== sbs_order_alx_cases_s2_m1_tma_lbr.mqh ===============/

//========================== Process_S2_M1_Case_TMA ======================/
//--- TMA signal 355/455 ---/

void     Process_S2_M1_Case_TMA()
{
//-------------------------- M1_SCLP_PROFILE -----------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE)
   {
//      Process_S2_M1_SCLP_Case_TMA_Open();          // Case Open (10X)

//      Process_S2_M1_SCLP_Case_KC_TMA_Open();       // Case Open (11X)

//      Process_S2_M1_SCLP_Case_KC_Cross_TMA_Open(); // Case Open (12X)
      
      Process_S2_M1_SCLP_Sarra_B_TMA_Open(); // Case Open (13X)
      
      Process_S2_M1_SCLP_Case_TMA_Close();         // Case Close (19X)
   }

//-------------------------- M1_RGLR_PROFILE -----------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
   {
      Process_S2_Case_Multi_TMA_Open();            // Case Open (20X)
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_M1_SCLP_Case_TMA_Open ============/
//--- TMA signal 355(10X)/455(10X) ---/

void     Process_S2_M1_SCLP_Case_TMA_Open()
{
//-------------------------- Check for SELL (355(10x)) -------------------/

//------ (CASE 101) ------/
/*
   if (
//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m1 == SBS_ALX_TREND_DOWN) &&
         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_DOWN) &&

//--- WPR ---/

         (alx_wpr_signal.trend_general == SBS_ALX_TREND_DOWN_STRONG) &&

//--- TMA_M1 lo data check ---/

         (Low[0] > (sbs_alx_multi_tma_m1_lo_data[0] + (2 * n_Point)))

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,101);
      return;
   }
*/
//------ (CASE 102) ------/

   if (
//--- MULTI_TMA ---/

//         (sbs_alx_multi_tma_signal.trend_m1 == SBS_ALX_TREND_DOWN) &&
         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_DOWN) &&

//--- WPR ---/

//         (alx_wpr_signal.trend_21  == SBS_ALX_TREND_DOWN_STRONG) &&

         (sbs_alx_wpr_21_data[0] < alx_wpr_signal.wpr_21_hi_level) &&
         (sbs_alx_wpr_21_data[1] < alx_wpr_signal.wpr_21_hi_level) &&
         (sbs_alx_wpr_21_data[2] > alx_wpr_signal.wpr_21_hi_level) &&
         
//         (alx_wpr_signal.state_105 == SBS_ALX_WPR_105_MD_LO_STATE) &&

         (sbs_alx_wpr_105_data[1] < alx_wpr_signal.wpr_105_hi_level) &&

//--- TMA_M1 data check ---/

         (High[0] == Open[0]) &&
         (Low[0]  == Open[0])

//         (Low[0] > (sbs_alx_multi_tma_m1_lo_data[0] + (2 * n_Point)))

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,102);
      return;
   }

//-------------------------- Check for BUY (455(10x)) --------------------/

//------ (CASE 101) ------/
/*
   if (
//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m1 == SBS_ALX_TREND_UP) &&
         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_UP) &&

//--- WPR ---/

         (alx_wpr_signal.trend_general == SBS_ALX_TREND_UP_STRONG) &&

//--- TMA_M1 hi data check ---/

         (High[0] < (sbs_alx_multi_tma_m1_hi_data[0] - (2 * n_Point)))

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,101);
      return;
   }
*/
//------ (CASE 102) ------/

   if (
//--- MULTI_TMA ---/

//         (sbs_alx_multi_tma_signal.trend_m1 == SBS_ALX_TREND_UP) &&
         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_UP) &&

//--- WPR ---/

//         (alx_wpr_signal.trend_21  == SBS_ALX_TREND_UP_STRONG) &&

         (sbs_alx_wpr_21_data[0] > alx_wpr_signal.wpr_21_lo_level) &&
         (sbs_alx_wpr_21_data[1] > alx_wpr_signal.wpr_21_lo_level) &&
         (sbs_alx_wpr_21_data[2] < alx_wpr_signal.wpr_21_lo_level) &&

//         (alx_wpr_signal.state_105 == SBS_ALX_WPR_105_MD_HI_STATE) &&

         (sbs_alx_wpr_105_data[1] > alx_wpr_signal.wpr_105_lo_level) &&

//--- TMA_M1 data check ---/

         (High[0] == Open[0]) &&
         (Low[0]  == Open[0])

//         (High[0] < (sbs_alx_multi_tma_m1_hi_data[0] - (2 * n_Point)))

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,102);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_M1_SCLP_Case_TMA_Close ===========/
//--- TMA signal 355(19X)/455(19X) ---/

void     Process_S2_M1_SCLP_Case_TMA_Close()
{
//-------------------- Check for SELL (CLOSE BUY) (191) ------------------/

   if (
//--- OFFLINE CTX ---/

         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&

//--- DFM ORDER STATE ---/

         (sbs_dfm_order_state.status         == BUY_ORDER) &&
         (sbs_dfm_order_state.case_number    == 455) &&
         (
            (sbs_dfm_order_state.subcase_number == 101) ||
            (sbs_dfm_order_state.subcase_number == 102) ||
            
            (sbs_dfm_order_state.subcase_number == 111) ||
            (sbs_dfm_order_state.subcase_number == 112) ||
            
            (sbs_dfm_order_state.subcase_number == 121) ||
            
            (sbs_dfm_order_state.subcase_number == 131) ||
            (sbs_dfm_order_state.subcase_number == 132)
         ) &&

//--- TMA_M1 hi data check ---/

         (Close[0] > sbs_alx_multi_tma_m1_hi_data[0])
//         (SBS_High_Cross_Multi_TMA(sbs_alx_multi_tma_m1_hi_data,sbs_dfm_order_state.time_stamp) == True)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,355,191);
      return;
   }

//-------------------- Check for BUY (CLOSE SELL) (191) ------------------/

   if (
//--- OFFLINE CTX ---/

         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&

//--- DFM ORDER STATE ---/

         (sbs_dfm_order_state.status         == SELL_ORDER) &&
         (sbs_dfm_order_state.case_number    == 355) &&
         (
            (sbs_dfm_order_state.subcase_number == 101) ||
            (sbs_dfm_order_state.subcase_number == 102) ||
            
            (sbs_dfm_order_state.subcase_number == 111) ||
            (sbs_dfm_order_state.subcase_number == 112) ||
            
            (sbs_dfm_order_state.subcase_number == 121) ||
            
            (sbs_dfm_order_state.subcase_number == 131) ||
            (sbs_dfm_order_state.subcase_number == 132)
         ) &&

//--- TMA_M1 hi data check ---/

         (Low[0] < sbs_alx_multi_tma_m1_lo_data[0])
//         (SBS_Low_Cross_Multi_TMA(sbs_alx_multi_tma_m1_lo_data,sbs_dfm_order_state.time_stamp) == True)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,455,191);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_M1_SCLP_Case_KC_TMA_Open =========/
//--- TMA signal 355(11X)/455(11X) ---/

void     Process_S2_M1_SCLP_Case_KC_TMA_Open()
{
//-------------------------- Check for SELL (355(11x)) -------------------/

//------ (CASE 111) ------/

   if (
//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_DOWN) &&

//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_DOWN_STRONG) &&

//--- MULTI_KC ---/

         (sbs_alx_multi_kc_signal.cross_m1 == SBS_ALX_TREND_DOWN) &&
         (Close[0] > sbs_alx_multi_kc_m1_middle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,111);
      return;
   }

//------ (CASE 112) ------/

   if (
//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_DOWN) &&

//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_DOWN_STRONG) &&

//--- MULTI_KC ---/

         (sbs_alx_multi_kc_signal.cross_m1_wide == SBS_ALX_TREND_DOWN) &&
         (Close[0] > sbs_alx_multi_kc_m1_wide_middle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,112);
      return;
   }

//-------------------------- Check for BUY (455(11x)) --------------------/

//------ (CASE 111) ------/

   if (
//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_UP) &&

//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_UP_STRONG) &&

//--- MULTI_KC ---/

         (sbs_alx_multi_kc_signal.cross_m1 == SBS_ALX_TREND_UP) &&
         (Close[0] < sbs_alx_multi_kc_m1_middle_data[0])

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,111);
      return;
   }

//------ (CASE 112) ------/

   if (
//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_UP) &&

//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_UP_STRONG) &&

//--- MULTI_KC ---/

         (sbs_alx_multi_kc_signal.cross_m1_wide == SBS_ALX_TREND_UP) &&
         (Close[0] < sbs_alx_multi_kc_m1_wide_middle_data[0])

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,112);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_M1_SCLP_Case_KC_Cross_TMA_Open ===/
//--- TMA signal 355(12X)/455(12X) ---/

void     Process_S2_M1_SCLP_Case_KC_Cross_TMA_Open()
{
//-------------------------- Check for SELL (355(12x)) -------------------/

//------ (CASE 121) ------/

   if (
//--- WPR ---/

         (alx_wpr_signal.trend_105 == SBS_ALX_TREND_DOWN_STRONG) &&

//--- MULTI_TMA_KC ---/

         (sbs_alx_multi_tma_m1_md_data[0] < sbs_alx_multi_kc_m1_middle_data[0]) &&

         (Close[0] > sbs_alx_multi_kc_m1_lower_data[0]) &&
         
         (
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_md_data,sbs_alx_multi_kc_m1_middle_data) < 2) ||
            
            (
               (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_md_data,sbs_alx_multi_kc_m1_middle_data) >= 2) &&
               ((Close[0] > sbs_alx_multi_kc_m1_middle_data[0]))
            )
         )

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,121);
      return;
   }

//-------------------------- Check for BUY (455(12x)) --------------------/

//------ (CASE 121) ------/

   if (
//--- WPR ---/

         (alx_wpr_signal.trend_105 == SBS_ALX_TREND_UP_STRONG) &&

//--- MULTI_TMA_KC ---/

         (sbs_alx_multi_tma_m1_md_data[0] > sbs_alx_multi_kc_m1_middle_data[0]) &&

         (Close[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
         
         (
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_md_data,sbs_alx_multi_kc_m1_middle_data) < 2) ||
            
            (
               (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_md_data,sbs_alx_multi_kc_m1_middle_data) >= 2) &&
               ((Close[0] < sbs_alx_multi_kc_m1_middle_data[0]))
            )
         )

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,121);
      return;
   }


//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_M1_SCLP_Sarra_B_TMA_Open =========/
//--- TMA signal 355(13X)/455(13X) ---/

void     Process_S2_M1_SCLP_Sarra_B_TMA_Open()
{
//-------------------------- Check if MA150 & MA450 inside KChannel ------/

   if (
         (sbs_alx_pac_MA150_data[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
         (sbs_alx_pac_MA150_data[0] > sbs_alx_multi_kc_m1_lower_data[0]) &&
         (sbs_alx_pac_MA450_data[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
         (sbs_alx_pac_MA450_data[0] > sbs_alx_multi_kc_m1_lower_data[0])
      )
   {
      return;
   }

//-------------------------- Check for SELL (355(13x)) -------------------/

//------ (CASE 131) (MA150 & MA450 out of KChannel)------/

   if (
//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_DOWN_STRONG) &&
         
         (sbs_alx_wpr_105_data[0] < alx_wpr_signal.wpr_105_hi_level) &&

//--- KC ---/

         (sbs_alx_multi_kc_m1_middle_data[0] < sbs_alx_multi_kc_240_middle_data[0]) &&

//--- MA ---/

         (sbs_alx_pac_MA150_data[0] < sbs_alx_pac_MA450_data[0]) &&
         
         (sbs_alx_pac_MA150_data[0] > sbs_alx_multi_kc_m1_upper_data[0]) &&
         
//         (sbs_alx_pac_MA150_data[0] < sbs_alx_pac_MA150_data[5]) &&
//         (sbs_alx_pac_MA450_data[0] < sbs_alx_pac_MA450_data[5]) &&

//--- PRICE ---/

         (Close[0] < sbs_alx_pac_MA150_data[0]) &&
         
         (Close[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
         (Close[0] > sbs_alx_multi_kc_m1_lower_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,131);
      return;
   }

//------ (CASE 132) (MA150 in upper part of KChannel)------/

   if (
//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_DOWN_STRONG) &&
         
//         (sbs_alx_wpr_105_data[0] < alx_wpr_signal.wpr_105_hi_level) &&

//--- KC ---/

         (sbs_alx_multi_kc_m1_middle_data[0] < sbs_alx_multi_kc_240_middle_data[0]) &&

//--- MA ---/

         (sbs_alx_pac_MA150_data[0] < sbs_alx_pac_MA450_data[0]) &&

         (sbs_alx_pac_MA150_data[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
         (sbs_alx_pac_MA150_data[0] > sbs_alx_multi_kc_m1_middle_data[0])
         
//         (sbs_alx_pac_MA150_data[0] < sbs_alx_pac_MA150_data[5]) &&
//         (sbs_alx_pac_MA450_data[0] < sbs_alx_pac_MA450_data[5]) &&

//--- PRICE ---/

//         (Close[0] < sbs_alx_pac_MA150_data[0]) &&
         
//         (Close[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
//         (Close[0] > sbs_alx_multi_kc_m1_lower_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,355,132);
      return;
   }

//-------------------------- Check for BUY (455(13x)) --------------------/

//------ (CASE 131) (MA150 & MA450 out of KChannel)------/

   if (
//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_UP_STRONG) &&
         
         (sbs_alx_wpr_105_data[0] > alx_wpr_signal.wpr_105_lo_level) &&

//--- KC ---/

         (sbs_alx_multi_kc_m1_middle_data[0] > sbs_alx_multi_kc_240_middle_data[0]) &&

//--- MA ---/

         (sbs_alx_pac_MA150_data[0] > sbs_alx_pac_MA450_data[0]) &&
         
         (sbs_alx_pac_MA150_data[0] < sbs_alx_multi_kc_m1_lower_data[0]) &&
         
//         (sbs_alx_pac_MA150_data[0] < sbs_alx_pac_MA150_data[5]) &&
//         (sbs_alx_pac_MA450_data[0] < sbs_alx_pac_MA450_data[5]) &&

//--- PRICE ---/

         (Close[0] > sbs_alx_pac_MA150_data[0]) &&
         
         (Close[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
         (Close[0] > sbs_alx_multi_kc_m1_lower_data[0])

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,131);
      return;
   }

//------ (CASE 132) (MA150 in lower part of KChannel)------/

   if (
//--- WPR ---/

         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_UP_STRONG) &&
         
//         (sbs_alx_wpr_105_data[0] > alx_wpr_signal.wpr_105_lo_level) &&

//--- KC ---/

         (sbs_alx_multi_kc_m1_middle_data[0] > sbs_alx_multi_kc_240_middle_data[0]) &&

//--- MA ---/

         (sbs_alx_pac_MA150_data[0] > sbs_alx_pac_MA450_data[0]) &&

         (sbs_alx_pac_MA150_data[0] > sbs_alx_multi_kc_m1_lower_data[0]) &&
         (sbs_alx_pac_MA150_data[0] < sbs_alx_multi_kc_m1_middle_data[0])
         
//         (sbs_alx_pac_MA150_data[0] < sbs_alx_pac_MA150_data[5]) &&
//         (sbs_alx_pac_MA450_data[0] < sbs_alx_pac_MA450_data[5]) &&

//--- PRICE ---/

//         (Close[0] < sbs_alx_pac_MA150_data[0]) &&
         
//         (Close[0] < sbs_alx_multi_kc_m1_upper_data[0]) &&
//         (Close[0] > sbs_alx_multi_kc_m1_lower_data[0])

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,455,132);
      return;
   }

//------------------------------------------------------------------------/

   return;
}


//================== eof sbs_order_alx_cases_s2_m1_tma_lbr.mqh ===========/
