//===================== sbs_order_alx_cases_lbr.mqh ======================/

//========================== Process_S2_Case_Bar1_Much_Shorter ===========/

void     Process_S2_Case_Bar1_Much_Shorter()
{
//-------------------------- Bars 0 & 1 have different trends ------------/

//-------------------------- Check for SELL (0 & 1 have diff trends) -----/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Sell_Cases_Allowed()) && 
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.s2_case      == SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER)
      )
   {
   
//----------- SELL Subcase 1 ---/

      if (
//--- MA ---/         

            (Low[1]   < alx_pac_signal.HMA_1) &&
            (Close[0] < alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > ((0.33) * alx_vlt_signal.threshold)) ||      // was 0.5
               (alx_vlt_signal.diff < ((-0.33) * alx_vlt_signal.threshold))
            )
         )
      {
         if (
               (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
               (sbs_alx_apb_HA_Close_data[2] >= alx_pac_signal.HMA_2)
            )
         {
            if ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) >= ((1.05) * alx_rf_signal.Upper_Limit))
            {
               Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 10 + 1));
               return;
            }
            
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) < ((1.05) * alx_rf_signal.Upper_Limit)) &&
                  (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold)) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandUp() < tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine())
               )
            {
               Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 10 + 6));
               return;
            }
            
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) < ((1.05) * alx_rf_signal.Upper_Limit)) &&
                  (alx_vlt_signal.diff < ((-0.33) * alx_vlt_signal.threshold)) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandUp() > tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine()) &&
                  (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle)
               )
            {
               Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 10 + 7));
               return;
            }
         }
         
         if (
               (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
               (sbs_alx_apb_HA_Close_data[2] < alx_pac_signal.HMA_2) &&
               
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelDown) &&
               (tdi_bandMiddle_CROSS_tdi_LevelMiddle() >= 12)
            )
         {
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) > ((1.05) * alx_rf_signal.Lower_Limit))
               )
            {
               Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 20 + 1));
               return;
            }
            
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) <= ((1.05) * alx_rf_signal.Lower_Limit)) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandDown() < tdi_rsiPriceLine_CROSS_tdi_bandMiddle())
               )
            {
            
            
               Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 20 + 6));
               return;
            }
         }
      }

//----------- SELL Subcase 2 ---/

      if (
//--- MA ---/         

            (Low[1]   > alx_pac_signal.HMA_1) &&
            (Close[0] < alx_pac_signal.HMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff < ((-0.5) * alx_vlt_signal.threshold))
         )
      {
         if (
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelDown) &&
               (tdi_bandMiddle_CROSS_tdi_LevelMiddle() >= 20)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 10 + 2));
         }
         
         if (
               (alx_tdi_signal.bandDown >= alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 20 + 2));
         }

         if (
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelUp) &&
               (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
               (tdi_rsiPriceLine_CROSS_tdi_bandDown() < 8)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 30 + 2));
         }
      }

//----------- EOF SELL Subcases (diff trends) ---/
   }

//-------------------------- Check for BUY (0 & 1 have diff trends) ------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Buy_Cases_Allowed()) && 
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.s2_case      == SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER)
      )
   {

//----------- BUY Subcase 1 ---/

      if (
//--- MA ---/         

            (High[1]  > alx_pac_signal.LMA_1) &&
            (Close[0] > alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold)) ||    // was 0.5
               (alx_vlt_signal.diff < ((-0.33) * alx_vlt_signal.threshold))
            )
         )
      {
         if (
               (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
               (sbs_alx_apb_HA_Close_data[2] <= alx_pac_signal.LMA_2)
            )
         {
            if ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) <= ((1.05) * alx_rf_signal.Lower_Limit))
            {
               Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 10 + 1));
               return;
            }
            
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) > ((1.05) * alx_rf_signal.Lower_Limit)) &&
                  (alx_vlt_signal.diff > ((0.33) * alx_vlt_signal.threshold)) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandDown() < tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine())
               )
            {
               Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 10 + 6));
               return;
            }
            
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) > ((1.05) * alx_rf_signal.Lower_Limit)) &&
                  (alx_vlt_signal.diff < ((-0.33) * alx_vlt_signal.threshold)) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandDown() > tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine()) &&
                  (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle)
               )
            {
               Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 10 + 7));
               return;
            }
         }
         
         if (
               (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
               (sbs_alx_apb_HA_Close_data[2] > alx_pac_signal.LMA_2) &&
               
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelUp) &&
               (tdi_bandMiddle_CROSS_tdi_LevelMiddle() >= 12)
            )
         {
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) < ((1.05) * alx_rf_signal.Upper_Limit))
               )
            {
               Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 20 + 1));
               return;
            }
            
            if (
                  ((alx_rf_signal.Linear_Value - alx_rf_signal.diff) >= ((1.05) * alx_rf_signal.Upper_Limit)) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandUp() < tdi_rsiPriceLine_CROSS_tdi_bandMiddle())
               )
            {
               Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 20 + 6));
               return;
            }
         }
      }

//----------- BUY Subcase 2 ---/

      if (
//--- MA ---/         

            (High[1]  < alx_pac_signal.LMA_1) &&
            (Close[0] > alx_pac_signal.LMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff < ((-0.5) * alx_vlt_signal.threshold))
         )
      {
         if (
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelUp) &&
               (tdi_bandMiddle_CROSS_tdi_LevelMiddle() >= 20)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 10 + 2));
         }
         
         if (
               (alx_tdi_signal.bandUp <= alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 20 + 2));
         }

         if (
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelDown) &&
               (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
               (tdi_rsiPriceLine_CROSS_tdi_bandDown() < 8)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 30 + 2));
         }
      }

//----------- EOF BUY Subcases (diff trends) ---/
   }

//-------------------------- Bars 0 & 1 have same trends -----------------/

//-------------------------- Check for SELL (0 & 1 have same trends) -----/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Sell_Cases_Allowed()) && 
         
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.s2_case      == SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER_F)
      )
   {
   
//----------- SELL Subcase 3 ---/

      if (
//--- MA ---/         

            (Low[1]   < alx_pac_signal.HMA_1) &&
            (Close[0] < alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold))    // was 0.5
            )
         )
      {
         if (
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 10 + 3));
            return;
         }
      }

//----------- SELL Subcase 4 ---/

      if (
//--- MA ---/         

            (Low[1]   < alx_pac_signal.HMA_1) &&
            (Close[0] < alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff < ((-0.5) * alx_vlt_signal.threshold))
            )
         )
      {
         if (
               (alx_tdi_signal.bandDown >= alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelUp)
            )
         {
            if (tdi_rsiPriceLine_CROSS_tdi_LevelUp() < 6)
            {
               if (
                     (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
                     (tdi_rsiPriceLine_CROSS_tdi_LevelUp() < 3)
                  )
               {
                  Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 10 + 4));
                  return;
               }
               
               Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,311,(100 + 4));
               return;
            }
         }
         
         if (
               (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle)
            )
         {
            if (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle)
            {
               Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 20 + 4));
               return;
            }
            
            if (alx_tdi_signal.bandMiddle >= alx_tdi_LevelMiddle)
            {
               if (
                     (((alx_vlt_signal.val - alx_vlt_signal.diff) / alx_vlt_signal.threshold) < 2)
                  )
               {
                  if (
                        (tdi_rsiPriceLine_CROSS_tdi_bandDown() < 6) &&
                        (MathMax(sbs_alx_apb_HA_Open_data[2],sbs_alx_apb_HA_Close_data[2]) < alx_pac_signal.MMA_2)
                     )
                  {
                     Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 30 + 4));
                     return;
                  }
                  
                  if (
                        (tdi_rsiPriceLine_CROSS_upper_tdi_LevelUp_Middle(0.25) < 6) &&
                        (sbs_alx_tdi_rsiPriceLine_data[tdi_rsiPriceLine_CROSS_upper_tdi_LevelUp_Middle(0.25) + 1] > 
                           sbs_alx_tdi_bandMiddle_data[tdi_rsiPriceLine_CROSS_upper_tdi_LevelUp_Middle(0.25) + 1])
                     )
                  {
                     Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 40 + 4));
                     return;
                  }
               }
            }
         }
      }

//----------- SELL Subcase 5 ---/

      if (
//--- MA ---/         

            (Low[1]   > alx_pac_signal.HMA_1) &&
            (Close[0] < alx_pac_signal.HMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff > ((0.5) * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,311,((100 * alx_apb_signal.allow_case) + 5));
         return;
      }

//----------- EOF SELL Subcases (same trends) ---/
   }

//-------------------------- Check for BUY (0 & 1 have same trends) ------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Buy_Cases_Allowed()) && 
         
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.s2_case      == SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER_F)
      )
   {

//----------- BUY Subcase 3 ---/

      if (
//--- MA ---/         

            (High[1]  > alx_pac_signal.LMA_1) &&
            (Close[0] > alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold))    // was 0.5
            )
         )
      {
         if (
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 10 + 3));
            return;
         }
      }

//----------- BUY Subcase 4 ---/

      if (
//--- MA ---/         

            (High[1]  > alx_pac_signal.LMA_1) &&
            (Close[0] > alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff < ((-0.5) * alx_vlt_signal.threshold))
            )
         )
      {
         if (
               (alx_tdi_signal.bandUp <= alx_tdi_LevelMiddle) &&
               (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelDown)
            )
         {
            if (tdi_rsiPriceLine_CROSS_tdi_LevelDown() < 6)
            {
               if (
                     (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
                     (tdi_rsiPriceLine_CROSS_tdi_LevelDown() < 3)
                  )
               {
                  Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 10 + 4));
                  return;
               }
               
               Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,411,(100 + 4));
               return;
            }
         }
         
         if (
               (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle)
            )
         {
            if (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle)
            {
               Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 20 + 4));
               return;
            }
            
            if (alx_tdi_signal.bandMiddle <= alx_tdi_LevelMiddle)
            {
               if (
                     (((alx_vlt_signal.val - alx_vlt_signal.diff) / alx_vlt_signal.threshold) < 2)
                  )
               {
                  if (
                        (tdi_rsiPriceLine_CROSS_tdi_bandUp() < 6) &&
                        (MathMin(sbs_alx_apb_HA_Open_data[2],sbs_alx_apb_HA_Close_data[2]) > alx_pac_signal.MMA_2)
                     )
                  {
                     Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 30 + 4));
                     return;
                  }
                  
                  if (
                        (tdi_rsiPriceLine_CROSS_lower_tdi_LevelDown_Middle(0.25) < 6) &&
                        (sbs_alx_tdi_rsiPriceLine_data[tdi_rsiPriceLine_CROSS_lower_tdi_LevelDown_Middle(0.25) + 1] < 
                           sbs_alx_tdi_bandMiddle_data[tdi_rsiPriceLine_CROSS_lower_tdi_LevelDown_Middle(0.25) + 1])
                     )
                  {
                     Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 40 + 4));
                     return;
                  }
               }
            }
         }
      }

//----------- BUY Subcase 5 ---/

      if (
//--- MA ---/         

            (High[1]  < alx_pac_signal.LMA_1) &&
            (Close[0] > alx_pac_signal.LMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff > ((0.5) * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,411,((100 * alx_apb_signal.allow_case) + 5));
         return;
      }

//----------- EOF BUY Subcases (same trends) ---/
   }
  
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_Bar1_Reversed ============/

void     Process_S2_Case_Bar1_Reversed()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Sell_Cases_Allowed()) && 
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
      )
   {
   
//----------- SELL Subcase 1 ---/

      if (
//--- MA ---/         

            (Low[1]  < alx_pac_signal.HMA_1) &&
            (Close[0] < alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold))    // was 0.5
            )
         )
      {
         if (
               (vlt_pre_flat_bars(alx_vlt_signal.threshold * 1.33) < 6) &&
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,312,((100 * alx_apb_signal.allow_case) + 10 + 1));
            return;
         }
      }

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Buy_Cases_Allowed()) &&  
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
      )
   {

//----------- BUY Subcase 1 ---/

      if (
//--- MA ---/         

            (High[1]  > alx_pac_signal.LMA_1) &&
            (Close[0] > alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.2) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold))    // was 0.5
            )
         )
      {
         if (
               (vlt_pre_flat_bars(alx_vlt_signal.threshold * 1.33) < 6) &&
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,412,((100 * alx_apb_signal.allow_case) + 10 + 1));
            return;
         }
      }

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_Bar2_Reversed ============/

void     Process_S2_Case_Bar2_Reversed()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Sell_Cases_Allowed()) &&  
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) 
         
      )
   {
   
//----------- SELL Subcase 1 ---/

      if (
//--- MA ---/         

            (High[2]  > alx_pac_signal.HMA_2) &&
            (Close[0] < alx_pac_signal.HMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.1) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold))    // was 0.5
            )
         )
      {
         if (
               (alx_ft_signal.trend    != NO_ORDER) &&
               (alx_ft_signal.trend_02 != NO_ORDER) &&
               (alx_ft_signal.bar    <= 5) &&
               (alx_ft_signal.bar_02 <= 5) &&
               
               (((alx_vlt_signal.val - alx_vlt_signal.diff) / alx_vlt_signal.threshold) > 0.8) &&
               
               (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,313,((100 * alx_apb_signal.allow_case) + 10 + 1));
            return;
         }
         
         if (
               (alx_ft_signal.trend    != NO_ORDER) &&
               (alx_ft_signal.trend_02 != NO_ORDER) &&
               (
                  (alx_ft_signal.bar    > 5) ||
                  (
                     (alx_ft_signal.bar    < 2) &&
                     (alx_ft_signal.bar_02 > 5)
                  )
               )
            )
         {
            if (
                  (sbs_alx_tdi_bandMiddle_data[0] < sbs_alx_tdi_bandMiddle_data[2]) &&
                  ((alx_vlt_signal.val - alx_vlt_signal.diff) < alx_vlt_signal.threshold) &&
                  (alx_vlt_signal.diff > ((0.5) * alx_vlt_signal.threshold)) &&
                  (alx_rf_signal.diff < ((-0.75) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit)))
               )
            {
               Set_SBS_ALX_Signal(SELL_ORDER,313,((100 * alx_apb_signal.allow_case) + 20 + 1));
               return;
            }
            
            if (
                  (sbs_alx_tdi_bandMiddle_data[0] >= sbs_alx_tdi_bandMiddle_data[2]) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandUp() < tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine())
               )
            {
               Set_SBS_ALX_Signal(SELL_ORDER,313,((100 * alx_apb_signal.allow_case) + 30 + 1));
               return;
            }
         }
      }

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Buy_Cases_Allowed()) && 
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
      )
   {

//----------- BUY Subcase 1 ---/

      if (
//--- MA ---/         

            (Low[2]   < alx_pac_signal.LMA_2) &&
            (Close[0] > alx_pac_signal.LMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.1) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > (0.33 * alx_vlt_signal.threshold))    // was 0.5
            )
         )
      {
          if (
               (alx_ft_signal.trend    != NO_ORDER) &&
               (alx_ft_signal.trend_02 != NO_ORDER) &&
               (alx_ft_signal.bar    <= 5) &&
               (alx_ft_signal.bar_02 <= 5) &&
               
               (((alx_vlt_signal.val - alx_vlt_signal.diff) / alx_vlt_signal.threshold) > 0.8) &&
               
               (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,413,((100 * alx_apb_signal.allow_case) + 10 + 1));
            return;
         }
         
         if (
               (alx_ft_signal.trend    != NO_ORDER) &&
               (alx_ft_signal.trend_02 != NO_ORDER) &&
               (
                  (alx_ft_signal.bar    > 5) ||
                  (
                     (alx_ft_signal.bar    < 2) &&
                     (alx_ft_signal.bar_02 > 5)
                  )
               )
            )
         {
            if (
                  (sbs_alx_tdi_bandMiddle_data[0] > sbs_alx_tdi_bandMiddle_data[2]) &&
                  ((alx_vlt_signal.val - alx_vlt_signal.diff) < alx_vlt_signal.threshold) &&
                  (alx_vlt_signal.diff > ((0.5) * alx_vlt_signal.threshold)) &&
                  (alx_rf_signal.diff > ((0.75) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit)))
               )
            {
               Set_SBS_ALX_Signal(BUY_ORDER,413,((100 * alx_apb_signal.allow_case) + 20 + 1));
               return;
            }
            
            if (
                  (sbs_alx_tdi_bandMiddle_data[0] <= sbs_alx_tdi_bandMiddle_data[2]) &&
                  (tdi_rsiPriceLine_CROSS_tdi_bandDown() < tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine())
               )
            {
               Set_SBS_ALX_Signal(BUY_ORDER,413,((100 * alx_apb_signal.allow_case) + 30 + 1));
               return;
            }
         }
      }

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_No_Bars_Reversed =========/

void     Process_S2_Case_No_Bars_Reversed()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Sell_Cases_Allowed()) && 
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) 
         
      )
   {
   
//----------- SELL Subcase 1 ---/

      if (
//--- MA ---/         

            (Close[0] < alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff < ((-0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
            (rf_Linear_Value_CROSS_rf_Upper_Limit() < 2) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > ((0.5) * alx_vlt_signal.threshold))  &&
               (vlt_val_CROSS_vlt_threshold() < 2)
            ) &&

//--- TDI ---/

            (tdi_rsiPriceLine_CROSS_tdi_bandUp() < tdi_rsiPriceLine_CROSS_tdi_bandDown()) &&
            (tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine() < tdi_rsiPriceLine_CROSS_tdi_bandUp())
            
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,314,((100 * alx_apb_signal.allow_case) + 1));
         return;
      }

//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Buy_Cases_Allowed()) && 
   
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
      )
   {

//----------- BUY Subcase 1 ---/

      if (
//--- MA ---/         

            (Close[0] > alx_pac_signal.MMA) &&

//--- RF ---/    
   
            (alx_rf_signal.diff > ((0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
            (rf_Linear_Value_CROSS_rf_Upper_Limit() < 2) &&
   
//--- VLT ---/

            (
               (alx_vlt_signal.diff > ((0.5) * alx_vlt_signal.threshold))  &&
               (vlt_val_CROSS_vlt_threshold() < 2)
            ) &&

//--- TDI ---/

            (tdi_rsiPriceLine_CROSS_tdi_bandUp() > tdi_rsiPriceLine_CROSS_tdi_bandDown()) &&
            (tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine() < tdi_rsiPriceLine_CROSS_tdi_bandDown())
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,414,((100 * alx_apb_signal.allow_case) + 1));
         return;
      }

//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_Bar1_Much_Shorter_Exit ===/

void     Process_S2_Case_Bar1_Much_Shorter_Exit()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

//         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER) ||
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER_F) 
         ) &&

//--- RF ---/    
   
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN)
      )
   {
//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_2_5 ---/

      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_2_5)
      {
         if (
               (Close[0] <= alx_dsr_signal.Resistance) &&
               (Close[0] >= alx_dsr_signal.SR_Mean) &&
               (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandUp)
            )
         {
            Set_SBS_ALX_Signal(SELL_ORDER,303,(100 + alx_vlt_signal.subcase));
            return;
         }
         
         if (
               (Close[0] > alx_dsr_signal.Resistance) &&
               ((MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1]) / 
                 MathAbs(sbs_alx_apb_HA_Close_data[2] - sbs_alx_apb_HA_Open_data[2])) 
                                            <= SBS_ALX_APB_SUPER_SHORTER)
            )
         {
            Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,303,(alx_vlt_signal.subcase));
            return;
         }
      }

//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_2_0 ---/
      
      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_2_0)
      {
         Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,303,alx_vlt_signal.subcase);
         return;
      }

//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_1_5 ---/
      
      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_1_5)
      {
         if (
               !(
                  (Close[0] <= alx_dsr_signal.Resistance) &&
                  (Close[0] >= alx_dsr_signal.Support) &&
                  
                  (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle) &&
                  (((alx_tdi_LevelUp - alx_tdi_signal.bandMiddle) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.7) &&
                  
                  (((alx_vlt_signal.val - alx_vlt_signal.diff) / alx_vlt_signal.threshold) < 2) &&
                  
                  (
                     (
                        (Close[0] >= alx_dsr_signal.SR_Mean) &&
                        (!dsr_channel_bounce_dn_Resistance())
                     ) ||
                     
                     (
                        (Close[0] < alx_dsr_signal.SR_Mean) &&
                        (!dsr_channel_bounce_dn_SR_Mean())
                     )
                  )
               )
            )
         {
            Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,303,alx_vlt_signal.subcase);
            return;
         }
      }

//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_1_0 ---/
      
      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_1_0)
      {
         if (
               (((alx_tdi_signal.bandMiddle - alx_tdi_LevelDown) / (alx_tdi_LevelMiddle - alx_tdi_LevelDown)) > 0.2)
            )
         {
            Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,303,alx_vlt_signal.subcase);
            return;
         }
      }
   }

//----------- EOF SELL Subcases ---/

//-------------------------- Check for BUY (Close SELL) ---------------/

   if (
//--- APB ---/

//         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER) ||
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER_F)
         ) &&

//--- RF ---/    
   
         (alx_rf_signal.direction == SBS_ALX_TREND_UP)
      )
   {
//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_2_5 ---/

      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_2_5)
      {
         if (
               (Close[0] >= alx_dsr_signal.Support) &&
               (Close[0] <= alx_dsr_signal.SR_Mean) &&
               (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandDown)
            )
         {
            Set_SBS_ALX_Signal(BUY_ORDER,403,(100 + alx_vlt_signal.subcase));
            return;
         }
         
         if (
               (Close[0] < alx_dsr_signal.Support) &&
               ((MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1]) / 
                 MathAbs(sbs_alx_apb_HA_Close_data[2] - sbs_alx_apb_HA_Open_data[2])) 
                                            <= SBS_ALX_APB_SUPER_SHORTER)
            )
         {
            Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,403,(alx_vlt_signal.subcase));
            return;
         }
      }
      
//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_2_0 ---/
      
      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_2_0)
      {
         Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,403,alx_vlt_signal.subcase);
         return;
      }

//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_1_5 ---/
      
      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_1_5)
      {
         if (
               !(
                  (Close[0] <= alx_dsr_signal.Resistance) &&
                  (Close[0] >= alx_dsr_signal.Support) &&
                  
                  (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle) &&
                  (((alx_tdi_signal.bandMiddle - alx_tdi_LevelDown) / (alx_tdi_LevelMiddle - alx_tdi_LevelDown)) < 0.7) &&
                  
                  (((alx_vlt_signal.val - alx_vlt_signal.diff) / alx_vlt_signal.threshold) < 2) &&
                  
                  (
                     (
                        (Close[0] >= alx_dsr_signal.SR_Mean) &&
                        (!dsr_channel_bounce_up_SR_Mean())
                     ) ||
                     
                     (
                        (Close[0] < alx_dsr_signal.SR_Mean) &&
                        (!dsr_channel_bounce_up_Support())
                     )
                  )
               )
            )
         {
            Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,403,alx_vlt_signal.subcase);
            return;
         }
      }

//--- VLT SBS_ALX_VLT_SUBCASE_WEAK_1_0 ---/
      
      if (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_1_0)
      {
         if (
               (((alx_tdi_LevelUp - alx_tdi_signal.bandMiddle) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) > 0.2)
            )
         {
            Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,403,alx_vlt_signal.subcase);
            return;
         }
      }
   }

//----------- EOF BUY Subcases ---/
   
//---------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_Bar2_Reversed_Exit =======/

void     Process_S2_Case_Bar2_Reversed_Exit()
{
//-------------------------- Check for SELL (Close BUY) ---------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&


//--- RF ---/    
   
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         (
            (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_BOUNCE_1_0)
         )
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,304,alx_vlt_signal.subcase);
      return;
   }

//----------- EOF SELL Subcases ---/

//-------------------------- Check for BUY (Close SELL) ---------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&

//--- RF ---/    
   
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/

         (
            (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_BOUNCE_1_0)
         )
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,404,alx_vlt_signal.subcase);
      return;
   }

//----------- EOF BUY Subcases ---/
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_After_Much_Shorter =======/

void     Process_S2_Case_After_Much_Shorter()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Sell_Cases_Allowed()) && 
         
//--- APB ---/
         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         (
            (alx_apb_signal.s2_case_32x  == SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER) ||
            (alx_apb_signal.s2_case_32x  == SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER_F)
         )
      )
   {
//----------- SELL Subcase 1 ---/

      if (
//--- RF ---/    
   
            (alx_rf_signal.subcase == SBS_ALX_RF_SUBCASE_BOUNCE_DN_LOWER) &&
            (alx_rf_signal.diff <= ((-0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff > (0.3 * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,321,(100 * alx_apb_signal.allow_case) + 1);
         return;
      }

//----------- SELL Subcase 2 ---/

      if (
//--- RF ---/    
   
            (alx_rf_signal.subcase == SBS_ALX_RF_SUBCASE_BOUNCE_DN_UPPER) &&
            (alx_rf_signal.diff <= ((-0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff > (0.3 * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,321,(100 * alx_apb_signal.allow_case) + 2);
         return;
      }

//----------- SELL Subcase 3 ---/

      if (
//--- RF ---/    

            (alx_rf_signal.diff <= ((-0.3) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/
            
            (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_BOUNCE_1_0) &&
            (alx_vlt_signal.diff > (0.3 * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,321,(100 * alx_apb_signal.allow_case) + 3);
         return;
      }
      
//----------- EOF SELL Subcases ---/
   }

//-------------------------- Check for BUY -----------------------------/

   if (
//--- APB ALLOWED ---/
         
         (S2_APB_Buy_Cases_Allowed()) && 
         
//--- APB ---/
         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         (
            (alx_apb_signal.s2_case_32x  == SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER) ||
            (alx_apb_signal.s2_case_32x  == SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER_F)
         )
      )
   {
//----------- BUY Subcase 1 ---/

      if (
//--- RF ---/    
   
            (alx_rf_signal.subcase == SBS_ALX_RF_SUBCASE_BOUNCE_UP_UPPER) &&
            (alx_rf_signal.diff >= ((0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff > (0.3 * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,421,(100 * alx_apb_signal.allow_case) + 1);
         return;
      }

//----------- BUY Subcase 2 ---/

      if (
//--- RF ---/    
   
            (alx_rf_signal.subcase == SBS_ALX_RF_SUBCASE_BOUNCE_UP_LOWER) &&
            (alx_rf_signal.diff >= ((0.5) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/

            (alx_vlt_signal.diff > (0.3 * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,421,(100 * alx_apb_signal.allow_case) + 2);
         return;
      }

//----------- BUY Subcase 3 ---/

      if (
//--- RF ---/    

            (alx_rf_signal.diff >= ((0.3) * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit))) &&
   
//--- VLT ---/
            
            (alx_vlt_signal.subcase == SBS_ALX_VLT_SUBCASE_WEAK_BOUNCE_1_0) &&
            (alx_vlt_signal.diff > (0.3 * alx_vlt_signal.threshold))
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,421,(100 * alx_apb_signal.allow_case) + 3);
         return;
      }
      
//----------- EOF BUY Subcases ---/
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== S2_APB_Sell_Cases_Alowed ====================/

bool     S2_APB_Sell_Cases_Allowed()
{
   if (S2_APB_Sell_Cases_Allowed_Classic())     // 1x, 2x
   {
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== S2_APB_Buy_Cases_Alowed =====================/

bool     S2_APB_Buy_Cases_Allowed()
{
   if (S2_APB_Buy_Cases_Allowed_Classic())     // 1x, 2x
   {
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== S2_APB_Sell_Cases_Alowed ====================/

bool     S2_APB_Sell_Cases_Allowed_Classic()
{
//-------------------------- Reset APB Allow Case Number -----------------/

   alx_apb_signal.allow_case = 0;

//-------------------------- Bounce from Pivot R3 ------------------------/

//-------------------------- Complex Checks ------------------------------/

//----------- Check SELL #1 ---/

   if (
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
            
//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
         (
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] > alx_stoch_mtf_signal.LevelUp) &&
               (sbs_alx_stoch_mtf_H4_Dline_data[1] > alx_stoch_mtf_signal.LevelUp)
            ) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] < alx_stoch_mtf_signal.LevelUp) &&
               (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1])
            )
         ) 

      )
   {
//----------- Subcase SELL #11 ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
            
//--- STOCH_MTF ---/

            (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Dline_data[1]) &&

//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.00 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 11;
         return(true);
      }

//----------- Subcase SELL #12 ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.25 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
//            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 12;
         return(true);
      }
//----------- Subcase SELL #13 ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.50 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) 
         
//            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
//            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] != EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 13;
         return(true);
      }

//----------- Subcase SELL #14 ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&


//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.75 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 14;
         return(true);
      }
   
   
   
//      alx_apb_signal.allow_case = 1;
//      return(true);
   }

//----------- Check SELL #2 ---/

   if (
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
            
//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_DOWN) &&
         (
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_DOWN) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] > alx_stoch_mtf_signal.LevelUp) &&
               (sbs_alx_stoch_mtf_H4_Dline_data[1] > alx_stoch_mtf_signal.LevelUp)
            ) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] < alx_stoch_mtf_signal.LevelUp) &&
               (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Dline_data[1])
            )
         ) 

      )
   {
//----------- Subcase SELL #21 ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] <= (0.75 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] <= (0.00 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  <= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[0] != EMPTY_VALUE)
//            (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[0] == EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 21;
         return(true);
      }
   
   
   
//      alx_apb_signal.allow_case = 2;
//      return(true);
   }

//----------- End of SELL Checks ---/

//------------------------------------------------------------------------/

   return(false);
}

//========================== S2_APB_Buy_Cases_Allowed_Classic ============/

bool     S2_APB_Buy_Cases_Allowed_Classic()
{
//-------------------------- Reset APB Allow Case Number -----------------/

   alx_apb_signal.allow_case = 0;

//-------------------------- Bounce from Pivot S3 ------------------------/

//-------------------------- Complex Checks ------------------------------/

//----------- Check BUY #1 ---/

   if (
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
            
//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
         (
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] < alx_stoch_mtf_signal.LevelDown) &&
               (sbs_alx_stoch_mtf_H4_Dline_data[1] < alx_stoch_mtf_signal.LevelDown)
            ) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] > alx_stoch_mtf_signal.LevelDown) &&
               (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1])
            )
         ) 

      )
   {
//----------- Subcase BUY #11 (H1NT, H4NT)---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
            
//--- STOCH_MTF ---/

            (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Dline_data[1]) &&

//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.00 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 11;
         return(true);
      }

//----------- Subcase BUY #12 (H4NT) ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.25 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
//            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 12;
         return(true);
      }
//----------- Subcase BUY #13 (ANY, ANY) ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiPriceLine_data[1]) &&

//--- TDI_04 ---/

            (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) &&

//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.50 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) 
         
//            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE) &&
//            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] != EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 13;
         return(true);
      }

//----------- Subcase BUY #14 (OT, OT) ---/

      if (
//--- TDI_MDL ---/

            (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&


//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.50 * alx_wcci_signal.LevelDown)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.75 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] == EMPTY_VALUE) &&
            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 14;
         return(true);
      }
   
   
   
//      alx_apb_signal.allow_case = 1;
//      return(true);
   }

//----------- Check BUY #2 ---/

   if (
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiPriceLine_data[1]) &&
            
//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP) &&
//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP) &&

//--- STOCH_MTF ---/

         (alx_stoch_mtf_signal.global_trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_stoch_mtf_signal.global_trend_H1  == SBS_ALX_TREND_UP) &&
         (
            (alx_stoch_mtf_signal.global_trend_H4  == SBS_ALX_TREND_UP) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] < alx_stoch_mtf_signal.LevelDown) &&
               (sbs_alx_stoch_mtf_H4_Dline_data[1] < alx_stoch_mtf_signal.LevelDown)
            ) ||
            (
               (sbs_alx_stoch_mtf_H4_Kline_data[1] > alx_stoch_mtf_signal.LevelDown) &&
               (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Dline_data[1])
            )
         ) 

      )
   {
//----------- Subcase BUY #21 (NT, ANY) ---/

      if (
//--- WCCI ---/

            (sbs_alx_wcci_H1_turboCCI_data[0] >= (0.75 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H1_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelUp)) &&
         
            (sbs_alx_wcci_H4_turboCCI_data[0] >= (0.00 * alx_wcci_signal.LevelUp)) &&
            (sbs_alx_wcci_H4_mainCCI_data[0]  >= (0.25 * alx_wcci_signal.LevelDown)) &&
         
            (sbs_alx_wcci_H1_azHistNonTrendCCI_data[0] != EMPTY_VALUE)
//            (sbs_alx_wcci_H4_azHistNonTrendCCI_data[0] == EMPTY_VALUE)
            
         )
      {
         alx_apb_signal.allow_case = 21;
         return(true);
      }
   
   
   
//      alx_apb_signal.allow_case = 2;
//      return(true);
   }

//----------- End of BUY Checks ---/

//------------------------------------------------------------------------/

   return(false);
}

//===================== eof sbs_order_alx_cases_lbr.mqh ==================/