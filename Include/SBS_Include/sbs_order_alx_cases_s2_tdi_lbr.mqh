//===================== sbs_order_alx_cases_s2_tdi_lbr.mqh ======================/

//========================== Process_S2_Case_TDI_Cross_Signal_bandMiddle ========/

void     Process_S2_Case_TDI_Cross_Signal_bandMiddle()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         ((sbs_alx_apb_HA_Open_data[0] - sbs_alx_apb_HA_Close_data[0]) / (alx_pac_signal.HMA - alx_pac_signal.MMA) > 0.5) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/    
   
         (alx_rf_signal.diff < ((-0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&

//--- VLT ---/

         (alx_vlt_signal.diff > ((0.33) * alx_vlt_signal.threshold)) &&
         (alx_vlt_signal.val  > alx_vlt_signal.threshold)
      )
   {
   
//----------- SELL Subcase 1 ---/

      if (
            (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,331,1111);
         return;
      }

//----------- SELL Subcase 2 ---/

      if (
            (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,331,2222);
         return;
      }

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         ((sbs_alx_apb_HA_Close_data[0] - sbs_alx_apb_HA_Open_data[0]) / (alx_pac_signal.MMA - alx_pac_signal.LMA) > 0.5) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/    
   
         (alx_rf_signal.diff > ((0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&

//--- VLT ---/

         (alx_vlt_signal.diff > ((0.33) * alx_vlt_signal.threshold)) &&
         (alx_vlt_signal.val  > alx_vlt_signal.threshold)
      )
   {
   
//----------- SELL Subcase 1 ---/

      if (
            (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,431,1111);
         return;
      }

//----------- SELL Subcase 2 ---/

      if (
            (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,431,2222);
         return;
      }

//----------- EOF BUY Subcases ---/
   }
   
//---------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_TDI_Weak ===============/

void     Process_S2_Case_TDI_Weak()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (((sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_md_extremum_bar] - alx_rf_signal.Upper_Limit) / (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit)) < 0.5) &&
         (alx_rf_signal.g_trend_diff < ((-1) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&

//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (((sbs_alx_vlt_data[alx_vlt_signal.g_md_extremum_bar] - alx_vlt_signal.threshold) / (alx_vlt_signal.threshold)) < 0.25) &&
         (alx_vlt_signal.g_trend_diff < ((-1) * (alx_vlt_signal.threshold))) &&

//--- SSL ---/

         (alx_ssl_signal.trend == SBS_ALX_TREND_DOWN)
      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_ALX_Signal(SELL_ORDER,341,1);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (((alx_rf_signal.Lower_Limit - sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_md_extremum_bar]) / (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit)) < 0.5) &&
         (alx_rf_signal.g_trend_diff > ((1) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&

//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (((sbs_alx_vlt_data[alx_vlt_signal.g_md_extremum_bar] - alx_vlt_signal.threshold) / (alx_vlt_signal.threshold)) < 0.25) &&
         (alx_vlt_signal.g_trend_diff < ((-1) * (alx_vlt_signal.threshold))) &&

//--- SSL ---/

         (alx_ssl_signal.trend == SBS_ALX_TREND_UP)
      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_ALX_Signal(BUY_ORDER,441,1);
      return;

//----------- EOF BUY Subcases ---/

   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_TDI_Exit =================/

void     Process_S2_Case_TDI_Exit()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (sbs_alx_tdi_rsiPriceLine_data[1] > sbs_alx_tdi_rsiSignalLine_data[1]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
         (sbs_alx_tdi_04_rsiPriceLine_data[1] > sbs_alx_tdi_04_rsiSignalLine_data[1])

      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,351,1);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (sbs_alx_tdi_rsiPriceLine_data[1] < sbs_alx_tdi_rsiSignalLine_data[1]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
         (sbs_alx_tdi_04_rsiPriceLine_data[1] < sbs_alx_tdi_04_rsiSignalLine_data[1])

      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,451,1);
      return;

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_ALX1_Case_01_TDI_Strong ===============/
/*
void     Process_S2_ALX1_Case_01_TDI_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) && 

//--- RSI_01 ---/    
         
         (alx_rsioma_01_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- RSI_04 ---/    
         
         (alx_rsioma_04_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- TSI_MACD_01 ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- TSI_MACD_04 ---/    
         
         (alx_tsi_macd_04_signal.trend == SBS_ALX_TREND_DOWN)

      )
   {
//----------- SELL Subcase 1X ---/

      Set_SBS_Open_Order_Condition(SELL_ORDER,SBS_ALX_ORDER_CONDITION_001);
      Set_SBS_ALX_Signal(SELL_ORDER,332,1);
      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) && 

//--- RSI_01 ---/    
         
         (alx_rsioma_01_signal.trend == SBS_ALX_TREND_UP) &&

//--- RSI_04 ---/    
         
         (alx_rsioma_04_signal.trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_01 ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_04 ---/    
         
         (alx_tsi_macd_04_signal.trend == SBS_ALX_TREND_UP)

      )
   {
//----------- BUY Subcase 1X ---/

      Set_SBS_Open_Order_Condition(BUY_ORDER,SBS_ALX_ORDER_CONDITION_001);
      Set_SBS_ALX_Signal(BUY_ORDER,432,1);
      return;
            
//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}
*/
//========================== Process_S2_ALX1_Case_02_TDI_Strong ===============/
/*
void     Process_S2_ALX1_Case_02_TDI_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) && 

//--- RSI_01 ---/    
         
         (alx_rsioma_01_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Lower_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_01 ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- TSI_MACD_04 ---/    
         
         (alx_tsi_macd_04_signal.trend == SBS_ALX_TREND_UP)

      )
   {
//----------- SELL Subcase 1X ---/

      Set_SBS_Open_Order_Condition(SELL_ORDER,SBS_ALX_ORDER_CONDITION_002);
      Set_SBS_ALX_Signal(SELL_ORDER,333,1);
      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- TDI ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) && 

//--- RSI_01 ---/    
         
         (alx_rsioma_01_signal.trend == SBS_ALX_TREND_UP) &&

//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Upper_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_01 ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_04 ---/    
         
         (alx_tsi_macd_04_signal.trend == SBS_ALX_TREND_DOWN)

      )
   {
//----------- BUY Subcase 1X ---/

      Set_SBS_Open_Order_Condition(BUY_ORDER,SBS_ALX_ORDER_CONDITION_002);
      Set_SBS_ALX_Signal(BUY_ORDER,433,1);
      return;
            
//----------- EOF BUY Subcases ---/
   }
   
//---------------------------------------------------------------------/

   return;
}
*/
//========================== Process_S2_ALX1_Case_TDI_Exit_Conditional /
/*
void     Process_S2_ALX1_Case_TDI_Exit_Conditional()
{
//-------------------------- SBS_ALX_ORDER_CONDITION_001 --------------/

//-------------------------- Check for SELL ---------------------------/

   if (
//--- CONDITION ---/

         (open_order_profile.action    == BUY_ORDER) &&
         (open_order_profile.condition == SBS_ALX_ORDER_CONDITION_001) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])
      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_Open_Order_Condition(NO_ORDER,SBS_ALX_ORDER_CONDITION_NONE);
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,352,1);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- CONDITION ---/

         (open_order_profile.action    == SELL_ORDER) &&
         (open_order_profile.condition == SBS_ALX_ORDER_CONDITION_001) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])
      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_Open_Order_Condition(NO_ORDER,SBS_ALX_ORDER_CONDITION_NONE);
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,452,1);
      return;

//----------- EOF BUY Subcases ---/
   }

//-------------------------- SBS_ALX_ORDER_CONDITION_002 --------------/

//-------------------------- Check for SELL ---------------------------/

   if (
//--- CONDITION ---/

         (open_order_profile.action    == BUY_ORDER) &&
         (open_order_profile.condition == SBS_ALX_ORDER_CONDITION_002) &&

//--- TSI_MACD_01 ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_DOWN)
      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_Open_Order_Condition(NO_ORDER,SBS_ALX_ORDER_CONDITION_NONE);
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,353,1);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- CONDITION ---/

         (open_order_profile.action    == SELL_ORDER) &&
         (open_order_profile.condition == SBS_ALX_ORDER_CONDITION_002) &&

//--- TSI_MACD_01 ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_UP)
      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_Open_Order_Condition(NO_ORDER,SBS_ALX_ORDER_CONDITION_NONE);
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,453,1);
      return;

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}
*/
//========================== Process_S2_ALX1_Case_M15_H1_TDI_Strong ===/

void     Process_S2_ALX1_Case_M15_H1_TDI_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- TDI(15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&

//--- TDI_04(60) ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < alx_tdi_LevelMiddle) && 
         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) && 
         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_bandMiddle_data[0]) && 
         
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Lower_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_01(15) ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- TSI_MACD_04(60) ---/    
         
         (alx_tsi_macd_04_signal.trend == SBS_ALX_TREND_DOWN)

      )
   {
//----------- SELL Subcase 1X ---/

      Set_SBS_ALX_Signal(SELL_ORDER,334,1);
      return;
            
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- TDI(15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&

//--- TDI_04(60) ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > alx_tdi_LevelMiddle) && 
         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) && 
         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_bandMiddle_data[0]) && 
         
//--- RF ---/    
         
         (alx_rf_signal.g_trend == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Upper_Limit) &&
         
//--- VLT ---/

         (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_01(15) ---/    
         
         (alx_tsi_macd_01_signal.trend == SBS_ALX_TREND_UP) &&

//--- TSI_MACD_04(60) ---/    
         
         (alx_tsi_macd_04_signal.trend == SBS_ALX_TREND_UP)

      )
   {
//----------- BUY Subcase 1X ---/

      Set_SBS_ALX_Signal(BUY_ORDER,434,1);
      return;
            
//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_ALX1_Case_M15_H1_TDI_Exit =====/

void     Process_S2_ALX1_Case_M15_H1_TDI_Exit()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- TDI_04(60) ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])
         
      )
   {
   
//----------- SELL Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,354,1);
      return;

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- TDI_04(60) ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
   
//----------- BUY Subcase 1 ---/

      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,454,1);
      return;

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//===================== eof sbs_order_alx_cases_s2_tdi_lbr.mqh ==================/