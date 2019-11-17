//===================== sbs_order_alx_cases_s2_GMTS_lbr.mqh ===========/

//========================== Process_S2_Case_GMTS_Strong ==============/

void     Process_S2_Case_GMTS_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- GMTS ---/
   
//         (alx_gmts_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
//         (alx_gmts_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
//         (alx_gmts_signal.trend_H1 == SBS_ALX_TREND_DOWN) &&
//         (alx_gmts_signal.trend_H4 == SBS_ALX_TREND_DOWN) &&
   
//--- ASCTREND_4TF ---/
   
         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H4 == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 (H1) ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- TDI_MDL (M30) ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- CHKN_VLT ---/
   
         (sbs_alx_chkn_vlt_data[0] > 0)

      )
   {

//----------- SELL Subcase 1X ---/

      Set_SBS_ALX_Signal(SELL_ORDER,335,1);
      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- GMTS ---/
   
//         (alx_gmts_signal.trend_M15 == SBS_ALX_TREND_UP) &&
//         (alx_gmts_signal.trend_M30 == SBS_ALX_TREND_UP) &&
//         (alx_gmts_signal.trend_H1 == SBS_ALX_TREND_UP) &&
//         (alx_gmts_signal.trend_H4 == SBS_ALX_TREND_UP) &&
   
//--- ASCTREND_4TF ---/
   
         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H1 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H4 == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 (H1) ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- TDI_MDL (M30) ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- CHKN_VLT ---/
   
         (sbs_alx_chkn_vlt_data[0] > 0)

      )
   {

//----------- BUY Subcase 1x ---/

      Set_SBS_ALX_Signal(BUY_ORDER,435,1);
      return;
            
//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_GMTS_Strong_Exit =========/

void     Process_S2_Case_GMTS_Strong_Exit()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- TDI_MDL (M30) ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0])

      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,355,1);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- TDI_MDL (M30) ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0])
         
      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,455,1);
      return;

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//===================== eof sbs_order_alx_cases_s2_GMTS_lbr.mqh ==========/