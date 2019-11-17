//===================== sbs_order_alx_cases_s2_xst_3sig_lbr.mqh ==========/

//========================== Process_S2_Case_XST_3Sig ====================/
//--- XST signal 344/444 ---/

void     Process_S2_Case_XST_3Sig()
{
//-------------------------- Check Open Signals --------------------------/

//   Process_S2_Case_XST_3Sig_Open();

   Process_S2_Case_XST_3Sig_Open_cross_level();

//-------------------------- Check Close Signals -------------------------/

//   Process_S2_Case_XST_3Sig_Close();

   Process_S2_Case_XST_3Sig_Close_cross_level();

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_XST_3Sig_Open ===============/
//--- XST signal 344(1xx)/444(1xx) ---/

void     Process_S2_Case_XST_3Sig_Open()
{
//-------------------------- Check for SELL (101) between md & lo ---------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) &&
         (alx_xst_signal.trend_H1_40    == SBS_ALX_TREND_DOWN) &&
         (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max <= alx_wdmi_signal.adx_md_level) &&
         (alx_wdmi_signal.adx_max >  alx_wdmi_signal.adx_lo_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,344,101);
      return;
   }

//-------------------------- Check for BUY (101) between md & lo ---------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) &&
         (alx_xst_signal.trend_H1_40    == SBS_ALX_TREND_UP) &&
         (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max <= alx_wdmi_signal.adx_md_level) &&
         (alx_wdmi_signal.adx_max >  alx_wdmi_signal.adx_lo_level) &&
         
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP) &&
         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,444,101);
      return;
   }

//-------------------------- Check for SELL (102) ADX upper hi ------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
         (
            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) ||
            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min > alx_wdmi_signal.adx_hi_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN)
         
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,344,102);
      return;
   }

//-------------------------- Check for BUY (102) -------------------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
         (
            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) ||
            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min > alx_wdmi_signal.adx_hi_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP)
         
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,444,102);
      return;
   }

//-------------------------- Check for SELL (103) ADX between hi & lo ----/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
         (
            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) ||
            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min <= alx_wdmi_signal.adx_hi_level) &&
         (alx_wdmi_signal.adx_max > alx_wdmi_signal.adx_lo_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,344,103);
      return;
   }

//-------------------------- Check for BUY (103) ADX between hi & lo -----/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
         (
            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) ||
            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min <= alx_wdmi_signal.adx_hi_level) &&
         (alx_wdmi_signal.adx_max > alx_wdmi_signal.adx_lo_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP) &&
         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,444,103);
      return;
   }


//-------------------------- Check for SELL (104) ADX lower lo -----------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
         (
            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) ||
            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max < alx_wdmi_signal.adx_lo_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_md_level)
         
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,344,104);
      return;
   }

//-------------------------- Check for BUY (104) ADX lower lo ------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
         (
            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) ||
            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max < alx_wdmi_signal.adx_lo_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP) &&
         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_md_level)
         
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,444,104);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_XST_3Sig_Close ==============/
//--- XST signal 344(5xx)/444(5xx) ---/

void     Process_S2_Case_XST_3Sig_Close()
{

//-------------------- Check for SELL (CLOSE BUY) (501) between md & lo --/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max <= alx_wdmi_signal.adx_md_level) &&
         (alx_wdmi_signal.adx_max >  alx_wdmi_signal.adx_lo_level) &&

         (alx_wdmi_signal.DIp < alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,344,501);
      return;
   }

//-------------------- Check for BUY (CLOSE SELL) (501) between md & lo --/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max <= alx_wdmi_signal.adx_md_level) &&
         (alx_wdmi_signal.adx_max >  alx_wdmi_signal.adx_lo_level) &&

         (alx_wdmi_signal.DIm < alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,444,501);
      return;
   }

//-------------------- Check for SELL (CLOSE BUY) (502) ADX upper hi -----/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min > alx_wdmi_signal.adx_hi_level) &&

         (alx_wdmi_signal.DIp < alx_wdmi_signal.adx_hi_level)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,344,502);
      return;
   }

//-------------------- Check for BUY (CLOSE SELL) (502) ADX upper hi -----/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min > alx_wdmi_signal.adx_hi_level) &&

         (alx_wdmi_signal.DIm < alx_wdmi_signal.adx_hi_level)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,444,502);
      return;
   }


//-------------------- Check for SELL (CLOSE BUY) (503) ADX between hi & lo --/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min <= alx_wdmi_signal.adx_hi_level) &&
         (alx_wdmi_signal.adx_max > alx_wdmi_signal.adx_lo_level) &&

         (alx_wdmi_signal.DIp < alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,344,503);
      return;
   }

//-------------------- Check for BUY (CLOSE SELL) (503) ADX between hi & lo --/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_min <= alx_wdmi_signal.adx_hi_level) &&
         (alx_wdmi_signal.adx_max > alx_wdmi_signal.adx_lo_level) &&

         (alx_wdmi_signal.DIm < alx_wdmi_signal.adx_max)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,444,503);
      return;
   }

//-------------------- Check for SELL (CLOSE BUY) (504) ADX lower lo ---------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max < alx_wdmi_signal.adx_lo_level)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,344,504);
      return;
   }

//-------------------- Check for BUY (CLOSE SELL) (504) ADX lower lo ---------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.adx_max < alx_wdmi_signal.adx_lo_level)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,444,504);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_XST_3Sig_Open_cross_level ===/
//--- XST signal 345(1xx)/445(1xx) ---/

void     Process_S2_Case_XST_3Sig_Open_cross_level()
{
//-------------------------- Check for SELL (101) DI upper cross level ---/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
//         (
//            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) ||
//            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
//         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_cross_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN)
         
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,345,101);
      return;
   }

//-------------------------- Check for BUY (101) DI upper cross level ----/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
//         (
//            (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) ||
//            (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
//         ) &&

//--- WDMI ---/

         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_cross_level) &&
                  
         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP)
         
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,445,101);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_XST_3Sig_Close_cross_level ==/
//--- XST signal 345(5xx)/445(5xx) ---/

void     Process_S2_Case_XST_3Sig_Close_cross_level()
{

//-------------------- Check for SELL (CLOSE BUY) (501) simple cross -----/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_min) &&
         (alx_wdmi_signal.dihm < (-1 * 3))
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,345,501);
      return;
   }

//-------------------- Check for BUY (CLOSE SELL) (501) simple cross -----/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- XST Trend ---/

         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP) &&
         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_min) &&
         (alx_wdmi_signal.dihp > 3)
         
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,445,501);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//===================== eof sbs_order_alx_cases_s2_xst_3_sig_lbr.mqh =====/