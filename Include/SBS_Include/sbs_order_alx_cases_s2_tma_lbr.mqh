//===================== sbs_order_alx_cases_s2_tma_lbr.mqh ===============/

//========================== Process_S2_Case_TMA =========================/
//--- XST signal 345/445 ---/

void     Process_S2_Case_TMA()
{
//-------------------------- Check Open Signals --------------------------/

   Process_S2_Case_TMA_Open();

//-------------------------- Check Close Signals -------------------------/

//   Process_S2_Case_TMA_Close();

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_TMA_Open ====================/
//--- XST signal 345(xxx)/445(xxx) ---/

void     Process_S2_Case_TMA_Open()
{
//-------------------------- Check for SELL (345(xxx)) -------------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_tma_open_level) &&

//--- TMA ---/

         (sbs_alx_tma_basic_lo_data[0] > sbs_alx_tma_upper1_lo_data[0])

      )
   {
//      Set_SBS_ALX_Signal(SELL_ORDER,345,101);
//      return;

//=== (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_GR_UPPER1_STATE) ===/

//--- (CASE 101) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_GR_UPPER1_STATE) &&
            
            (alx_tma_signal.xst_upper1_state   == SBS_ALX_XST_GR_UPPER1_STATE)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,101);
         return;
      }

//--- (CASE 102) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_GR_UPPER1_STATE) &&
            
            (alx_tma_signal.xst_basic_state    == SBS_ALX_XST_GR_BASIC_STATE)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,102);
         return;
      }

//--- (CASE 103) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_GR_UPPER1_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_DOWN) &&
            (alx_tma_signal.xst_dn_upper1_dn_number == 1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,103);
         return;
      }

//=== (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_HI_STATE) ===/

//--- (CASE 203) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_HI_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_DOWN) &&
            (alx_tma_signal.xst_dn_basic_upper1_dn_number == 1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,203);
         return;
      }

//=== (BASIC cross UPPER1 MIDDLE) ===/

//--- (CASE 303) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_HI_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_DOWN) &&
            (alx_tma_signal.xst_dn_upper1_dn_number == 1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,303);
         return;
      }

//=== (BASIC_SHORT cross UPPER1 MIDDLE) ===/

//--- (CASE 402) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_short_upper1_state == SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE) &&

            (alx_tma_signal.xst_basic_state == SBS_ALX_XST_GR_BASIC_STATE)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,402);
         return;
      }

//--- (CASE 404) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_short_upper1_state == SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_DOWN) &&
            (alx_tma_signal.xst_dn_basic_sh_upper1_dn_number == 1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,404);
         return;
      }

//=== (CANDLE cross UPPER1) ===/

//--- (CASE 501) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.candle_upper1_state == SBS_ALX_CANDLE_GR_UPPER1_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_DOWN) &&
            (alx_tma_signal.xst_basic_state == SBS_ALX_XST_GR_BASIC_STATE) &&
            (alx_tma_signal.xst_dn_upper1_dn_number >= 2) &&
            (alx_tma_signal.xst_dn_candle_upper1_gr_number == 1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,345,501);
         return;
      }
      
   }  // Check for SELL (345(xxx))

//-------------------------- Check for BUY (445(xxx)) --------------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP) &&
         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_tma_open_level) &&

//--- TMA ---/

         (sbs_alx_tma_basic_hi_data[0] < sbs_alx_tma_upper1_hi_data[0])

      )
   {
//      Set_SBS_ALX_Signal(SELL_ORDER,445,101);
//      return;

//=== (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_LE_UPPER1_STATE) ===/

//--- (CASE 101) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_LE_UPPER1_STATE) &&
            
            (alx_tma_signal.xst_upper1_state   == SBS_ALX_XST_LE_UPPER1_STATE)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,101);
         return;
      }

//--- (CASE 102) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_LE_UPPER1_STATE) &&
            
            (alx_tma_signal.xst_basic_state    == SBS_ALX_XST_LE_BASIC_STATE)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,102);
         return;
      }

//--- (CASE 103) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_LE_UPPER1_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_UP) &&
            (alx_tma_signal.xst_up_upper1_up_number == 1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,103);
         return;
      }

//=== (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_LO_STATE) ===/

//--- (CASE 203) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_LO_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_UP) &&
            (alx_tma_signal.xst_up_basic_upper1_up_number == 1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,203);
         return;
      }

//=== (BASIC cross UPPER1 MIDDLE) ===/

//--- (CASE 303) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_LO_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_UP) &&
            (alx_tma_signal.xst_up_upper1_up_number == 1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,303);
         return;
      }

//=== (BASIC_SHORT cross UPPER1 MIDDLE) ===/

//--- (CASE 402) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_short_upper1_state == SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE) &&

            (alx_tma_signal.xst_basic_state == SBS_ALX_XST_LE_BASIC_STATE)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,402);
         return;
      }

//--- (CASE 404) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.basic_short_upper1_state == SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_UP) &&
            (alx_tma_signal.xst_up_basic_sh_upper1_up_number == 1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,404);
         return;
      }

//=== (CANDLE cross UPPER1) ===/

//--- (CASE 501) ---/

      if (
//------ TMA ---/

            (alx_tma_signal.candle_upper1_state == SBS_ALX_CANDLE_LE_UPPER1_STATE) &&
            
            (alx_tma_signal.upper1_trend == SBS_ALX_TREND_UP) &&
            (alx_tma_signal.xst_basic_state == SBS_ALX_XST_LE_BASIC_STATE) &&
            (alx_tma_signal.xst_up_upper1_up_number >= 2) &&
            (alx_tma_signal.xst_up_candle_upper1_le_number == 1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,445,501);
         return;
      }
      
   }  // Check for BUY (445(xxx))
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_TMA_Close ===================/
//--- XST signal 345(9xx)/445(9xx) ---/

void     Process_S2_Case_TMA_Close()
{
//-------------------- Check for SELL (CLOSE BUY) (901) -----/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_tma_close_level) &&
         (alx_wdmi_signal.dihm < (-1 * 3))
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,345,901);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//===================== eof sbs_order_alx_cases_s2_tma_lbr.mqh ===========/