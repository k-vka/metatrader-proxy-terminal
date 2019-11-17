//===================== sbs_order_alx_cases_s2_tdi_M15_H1_H4_lbr.mqh ==/

//========================== Process_S2_Case_TDI_PS_Strong ============/

void     Process_S2_Case_TDI_PS_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))

      )
   {

//----------- SELL Subcase 1X ---/

      if (
            ((sbs_alx_tdi_04_rsiPriceLine_data[(alx_tdi_signal.bar_shift_04 - 1)] - sbs_alx_tdi_04_rsiPriceLine_data[0]) >= 2)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,331,11);
         return;
      }

//      Set_SBS_ALX_Signal(SELL_ORDER,331,1);
//      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) && /////////////////

//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&

//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))     ///////////////////

      )
   {

//----------- BUY Subcase 1x ---/

      if (
            (sbs_alx_tdi_04_rsiPriceLine_data[0] - (sbs_alx_tdi_04_rsiPriceLine_data[(alx_tdi_signal.bar_shift_04 - 1)]) >= 2)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,431,11);
         return;
      }

//      Set_SBS_ALX_Signal(BUY_ORDER,431,1);
//      return;
            
//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_TDI_PS_Strong_Fake =======/
/*
void     Process_S2_Case_TDI_PS_Strong_Fake()
{
int      order_bar;

   order_bar = iBarShift(NULL,0,open_order_profile.order_time,false);

//-------------------------- Check for SELL ---------------------------/

   if (
//--- open_order_profile ---/

         (open_order_profile.signal         == BUY_ORDER) &&
         (open_order_profile.case_number    == 431) &&
         (open_order_profile.case_subnumber == 11) &&
         
         (order_bar < (1 * alx_tdi_signal.bar_shift_04)) &&
         (order_bar > 0) &&

//--- TDI ---/

         (
            (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) ||
            (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle)
         ) &&

//--- TDI_04 ---/
         
         (
            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) ||
            (sbs_alx_tdi_04_rsiPriceLine_data[order_bar] - (sbs_alx_tdi_04_rsiPriceLine_data[(order_bar + (1 * alx_tdi_signal.bar_shift_04))]) < 2) 
         )

      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,351,11);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- open_order_profile ---/
   
         (open_order_profile.signal         == SELL_ORDER) &&
         (open_order_profile.case_number    == 331) &&
         (open_order_profile.case_subnumber == 11) &&
         
         (order_bar < (1 * alx_tdi_signal.bar_shift_04)) &&
         (order_bar > 0) &&

//--- TDI ---/

         (
            (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) ||
            (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle)
         ) &&

//--- TDI_04 ---/
         (
            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) ||
            ((sbs_alx_tdi_04_rsiPriceLine_data[(order_bar + (1 * alx_tdi_signal.bar_shift_04))] - sbs_alx_tdi_04_rsiPriceLine_data[order_bar]) < 2)
         )
      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,451,11);
      return;

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}
*/
//========================== Process_S2_Case_TDI_PB_Strong ============/
// H4 PriceLine cross band (Up or Down) 332/432

void     Process_S2_Case_TDI_PB_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandUp_data[0]) &&
         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
         (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() < tdi_04_rsiPriceLine_CROSS_tdi_bandDown()) &&

/*
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
         
/*
//--- VLT ---/

         (
            (
               (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
               (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))
            ) ||
            (
               (alx_vlt_signal.val > ((1.25) * alx_vlt_signal.threshold))
            )
         ) &&
*/

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
         
         (alx_stoch_mtf_signal.local_direction_H4  == SBS_ALX_TREND_DOWN) &&

         (alx_stoch_mtf_signal.H1_Kopen > alx_stoch_mtf_signal.LevelMiddle) &&
         (alx_stoch_mtf_signal.H4_Kopen > alx_stoch_mtf_signal.LevelMiddle) &&
         
         (stoch_mtf_H1_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle + ((alx_stoch_mtf_signal.LevelUp - alx_stoch_mtf_signal.LevelMiddle) / 2)) <
            stoch_mtf_H1_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle)) &&
         
         (stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle + ((alx_stoch_mtf_signal.LevelUp - alx_stoch_mtf_signal.LevelMiddle) / 2)) <
            stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle)) &&

//--- WCCI ---/

         (
            (alx_wcci_signal.trend_H1 == SBS_ALX_TREND_DOWN) ||
            (alx_wcci_signal.trend_H4 == SBS_ALX_TREND_DOWN)
         )

      )
   {

//----------- SELL Subcase 1X ---/

      Set_SBS_ALX_Signal(SELL_ORDER,332,1);
      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_bandDown_data[0]) &&
         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
         (tdi_04_rsiPriceLine_CROSS_tdi_bandDown() < tdi_04_rsiPriceLine_CROSS_tdi_bandUp()) &&

/*
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&

//--- VLT ---/

         (
            (
               (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
               (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))
            ) ||
            (
               (alx_vlt_signal.val > ((1.25) * alx_vlt_signal.threshold))
            )
         ) &&
*/

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
         
         (alx_stoch_mtf_signal.local_direction_H4  == SBS_ALX_TREND_UP) &&

         (alx_stoch_mtf_signal.H1_Kopen < alx_stoch_mtf_signal.LevelMiddle) &&
         (alx_stoch_mtf_signal.H4_Kopen < alx_stoch_mtf_signal.LevelMiddle) &&
         
         (stoch_mtf_H1_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle - ((alx_stoch_mtf_signal.LevelMiddle - alx_stoch_mtf_signal.LevelDown) / 2)) <
            stoch_mtf_H1_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle)) &&
         
         (stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle - ((alx_stoch_mtf_signal.LevelMiddle - alx_stoch_mtf_signal.LevelDown) / 2)) <
            stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle)) &&

//--- WCCI ---/

         (
            (alx_wcci_signal.trend_H1 == SBS_ALX_TREND_UP) ||
            (alx_wcci_signal.trend_H4 == SBS_ALX_TREND_UP)
         )

      )
   {

//----------- BUY Subcase 1x ---/

      Set_SBS_ALX_Signal(BUY_ORDER,432,1);
      return;
            
//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_TDI_MDL_PB_Strong ========/
// H1 PriceLine cross band (Up or Down) 333/433

void     Process_S2_Case_TDI_MDL_PB_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandUp_data[0]) &&
         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() < tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown()) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1]) &&

/*       
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
         
//--- VLT ---/

         (
            (
               (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
               (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))
            ) ||
            (
               (alx_vlt_signal.val > ((1.25) * alx_vlt_signal.threshold))
            )
         ) &&
*/

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
//         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
         
         (alx_stoch_mtf_signal.local_direction_H4  == SBS_ALX_TREND_DOWN) &&

         (alx_stoch_mtf_signal.H4_Kopen > alx_stoch_mtf_signal.LevelMiddle) &&
         
         (stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle + ((alx_stoch_mtf_signal.LevelUp - alx_stoch_mtf_signal.LevelMiddle) / 2)) <
            stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle)) &&

//--- WCCI ---/

         (
            (alx_wcci_signal.trend_H1 == SBS_ALX_TREND_DOWN) ||
            (alx_wcci_signal.trend_H4 == SBS_ALX_TREND_DOWN)
         )

      )
   {

//----------- SELL Subcase 1X ---/

      if (
//--- ASCTREND_4TF ---/

            (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
            (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,333,11);
         return;
      }
      
      if (
//--- ASCTREND_4TF ---/

            (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
            (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,333,12);
         return;
      }
      
      if (
//--- ASCTREND_4TF ---/

            (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,333,13);
         return;
      }

//      Set_SBS_ALX_Signal(SELL_ORDER,333,1);
//      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandDown_data[0]) &&
         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() < tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp()) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1]) &&

/*         
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&
         
//--- VLT ---/

         (
            (
               (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
               (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))
            ) ||
            (
               (alx_vlt_signal.val > ((1.25) * alx_vlt_signal.threshold))
            )
         ) &&
*/

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
//         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
         
         (alx_stoch_mtf_signal.local_direction_H4  == SBS_ALX_TREND_UP) &&

         (alx_stoch_mtf_signal.H4_Kopen < alx_stoch_mtf_signal.LevelMiddle) &&
         
         (stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle - ((alx_stoch_mtf_signal.LevelMiddle - alx_stoch_mtf_signal.LevelDown) / 2)) <
            stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(alx_stoch_mtf_signal.LevelMiddle)) &&

//--- WCCI ---/

         (
            (alx_wcci_signal.trend_H1 == SBS_ALX_TREND_UP) ||
            (alx_wcci_signal.trend_H4 == SBS_ALX_TREND_UP)
         )

      )
   {

//----------- BUY Subcase 1x ---/

      if (
//--- ASCTREND_4TF ---/

            (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
            (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,433,11);
         return;
      }
      
      if (
//--- ASCTREND_4TF ---/

            (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
            (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,433,12);
         return;
      }
      
      if (
//--- ASCTREND_4TF ---/

            (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,433,13);
         return;
      }
      
//      Set_SBS_ALX_Signal(BUY_ORDER,433,1);
//      return;
            
//----------- EOF BUY Subcases ---/
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_WCCI_H1NT_H4NT ===========/
// WCCI strong signal 334/434 (H1 new trend, H4 new trend)

void     Process_S2_Case_WCCI_H1NT_H4NT()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) 
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)

      )
   {

//----------- SELL Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= alx_wcci_signal.LevelDown) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.25 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
                     (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] >= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,334,11);
         return;
      }

//----------- SELL Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.75 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[1] >= alx_stoch_mtf_signal.LevelDown) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])
            
            
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,334,12);
         return;
      }

//----------- SELL Subcase 13 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.25 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
//            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
//            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[1] >= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,334,13);
         return;
      }



//      Set_SBS_ALX_Signal(SELL_ORDER,334,1);
//      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) 
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)

      )
   {

//----------- BUY Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= alx_wcci_signal.LevelUp) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.25 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] <= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,434,11);
         return;
      }

//----------- BUY Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.75 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[1] <= alx_stoch_mtf_signal.LevelUp) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])
            
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,434,12);
         return;
      }

//----------- BUY Subcase 13 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.25 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
//            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
//            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[1] <= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,434,13);
         return;
      }



//      Set_SBS_ALX_Signal(BUY_ORDER,434,1);
//      return;
            
//----------- EOF BUY Subcases ---/
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_WCCI_H1OT_H4OT ===========/
// WCCI strong signal 335/435 (H1 old trend, H4 old trend)

void     Process_S2_Case_WCCI_H1OT_H4OT()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)

      )
   {

//----------- SELL Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
//            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,335,11);
         return;
      }

//----------- SELL Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.75 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
//            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,335,12);
         return;
      }


//      Set_SBS_ALX_Signal(SELL_ORDER,335,1);
//      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)

      )
   {

//----------- BUY Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
//            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,435,11);
         return;
      }

//----------- SELL Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.75 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
//            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,435,12);
         return;
      }

//      Set_SBS_ALX_Signal(BUY_ORDER,435,1);
//      return;
            
//----------- EOF BUY Subcases ---/
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_WCCI_H1OT_H4NT ===========/
// WCCI strong signal 336/436 (H1 old trend, H4 new trend)

void     Process_S2_Case_WCCI_H1OT_H4NT()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)

      )
   {

//----------- SELL Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.75 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.75 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,336,11);
         return;
      }

//----------- SELL Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,336,12);
         return;
      }

//----------- SELL Subcase 13 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
         
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,336,13);
         return;
      }

//----------- SELL Subcase 14 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
         
            (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,336,14);
         return;
      }


//      Set_SBS_ALX_Signal(SELL_ORDER,336,1);
//      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)

      )
   {

//----------- BUY Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.75 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.75 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,436,11);
         return;
      }

//----------- BUY Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,436,12);
         return;
      }

//----------- BUY Subcase 13 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
         
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,436,13);
         return;
      }

//----------- BUY Subcase 14 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
         
            (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,436,14);
         return;
      }

//      Set_SBS_ALX_Signal(BUY_ORDER,436,1);
//      return;
            
//----------- EOF BUY Subcases ---/
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_WCCI_H1NT_H4OT ===========/
// WCCI strong signal 337/437 (H1 new trend, H4 old trend)

void     Process_S2_Case_WCCI_H1NT_H4OT()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)

      )
   {

//----------- SELL Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (1.25 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.75 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] >= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,337,11);
         return;
      }

//----------- SELL Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (1.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.25 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
//            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] >= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,337,12);
         return;
      }

//----------- SELL Subcase 13 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.75 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] >= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,337,13);
         return;
      }


//      Set_SBS_ALX_Signal(SELL_ORDER,337,1);
//      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)

      )
   {

//----------- BUY Subcase 11 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (1.25 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.75 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] <= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,437,11);
         return;
      }

//----------- BUY Subcase 12 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (1.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.25 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
//            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] <= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,437,12);
         return;
      }

//----------- SELL Subcase 13 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.75 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&

//--- STOCH_MTF ---/

            (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) &&
         
            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[1] <= alx_stoch_mtf_signal.LevelMiddle) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1])

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,437,13);
         return;
      }

//      Set_SBS_ALX_Signal(BUY_ORDER,437,1);
//      return;
            
//----------- EOF BUY Subcases ---/
   }

//------------------------------------------------------------------------/

   return;
}








//========================== Process_S2_Case_TDI_MDL_PL_Strong ========/

void     Process_S2_Case_TDI_MDL_PL_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < alx_tdi_LevelUp) &&
         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_LevelUp() < tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown()) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
         
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))

      )
   {

//----------- SELL Subcase 1X ---/

      Set_SBS_ALX_Signal(SELL_ORDER,334,1);
      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > alx_tdi_LevelDown) &&
         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_LevelDown() < tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp()) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
         
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.g_trend_md_diff > ((-0.2) * alx_vlt_signal.threshold))

      )
   {

//----------- BUY Subcase 1x ---/

      Set_SBS_ALX_Signal(BUY_ORDER,434,1);
      return;
            
//----------- EOF BUY Subcases ---/
   }

//------------------------------------------------------------------------/

   return;
}

//===================== eof sbs_order_alx_cases_s2_tdi_M15_H1_H4_lbr.mqh =/