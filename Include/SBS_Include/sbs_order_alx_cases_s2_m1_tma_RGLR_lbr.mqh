//================== sbs_order_alx_cases_s2_m1_tma_RGLR_lbr.mqh ==========/

//========================== Process_S2_Case_Multi_TMA_Open ==============/
//--- TMA signal 355(2XX)/455(2XX) ---/

void     Process_S2_Case_Multi_TMA_Open()
{
//-------------------------- Check for SELL (355(xxx)) -------------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_DOWN) &&
         (alx_wdmi_signal.DIm > alx_wdmi_signal.adx_tma_open_level) &&

//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m1 == SBS_ALX_TREND_DOWN) &&
         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_DOWN) 
         
      )
   {
   
//-------------------------- CROSS H1 HIGH -------------------------------/
   
//------ (CASE 201) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_hi_data[0]) &&
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_hi_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_m5_hi_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_m5_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_m15_hi_data))

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,201);
         return;
      }

//------ (CASE 2011) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_hi_data[0]) &&
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_h1_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_h1_hi_data[0]) &&

            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_m15_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_hi_data,sbs_alx_multi_tma_h1_hi_data)) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_h1_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_hi_data,sbs_alx_multi_tma_h1_hi_data))


         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,2011);
         return;
      }

//------ (CASE 2012), aka 2011 WIDE ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_m15_wide_hi_data[0] > sbs_alx_multi_tma_h1_hi_data[0]) &&
            (sbs_alx_multi_tma_m15_wide_lo_data[0] < sbs_alx_multi_tma_h1_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m5_wide_hi_data[0] < sbs_alx_multi_tma_m15_wide_hi_data[0]) &&
            (sbs_alx_multi_tma_m5_wide_hi_data[0] > sbs_alx_multi_tma_h1_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_h1_hi_data[0]) &&

            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_wide_hi_data,sbs_alx_multi_tma_m15_wide_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_wide_hi_data,sbs_alx_multi_tma_h1_hi_data)) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_wide_hi_data,sbs_alx_multi_tma_h1_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_wide_hi_data,sbs_alx_multi_tma_h1_hi_data))


         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,2012);
         return;
      }

//-------------------------- CROSS H1 TREND DOWN -------------------------/

//------ (CASE 202) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_h1 == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_m15_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_m15_hi_data))

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,202);
         return;
      }

//------ (CASE 2021) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_h1 == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_m5_hi_data[0]) &&
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_m5_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_h1_md_data)) &&
               
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_h1_md_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_h1_md_data))


         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,2021);
         return;
      }

//-------------------------- CROSS H1 & M15 TRENDS DOWN ------------------/

//------ (CASE 2022) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_h1 == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m5_wide_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            (sbs_alx_multi_tma_m5_wide_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_m5_hi_data[0]) &&
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_wide_hi_data,sbs_alx_multi_tma_m15_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_hi_data,sbs_alx_multi_tma_h1_md_data))

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,2022);
         return;
      }

//-------------------------- CROSS M15 TREND DOWN ------------------------/

//------ (CASE 203) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m1_wide_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_wide_hi_data,sbs_alx_multi_tma_m15_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_m15_hi_data))

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,203);
         return;
      }

//------ (CASE 2031) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] < sbs_alx_multi_tma_m5_hi_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_m15_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_h1_md_data))
            

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,2031);
         return;
      }

//------ (CASE 2032) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_DOWN) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_m15_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_h1_md_data))
            

         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,355,2032);
         return;
      }

//------------------------------------------------------------------------/
      
   }  // Check for SELL (355(xxx))


//-------------------------- Check for BUY (455(xxx)) --------------------/

   if (
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&

//--- WDMI ---/

         (alx_wdmi_signal.DI_trend == SBS_ALX_TREND_UP) &&
         (alx_wdmi_signal.DIp > alx_wdmi_signal.adx_tma_open_level) &&

//--- MULTI_TMA ---/

         (sbs_alx_multi_tma_signal.trend_m1 == SBS_ALX_TREND_UP) &&
         (sbs_alx_multi_tma_signal.trend_m5 == SBS_ALX_TREND_UP) 
         
      )
   {
   
//-------------------------- CROSS H1 LOW --------------------------------/
   
//------ (CASE 201) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_lo_data[0]) &&
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_lo_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_m5_lo_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_m5_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_m15_lo_data))

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,201);
         return;
      }

//------ (CASE 2011) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_lo_data[0]) &&
            (sbs_alx_multi_tma_m15_hi_data[0] > sbs_alx_multi_tma_h1_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_h1_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_h1_lo_data[0]) &&

            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_m15_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_lo_data,sbs_alx_multi_tma_h1_lo_data)) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_h1_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_lo_data,sbs_alx_multi_tma_h1_lo_data))


         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,2011);
         return;
      }

//------ (CASE 2012), aka 2011 WIDE ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_m15_wide_lo_data[0] < sbs_alx_multi_tma_h1_lo_data[0]) &&
            (sbs_alx_multi_tma_m15_wide_hi_data[0] > sbs_alx_multi_tma_h1_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m5_wide_lo_data[0] > sbs_alx_multi_tma_m15_wide_lo_data[0]) &&
            (sbs_alx_multi_tma_m5_wide_lo_data[0] < sbs_alx_multi_tma_h1_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_h1_lo_data[0]) &&

            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_wide_lo_data,sbs_alx_multi_tma_m15_wide_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_wide_lo_data,sbs_alx_multi_tma_h1_lo_data)) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_wide_lo_data,sbs_alx_multi_tma_h1_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_wide_lo_data,sbs_alx_multi_tma_h1_lo_data))


         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,2012);
         return;
      }

//-------------------------- CROSS H1 TREND UP ---------------------------/

//------ (CASE 202) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_h1 == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_m15_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_m15_lo_data))

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,202);
         return;
      }

//------ (CASE 2021) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_h1 == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_m5_lo_data[0]) &&
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_m5_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_h1_md_data)) &&
               
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_h1_md_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_h1_md_data))


         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,2021);
         return;
      }

//-------------------------- CROSS H1 & M15 TRENDS UP --------------------/

//------ (CASE 2022) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_h1 == SBS_ALX_TREND_UP) &&
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m5_wide_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            (sbs_alx_multi_tma_m5_wide_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_m5_lo_data[0]) &&
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_wide_lo_data,sbs_alx_multi_tma_m15_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m15_lo_data,sbs_alx_multi_tma_h1_md_data))

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,2022);
         return;
      }

//-------------------------- CROSS M15 TREND UP --------------------------/

//------ (CASE 203) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_multi_tma_m15_lo_data[0] < sbs_alx_multi_tma_h1_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (sbs_alx_multi_tma_m1_wide_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_wide_lo_data,sbs_alx_multi_tma_m15_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_m15_lo_data))

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,355,203);
         return;
      }

//------ (CASE 2031) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m1_lo_data[0] > sbs_alx_multi_tma_m5_lo_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_lo_data,sbs_alx_multi_tma_m15_lo_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_lo_data,sbs_alx_multi_tma_h1_md_data))
            

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,2031);
         return;
      }

//------ (CASE 2032) ------/

      if (
//--- MULTI_TMA ---/
            
            (sbs_alx_multi_tma_signal.trend_m15 == SBS_ALX_TREND_UP) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] > sbs_alx_multi_tma_m15_lo_data[0]) &&
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_m15_md_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] < sbs_alx_multi_tma_m15_hi_data[0]) &&
            
            (sbs_alx_multi_tma_m5_lo_data[0] < sbs_alx_multi_tma_h1_md_data[0]) &&
            (sbs_alx_multi_tma_m5_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (sbs_alx_multi_tma_m1_hi_data[0] > sbs_alx_multi_tma_h1_md_data[0]) &&
            
            (SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m1_hi_data,sbs_alx_multi_tma_m15_hi_data) < 
               SBS_ALX_Indi_Cross_Bar(sbs_alx_multi_tma_m5_hi_data,sbs_alx_multi_tma_h1_md_data))
            

         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,455,2032);
         return;
      }

//------------------------------------------------------------------------/
      
   }  // Check for BUY (455(xxx))

//------------------------------------------------------------------------/

   return;
}

//================== eof sbs_order_alx_cases_s2_m1_tma_RGLR_lbr.mqh ======/
