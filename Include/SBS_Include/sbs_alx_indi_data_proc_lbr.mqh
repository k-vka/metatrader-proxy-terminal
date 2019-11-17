//================== sbs_alx_indi_data_proc_lbr.mqh ========================/

//=========================== Get_SBS_ALX_State() ==========================/

void     Get_SBS_ALX_State()
{
//-------------------------- Get MCDP State Data ---------------------------/

//   Get_ALX_MCDP_State();

//-------------------------- Get TDI State Data ----------------------------/

//   Get_ALX_TDI_State();

//-------------------------- Get PAC State & Rules -------------------------/
   
//   Get_ALX_PAC_State_and_Rules();

//-------------------------- Get TDI State & Rules -------------------------/
   
//   Get_ALX_TDI_State_and_Rules();

//-------------------------- Get APB State & Rules -------------------------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
      )
   {   
      Get_ALX_APB_State_and_Rules();
   }

//-------------------------- Get VLT State & Rules -------------------------/

//   Get_ALX_VLT_State_and_Rules();

//-------------------------- Get RF State & Rules --------------------------/

//   Get_ALX_RF_State_and_Rules();

//-------------------------- Get DSR State & Rules -------------------------/

//   Get_ALX_DSR_State_and_Rules();         // Standard rules, should be the last
//   Get_ALX_DSR_Close_State_and_Rules();   // Set rules for "order close" operations

//-------------------------- Get GMTS State & Rules ------------------------/

//   Get_ALX_GMTS_State_and_Rules();

//-------------------------- Get ASCTREND 4TF State & Rules ----------------/

//   Get_ALX_ASCTREND_4TF_State_and_Rules();

//-------------------------- Get STOCH_MTF State & Rules -------------------/

//   Get_ALX_STOCH_MTF_State_and_Rules();

//-------------------------- Get WCCI State & Rules ------------------------/

//   Get_ALX_WCCI_State_and_Rules();

//-------------------------- Get PIVOT State & Rules -----------------------/

//   Get_ALX_PIVOT_State_and_Rules();

//-------------------------- Get XST State & Rules -------------------------/

//   Get_ALX_XST_State_and_Rules();

//-------------------------- Get WDMI State & Rules ------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
   {
      Get_ALX_WDMI_State_and_Rules();
   }

//-------------------------- Get TMA State & Rules -------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_4H_PROFILE)
   {
      Get_ALX_TMA_State_and_Rules();      // run after XST
   }
   
   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
      )
   {
      Get_ALX_TMA_M1_State_and_Rules();   // run after XST
   }

//-------------------------- Get WPR State & Rules -------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE)
   {
      Get_ALX_WPR_M1_State_and_Rules();
   }

//-------------------------- Get KC State & Rules -------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE)
   {
      Get_ALX_KC_M1_State_and_Rules();
   }

//-------------------------- Get SSL State & Rules -------------------------/

//   Get_ALX_SSL_State_and_Rules();
   
//-------------------------- Get RSIOMA State & Rules ----------------------/

//   Get_ALX_RSIOMA_State_and_Rules();

//-------------------------- Get TSI_MACD State & Rules --------------------/

//   Get_ALX_TSI_MACD_State_and_Rules();

//-------------------------- ISLANDS State & Rules -------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
   {
      Get_ALX_ISLANDS_M1_State_and_Rules();
      
      Get_ALX_FXI3_SEMAFOR_M1_State_and_Rules();      // should be after Get_ALX_ISLANDS...
      
      Get_ALX_TREND_ZONE_M1_State_and_Rules();
   }

//-------------------------- PATTERNS State & Rules ------------------------/
   
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
//      Get_ALX_TREND_ZONE_M1_State_and_Rules();
      
      Get_ALX_FXI3_SEMAFOR_Patterns_State_and_Rules();
      
//      Get_ALX_DLRB_Channel_State_and_Rules();

//      Get_ALX_MIW_TREND_State_and_Rules();
      
//      Get_ALX_TREND_CCI_30_05_State_and_Rules();
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_MCDP_State() =========================/

void     Get_ALX_MCDP_State()
{
int      i;

//-------------------------- Reset MCDP State ------------------------------/

   alx_mcdp_signal.trend           = NO_ORDER;
   alx_mcdp_signal.bar = 0;

//-------------------------- Set Avg plus Diffs data -----------------------/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      sbs_alx_mcdp_Avg_plus_Diff_data[i] = sbs_alx_mcdp_Diff_UpAbove_data[i] +
                                           sbs_alx_mcdp_Diff_DnAbove_data[i] +
                                           sbs_alx_mcdp_Diff_UpBelow_data[i] +
                                           sbs_alx_mcdp_Diff_DnBelow_data[i];
   }

//-------------------------- Set Last MCDP Values (for Bar[0]) -------------/

   alx_mcdp_signal.Diff_UpAbove  = sbs_alx_mcdp_Diff_UpAbove_data[0];
   alx_mcdp_signal.Diff_DnAbove  = sbs_alx_mcdp_Diff_DnAbove_data[0];
   alx_mcdp_signal.Diff_UpBelow  = sbs_alx_mcdp_Diff_UpBelow_data[0];
   alx_mcdp_signal.Diff_DnBelow  = sbs_alx_mcdp_Diff_DnBelow_data[0];
   alx_mcdp_signal.Macd          = sbs_alx_mcdp_Macd_data[0];
   alx_mcdp_signal.Avg           = sbs_alx_mcdp_Avg_data[0];
   
   alx_mcdp_signal.Avg_plus_Diff = sbs_alx_mcdp_Avg_plus_Diff_data[0];

//-------------------------- Set Trend -------------------------------------/

   for (i = 1; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_alx_mcdp_Avg_plus_Diff_data[0] < sbs_alx_mcdp_Avg_plus_Diff_data[i])
      {
         alx_mcdp_signal.trend = SELL_ORDER;
         break;
      }
      
      if (sbs_alx_mcdp_Avg_plus_Diff_data[0] > sbs_alx_mcdp_Avg_plus_Diff_data[i])
      {
         alx_mcdp_signal.trend = BUY_ORDER;
         break;
      }
   }

//--- Trend was not defined ---/
   
   if (alx_mcdp_signal.trend == NO_ORDER)
   {
      return;
   }

//-------------------------- Set Trend Start Bar ---------------------------/

   if (alx_mcdp_signal.trend == SELL_ORDER)
   {
      for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (sbs_alx_mcdp_Avg_plus_Diff_data[i] > sbs_alx_mcdp_Avg_plus_Diff_data[i+1])
         {
            alx_mcdp_signal.bar = i;
            return;
         }
      }
      
      alx_mcdp_signal.bar = SBS_INDI_BARS_NO - 1;  // trend change was not found
      return;
   }
   
   if (alx_mcdp_signal.trend == BUY_ORDER)
   {
      for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (sbs_alx_mcdp_Avg_plus_Diff_data[i] < sbs_alx_mcdp_Avg_plus_Diff_data[i+1])
         {
            alx_mcdp_signal.bar = i;
            return;
         }
      }
      
      alx_mcdp_signal.bar = SBS_INDI_BARS_NO - 1;  // trend change was not found
      return;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_TDI_State() ==========================/

void     Get_ALX_TDI_State()
{
int      i;
int      bandMiddle_cross_bar;

//-------------------------- Reset TDI State -------------------------------/

   alx_tdi_signal.trend = NO_ORDER;
   alx_tdi_signal.bar   = 0;
   
   bandMiddle_cross_bar = SBS_INDI_BARS_NO - 1;

//-------------------------- Set Last TDI Values (for Bar[0]) --------------/

   alx_tdi_signal.bandUp        = sbs_alx_tdi_bandUp_data[0];
   alx_tdi_signal.bandMiddle    = sbs_alx_tdi_bandMiddle_data[0];
   alx_tdi_signal.bandDown      = sbs_alx_tdi_bandDown_data[0];
   alx_tdi_signal.rsiPriceLine  = sbs_alx_tdi_rsiPriceLine_data[0];
   alx_tdi_signal.rsiSignalLine = sbs_alx_tdi_rsiSignalLine_data[0];
   
//-------------------------- Check Entry Condition -------------------------/

//--- Check for BUY Signal ---/

   if (
         (alx_tdi_signal.trend == NO_ORDER) &&
         
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelMiddle)
         
//         (sbs_alx_tdi_rsiPriceLine_data[1] > sbs_alx_tdi_rsiSignalLine_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] > sbs_alx_tdi_bandMiddle_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] > alx_tdi_LevelMiddle)
      )
   {
      alx_tdi_signal.trend = BUY_ORDER;
   }

//--- Check for SELL Signal ---/

   if (
         (alx_tdi_signal.trend == NO_ORDER) &&
         
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelMiddle)
         
//         (sbs_alx_tdi_rsiPriceLine_data[1] < sbs_alx_tdi_rsiSignalLine_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] < sbs_alx_tdi_bandMiddle_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] < alx_tdi_LevelMiddle)
      )
   {
      alx_tdi_signal.trend = SELL_ORDER;
   }
   
//--- Get bandMiddle_cross_bar ---/

   if (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle)
   {
      for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (
               (sbs_alx_tdi_rsiPriceLine_data[i]   >  sbs_alx_tdi_bandMiddle_data[i]) &&
               (sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_bandMiddle_data[i+1])
            )
         {
            bandMiddle_cross_bar = i;
            break;
         }
      }
   }
   
   if (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle)
   {
      for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (
               (sbs_alx_tdi_rsiPriceLine_data[i]   <  sbs_alx_tdi_bandMiddle_data[i]) &&
               (sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_bandMiddle_data[i+1])
            )
         {
            bandMiddle_cross_bar = i;
            break;
         }
      }
   }


//--- Check for CLOSE_SELL & CLOSE_BUY Signals ---/

//--- check if rsiPriceLine is inside band ---/

   if (
         (alx_tdi_signal.rsiPriceLine >= alx_tdi_signal.bandUp) ||
         (alx_tdi_signal.rsiPriceLine <= alx_tdi_signal.bandDown)
      )
   {
      return;
   }

//--- check for CLOSE signals ---/
   
   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (
            (sbs_alx_tdi_rsiPriceLine_data[i]   <  sbs_alx_tdi_bandUp_data[i]) &&
            (sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_bandUp_data[i+1])
         )
      {
         if (
               (alx_tdi_signal.trend == BUY_ORDER)
            )
         {
            if (bandMiddle_cross_bar >= i)
            {
               alx_tdi_signal.trend = CLOSE_BUY_ORDER;
               alx_tdi_signal.bar   = i;
            }
            
            return;
         }
         
         if (bandMiddle_cross_bar >= i)
         {
            alx_tdi_signal.trend = CLOSE_BUY_ORDER;
            alx_tdi_signal.bar   = i;
         }
            
         return;
      }
      
      if (
            (sbs_alx_tdi_rsiPriceLine_data[i]   >  sbs_alx_tdi_bandDown_data[i]) &&
            (sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_bandDown_data[i+1])
         )
      {
         if (
               (alx_tdi_signal.trend == SELL_ORDER)
            )
         {
            if (bandMiddle_cross_bar >= i)
            {
               alx_tdi_signal.trend = CLOSE_SELL_ORDER;
               alx_tdi_signal.bar   = i;
            }
            
            return;
         }
         
         if (bandMiddle_cross_bar >= i)
         {
            alx_tdi_signal.trend = CLOSE_SELL_ORDER;
            alx_tdi_signal.bar   = i;
         }
            
         return;
      }
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_PAC_State_and_Rules() ================/

void     Get_ALX_PAC_State_and_Rules()
{
//--------------------------- Reset PAC State & Rules ----------------------/

   alx_pac_signal.trend = SBS_ALX_TREND_NONE;
   
   alx_pac_signal.Long_Basic_Exit = false;
   alx_pac_signal.Short_Basic_Exit = false;

//--------------------------- Check PAC High Moving Average Trending -------/
   
   if (alx_pac_signal.MMA > alx_pac_signal.MMA_1)
   {
      alx_pac_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (alx_pac_signal.MMA < alx_pac_signal.MMA_1)
   {
      alx_pac_signal.trend = SBS_ALX_TREND_DOWN;
   }

//--------------------------- Check PAC CLOSE (Long & Short Basic Exit) ----/

   if (
         (sbs_alx_apb_HA_Close_data[1] < alx_pac_signal.HMA_1) &&
         (sbs_alx_apb_HA_Close_data[1] > alx_pac_signal.LMA_1)
      )
   {
      alx_pac_signal.Long_Basic_Exit  = true;
      alx_pac_signal.Short_Basic_Exit = true;
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_TDI_State_and_Rules() ================/

void     Get_ALX_TDI_State_and_Rules()
{
int      i;

//--------------------------- Reset TDI State & Rules ----------------------/

   alx_tdi_signal.trend            = NO_ORDER;
   alx_tdi_signal.bar              = 0;
   alx_tdi_signal.bandMiddle_trend = SBS_ALX_TREND_NONE;
   alx_tdi_signal.bar_shift_04     = 1;

//--- Entry Rules ---/

   alx_tdi_signal.Long_Basic_Entry       = false;
   alx_tdi_signal.Short_Basic_Entry      = false;
   
   alx_tdi_signal.Long_Extra_Band_Entry  = false;
   alx_tdi_signal.Short_Extra_Band_Entry = false;

//--- Entry Conditions ---/

   alx_tdi_signal.Long_Basic_Entry_Consider_01  = false;
   alx_tdi_signal.Long_Basic_Entry_Avoid_01     = false;

   alx_tdi_signal.Short_Basic_Entry_Consider_01 = false;
   alx_tdi_signal.Short_Basic_Entry_Avoid_01    = false;

//--- Exit Rules ---/

   alx_tdi_signal.Long_Basic_Exit  = false;
   alx_tdi_signal.Short_Basic_Exit = false;

//--- S2 Entry Rules ---/

   alx_tdi_signal.S2_G_Cross_B_BUY_Rule  = false;
   alx_tdi_signal.S2_G_Cross_B_SELL_Rule = false;
   
//--- RSI Frame Data ---/

   alx_tdi_signal.rsi_frame_start        = SBS_INDI_BARS_NO;
   alx_tdi_signal.rsi_frame_end          = SBS_INDI_BARS_NO;
   alx_tdi_signal.rsi_frame_trend        = SBS_ALX_TREND_NONE;

//-------------------------- Set Last TDI Values (for Bar[0]) --------------/

   alx_tdi_signal.bandUp        = sbs_alx_tdi_bandUp_data[0];
   alx_tdi_signal.bandMiddle    = sbs_alx_tdi_bandMiddle_data[0];
   alx_tdi_signal.bandDown      = sbs_alx_tdi_bandDown_data[0];
   alx_tdi_signal.rsiPriceLine  = sbs_alx_tdi_rsiPriceLine_data[0];
   alx_tdi_signal.rsiSignalLine = sbs_alx_tdi_rsiSignalLine_data[0];

//-------------------------- Set TDI bandMiddle_trend ----------------------/

   if (sbs_alx_tdi_bandMiddle_data[0] > sbs_alx_tdi_bandMiddle_data[1])
   {
      alx_tdi_signal.bandMiddle_trend = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_tdi_bandMiddle_data[0] < sbs_alx_tdi_bandMiddle_data[1])
   {
      alx_tdi_signal.bandMiddle_trend = SBS_ALX_TREND_DOWN;
   }

//--------------------------- Set TDI 04 bar_shift_04 ----------------------/
   
   switch (Period()) 
   {
      case PERIOD_H4:   {alx_tdi_signal.bar_shift_04 =   1; break;}
      case PERIOD_H1:   {alx_tdi_signal.bar_shift_04 =   4; break;}
      case PERIOD_M30:  {alx_tdi_signal.bar_shift_04 =   8; break;}
      case PERIOD_M15:  {alx_tdi_signal.bar_shift_04 =  16; break;}
      case PERIOD_M5:   {alx_tdi_signal.bar_shift_04 =  48; break;}
      case PERIOD_M1:   {alx_tdi_signal.bar_shift_04 = 240; break;}
   }

//--------------------------- Check TDI Basic_Entry Rule -------------------/

//--- Check for BUY (Long) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelMiddle)
      )
   {
      alx_tdi_signal.Long_Basic_Entry  = true;
   }

//--- Check for SELL (Short) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelMiddle)
      )
   {
      alx_tdi_signal.Short_Basic_Entry = true;
   }

//--------------------------- Check TDI Extra_Band Rule --------------------/

//--- Check for BUY (Long) Rule ---/

   if (
         (alx_tdi_signal.bandUp < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandUp)
      )
   {
      alx_tdi_signal.Long_Extra_Band_Entry  = true;
   }

//--- Check for SELL (Short) Rule ---/

   if (
         (alx_tdi_signal.bandDown > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandDown)
      )
   {
      alx_tdi_signal.Short_Extra_Band_Entry = true;
   }

//--------------------------- Check TDI S2 Green/Blue Cross Rule ----------/

//--- Check for BUY (Long) Rule ---/

   if (
//         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_rsiSignalLine()) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_bandDown())
      )
   {
      alx_tdi_signal.S2_G_Cross_B_BUY_Rule  = true;
   }

//--- Check for SELL (Short) Rule ---/

   if (
//         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_rsiSignalLine()) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_bandUp())
      )
   {
      alx_tdi_signal.S2_G_Cross_B_SELL_Rule = true;
   }

//--------------------------- Check TDI Basic_Entry_Consider_01 Rule -------/

//--- Check for BUY (Long) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandUp) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelUp)
      )
   {
      alx_tdi_signal.Long_Basic_Entry_Consider_01  = true;
   }

//--- Check for SELL (Short) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandDown) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelDown)
      )
   {
      alx_tdi_signal.Short_Basic_Entry_Consider_01  = true;
   }

//--------------------------- Check TDI Basic_Entry_Avoid_01 Rule -------/

//--- Check for BUY (Long) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandUp) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelUp)
      )
   {
      alx_tdi_signal.Long_Basic_Entry_Avoid_01  = true;
   }

//--- Check for SELL (Short) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandDown) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelDown)
      )
   {
      alx_tdi_signal.Short_Basic_Entry_Avoid_01  = true;
   }

//--------------------------- Check TDI Basic_Exit Rule -------------------/

//--- Check for CLOSE_BUY (Long Exit) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandUp) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         
//         (sbs_alx_tdi_rsiPriceLine_data[1] < sbs_alx_tdi_rsiSignalLine_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] < sbs_alx_tdi_bandUp_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] > sbs_alx_tdi_bandMiddle_data[1]) &&
         
         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_rsiSignalLine()) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_bandUp())
      )
   {
      alx_tdi_signal.Long_Basic_Exit = true;
   }

//--- Check for CLOSE_SELL (Short Exit) Rule ---/

   if (
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandDown) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//         (sbs_alx_tdi_rsiPriceLine_data[1] > sbs_alx_tdi_rsiSignalLine_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] > sbs_alx_tdi_bandUp_data[1]) &&
//         (sbs_alx_tdi_rsiPriceLine_data[1] < sbs_alx_tdi_bandMiddle_data[1]) &&
         
         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_rsiSignalLine()) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandMiddle() > tdi_rsiPriceLine_CROSS_tdi_bandDown())
      )
   {
      alx_tdi_signal.Short_Basic_Exit = true;
   }

//--------------------------- Collect RSI Frame Data -----------------------/

//--- RSI Frame Trend ---/

   if (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine)
   {
      alx_tdi_signal.rsi_frame_trend = SBS_ALX_TREND_DOWN;
   }
   
   if (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine)
   {
      alx_tdi_signal.rsi_frame_trend = SBS_ALX_TREND_UP;
   }

//--- RSI Frame Start ---/

   if (alx_tdi_signal.rsi_frame_trend == SBS_ALX_TREND_DOWN)
   {
      for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (sbs_alx_tdi_rsiPriceLine_data[i+1] > sbs_alx_tdi_rsiSignalLine_data[i+1])
         {
            alx_tdi_signal.rsi_frame_start = i;
            break;
         }
      }
   }
   
   if (alx_tdi_signal.rsi_frame_trend == SBS_ALX_TREND_UP)
   {
      for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (sbs_alx_tdi_rsiPriceLine_data[i+1] < sbs_alx_tdi_rsiSignalLine_data[i+1])
         {
            alx_tdi_signal.rsi_frame_start = i;
            break;
         }
      }
   }

//--- RSI Frame End ---/

   if (
         (alx_tdi_signal.rsi_frame_trend == SBS_ALX_TREND_DOWN) &&
         (alx_tdi_signal.rsi_frame_start < (SBS_INDI_BARS_NO - 1))
      )
   {
      for(i = (alx_tdi_signal.rsi_frame_start + 1); i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if ((sbs_alx_tdi_rsiPriceLine_data[i] - sbs_alx_tdi_rsiSignalLine_data[i]) > 2)
         {
            alx_tdi_signal.rsi_frame_end = i;
            break;
         }
      }
   }
   
   if (
         (alx_tdi_signal.rsi_frame_trend == SBS_ALX_TREND_UP) &&
         (alx_tdi_signal.rsi_frame_start < (SBS_INDI_BARS_NO - 1))
      )
   {
      for(i = (alx_tdi_signal.rsi_frame_start + 1); i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if ((sbs_alx_tdi_rsiSignalLine_data[i] - sbs_alx_tdi_rsiPriceLine_data[i]) > 2)
         {
            alx_tdi_signal.rsi_frame_end = i;
            break;
         }
      }
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_APB_State_and_Rules() ================/

void     Get_ALX_APB_State_and_Rules()
{
//--------------------------- Reset APB State & Rules ----------------------/

   alx_apb_signal.bar_00_trend = SBS_ALX_APB_BAR_TREND_NONE;
   alx_apb_signal.bar_01_trend = SBS_ALX_APB_BAR_TREND_NONE;
   alx_apb_signal.bar_02_trend = SBS_ALX_APB_BAR_TREND_NONE;
   alx_apb_signal.s2_case      = SBS_ALX_APB_S2_CASE_NONE;
   alx_apb_signal.s2_case_32x  = SBS_ALX_APB_S2_CASE_NONE;

   alx_apb_signal.Long_Basic_Exit  = false;
   alx_apb_signal.Short_Basic_Exit = false;
   
//--------------------------- Get APB bar trends (for bar 0, 1 & 2) -------/

//--- For Bar 0 ---/

   if (sbs_alx_apb_HA_Close_data[0] > sbs_alx_apb_HA_Open_data[0])
   {
      alx_apb_signal.bar_00_trend = SBS_ALX_APB_BAR_TREND_POSITIVE;
   }
   
   if (sbs_alx_apb_HA_Close_data[0] < sbs_alx_apb_HA_Open_data[0])
   {
      alx_apb_signal.bar_00_trend = SBS_ALX_APB_BAR_TREND_NEGATIVE;
   }
   
//--- For Bar 1 ---/

   if (sbs_alx_apb_HA_Close_data[1] > sbs_alx_apb_HA_Open_data[1])
   {
      alx_apb_signal.bar_01_trend = SBS_ALX_APB_BAR_TREND_POSITIVE;
   }
   
   if (sbs_alx_apb_HA_Close_data[1] < sbs_alx_apb_HA_Open_data[1])
   {
      alx_apb_signal.bar_01_trend = SBS_ALX_APB_BAR_TREND_NEGATIVE;
   }

//--- For Bar 2 ---/

   if (sbs_alx_apb_HA_Close_data[2] > sbs_alx_apb_HA_Open_data[2])
   {
      alx_apb_signal.bar_02_trend = SBS_ALX_APB_BAR_TREND_POSITIVE;
   }
   
   if (sbs_alx_apb_HA_Close_data[2] < sbs_alx_apb_HA_Open_data[2])
   {
      alx_apb_signal.bar_02_trend = SBS_ALX_APB_BAR_TREND_NEGATIVE;
   }

//--------------------------- Check APB S2 States & Rules ------------------/

//--------------------------- Check APB CLOSE_BUY (Long Basic Exit) -------/
   
   if (
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
      )
   {
      if (
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_CASE_NONE) &&
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
            (((sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1]) / 
              (sbs_alx_apb_HA_Close_data[2] - sbs_alx_apb_HA_Open_data[2])) 
                                            < SBS_ALX_APB_BAR_MUCH_SHORTER)
         )
      {
         alx_apb_signal.Long_Basic_Exit  = true;
         alx_apb_signal.s2_case  = SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER;
      }
      
      if (
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_CASE_NONE) &&
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
            ((MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1]) / 
              (sbs_alx_apb_HA_Close_data[2] - sbs_alx_apb_HA_Open_data[2])) 
                                            < SBS_ALX_APB_BAR_MUCH_SHORTER)
         )
      {
         alx_apb_signal.Long_Basic_Exit  = true;
         alx_apb_signal.s2_case  = SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER_F;
      }
      
      if (
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
         )
      {
         alx_apb_signal.Long_Basic_Exit  = true;
      }
   }

//--------------------------- Check APB CLOSE_SELL (Short Basic Exit) -----/
   
   if (
         (alx_apb_signal.bar_02_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
      )
   {
      if (
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_CASE_NONE) &&
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
            (((sbs_alx_apb_HA_Open_data[1] - sbs_alx_apb_HA_Close_data[1]) / 
              (sbs_alx_apb_HA_Open_data[2] - sbs_alx_apb_HA_Close_data[2])) 
                                            < SBS_ALX_APB_BAR_MUCH_SHORTER)
         )
      {
         alx_apb_signal.Short_Basic_Exit  = true;
         alx_apb_signal.s2_case  = SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER;
      }
      
      if (
            (alx_apb_signal.s2_case == SBS_ALX_APB_S2_CASE_NONE) &&
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
            ((MathAbs(sbs_alx_apb_HA_Open_data[1] - sbs_alx_apb_HA_Close_data[1]) / 
              (sbs_alx_apb_HA_Open_data[2] - sbs_alx_apb_HA_Close_data[2])) 
                                            < SBS_ALX_APB_BAR_MUCH_SHORTER)
         )
      {
         alx_apb_signal.Short_Basic_Exit  = true;
         alx_apb_signal.s2_case  = SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER_F;
      }
      
      if (
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
         )
      {
         alx_apb_signal.Short_Basic_Exit  = true;
      }
   }

//--------------------------- SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER ---/

   if (
         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
      )
   {
      if (
            (alx_apb_signal.s2_case_32x == SBS_ALX_APB_S2_CASE_NONE) &&
            
            ((MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1]) / 
              MathAbs(sbs_alx_apb_HA_Close_data[0] - sbs_alx_apb_HA_Open_data[0])) 
                                            < SBS_ALX_APB_AFTER_MUCH_SHORTER)
         )
      {
         alx_apb_signal.s2_case_32x = SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER;
      }
      
      if (
            (alx_apb_signal.s2_case_32x == SBS_ALX_APB_S2_CASE_NONE) &&
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
            
            ((MathAbs(sbs_alx_apb_HA_Close_data[2] - sbs_alx_apb_HA_Open_data[2]) / 
              MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1])) 
                                            < SBS_ALX_APB_AFTER_MUCH_SHORTER)
         )
      {
         alx_apb_signal.s2_case_32x = SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER_F;
      }

   }

//--------------------------- SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER ---/

   if (
         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
      )
   {
      if (
            (alx_apb_signal.s2_case_32x == SBS_ALX_APB_S2_CASE_NONE) &&
            
            ((MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1]) / 
              MathAbs(sbs_alx_apb_HA_Close_data[0] - sbs_alx_apb_HA_Open_data[0])) 
                                            < SBS_ALX_APB_AFTER_MUCH_SHORTER)
         )
      {
         alx_apb_signal.s2_case_32x = SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER;
      }
      
      if (
            (alx_apb_signal.s2_case_32x == SBS_ALX_APB_S2_CASE_NONE) &&
            (alx_apb_signal.bar_01_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
            
            ((MathAbs(sbs_alx_apb_HA_Close_data[2] - sbs_alx_apb_HA_Open_data[2]) / 
              MathAbs(sbs_alx_apb_HA_Close_data[1] - sbs_alx_apb_HA_Open_data[1])) 
                                            < SBS_ALX_APB_AFTER_MUCH_SHORTER)
         )
      {
         alx_apb_signal.s2_case_32x = SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER_F;
      }

   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_VLT_State_and_Rules() ================/

void     Get_ALX_VLT_State_and_Rules()
{
int      i;
int      j;

//--------------------------- Reset VLT State & Rules ----------------------/

   alx_vlt_signal.trend     = SBS_ALX_TREND_NONE;
   alx_vlt_signal.threshold = 0;
   alx_vlt_signal.cross_bar = SBS_INDI_BARS_NO - 1;
   alx_vlt_signal.direction = SBS_ALX_TREND_NONE;
   alx_vlt_signal.diff      = 0;
   alx_vlt_signal.val       = EMPTY_VALUE;
   
   alx_vlt_signal.trigger          = 0.5;
   alx_vlt_signal.height           = 0;
   alx_vlt_signal.bounce_deviation = 0;
   alx_vlt_signal.subcase          = SBS_ALX_VLT_SUBCASE_NONE;
   
//--------------------------- Set VLT cross threshold (red line) & trigger -/
   
   switch (Period()) 
   {
      case PERIOD_MN1:  {alx_vlt_signal.threshold = 0.005;  break;}
      case PERIOD_W1:   {alx_vlt_signal.threshold = 0.005;  break;}
      case PERIOD_D1:   {alx_vlt_signal.threshold = 0.005;  break;}
      case PERIOD_H4:   {alx_vlt_signal.threshold = 0.0014; break;}
      case PERIOD_H1:   {alx_vlt_signal.threshold = 0.0008; break;}
      case PERIOD_M30:  {alx_vlt_signal.threshold = 0.0006; break;}
      case PERIOD_M15:  {
                           alx_vlt_signal.threshold = 0.0004; 
                           
                           if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_PROFILE)
                           {
                              alx_vlt_signal.threshold = 0.0003;
                           }
                           
                           break;
                        }
      case PERIOD_M5:   {alx_vlt_signal.threshold = 0.0002; break;}
      case PERIOD_M1:   {alx_vlt_signal.threshold = 0.0001; break;}
   }
   
   alx_vlt_signal.trigger = 0.5 / 0.0014 * alx_vlt_signal.threshold;
   alx_vlt_signal.bounce_deviation = 0.2 / 0.0014 * alx_vlt_signal.threshold;
   
//--------------------------- Set VLT current value (bar 0) ----------------/
   
   alx_vlt_signal.val = sbs_alx_vlt_data[0];

//--------------------------- Global Trend parameters ----------------------/

   alx_vlt_signal.g_trend           = SBS_ALX_TREND_NONE;
   alx_vlt_signal.g_trend_diff      = 0;
   alx_vlt_signal.g_trend_md_diff   = 0;
   alx_vlt_signal.g_trend_step      = 1 * alx_vlt_signal.threshold;
   alx_vlt_signal.g_extremum_bar    = 0;
   alx_vlt_signal.g_md_extremum_bar = 0;

//--------------------------- Check VLT trend (just for FLAT) --------------/

   if (alx_vlt_signal.val <= alx_vlt_signal.threshold)
   {
      alx_vlt_signal.trend = SBS_ALX_TREND_FLAT;
   }

//--------------------------- Set VLT cross_bar ----------------------------/
   
   alx_vlt_signal.cross_bar = vlt_val_CROSS_vlt_threshold();
   
//--------------------------- Check VLT trend direction --------------------/

   if (sbs_alx_vlt_data[0] > sbs_alx_vlt_data[1])
   {
      alx_vlt_signal.direction = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_vlt_data[0] < sbs_alx_vlt_data[1])
   {
      alx_vlt_signal.direction = SBS_ALX_TREND_DOWN;
   }

//--------------------------- Get VLT diff ---------------------------------/

//--- Get first not zero diff ---/

   for (i = 1; i < (SBS_INDI_BARS_NO - 2); i++)
   {
      alx_vlt_signal.diff = sbs_alx_vlt_data[0] - sbs_alx_vlt_data[i];

      if (alx_vlt_signal.diff != 0)
      {
         j = i;
         break;
      }
   }
   
//--- Get final diff ---/   

   for (i = j; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (alx_vlt_signal.diff < 0)
      {
         if (
               (sbs_alx_vlt_data[i+1] >= sbs_alx_vlt_data[i])
            )
         {
            alx_vlt_signal.diff = sbs_alx_vlt_data[0] - sbs_alx_vlt_data[i+1];
         }
         else
         {
            break;
         }
      }
      
      if (alx_vlt_signal.diff > 0)
      {
         if (
               (sbs_alx_vlt_data[i+1] <= sbs_alx_vlt_data[i])
            )
         {
            alx_vlt_signal.diff = sbs_alx_vlt_data[0] - sbs_alx_vlt_data[i+1];
         }
         else
         {
            break;
         }
      }   
   }

//--------------------------- Get VLT height -------------------------------/

   alx_vlt_signal.height = alx_vlt_signal.val / alx_vlt_signal.threshold;

//--------------------------- Get VLT subcase ------------------------------/

   if (
         (alx_vlt_signal.height <= 2.5) &&
         (alx_vlt_signal.height >  2.0) &&
         
         (alx_vlt_signal.diff < ((-1) * alx_vlt_signal.trigger * alx_vlt_signal.threshold))
      )
   {
      alx_vlt_signal.subcase = SBS_ALX_VLT_SUBCASE_WEAK_2_5;
   }
   
   if (
         (alx_vlt_signal.height <= 2.0) &&
         (alx_vlt_signal.height >  1.5) &&
         
         (alx_vlt_signal.diff < ((-0.5) * alx_vlt_signal.trigger * alx_vlt_signal.threshold))
      )
   {
      alx_vlt_signal.subcase = SBS_ALX_VLT_SUBCASE_WEAK_2_0;
   }
   
   if (
         (alx_vlt_signal.height <= 1.5) &&
         (alx_vlt_signal.height >  1.0) &&
         
         (alx_vlt_signal.diff < ((-0.25) * alx_vlt_signal.trigger * alx_vlt_signal.threshold))
      )
   {
      alx_vlt_signal.subcase = SBS_ALX_VLT_SUBCASE_WEAK_1_5;
   }
   
   if (
         (alx_vlt_signal.height <= 1.0) &&
         
         (sbs_alx_vlt_data[0] <= sbs_alx_vlt_data[1])
      )
   {
      alx_vlt_signal.subcase = SBS_ALX_VLT_SUBCASE_WEAK_1_0;
   }
   
   if (
         (vlt_min_value(3)    <= (alx_vlt_signal.threshold + alx_vlt_signal.bounce_deviation)) &&
         (sbs_alx_vlt_data[0] >= alx_vlt_signal.threshold) &&
         (sbs_alx_vlt_data[0] >  sbs_alx_vlt_data[1])
      )
   {
      alx_vlt_signal.subcase = SBS_ALX_VLT_SUBCASE_WEAK_BOUNCE_1_0;
   }

//--------------------------- Get Global Trend Parameters ------------------/

   for (i = 1; i < SBS_INDI_BARS_NO; i++)
   {
      if (MathAbs(sbs_alx_vlt_data[i] - alx_vlt_signal.val) >= alx_vlt_signal.g_trend_step)
      {
         j = i;
         alx_vlt_signal.g_extremum_bar = i;
         break;
      }
   }

//--- g_trend ---/

   if (sbs_alx_vlt_data[j] > alx_vlt_signal.val)
   {
      alx_vlt_signal.g_trend = SBS_ALX_TREND_DOWN;
   }
   
   if (sbs_alx_vlt_data[j] < alx_vlt_signal.val)
   {
      alx_vlt_signal.g_trend = SBS_ALX_TREND_UP;
   }

//--- g_extremum_bar ---/
   
   if (alx_vlt_signal.g_trend == SBS_ALX_TREND_DOWN)
   {
      for (i = (j + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_vlt_data[i] > sbs_alx_vlt_data[alx_vlt_signal.g_extremum_bar])
         {
            alx_vlt_signal.g_extremum_bar = i;
            continue;
         }
         
         if ((sbs_alx_vlt_data[alx_vlt_signal.g_extremum_bar] - sbs_alx_vlt_data[i]) >= alx_vlt_signal.g_trend_step)
         {
            break;
         }
      }
   }
   
   if (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP)
   {
      for (i = (j + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_vlt_data[i] < sbs_alx_vlt_data[alx_vlt_signal.g_extremum_bar])
         {
            alx_vlt_signal.g_extremum_bar = i;
            continue;
         }
         
         if ((sbs_alx_vlt_data[i] - sbs_alx_vlt_data[alx_vlt_signal.g_extremum_bar]) >= alx_vlt_signal.g_trend_step)
         {
            break;
         }
      }
   }

//--- g_md_extremum_bar ---/

   if (alx_vlt_signal.g_trend == SBS_ALX_TREND_DOWN)
   {
      for (i = 0; i <= alx_vlt_signal.g_extremum_bar; i++)
      {
         if (sbs_alx_vlt_data[i] < sbs_alx_vlt_data[alx_vlt_signal.g_md_extremum_bar])
         {
            alx_vlt_signal.g_md_extremum_bar =  i;
         }
      }
   }
   
   if (alx_vlt_signal.g_trend == SBS_ALX_TREND_UP)
   {
      for (i = 0; i <= alx_vlt_signal.g_extremum_bar; i++)
      {
         if (sbs_alx_vlt_data[i] > sbs_alx_vlt_data[alx_vlt_signal.g_md_extremum_bar])
         {
            alx_vlt_signal.g_md_extremum_bar =  i;
         }
      }
   }
   
//--- g_trend_diff ---/
   
   alx_vlt_signal.g_trend_diff = sbs_alx_vlt_data[alx_vlt_signal.g_md_extremum_bar] - sbs_alx_vlt_data[alx_vlt_signal.g_extremum_bar];
   
//--- g_trend_md_diff ---/  
   
   alx_vlt_signal.g_trend_md_diff = sbs_alx_vlt_data[0] - sbs_alx_vlt_data[alx_vlt_signal.g_md_extremum_bar];
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_RF_State_and_Rules() =================/

void     Get_ALX_RF_State_and_Rules()
{
int      i;
int      j;
int      c_bar_upper;
int      c_bar_lower;
int      flat_bars;

//--------------------------- Reset RF State & Rules -----------------------/

   alx_rf_signal.trend     = SBS_ALX_TREND_NONE;
   alx_rf_signal.cross_bar = SBS_INDI_BARS_NO - 1;
   alx_rf_signal.direction = SBS_ALX_TREND_NONE;
   alx_rf_signal.diff      = 0;
   
   flat_bars = 4;

//--------------------------- Set RF Bar 0 Values --------------------------/

   alx_rf_signal.Linear_Value = sbs_alx_rf_Linear_Value_data[0];
   alx_rf_signal.Upper_Limit  = sbs_alx_rf_Upper_Limit_data[0];
   alx_rf_signal.Lower_Limit  = sbs_alx_rf_Lower_Limit_data[0];

//--------------------------- Operation parameters -------------------------/

   alx_rf_signal.subcase           = SBS_ALX_RF_SUBCASE_NONE;
   alx_vlt_signal.trigger          = 0.2 * (sbs_alx_rf_Upper_Limit_data[0] - sbs_alx_rf_Lower_Limit_data[0]);
   alx_vlt_signal.bounce_deviation = 0.2 * (sbs_alx_rf_Upper_Limit_data[0] - sbs_alx_rf_Lower_Limit_data[0]);

//--------------------------- Global Trend parameters ----------------------/

   alx_rf_signal.g_trend           = SBS_ALX_TREND_NONE;
   alx_rf_signal.g_trend_diff      = 0;
   alx_rf_signal.g_trend_md_diff   = 0;
   alx_rf_signal.g_trend_step      = 1 * (alx_rf_signal.Upper_Limit - alx_rf_signal.Lower_Limit);
   alx_rf_signal.g_extremum_bar    = 0;
   alx_rf_signal.g_md_extremum_bar = 0;

//--------------------------- Check RF trend (just for FLAT) ---------------/
   
   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (
            (sbs_alx_rf_Linear_Value_data[i] > sbs_alx_rf_Upper_Limit_data[i]) ||
            (sbs_alx_rf_Linear_Value_data[i] < sbs_alx_rf_Lower_Limit_data[i])
         )
      {
         break;
      }
   }
   
   if (i >= (flat_bars - 1))
   {
      alx_rf_signal.trend = SBS_ALX_TREND_FLAT;
   }

//--------------------------- Set RF cross_bar -----------------------------/
   
   c_bar_upper = rf_Linear_Value_CROSS_rf_Upper_Limit();
   c_bar_lower = rf_Linear_Value_CROSS_rf_Lower_Limit();
   
   if (c_bar_upper < c_bar_lower)
   {
      alx_rf_signal.cross_bar = c_bar_upper;
   }
   else
   {
      alx_rf_signal.cross_bar = c_bar_lower;
   }

//--------------------------- Check RF direction ---------------------------/

   if (
         (sbs_alx_rf_Linear_Value_data[0] > sbs_alx_rf_Linear_Value_data[1])
      )
   {
      alx_rf_signal.direction = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_rf_Linear_Value_data[0] < sbs_alx_rf_Linear_Value_data[1])
      )
   {
      alx_rf_signal.direction = SBS_ALX_TREND_DOWN;
   }

//--------------------------- Get RF diff ----------------------------------/

//--- Get first not zero diff ---/

   for (i = 1; i < (SBS_INDI_BARS_NO - 2); i++)
   {
      alx_rf_signal.diff = sbs_alx_rf_Linear_Value_data[0] - sbs_alx_rf_Linear_Value_data[i];

      if (alx_rf_signal.diff != 0)
      {
         j = i;
         break;
      }
   }
   
//--- Get final diff ---/   

   for (i = j; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (alx_rf_signal.diff < 0)
      {
         if (
               (sbs_alx_rf_Linear_Value_data[i+1] >= sbs_alx_rf_Linear_Value_data[i])
            )
         {
            alx_rf_signal.diff = sbs_alx_rf_Linear_Value_data[0] - sbs_alx_rf_Linear_Value_data[i+1];
         }
         else
         {
            break;
         }
      }
      
      if (alx_rf_signal.diff > 0)
      {
         if (
               (sbs_alx_rf_Linear_Value_data[i+1] <= sbs_alx_rf_Linear_Value_data[i])
            )
         {
            alx_rf_signal.diff = sbs_alx_rf_Linear_Value_data[0] - sbs_alx_rf_Linear_Value_data[i+1];
         }
         else
         {
            break;
         }
      }   
   }
   
//--------------------------- Get RF subcase -------------------------------/

   if (alx_rf_signal.direction == SBS_ALX_TREND_DOWN)
   {
      if (
            (rf_max_value(3) >= (alx_rf_signal.Upper_Limit - alx_rf_signal.bounce_deviation)) &&
            (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
            (sbs_alx_rf_Linear_Value_data[0] <= sbs_alx_rf_Linear_Value_data[1])
         )
      {
         alx_rf_signal.subcase = SBS_ALX_RF_SUBCASE_BOUNCE_DN_UPPER;
      }
   
      if (
            (rf_max_value(3) >= (alx_rf_signal.Lower_Limit - alx_rf_signal.bounce_deviation)) &&
            (alx_rf_signal.Linear_Value <= alx_rf_signal.Lower_Limit) &&
            (sbs_alx_rf_Linear_Value_data[0] <= sbs_alx_rf_Linear_Value_data[1])
         )
      {
         alx_rf_signal.subcase = SBS_ALX_RF_SUBCASE_BOUNCE_DN_LOWER;
      }
   }
   
   if (alx_rf_signal.direction == SBS_ALX_TREND_UP)
   {
      if (
            (rf_min_value(3) <= (alx_rf_signal.Upper_Limit + alx_rf_signal.bounce_deviation)) &&
            (alx_rf_signal.Linear_Value >= alx_rf_signal.Upper_Limit) &&
            (sbs_alx_rf_Linear_Value_data[0] >= sbs_alx_rf_Linear_Value_data[1])
         )
      {
         alx_rf_signal.subcase = SBS_ALX_RF_SUBCASE_BOUNCE_UP_UPPER;
      }
   
      if (
            (rf_min_value(3) <= (alx_rf_signal.Lower_Limit + alx_rf_signal.bounce_deviation)) &&
            (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&
            (sbs_alx_rf_Linear_Value_data[0] >= sbs_alx_rf_Linear_Value_data[1])
         )
      {
         alx_rf_signal.subcase = SBS_ALX_RF_SUBCASE_BOUNCE_UP_LOWER;
      }
   }
   
//--------------------------- Get Global Trend Parameters ------------------/

   for (i = 1; i < SBS_INDI_BARS_NO; i++)
   {
      if (MathAbs(sbs_alx_rf_Linear_Value_data[i] - alx_rf_signal.Linear_Value) >= alx_rf_signal.g_trend_step)
      {
         j = i;
         alx_rf_signal.g_extremum_bar = i;
         break;
      }
   }

//--- g_trend ---/

   if (sbs_alx_rf_Linear_Value_data[j] > alx_rf_signal.Linear_Value)
   {
      alx_rf_signal.g_trend = SBS_ALX_TREND_DOWN;
   }
   
   if (sbs_alx_rf_Linear_Value_data[j] < alx_rf_signal.Linear_Value)
   {
      alx_rf_signal.g_trend = SBS_ALX_TREND_UP;
   }

//--- g_extremum_bar ---/
   
   if (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN)
   {
      for (i = (j + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_rf_Linear_Value_data[i] > sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_extremum_bar])
         {
            alx_rf_signal.g_extremum_bar = i;
            continue;
         }
         
         if ((sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_extremum_bar] - sbs_alx_rf_Linear_Value_data[i]) >= alx_rf_signal.g_trend_step)
         {
            break;
         }
      }
   }
   
   if (alx_rf_signal.g_trend == SBS_ALX_TREND_UP)
   {
      for (i = (j + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_rf_Linear_Value_data[i] < sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_extremum_bar])
         {
            alx_rf_signal.g_extremum_bar = i;
            continue;
         }
         
         if ((sbs_alx_rf_Linear_Value_data[i] - sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_extremum_bar]) >= alx_rf_signal.g_trend_step)
         {
            break;
         }
      }
   }

//--- g_md_extremum_bar ---/

   if (alx_rf_signal.g_trend == SBS_ALX_TREND_DOWN)
   {
      for (i = 0; i <= alx_rf_signal.g_extremum_bar; i++)
      {
         if (sbs_alx_rf_Linear_Value_data[i] < sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_md_extremum_bar])
         {
            alx_rf_signal.g_md_extremum_bar =  i;
         }
      }
   }
   
   if (alx_rf_signal.g_trend == SBS_ALX_TREND_UP)
   {
      for (i = 0; i <= alx_rf_signal.g_extremum_bar; i++)
      {
         if (sbs_alx_rf_Linear_Value_data[i] > sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_md_extremum_bar])
         {
            alx_rf_signal.g_md_extremum_bar =  i;
         }
      }
   }
   
//--- g_trend_diff ---/
   
   alx_rf_signal.g_trend_diff = sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_md_extremum_bar] - sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_extremum_bar];
   
//--- g_trend_md_diff ---/  
   
   alx_rf_signal.g_trend_md_diff = sbs_alx_rf_Linear_Value_data[0] - sbs_alx_rf_Linear_Value_data[alx_rf_signal.g_md_extremum_bar];
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_DSR_State_and_Rules() =================/

void     Get_ALX_DSR_State_and_Rules()
{
int         i;

double      dsr_step;
double      ma_deviation;
double      dsr_position;

double      Resistance_1_00;
double      Resistance_0_50;
double      Resistance_0_25;

double      Support_1_00;
double      Support_0_50;
double      Support_0_25;

bool      Stop_Resistance_1_00;
bool      Stop_Resistance_0_50;
bool      Stop_Resistance_0_25;

bool      Stop_Support_1_00;
bool      Stop_Support_0_50;
bool      Stop_Support_0_25;

//--------------------------- Reset DSR State & Rules ----------------------/

   alx_dsr_signal.BounceUp = false;
   alx_dsr_signal.BounceDn = false;
   
   alx_dsr_signal.BounceUp_Type = SBS_ALX_DSR_BOUNCE_NONE;
   alx_dsr_signal.BounceDn_Type = SBS_ALX_DSR_BOUNCE_NONE;

//--------------------------- Set DSR Bar 0 Values -------------------------/

   alx_dsr_signal.Resistance = sbs_alx_dsr_Resistance_data[0];
   alx_dsr_signal.Support    = sbs_alx_dsr_Support_data[0];
   alx_dsr_signal.SR_Mean    = sbs_alx_dsr_SR_Mean_data[0];

//--------------------------- Set Bounce Conditions ------------------------/

   Stop_Resistance_1_00 = false;
   Stop_Support_1_00    = false;
   
   Stop_Resistance_0_50 = false;
   Stop_Support_0_50    = false;
   
   Stop_Resistance_0_25 = false;
   Stop_Support_0_25    = false;

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
//--------------------------- Find Closest Resistance & Support Levels -----/

//--- R/S 1_00 ---/

      dsr_step     = (sbs_alx_dsr_Resistance_data[i] - sbs_alx_dsr_Support_data[i]);
      dsr_position = sbs_alx_apb_HA_Close_data[i] - sbs_alx_dsr_Support_data[i];
   
      Resistance_1_00 = (MathCeil(dsr_position / dsr_step) * dsr_step)  + sbs_alx_dsr_Support_data[i];
      Support_1_00    = (MathFloor(dsr_position / dsr_step) * dsr_step) + sbs_alx_dsr_Support_data[i];
   
//--- R/S 0_50 ---/
   
      dsr_step     = (sbs_alx_dsr_Resistance_data[i] - sbs_alx_dsr_Support_data[i]) / 2;
      dsr_position = sbs_alx_apb_HA_Close_data[i] - Support_1_00;
   
      Resistance_0_50 = (MathCeil(dsr_position / dsr_step) * dsr_step)  + Support_1_00;
      Support_0_50    = (MathFloor(dsr_position / dsr_step) * dsr_step) + Support_1_00;

//--- R/S 0_25 ---/
   
      dsr_step     = (sbs_alx_dsr_Resistance_data[i] - sbs_alx_dsr_Support_data[i]) / 4;
      dsr_position = sbs_alx_apb_HA_Close_data[i] - Support_0_50;
   
      Resistance_0_25 = (MathCeil(dsr_position / dsr_step) * dsr_step)  + Support_0_50;
      Support_0_25    = (MathFloor(dsr_position / dsr_step) * dsr_step) + Support_0_50;

//--------------------------- Define Bounce Conditions ---------------------/

//--- R/S 1_00 ---/

      ma_deviation = (sbs_alx_pac_HMA_data[i] - sbs_alx_pac_LMA_data[i]);
      
      if (i > 0)
      {
         if (High[i] < Support_1_00)
         {
            Stop_Resistance_1_00 = true;
         }
      
         if (Low[i] > Resistance_1_00)
         {
            Stop_Support_1_00 = true;
         }
      }
      
      if (
            (!alx_dsr_signal.BounceUp) &&
            (!Stop_Support_1_00)
         )
      {
         if ((Low[i] - ma_deviation) <= Support_1_00) 
         {
            alx_dsr_signal.BounceUp = true;
            alx_dsr_signal.BounceUp_Type = SBS_ALX_DSR_BOUNCE_1_00;
         }
      }
      
      if (
            (!alx_dsr_signal.BounceDn) &&
            (!Stop_Resistance_1_00)
         )
      {
         if ((High[i] + ma_deviation) >= Resistance_1_00) 
         {
            alx_dsr_signal.BounceDn = true;
            alx_dsr_signal.BounceDn_Type = SBS_ALX_DSR_BOUNCE_1_00;
         }
      }

//--- R/S 0_50 ---/

      ma_deviation = (sbs_alx_pac_HMA_data[i] - sbs_alx_pac_LMA_data[i]) / 2;
      
      if (i > 0)
      {
         if (High[i] < Support_0_50)
         {
            Stop_Resistance_0_50 = true;
         }
      
         if (Low[i] > Resistance_0_50)
         {
            Stop_Support_0_50 = true;
         }
      }
      
      if (
            (!alx_dsr_signal.BounceUp) &&
            (!Stop_Support_0_50)
         )
      {
         if ((Low[i] - ma_deviation) <= Support_0_50) 
         {
            alx_dsr_signal.BounceUp = true;
            alx_dsr_signal.BounceUp_Type = SBS_ALX_DSR_BOUNCE_0_50;
         }
      }
      
      if (
            (!alx_dsr_signal.BounceDn) &&
            (!Stop_Resistance_0_50)
         )
      {
         if ((High[i] + ma_deviation) >= Resistance_0_50) 
         {
            alx_dsr_signal.BounceDn = true;
            alx_dsr_signal.BounceDn_Type = SBS_ALX_DSR_BOUNCE_0_50;
         }
      }

//--- R/S 0_25 ---/

      ma_deviation = (sbs_alx_pac_HMA_data[i] - sbs_alx_pac_LMA_data[i]) / 4;
      
      if (i > 0)
      {
         if (High[i] < Support_0_25)
         {
            Stop_Resistance_0_25 = true;
         }
      
         if (Low[i] > Resistance_0_25)
         {
            Stop_Support_0_25 = true;
         }
      }
      
      if (
            (!alx_dsr_signal.BounceUp) &&
            (!Stop_Support_0_25)
         )
      {
         if ((Low[i] - ma_deviation) <= Support_0_25) 
         {
            alx_dsr_signal.BounceUp = true;
            alx_dsr_signal.BounceUp_Type = SBS_ALX_DSR_BOUNCE_0_25;
         }
      }
      
      if (
            (!alx_dsr_signal.BounceDn) &&
            (!Stop_Resistance_0_25)
         )
      {
         if ((High[i] + ma_deviation) >= Resistance_0_25) 
         {
            alx_dsr_signal.BounceDn = true;
            alx_dsr_signal.BounceDn_Type = SBS_ALX_DSR_BOUNCE_0_25;
         }
      }
      
//--------------------------- Check if Bounces are defined -----------------/

      if (
            (alx_dsr_signal.BounceUp) &&
            (alx_dsr_signal.BounceDn)
         )
      {
         break;
      }

   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_DSR_Close_State_and_Rules() ==========/

void     Get_ALX_DSR_Close_State_and_Rules()
{
int         i;

double      dsr_step;
double      ma_deviation;
double      dsr_position;

double      Resistance_1_00;
double      Resistance_0_50;
double      Resistance_0_25;

double      Support_1_00;
double      Support_0_50;
double      Support_0_25;

bool      Stop_Resistance_1_00;
bool      Stop_Resistance_0_50;
bool      Stop_Resistance_0_25;

bool      Stop_Support_1_00;
bool      Stop_Support_0_50;
bool      Stop_Support_0_25;

//--------------------------- Reset DSR State & Rules ----------------------/

   alx_dsr_signal.Close_BounceUp = false;
   alx_dsr_signal.Close_BounceDn = false;
   
   alx_dsr_signal.Close_BounceUp_Type = SBS_ALX_DSR_BOUNCE_NONE;
   alx_dsr_signal.Close_BounceDn_Type = SBS_ALX_DSR_BOUNCE_NONE;
   
   alx_dsr_signal.Close_Bounce_Support    = 0;
   alx_dsr_signal.Close_Bounce_Resistance = EMPTY_VALUE;

//--------------------------- Set DSR Bar 0 Values -------------------------/

//   alx_dsr_signal.Resistance = sbs_alx_dsr_Resistance_data[0];
//   alx_dsr_signal.Support    = sbs_alx_dsr_Support_data[0];
//   alx_dsr_signal.SR_Mean    = sbs_alx_dsr_SR_Mean_data[0];

//--------------------------- Set Bounce Conditions ------------------------/

   Stop_Resistance_1_00 = false;
   Stop_Support_1_00    = false;
   
   Stop_Resistance_0_50 = false;
   Stop_Support_0_50    = false;
   
   Stop_Resistance_0_25 = false;
   Stop_Support_0_25    = false;

//--------------------------- Find Closest Resistance & Support Levels -----/

//--- R/S 1_00 ---/

      dsr_step     = (sbs_alx_dsr_Resistance_data[0] - sbs_alx_dsr_Support_data[0]) / 1;
      dsr_position = Close[0] - sbs_alx_dsr_Support_data[0];
   
      Resistance_1_00 = (MathCeil(dsr_position / dsr_step) * dsr_step)  + sbs_alx_dsr_Support_data[0];
      Support_1_00    = (MathFloor(dsr_position / dsr_step) * dsr_step) + sbs_alx_dsr_Support_data[0];
   
//--- R/S 0_50 ---/
   
      dsr_step     = (sbs_alx_dsr_Resistance_data[0] - sbs_alx_dsr_Support_data[0]) / 2;
      dsr_position = Close[0] - Support_1_00;
   
      Resistance_0_50 = (MathCeil(dsr_position / dsr_step) * dsr_step)  + Support_1_00;
      Support_0_50    = (MathFloor(dsr_position / dsr_step) * dsr_step) + Support_1_00;

//--- R/S 0_25 ---/
   
      dsr_step     = (sbs_alx_dsr_Resistance_data[0] - sbs_alx_dsr_Support_data[0]) / 4;
      dsr_position = Close[0] - Support_0_50;
   
      Resistance_0_25 = (MathCeil(dsr_position / dsr_step) * dsr_step)  + Support_0_50;
      Support_0_25    = (MathFloor(dsr_position / dsr_step) * dsr_step) + Support_0_50;

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
//--------------------------- Define Bounce Conditions ---------------------/

//--- R/S 1_00 ---/

      ma_deviation = (sbs_alx_pac_HMA_data[i] - sbs_alx_pac_LMA_data[i]) / 2;
      
      if (i > 0)
      {
         if (High[i] < Support_1_00)
         {
            Stop_Resistance_1_00 = true;
         }
      
         if (Low[i] > Resistance_1_00)
         {
            Stop_Support_1_00 = true;
         }
      }
      
      if (
            (!alx_dsr_signal.Close_BounceUp) &&
            (!Stop_Support_1_00)
         )
      {
         if ((Low[i] - ma_deviation) <= Support_1_00) 
         {
            alx_dsr_signal.Close_BounceUp = true;
            alx_dsr_signal.Close_BounceUp_Type = SBS_ALX_DSR_BOUNCE_1_00;
         }
      }
      
      if (
            (!alx_dsr_signal.Close_BounceDn) &&
            (!Stop_Resistance_1_00)
         )
      {
         if ((High[i] + ma_deviation) >= Resistance_1_00) 
         {
            alx_dsr_signal.Close_BounceDn = true;
            alx_dsr_signal.Close_BounceDn_Type = SBS_ALX_DSR_BOUNCE_1_00;
         }
      }

//--- R/S 0_50 ---/

      ma_deviation = (sbs_alx_pac_HMA_data[i] - sbs_alx_pac_LMA_data[i]) / 4;
      
      if (i > 0)
      {
         if (High[i] < Support_0_50)
         {
            Stop_Resistance_0_50 = true;
         }
      
         if (Low[i] > Resistance_0_50)
         {
            Stop_Support_0_50 = true;
         }
      }
      
      if (
            (!alx_dsr_signal.Close_BounceUp) &&
            (!Stop_Support_0_50)
         )
      {
         if ((Low[i] - ma_deviation) <= Support_0_50) 
         {
            alx_dsr_signal.Close_BounceUp = true;
            alx_dsr_signal.Close_BounceUp_Type = SBS_ALX_DSR_BOUNCE_0_50;
         }
      }
      
      if (
            (!alx_dsr_signal.Close_BounceDn) &&
            (!Stop_Resistance_0_50)
         )
      {
         if ((High[i] + ma_deviation) >= Resistance_0_50) 
         {
            alx_dsr_signal.Close_BounceDn = true;
            alx_dsr_signal.Close_BounceDn_Type = SBS_ALX_DSR_BOUNCE_0_50;
         }
      }

//--- R/S 0_25 ---/

      ma_deviation = (sbs_alx_pac_HMA_data[i] - sbs_alx_pac_LMA_data[i]) / 8;
      
      if (i > 0)
      {
         if (High[i] < Support_0_25)
         {
            Stop_Resistance_0_25 = true;
         }
      
         if (Low[i] > Resistance_0_25)
         {
            Stop_Support_0_25 = true;
         }
      }
      
      if (
            (!alx_dsr_signal.Close_BounceUp) &&
            (!Stop_Support_0_25)
         )
      {
         if ((Low[i] - ma_deviation) <= Support_0_25) 
         {
            alx_dsr_signal.Close_BounceUp = true;
            alx_dsr_signal.Close_BounceUp_Type = SBS_ALX_DSR_BOUNCE_0_25;
         }
      }
      
      if (
            (!alx_dsr_signal.Close_BounceDn) &&
            (!Stop_Resistance_0_25)
         )
      {
         if ((High[i] + ma_deviation) >= Resistance_0_25) 
         {
            alx_dsr_signal.Close_BounceDn = true;
            alx_dsr_signal.Close_BounceDn_Type = SBS_ALX_DSR_BOUNCE_0_25;
         }
      }
      
//--------------------------- Check if Bounces are defined -----------------/

      if (
            (alx_dsr_signal.Close_BounceUp) &&
            (alx_dsr_signal.Close_BounceDn)
         )
      {
         break;
      }

   }

//--------------------------- Check Bounce configuration -------------------/

//--- Check for SBS_ALX_DSR_BOUNCE_1_00 (always) ---/

   if (
         (alx_dsr_signal.Close_BounceUp) &&
         (alx_dsr_signal.Close_BounceUp_Type == SBS_ALX_DSR_BOUNCE_1_00)
      )
   {
      alx_dsr_signal.Close_Bounce_Support = Support_1_00;
   }
   
   if (
         (alx_dsr_signal.Close_BounceDn) &&
         (alx_dsr_signal.Close_BounceDn_Type == SBS_ALX_DSR_BOUNCE_1_00)
      )
   {
      alx_dsr_signal.Close_Bounce_Resistance = Resistance_1_00;
   }

//--- Check for SBS_ALX_DSR_BOUNCE_0_50 (always) ---/
/*
   if (
         (alx_dsr_signal.Close_BounceUp) &&
         (alx_dsr_signal.Close_BounceUp_Type == SBS_ALX_DSR_BOUNCE_0_50) &&
         (Support_0_50 < alx_dsr_signal.Resistance) &&
         (((alx_dsr_signal.Support - Support_0_50) / (alx_dsr_signal.Resistance - alx_dsr_signal.Support)) < 0.75)
      )
   {
      alx_dsr_signal.Close_Bounce_Support = Support_0_50;
   }
   else
   {
      alx_dsr_signal.Close_BounceUp = false;
      alx_dsr_signal.Close_BounceUp_Type = SBS_ALX_DSR_BOUNCE_NONE;
   }
   
   if (
         (alx_dsr_signal.Close_BounceDn) &&
         (alx_dsr_signal.Close_BounceDn_Type == SBS_ALX_DSR_BOUNCE_0_50) &&
         (Resistance_0_50 > alx_dsr_signal.Support) &&
         (((Resistance_0_50 - alx_dsr_signal.Resistance) / (alx_dsr_signal.Resistance - alx_dsr_signal.Support)) < 0.75)
      )
   {
      alx_dsr_signal.Close_Bounce_Resistance = Resistance_0_50;
   }
   else
   {
      alx_dsr_signal.Close_BounceDn = false;
      alx_dsr_signal.Close_BounceDn_Type = SBS_ALX_DSR_BOUNCE_NONE;
   }
*/

   if (
         (alx_dsr_signal.Close_BounceUp) &&
         (alx_dsr_signal.Close_BounceUp_Type == SBS_ALX_DSR_BOUNCE_0_50)
      )
   {
      alx_dsr_signal.Close_Bounce_Support = Support_0_50;
   }
   
   if (
         (alx_dsr_signal.Close_BounceDn) &&
         (alx_dsr_signal.Close_BounceDn_Type == SBS_ALX_DSR_BOUNCE_0_50)
      )
   {
      alx_dsr_signal.Close_Bounce_Resistance = Resistance_0_50;
   }
   
//--- Check for SBS_ALX_DSR_BOUNCE_0_25 (between support & resistance) ---/

   if (
         (alx_dsr_signal.Close_BounceUp) &&
         (alx_dsr_signal.Close_BounceUp_Type == SBS_ALX_DSR_BOUNCE_0_25) &&
         (Support_0_25 < alx_dsr_signal.Resistance) &&
         (Support_0_25 > alx_dsr_signal.Support)
      )
   {
      alx_dsr_signal.Close_Bounce_Support = Support_0_25;
   }
   else
   {
      alx_dsr_signal.Close_BounceUp = false;
      alx_dsr_signal.Close_BounceUp_Type = SBS_ALX_DSR_BOUNCE_NONE;
   }
   
   if (
         (alx_dsr_signal.Close_BounceDn) &&
         (alx_dsr_signal.Close_BounceDn_Type == SBS_ALX_DSR_BOUNCE_0_25) &&
         (Resistance_0_25 < alx_dsr_signal.Resistance) &&
         (Resistance_0_25 > alx_dsr_signal.Support)
      )
   {
      alx_dsr_signal.Close_Bounce_Resistance = Resistance_0_25;
   }
   else
   {
      alx_dsr_signal.Close_BounceDn = false;
      alx_dsr_signal.Close_BounceDn_Type = SBS_ALX_DSR_BOUNCE_NONE;
   }
   
//--------------------------------------------------------------------------/

   return;
}


//=========================== Get_ALX_SSL_State_and_Rules() ================/

void     Get_ALX_SSL_State_and_Rules()
{
//--------------------------- Reset SSL States -----------------------------/

   alx_ssl_signal.trend = SBS_ALX_TREND_NONE;

//--------------------------- Set SSL Trend --------------------------------/

   if (
         (sbs_alx_ssl_up_data[0] == SBS_ALX_SSL_FILL_VAL) &&
         (sbs_alx_ssl_up_data[1] == SBS_ALX_SSL_FILL_VAL)
      )
   {
      alx_ssl_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_ssl_dn_data[0] == SBS_ALX_SSL_FILL_VAL) &&
         (sbs_alx_ssl_dn_data[1] == SBS_ALX_SSL_FILL_VAL)
      )
   {
      alx_ssl_signal.trend = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_RSIOMA_State_and_Rules() =============/

void     Get_ALX_RSIOMA_State_and_Rules()
{
//--------------------------- Reset RSIOMA States --------------------------/

   alx_rsioma_01_signal.trend = SBS_ALX_TREND_NONE;
   
   alx_rsioma_04_signal.trend = SBS_ALX_TREND_NONE;

//--------------------------- Set RSIOMA 01 Trend --------------------------/

   if (
         (sbs_alx_rsioma_rsida_01_data[0] == EMPTY_VALUE)
      )
   {
      alx_rsioma_01_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_rsioma_rsida_01_data[0] != EMPTY_VALUE)
      )
   {
      alx_rsioma_01_signal.trend = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------- Set RSIOMA 04 Trend --------------------------/

   if (
         (sbs_alx_rsioma_rsida_04_data[0] == EMPTY_VALUE)
      )
   {
      alx_rsioma_04_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_rsioma_rsida_04_data[0] != EMPTY_VALUE)
      )
   {
      alx_rsioma_04_signal.trend = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_TSI_MACD_State_and_Rules() ===========/

void     Get_ALX_TSI_MACD_State_and_Rules()
{
//--------------------------- Reset TSI_MACD States ------------------------/

   alx_tsi_macd_01_signal.trend = SBS_ALX_TREND_NONE;
   
   alx_tsi_macd_04_signal.trend = SBS_ALX_TREND_NONE;

//--------------------------- Set TSI_MACD 01 Trend ------------------------/

   if (
         (sbs_alx_tsi_macd_01_TSI_data[0] > sbs_alx_tsi_macd_01_Signal_data[0])
      )
   {
      alx_tsi_macd_01_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_tsi_macd_01_TSI_data[0] < sbs_alx_tsi_macd_01_Signal_data[0])
      )
   {
      alx_tsi_macd_01_signal.trend = SBS_ALX_TREND_DOWN;
   }

//--------------------------- Set TSI_MACD 04 Trend ------------------------/

   if (
         (sbs_alx_tsi_macd_04_TSI_data[0] > sbs_alx_tsi_macd_04_Signal_data[0])
      )
   {
      alx_tsi_macd_04_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_tsi_macd_04_TSI_data[0] < sbs_alx_tsi_macd_04_Signal_data[0])
      )
   {
      alx_tsi_macd_04_signal.trend = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_GMTS_State_and_Rules() ===============/

void     Get_ALX_GMTS_State_and_Rules()
{
//--------------------------- Reset GMTS States ----------------------------/

   alx_gmts_signal.trend_M15 = SBS_ALX_TREND_NONE;
   alx_gmts_signal.trend_M30 = SBS_ALX_TREND_NONE;
   alx_gmts_signal.trend_H1  = SBS_ALX_TREND_NONE;
   alx_gmts_signal.trend_H4  = SBS_ALX_TREND_NONE;

//--------------------------- Set GMTS Trends ------------------------------/

//--- trend_M15 ---/

   alx_gmts_signal.trend_M15_tics = alx_gmts_signal.trend_M15_tics + 1;

   if (sbs_alx_gmts_M15_Up_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M15 == SBS_ALX_TREND_UP)
      {
         if (alx_gmts_signal.trend_M15_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M15 = SBS_ALX_TREND_UP;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M15  = SBS_ALX_TREND_UP;
         alx_gmts_signal.trend_M15_tics = 1;
      }
   }

   if (sbs_alx_gmts_M15_Dn_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M15 == SBS_ALX_TREND_DOWN)
      {
         if (alx_gmts_signal.trend_M15_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M15 = SBS_ALX_TREND_DOWN;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M15  = SBS_ALX_TREND_DOWN;
         alx_gmts_signal.trend_M15_tics = 1;
      }
   }

   if (sbs_alx_gmts_M15_UpR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M15 == SBS_ALX_TREND_UP_WEAK)
      {
         if (alx_gmts_signal.trend_M15_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M15 = SBS_ALX_TREND_UP_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M15  = SBS_ALX_TREND_UP_WEAK;
         alx_gmts_signal.trend_M15_tics = 1;
      }
   }

   if (sbs_alx_gmts_M15_DnR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M15 == SBS_ALX_TREND_DOWN_WEAK)
      {
         if (alx_gmts_signal.trend_M15_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M15 = SBS_ALX_TREND_DOWN_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M15  = SBS_ALX_TREND_DOWN_WEAK;
         alx_gmts_signal.trend_M15_tics = 1;
      }
   }

//--- trend_M30 ---/

   alx_gmts_signal.trend_M30_tics = alx_gmts_signal.trend_M30_tics + 1;

   if (sbs_alx_gmts_M30_Up_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M30 == SBS_ALX_TREND_UP)
      {
         if (alx_gmts_signal.trend_M30_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M30 = SBS_ALX_TREND_UP;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M30  = SBS_ALX_TREND_UP;
         alx_gmts_signal.trend_M30_tics = 1;
      }
   }

   if (sbs_alx_gmts_M30_Dn_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M30 == SBS_ALX_TREND_DOWN)
      {
         if (alx_gmts_signal.trend_M30_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M30 = SBS_ALX_TREND_DOWN;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M30  = SBS_ALX_TREND_DOWN;
         alx_gmts_signal.trend_M30_tics = 1;
      }
   }

   if (sbs_alx_gmts_M30_UpR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_M30 == SBS_ALX_TREND_UP_WEAK)
      {
         if (alx_gmts_signal.trend_M30_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M30 = SBS_ALX_TREND_UP_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M30  = SBS_ALX_TREND_UP_WEAK;
         alx_gmts_signal.trend_M30_tics = 1;
      }
   }

   if (sbs_alx_gmts_M30_DnR_data[0] == 1)    {alx_gmts_signal.trend_M30 = SBS_ALX_TREND_DOWN_WEAK;}
   {
      if (alx_gmts_signal.pre_trend_M30 == SBS_ALX_TREND_DOWN_WEAK)
      {
         if (alx_gmts_signal.trend_M30_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_M30 = SBS_ALX_TREND_DOWN_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_M30  = SBS_ALX_TREND_DOWN_WEAK;
         alx_gmts_signal.trend_M30_tics = 1;
      }
   }

//--- trend_H1 ---/

   alx_gmts_signal.trend_H1_tics = alx_gmts_signal.trend_H1_tics + 1;

   if (sbs_alx_gmts_H1_Up_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H1 == SBS_ALX_TREND_UP)
      {
         if (alx_gmts_signal.trend_H1_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H1 = SBS_ALX_TREND_UP;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H1  = SBS_ALX_TREND_UP;
         alx_gmts_signal.trend_H1_tics = 1;
      }
   }

   if (sbs_alx_gmts_H1_Dn_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H1 == SBS_ALX_TREND_DOWN)
      {
         if (alx_gmts_signal.trend_H1_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H1 = SBS_ALX_TREND_DOWN;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H1  = SBS_ALX_TREND_DOWN;
         alx_gmts_signal.trend_H1_tics = 1;
      }
   }

   if (sbs_alx_gmts_H1_UpR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H1 == SBS_ALX_TREND_UP_WEAK)
      {
         if (alx_gmts_signal.trend_H1_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H1 = SBS_ALX_TREND_UP_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H1  = SBS_ALX_TREND_UP_WEAK;
         alx_gmts_signal.trend_H1_tics = 1;
      }
   }

   if (sbs_alx_gmts_H1_DnR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H1 == SBS_ALX_TREND_DOWN_WEAK)
      {
         if (alx_gmts_signal.trend_H1_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H1 = SBS_ALX_TREND_DOWN_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H1  = SBS_ALX_TREND_DOWN_WEAK;
         alx_gmts_signal.trend_H1_tics = 1;
      }
   }

//--- trend_H4 ---/

   alx_gmts_signal.trend_H4_tics = alx_gmts_signal.trend_H4_tics + 1;

   if (sbs_alx_gmts_H4_Up_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H4 == SBS_ALX_TREND_UP)
      {
         if (alx_gmts_signal.trend_H4_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H4 = SBS_ALX_TREND_UP;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H4  = SBS_ALX_TREND_UP;
         alx_gmts_signal.trend_H4_tics = 1;
      }
   }

   if (sbs_alx_gmts_H4_Dn_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H4 == SBS_ALX_TREND_DOWN)
      {
         if (alx_gmts_signal.trend_H4_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H4 = SBS_ALX_TREND_DOWN;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H4  = SBS_ALX_TREND_DOWN;
         alx_gmts_signal.trend_H4_tics = 1;
      }
   }

   if (sbs_alx_gmts_H4_UpR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H4 == SBS_ALX_TREND_UP_WEAK)
      {
         if (alx_gmts_signal.trend_H4_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H4 = SBS_ALX_TREND_UP_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H4  = SBS_ALX_TREND_UP_WEAK;
         alx_gmts_signal.trend_H4_tics = 1;
      }
   }

   if (sbs_alx_gmts_H4_DnR_data[0] == 1)
   {
      if (alx_gmts_signal.pre_trend_H4 == SBS_ALX_TREND_DOWN_WEAK)
      {
         if (alx_gmts_signal.trend_H4_tics >= SBS_ALX_GMTS_TREND_MIN_TICS)
         {
            alx_gmts_signal.trend_H4 = SBS_ALX_TREND_DOWN_WEAK;
         }
      }
      else
      {
         alx_gmts_signal.pre_trend_H4  = SBS_ALX_TREND_DOWN_WEAK;
         alx_gmts_signal.trend_H4_tics = 1;
      }
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_ASCTREND_4TF_State_and_Rules() =======/

void     Get_ALX_ASCTREND_4TF_State_and_Rules()
{
//--------------------------- Reset ASCTREND_4TF States --------------------/

   alx_asctrend_4tf_signal.trend_M15 = SBS_ALX_TREND_NONE;
   alx_asctrend_4tf_signal.trend_M30 = SBS_ALX_TREND_NONE;
   alx_asctrend_4tf_signal.trend_H1  = SBS_ALX_TREND_NONE;
   alx_asctrend_4tf_signal.trend_H4  = SBS_ALX_TREND_NONE;

//--------------------------- Set ASCTREND_4TF Trends ----------------------/
   
//--- trend_M15 ---/

   alx_asctrend_4tf_signal.trend_M15_tics = alx_asctrend_4tf_signal.trend_M15_tics + 1;

   if (sbs_alx_asctrend_4tf_R1Up_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_M15 == SBS_ALX_TREND_UP)
      {
         if (alx_asctrend_4tf_signal.trend_M15_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_M15      = SBS_ALX_TREND_UP;
            alx_asctrend_4tf_signal.trend_M15_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_M15  = SBS_ALX_TREND_UP;
         alx_asctrend_4tf_signal.trend_M15_tics = 1;
      }
   }
   
   if (sbs_alx_asctrend_4tf_R1Dn_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_M15 == SBS_ALX_TREND_DOWN)
      {
         if (alx_asctrend_4tf_signal.trend_M15_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_M15      = SBS_ALX_TREND_DOWN;
            alx_asctrend_4tf_signal.trend_M15_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_M15  = SBS_ALX_TREND_DOWN;
         alx_asctrend_4tf_signal.trend_M15_tics = 1;
      }
   }
   
//--- trend_M30 ---/

   alx_asctrend_4tf_signal.trend_M30_tics = alx_asctrend_4tf_signal.trend_M30_tics + 1;

   if (sbs_alx_asctrend_4tf_R2Up_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_M30 == SBS_ALX_TREND_UP)
      {
         if (alx_asctrend_4tf_signal.trend_M30_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_M30      = SBS_ALX_TREND_UP;
            alx_asctrend_4tf_signal.trend_M30_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_M30  = SBS_ALX_TREND_UP;
         alx_asctrend_4tf_signal.trend_M30_tics = 1;
      }
   }
   
   if (sbs_alx_asctrend_4tf_R2Dn_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_M30 == SBS_ALX_TREND_DOWN)
      {
         if (alx_asctrend_4tf_signal.trend_M30_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_M30      = SBS_ALX_TREND_DOWN;
            alx_asctrend_4tf_signal.trend_M30_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_M30  = SBS_ALX_TREND_DOWN;
         alx_asctrend_4tf_signal.trend_M30_tics = 1;
      }
   }

//--- trend_H1 ---/

   alx_asctrend_4tf_signal.trend_H1_tics = alx_asctrend_4tf_signal.trend_H1_tics + 1;

   if (sbs_alx_asctrend_4tf_R3Up_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_H1 == SBS_ALX_TREND_UP)
      {
         if (alx_asctrend_4tf_signal.trend_H1_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_H1      = SBS_ALX_TREND_UP;
            alx_asctrend_4tf_signal.trend_H1_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_H1  = SBS_ALX_TREND_UP;
         alx_asctrend_4tf_signal.trend_H1_tics = 1;
      }
   }
   
   if (sbs_alx_asctrend_4tf_R3Dn_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_H1 == SBS_ALX_TREND_DOWN)
      {
         if (alx_asctrend_4tf_signal.trend_H1_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_H1      = SBS_ALX_TREND_DOWN;
            alx_asctrend_4tf_signal.trend_H1_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_H1  = SBS_ALX_TREND_DOWN;
         alx_asctrend_4tf_signal.trend_H1_tics = 1;
      }
   }

//--- trend_H4 ---/

   alx_asctrend_4tf_signal.trend_H4_tics = alx_asctrend_4tf_signal.trend_H4_tics + 1;

   if (sbs_alx_asctrend_4tf_R4Up_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_H4 == SBS_ALX_TREND_UP)
      {
         if (alx_asctrend_4tf_signal.trend_H4_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_H4      = SBS_ALX_TREND_UP;
            alx_asctrend_4tf_signal.trend_H4_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_H4  = SBS_ALX_TREND_UP;
         alx_asctrend_4tf_signal.trend_H4_tics = 1;
      }
   }
   
   if (sbs_alx_asctrend_4tf_R4Dn_data[0] != 0)
   {
      if (alx_asctrend_4tf_signal.pre_trend_H4 == SBS_ALX_TREND_DOWN)
      {
         if (alx_asctrend_4tf_signal.trend_H4_tics >= SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS)
         {
            alx_asctrend_4tf_signal.trend_H4      = SBS_ALX_TREND_DOWN;
            alx_asctrend_4tf_signal.trend_H4_tics = SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS;
         }
      }
      else
      {
         alx_asctrend_4tf_signal.pre_trend_H4  = SBS_ALX_TREND_DOWN;
         alx_asctrend_4tf_signal.trend_H4_tics = 1;
      }
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_STOCH_MTF_State_and_Rules() ==========/

void     Get_ALX_STOCH_MTF_State_and_Rules()
{
//--------------------------- Reset STOCH_MTF States -----------------------/

   alx_stoch_mtf_signal.global_trend_M15 = SBS_ALX_TREND_NONE;
   alx_stoch_mtf_signal.global_trend_H1  = SBS_ALX_TREND_NONE;
   alx_stoch_mtf_signal.global_trend_H4  = SBS_ALX_TREND_NONE;
   
   alx_stoch_mtf_signal.local_direction_M15 = SBS_ALX_TREND_NONE;
   alx_stoch_mtf_signal.local_direction_H1  = SBS_ALX_TREND_NONE;
   alx_stoch_mtf_signal.local_direction_H4  = SBS_ALX_TREND_NONE;

//--------------------------- Set STOCH_MTF Data (Bars 0 & 1) --------------/

//--- M15 ---/

   alx_stoch_mtf_signal.M15_Kopen = sbs_alx_stoch_mtf_M15_Kopen_data[0];
   
   alx_stoch_mtf_signal.M15_Kline = sbs_alx_stoch_mtf_M15_Kline_data[1];
   alx_stoch_mtf_signal.M15_KDn   = sbs_alx_stoch_mtf_M15_KDn_data[1];
   alx_stoch_mtf_signal.M15_Dline = sbs_alx_stoch_mtf_M15_Dline_data[1];

//--- H1 ---/

   alx_stoch_mtf_signal.H1_Kopen = sbs_alx_stoch_mtf_H1_Kopen_data[0];
   
   alx_stoch_mtf_signal.H1_Kline = sbs_alx_stoch_mtf_H1_Kline_data[1];
   alx_stoch_mtf_signal.H1_KDn   = sbs_alx_stoch_mtf_H1_KDn_data[1];
   alx_stoch_mtf_signal.H1_Dline = sbs_alx_stoch_mtf_H1_Dline_data[1];

//--- H4 ---/

   alx_stoch_mtf_signal.H4_Kopen = sbs_alx_stoch_mtf_H4_Kopen_data[0];
   
   alx_stoch_mtf_signal.H4_Kline = sbs_alx_stoch_mtf_H4_Kline_data[1];
   alx_stoch_mtf_signal.H4_KDn   = sbs_alx_stoch_mtf_H4_KDn_data[1];
   alx_stoch_mtf_signal.H4_Dline = sbs_alx_stoch_mtf_H4_Dline_data[1];

//--------------------------- Set STOCH_MTF Levels -------------------------/

   alx_stoch_mtf_signal.LevelUp     = 80;
   alx_stoch_mtf_signal.LevelMiddle = 50;
   alx_stoch_mtf_signal.LevelDown   = 20;

//--------------------------- Set STOCH_MTF Global Trends ------------------/

//--- M15 ---/

   if (alx_stoch_mtf_signal.M15_Kline != EMPTY_VALUE)
   {
      alx_stoch_mtf_signal.global_trend_M15 = SBS_ALX_TREND_UP;
   }
   
   if (alx_stoch_mtf_signal.M15_KDn != EMPTY_VALUE)
   {
      alx_stoch_mtf_signal.global_trend_M15 = SBS_ALX_TREND_DOWN;
   }

//--- H1 ---/

   if (alx_stoch_mtf_signal.H1_Kline != EMPTY_VALUE)
   {
      alx_stoch_mtf_signal.global_trend_H1 = SBS_ALX_TREND_UP;
   }
   
   if (alx_stoch_mtf_signal.H1_KDn != EMPTY_VALUE)
   {
      alx_stoch_mtf_signal.global_trend_H1 = SBS_ALX_TREND_DOWN;
   }

//--- H4 ---/

   if (alx_stoch_mtf_signal.H4_Kline != EMPTY_VALUE)
   {
      alx_stoch_mtf_signal.global_trend_H4 = SBS_ALX_TREND_UP;
   }
   
   if (alx_stoch_mtf_signal.H4_KDn != EMPTY_VALUE)
   {
      alx_stoch_mtf_signal.global_trend_H4 = SBS_ALX_TREND_DOWN;
   }

//--------------------------- Set STOCH_MTF Local Directions --------------/

//--- M15 ---/

   if (sbs_alx_stoch_mtf_M15_Kline_data[1] > sbs_alx_stoch_mtf_M15_Kline_data[2])
   {
      alx_stoch_mtf_signal.local_direction_M15 = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_stoch_mtf_M15_Kline_data[1] < sbs_alx_stoch_mtf_M15_Kline_data[2])
   {
      alx_stoch_mtf_signal.local_direction_M15 = SBS_ALX_TREND_DOWN;
   }

//--- H1 ---/

   if (sbs_alx_stoch_mtf_H1_Kline_data[1] > sbs_alx_stoch_mtf_H1_Kline_data[2])
   {
      alx_stoch_mtf_signal.local_direction_H1 = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_stoch_mtf_H1_Kline_data[1] < sbs_alx_stoch_mtf_H1_Kline_data[2])
   {
      alx_stoch_mtf_signal.local_direction_H1 = SBS_ALX_TREND_DOWN;
   }
   
//--- H4 ---/

   if (sbs_alx_stoch_mtf_H4_Kline_data[1] > sbs_alx_stoch_mtf_H4_Kline_data[2])
   {
      alx_stoch_mtf_signal.local_direction_H4 = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_stoch_mtf_H4_Kline_data[1] < sbs_alx_stoch_mtf_H4_Kline_data[2])
   {
      alx_stoch_mtf_signal.local_direction_H4 = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_WCCI_State_and_Rules() ===============/

void     Get_ALX_WCCI_State_and_Rules()
{
//--------------------------- Reset WCCI States ----------------------------/

   alx_wcci_signal.trend_H1 = SBS_ALX_TREND_NONE;
   alx_wcci_signal.trend_H4 = SBS_ALX_TREND_NONE;

//--------------------------- Set WCCI Levels ------------------------------/

   alx_wcci_signal.LevelUp     =  200;
   alx_wcci_signal.LevelDown   = -200;

//--------------------------- Set WCCI Trends ------------------------------/

//--- H1 ---/

   if (
         (sbs_alx_wcci_H1_turboCCI_data[0] >= (1.2 * alx_wcci_signal.LevelUp)) ||
         (sbs_alx_wcci_H1_turboCCI_data[1] >= alx_wcci_signal.LevelUp)
      )
   {
      alx_wcci_signal.trend_H1 = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_wcci_H1_turboCCI_data[0] <= (1.2 * alx_wcci_signal.LevelDown)) ||
         (sbs_alx_wcci_H1_turboCCI_data[1] <= alx_wcci_signal.LevelDown)
      )
   {
      alx_wcci_signal.trend_H1 = SBS_ALX_TREND_DOWN;
   }

//--- H4 ---/

   if (
         (sbs_alx_wcci_H4_turboCCI_data[0] >= (1.2 * alx_wcci_signal.LevelUp)) ||
         (sbs_alx_wcci_H4_turboCCI_data[1] >= alx_wcci_signal.LevelUp)
      )
   {
      alx_wcci_signal.trend_H4 = SBS_ALX_TREND_UP;
   }
   
   if (
         (sbs_alx_wcci_H4_turboCCI_data[0] <= (1.2 * alx_wcci_signal.LevelDown)) ||
         (sbs_alx_wcci_H4_turboCCI_data[1] <= alx_wcci_signal.LevelDown)
      )
   {
      alx_wcci_signal.trend_H4 = SBS_ALX_TREND_DOWN;
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_PIVOT_State_and_Rules() ==============/

void     Get_ALX_PIVOT_State_and_Rules()
{
int      i;

//--------------------------- Reset PIVOT States ---------------------------/

   alx_pivot_signal.Res3  = 0;
   alx_pivot_signal.Res2  = 0;
   alx_pivot_signal.Res1  = 0;
   alx_pivot_signal.Pivot = 0;
   alx_pivot_signal.Supp1 = 0;
   alx_pivot_signal.Supp2 = 0;
   alx_pivot_signal.Supp3 = 0;
   
   alx_pivot_signal.last_bar_0 = 0;
   alx_pivot_signal.last_bar_1 = 0;
   
   alx_pivot_signal.Res1_trend  = SBS_ALX_TREND_NONE;
   alx_pivot_signal.Pivot_trend = SBS_ALX_TREND_NONE;
   alx_pivot_signal.Supp1_trend = SBS_ALX_TREND_NONE;

//--------------------------- Get Current (Bar 0) PIVOT Values -------------/

   alx_pivot_signal.Res3  = sbs_alx_pivot_Res3_data[0];
   alx_pivot_signal.Res2  = sbs_alx_pivot_Res2_data[0];
   alx_pivot_signal.Res1  = sbs_alx_pivot_Res1_data[0];
   alx_pivot_signal.Pivot = sbs_alx_pivot_Pivot_data[0];
   alx_pivot_signal.Supp1 = sbs_alx_pivot_Supp1_data[0];
   alx_pivot_signal.Supp2 = sbs_alx_pivot_Supp2_data[0];
   alx_pivot_signal.Supp3 = sbs_alx_pivot_Supp3_data[0];

//--------------------------- Get PIVOT Placement Coordinates --------------/

//--- placement_pos ---/

   alx_pivot_signal.placement_pos = SBS_ALX_Get_Pivot_Placement_Pos(0,Close[0]);

//--------------------------- Get Last Bars for PIVOT days 0 & 1 -----------/

//--- last_bar_0 ---/

   for (i = 1; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_alx_pivot_Pivot_data[i] != sbs_alx_pivot_Pivot_data[i-1])
      {
         alx_pivot_signal.last_bar_0 = i - 1;
         break;
      }
   }

//--- last_bar_1 ---/

   for (i = (alx_pivot_signal.last_bar_0 + 2); i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_alx_pivot_Pivot_data[i] != sbs_alx_pivot_Pivot_data[i-1])
      {
         alx_pivot_signal.last_bar_1 = i - 1;
         break;
      }
   }
   
   if (alx_pivot_signal.last_bar_1 == 0)
   {
      alx_pivot_signal.last_bar_1 = alx_pivot_signal.last_bar_0;
   }

//--------------------------- Get PIVOT Level 0 & 1 Values -----------------/

   alx_pivot_signal.level_0[6] = sbs_alx_pivot_Res3_data[alx_pivot_signal.last_bar_0];
   alx_pivot_signal.level_0[5] = sbs_alx_pivot_Res2_data[alx_pivot_signal.last_bar_0];
   alx_pivot_signal.level_0[4] = sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0];
   alx_pivot_signal.level_0[3] = sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0];
   alx_pivot_signal.level_0[2] = sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0];
   alx_pivot_signal.level_0[1] = sbs_alx_pivot_Supp2_data[alx_pivot_signal.last_bar_0];
   alx_pivot_signal.level_0[0] = sbs_alx_pivot_Supp3_data[alx_pivot_signal.last_bar_0];
   
   alx_pivot_signal.level_1[6] = sbs_alx_pivot_Res3_data[alx_pivot_signal.last_bar_1];
   alx_pivot_signal.level_1[5] = sbs_alx_pivot_Res2_data[alx_pivot_signal.last_bar_1];
   alx_pivot_signal.level_1[4] = sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1];
   alx_pivot_signal.level_1[3] = sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1];
   alx_pivot_signal.level_1[2] = sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1];
   alx_pivot_signal.level_1[1] = sbs_alx_pivot_Supp2_data[alx_pivot_signal.last_bar_1];
   alx_pivot_signal.level_1[0] = sbs_alx_pivot_Supp3_data[alx_pivot_signal.last_bar_1];

//--------------------------- Get PIVOT Bounce Parameters ------------------/

//--- bounce_sell_pos_0 ---/

   alx_pivot_signal.bounce_sell_bar_0 = iHighest(NULL,0,MODE_HIGH,(alx_pivot_signal.last_bar_0 + 1),0);
   alx_pivot_signal.bounce_sell_val_0 = High[alx_pivot_signal.bounce_sell_bar_0];
   alx_pivot_signal.bounce_sell_pos_0 = SBS_ALX_Get_Pivot_Placement_Pos(alx_pivot_signal.bounce_sell_bar_0,alx_pivot_signal.bounce_sell_val_0);

//--- bounce_sell_pos_1 ---/

   if (alx_pivot_signal.last_bar_1 > alx_pivot_signal.last_bar_0)
   {
      alx_pivot_signal.bounce_sell_bar_1 = iHighest(NULL,0,MODE_HIGH,(alx_pivot_signal.last_bar_1 - alx_pivot_signal.last_bar_0),(alx_pivot_signal.last_bar_0 + 1));
      alx_pivot_signal.bounce_sell_val_1 = High[alx_pivot_signal.bounce_sell_bar_1];
      alx_pivot_signal.bounce_sell_pos_1 = SBS_ALX_Get_Pivot_Placement_Pos(alx_pivot_signal.bounce_sell_bar_1,alx_pivot_signal.bounce_sell_val_1);
   }
   else
   {
      alx_pivot_signal.bounce_sell_bar_1 = alx_pivot_signal.bounce_sell_bar_0;
      alx_pivot_signal.bounce_sell_val_1 = alx_pivot_signal.bounce_sell_val_0;
      alx_pivot_signal.bounce_sell_pos_1 = alx_pivot_signal.bounce_sell_pos_0;
   }

//--- bounce_buy_pos_0 ---/

   alx_pivot_signal.bounce_buy_bar_0 = iLowest(NULL,0,MODE_LOW,(alx_pivot_signal.last_bar_0 + 1),0);
   alx_pivot_signal.bounce_buy_val_0 = Low[alx_pivot_signal.bounce_buy_bar_0];
   alx_pivot_signal.bounce_buy_pos_0 = SBS_ALX_Get_Pivot_Placement_Pos(alx_pivot_signal.bounce_buy_bar_0,alx_pivot_signal.bounce_buy_val_0);

//--- bounce_buy_pos_1 ---/

   if (alx_pivot_signal.last_bar_1 > alx_pivot_signal.last_bar_0)
   {
      alx_pivot_signal.bounce_buy_bar_1 = iLowest(NULL,0,MODE_LOW,(alx_pivot_signal.last_bar_1 - alx_pivot_signal.last_bar_0),(alx_pivot_signal.last_bar_0 + 1));
      alx_pivot_signal.bounce_buy_val_1 = Low[alx_pivot_signal.bounce_buy_bar_1];
      alx_pivot_signal.bounce_buy_pos_1 = SBS_ALX_Get_Pivot_Placement_Pos(alx_pivot_signal.bounce_buy_bar_1,alx_pivot_signal.bounce_buy_val_1);
   }
   else
   {
      alx_pivot_signal.bounce_buy_bar_1 = alx_pivot_signal.bounce_buy_bar_0;
      alx_pivot_signal.bounce_buy_val_1 = alx_pivot_signal.bounce_buy_val_0;
      alx_pivot_signal.bounce_buy_pos_1 = alx_pivot_signal.bounce_buy_pos_0;
   }

//--------------------------- Get PIVOT Stoploss Recommended Values --------/

//--- stoploss_sell ---/

   alx_pivot_signal.stoploss_sell = SBS_ALX_Get_Pivot_Stoploss_Sell();

//--- stoploss_buy ---/

   alx_pivot_signal.stoploss_buy = SBS_ALX_Get_Pivot_Stoploss_Buy();

//--------------------------- Get PIVOT Trailing Stoploss Values -----------/

//--- stoploss_trl_sell ---/

   alx_pivot_signal.stoploss_trl_sell = MathMax(alx_pivot_signal.stoploss_trl_sell,alx_pivot_signal.stoploss_sell);

//--- stoploss_trl_buy ---/

   alx_pivot_signal.stoploss_trl_buy = MathMin(alx_pivot_signal.stoploss_trl_buy,alx_pivot_signal.stoploss_buy);

//--------------------------- Get PIVOT Trends -----------------------------/

//--- Res1_trend ---/

   if (sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] > sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1])
   {
      alx_pivot_signal.Res1_trend  = SBS_ALX_TREND_UP;
   }
   else
   {
      alx_pivot_signal.Res1_trend  = SBS_ALX_TREND_DOWN;
   }
   
//--- Pivot_trend ---/

   if (sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0] > sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1])
   {
      alx_pivot_signal.Pivot_trend  = SBS_ALX_TREND_UP;
   }
   else
   {
      alx_pivot_signal.Pivot_trend  = SBS_ALX_TREND_DOWN;
   }

//--- Supp1_trend ---/

   if (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] > sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1])
   {
      alx_pivot_signal.Supp1_trend  = SBS_ALX_TREND_UP;
   }
   else
   {
      alx_pivot_signal.Supp1_trend  = SBS_ALX_TREND_DOWN;
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_XST_State_and_Rules() ================/

void     Get_ALX_XST_State_and_Rules()
{
int      i;

//--------------------------- Reset XST States -----------------------------/

   alx_xst_signal.trend_H1       = SBS_ALX_TREND_NONE;
   alx_xst_signal.trend_H1_40    = SBS_ALX_TREND_NONE;
   alx_xst_signal.trend_H4       = SBS_ALX_TREND_NONE;
   alx_xst_signal.trend_H1_60_34 = SBS_ALX_TREND_NONE;
   
   alx_xst_signal.age_H1    = 0;
   alx_xst_signal.age_H1_40 = 0;
   
   alx_xst_signal.val_H1       = 0;
   alx_xst_signal.val_H1_40    = 0;
   alx_xst_signal.val_H4       = 0;
   alx_xst_signal.val_H1_60_34 = 0;
   
   alx_xst_signal.extreme_bar_H1    = 0;
   alx_xst_signal.extreme_bar_H1_40 = 0;
   
   alx_xst_signal.extreme_val_H1    = 0;
   alx_xst_signal.extreme_val_H1_40 = 0;

//--------------------------- Get XST Trends & val_H1 ----------------------/

//--- H1 ---/
/*
   if (sbs_alx_xst_mtf_Up_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H1 = SBS_ALX_TREND_UP;
      alx_xst_signal.val_H1   = sbs_alx_xst_mtf_Up_data[0];
   }
   
   if (sbs_alx_xst_mtf_Dn_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H1 = SBS_ALX_TREND_DOWN;
      alx_xst_signal.val_H1   = sbs_alx_xst_mtf_Dn_data[0];
   }
*/
//--- H1_40 ---/

   if (sbs_alx_xst_mtf_40_Up_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H1_40 = SBS_ALX_TREND_UP;
      alx_xst_signal.val_H1_40   = sbs_alx_xst_mtf_40_Up_data[0];
   }
   
   if (sbs_alx_xst_mtf_40_Dn_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H1_40 = SBS_ALX_TREND_DOWN;
      alx_xst_signal.val_H1_40   = sbs_alx_xst_mtf_40_Dn_data[0];
   }

//--- H4 ---/
/*
   if (sbs_alx_xst_mtf_H4_Up_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H4 = SBS_ALX_TREND_UP;
      alx_xst_signal.val_H4   = sbs_alx_xst_mtf_H4_Up_data[0];
   }
   
   if (sbs_alx_xst_mtf_H4_Dn_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H4 = SBS_ALX_TREND_DOWN;
      alx_xst_signal.val_H4   = sbs_alx_xst_mtf_H4_Dn_data[0];
   }

//--- H1_60_34 ---/

   if (sbs_alx_xst_mtf_60_34_Up_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H1_60_34 = SBS_ALX_TREND_UP;
      alx_xst_signal.val_H1_60_34   = sbs_alx_xst_mtf_60_34_Up_data[0];
   }
   
   if (sbs_alx_xst_mtf_60_34_Dn_data[0] != EMPTY_VALUE)
   {
      alx_xst_signal.trend_H1_60_34 = SBS_ALX_TREND_DOWN;
      alx_xst_signal.val_H1_60_34   = sbs_alx_xst_mtf_60_34_Dn_data[0];
   }
*/
//--------------------------- Get XST Ages ---------------------------------/

//--- age_H1 ---/
/*
   if (alx_xst_signal.trend_H1 == SBS_ALX_TREND_UP)
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_xst_mtf_Up_data[i] == EMPTY_VALUE)
         {
            break;
         }
      }
      
      alx_xst_signal.age_H1 = i;
   }
   
   if (alx_xst_signal.trend_H1 == SBS_ALX_TREND_DOWN)
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_xst_mtf_Dn_data[i] == EMPTY_VALUE)
         {
            break;
         }
      }
      
      alx_xst_signal.age_H1 = i;
   }
*/
//--- age_H1_40 ---/

   if (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP)
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_xst_mtf_40_Up_data[i] == EMPTY_VALUE)
         {
            break;
         }
      }
      
      alx_xst_signal.age_H1_40 = i;
   }
   
   if (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN)
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_xst_mtf_40_Dn_data[i] == EMPTY_VALUE)
         {
            break;
         }
      }
      
      alx_xst_signal.age_H1_40 = i;
   }

//--------------------------- Get XST Extreme bars & vals ------------------/

//--- extreme_H1 ---/
/*
   if (alx_xst_signal.trend_H1 == SBS_ALX_TREND_UP)
   {
      alx_xst_signal.extreme_val_H1 = sbs_alx_xst_mtf_Up_data[0];
      
      for (i = 1; i < alx_xst_signal.age_H1; i++)
      {
         if (sbs_alx_xst_mtf_Up_data[i] < sbs_alx_xst_mtf_Up_data[i-1])
         {
            alx_xst_signal.extreme_bar_H1 = i;
            alx_xst_signal.extreme_val_H1 = sbs_alx_xst_mtf_Up_data[i];
         }
      }
   }
   
   if (alx_xst_signal.trend_H1 == SBS_ALX_TREND_DOWN)
   {
      alx_xst_signal.extreme_val_H1 = sbs_alx_xst_mtf_Dn_data[0];
      
      for (i = 1; i < alx_xst_signal.age_H1; i++)
      {
         if (sbs_alx_xst_mtf_Dn_data[i] > sbs_alx_xst_mtf_Dn_data[i-1])
         {
            alx_xst_signal.extreme_bar_H1 = i;
            alx_xst_signal.extreme_val_H1 = sbs_alx_xst_mtf_Dn_data[i];
         }
      }
   }
*/
//--- extreme_H1_40 ---/

   if (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP)
   {
      alx_xst_signal.extreme_val_H1_40 = sbs_alx_xst_mtf_40_Up_data[0];
      
      for (i = 1; i < alx_xst_signal.age_H1_40; i++)
      {
         if (sbs_alx_xst_mtf_40_Up_data[i] < sbs_alx_xst_mtf_40_Up_data[i-1])
         {
            alx_xst_signal.extreme_bar_H1_40 = i;
            alx_xst_signal.extreme_val_H1_40 = sbs_alx_xst_mtf_40_Up_data[i];
         }
      }
   }
   
   if (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN)
   {
      alx_xst_signal.extreme_val_H1_40 = sbs_alx_xst_mtf_40_Dn_data[0];
      
      for (i = 1; i < alx_xst_signal.age_H1_40; i++)
      {
         if (sbs_alx_xst_mtf_40_Dn_data[i] > sbs_alx_xst_mtf_40_Dn_data[i-1])
         {
            alx_xst_signal.extreme_bar_H1_40 = i;
            alx_xst_signal.extreme_val_H1_40 = sbs_alx_xst_mtf_40_Dn_data[i];
         }
      }
   }

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_WDMI_State_and_Rules() ===============/

void     Get_ALX_WDMI_State_and_Rules()
{

//--------------------------- Reset WDMI States -----------------------------/
   
   alx_wdmi_signal.DI_trend  = SBS_ALX_TREND_NONE;
   
   alx_wdmi_signal.adx_max   = 0;
   alx_wdmi_signal.adx_min   = 0;
   
   alx_wdmi_signal.adx_hi_level = 30;
   alx_wdmi_signal.adx_md_level = 20;
   alx_wdmi_signal.adx_lo_level = 15;
   
   alx_wdmi_signal.adx_cross_level     = 32;
   
   alx_wdmi_signal.adx_tma_open_level  = 25;
   alx_wdmi_signal.adx_tma_close_level = 25;

//--------------------------- Get WDMI DI Trend -----------------------------/

   if (
         (alx_wdmi_signal.DIp != 0) &&
         (alx_wdmi_signal.DIm != 0)
      )
   {
      if (alx_wdmi_signal.DIp > alx_wdmi_signal.DIm)
      {
         alx_wdmi_signal.DI_trend = SBS_ALX_TREND_UP;
      }
      
      if (alx_wdmi_signal.DIp < alx_wdmi_signal.DIm)
      {
         alx_wdmi_signal.DI_trend = SBS_ALX_TREND_DOWN;
      }
   }

//--------------------------- Get WDMI adx_max & adx_min -------------------/

   alx_wdmi_signal.adx_max = MathMax(alx_wdmi_signal.ADX,alx_wdmi_signal.ADXR);
   
   alx_wdmi_signal.adx_min = MathMin(alx_wdmi_signal.ADX,alx_wdmi_signal.ADXR);

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_TMA_State_and_Rules() =================/

void     Get_ALX_TMA_State_and_Rules()
{
int      i;

int      cross_bar_hi;
int      cross_bar_lo;

int      cross_1;
int      cross_2;

int      trigger;

//--------------------------- Reset TMA States ------------------------------/

//--- States ---/
   
   alx_tma_signal.basic_upper1_state       = SBS_ALX_NO_STATE;
   alx_tma_signal.basic_short_upper1_state = SBS_ALX_NO_STATE;
   alx_tma_signal.xst_upper1_state         = SBS_ALX_NO_STATE;
   alx_tma_signal.xst_basic_state          = SBS_ALX_NO_STATE;
   alx_tma_signal.candle_upper1_state      = SBS_ALX_NO_STATE;

//--- Upper1 data ---/

   alx_tma_signal.upper1_trend_approval_bars = 5;
   alx_tma_signal.upper1_trend               = SBS_ALX_TREND_NONE;
   alx_tma_signal.upper1_trend_age           = 0; 
   
   alx_tma_signal.xst_dn_upper1_dn_number = 0;
   alx_tma_signal.xst_up_upper1_up_number = 0;

//--- Basic cross Upper1 data ---/

   alx_tma_signal.basic_upper1_trend_age        = 0; 
   
   alx_tma_signal.xst_dn_basic_upper1_dn_number = 0;
   alx_tma_signal.xst_up_basic_upper1_up_number = 0;

//--- Basic_Short cross Upper1 data ---/

   alx_tma_signal.basic_short_upper1_trend_age     = 0; 
   
   alx_tma_signal.xst_dn_basic_sh_upper1_dn_number = 0;
   alx_tma_signal.xst_up_basic_sh_upper1_up_number = 0;
   
//--- Candle cross Upper1 data ---/

   alx_tma_signal.candle_upper1_shift            = 2;
   alx_tma_signal.candle_upper1_trend_age        = 0;
   
   alx_tma_signal.xst_dn_candle_upper1_gr_number = 0;
   alx_tma_signal.xst_up_candle_upper1_le_number = 0;
   
//--------------------------- Get TMA basic_upper1_state -------------------/

//=== SBS_ALX_BASIC_GR_UPPER1_STATE or SBS_ALX_BASIC_LE_UPPER1_STATE ===/

   if (sbs_alx_tma_basic_hi_data[0] > sbs_alx_tma_upper1_hi_data[0])
   {
      alx_tma_signal.basic_upper1_state = SBS_ALX_BASIC_GR_UPPER1_STATE;
   }
   
   if (sbs_alx_tma_basic_lo_data[0] < sbs_alx_tma_upper1_lo_data[0])
   {
      alx_tma_signal.basic_upper1_state = SBS_ALX_BASIC_LE_UPPER1_STATE;
   }

//=== SBS_ALX_BASIC_CROSS_UPPER1_HI_STATE or SBS_ALX_BASIC_CROSS_UPPER1_LO_STATE ===/

   if (alx_tma_signal.basic_upper1_state == SBS_ALX_NO_STATE)
   {
      cross_bar_hi = SBS_INDI_BARS_NO;
      cross_bar_lo = SBS_INDI_BARS_NO;

//--- cross_bar_hi ---/

      if (
            (sbs_alx_tma_basic_hi_data[0] < sbs_alx_tma_upper1_hi_data[0]) &&
            (sbs_alx_tma_basic_lo_data[0] > sbs_alx_tma_upper1_lo_data[0])
         )
      {
         for (i = 1; i < SBS_INDI_BARS_NO; i++)
         {
            if (sbs_alx_tma_basic_hi_data[i] > sbs_alx_tma_upper1_hi_data[i])
            {
               cross_bar_hi = i - 1;
               break;
            }
         }
      }

//--- cross_bar_lo ---/

      if (
            (sbs_alx_tma_basic_lo_data[0] > sbs_alx_tma_upper1_lo_data[0]) &&
            (sbs_alx_tma_basic_hi_data[0] < sbs_alx_tma_upper1_hi_data[0])
         )
      {
         for (i = 1; i < SBS_INDI_BARS_NO; i++)
         {
            if (sbs_alx_tma_basic_lo_data[i] < sbs_alx_tma_upper1_lo_data[i])
            {
               cross_bar_lo = i - 1;
               break;
            }
         }
      }

//--- cross_bar_hi & cross_bar_lo comperison---/

      if (
            (cross_bar_hi != SBS_INDI_BARS_NO) ||
            (cross_bar_lo != SBS_INDI_BARS_NO)
         )
      {
         if (cross_bar_hi < cross_bar_lo)
         {
            alx_tma_signal.basic_upper1_state     = SBS_ALX_BASIC_CROSS_UPPER1_HI_STATE;
            alx_tma_signal.basic_upper1_trend_age = cross_bar_hi;
         }
         
         if (cross_bar_hi > cross_bar_lo)
         {
            alx_tma_signal.basic_upper1_state     = SBS_ALX_BASIC_CROSS_UPPER1_LO_STATE;
            alx_tma_signal.basic_upper1_trend_age = cross_bar_lo;
         }
      }
   
   }

//=== SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_HI_STATE or SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_LO_STATE ===/

   if (alx_tma_signal.basic_upper1_state == SBS_ALX_NO_STATE)
   {
//--- Check for HI Cross ---/

      if (sbs_alx_tma_basic_lo_data[0] < sbs_alx_tma_upper1_md_data[0])
      {
         cross_1 = SBS_INDI_BARS_NO;
         cross_2 = SBS_INDI_BARS_NO;
      
//--- get cross_1 ---/

         for (i = 1; i < SBS_INDI_BARS_NO; i++)
         {
            if (sbs_alx_tma_basic_lo_data[i] > sbs_alx_tma_upper1_md_data[i])
            {
               cross_1 = i - 1;
               break;
            }
         }
         
         if (cross_1 < (SBS_INDI_BARS_NO - 1))
         {
//--- get cross_2 ---/

            for (i = (cross_1 + 1); i < SBS_INDI_BARS_NO; i++)
            {
               if (sbs_alx_tma_basic_lo_data[i] < sbs_alx_tma_upper1_md_data[i])
               {
                  cross_2 = i - 1;
                  break;
               }
            }

//--- check if basic hi upper upper1 hi ---/

            trigger = 0;

            for (i = cross_1; i <= cross_2; i++)
            {
               if (sbs_alx_tma_basic_hi_data[i] > sbs_alx_tma_upper1_hi_data[i])
               {
                  trigger = 1;
                  break;
               }
            }
            
//--- Set the State ---/
            
            if (trigger == 0)
            {
               alx_tma_signal.basic_upper1_state     = SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_HI_STATE;
               alx_tma_signal.basic_upper1_trend_age = cross_1;
            }
            
         }
      }  //--- Check for HI Cross ---/

//--- Check for LO Cross ---/

      if (
            (alx_tma_signal.basic_upper1_state == SBS_ALX_NO_STATE) &&
            (sbs_alx_tma_basic_hi_data[0] > sbs_alx_tma_upper1_md_data[0])
         )
      {
         cross_1 = SBS_INDI_BARS_NO;
         cross_2 = SBS_INDI_BARS_NO;
      
//--- get cross_1 ---/

         for (i = 1; i < SBS_INDI_BARS_NO; i++)
         {
            if (sbs_alx_tma_basic_hi_data[i] < sbs_alx_tma_upper1_md_data[i])
            {
               cross_1 = i - 1;
               break;
            }
         }
         
         if (cross_1 < (SBS_INDI_BARS_NO - 1))
         {
//--- get cross_2 ---/

            for (i = (cross_1 + 1); i < SBS_INDI_BARS_NO; i++)
            {
               if (sbs_alx_tma_basic_hi_data[i] > sbs_alx_tma_upper1_md_data[i])
               {
                  cross_2 = i - 1;
                  break;
               }
            }

//--- check if basic lo lower upper1 lo ---/

            trigger = 0;

            for (i = cross_1; i <= cross_2; i++)
            {
               if (sbs_alx_tma_basic_lo_data[i] < sbs_alx_tma_upper1_lo_data[i])
               {
                  trigger = 1;
                  break;
               }
            }
            
//--- Set the State ---/
            
            if (trigger == 0)
            {
               alx_tma_signal.basic_upper1_state     = SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_LO_STATE;
               alx_tma_signal.basic_upper1_trend_age = cross_1;
            }
            
         }
      }  //--- Check for LO Cross ---/

   }

//=== SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE or SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE ===/

   if (
         (alx_tma_signal.basic_upper1_state       == SBS_ALX_NO_STATE) &&
         (alx_tma_signal.basic_short_upper1_state == SBS_ALX_NO_STATE)
      )
   {
//--- Check for HI Cross ---/

      if (sbs_alx_tma_basic_short_lo_data[0] < sbs_alx_tma_upper1_md_data[0])
      {
         cross_1 = SBS_INDI_BARS_NO;
         cross_2 = SBS_INDI_BARS_NO;
      
//--- get cross_1 ---/

         for (i = 1; i < SBS_INDI_BARS_NO; i++)
         {
            if (sbs_alx_tma_basic_short_lo_data[i] > sbs_alx_tma_upper1_md_data[i])
            {
               cross_1 = i - 1;
               break;
            }
         }
         
         if (cross_1 < (SBS_INDI_BARS_NO - 1))
         {
//--- get cross_2 ---/

            for (i = (cross_1 + 1); i < SBS_INDI_BARS_NO; i++)
            {
               if (sbs_alx_tma_basic_short_lo_data[i] < sbs_alx_tma_upper1_md_data[i])
               {
                  cross_2 = i - 1;
                  break;
               }
            }

//--- check if basic hi upper upper1 hi ---/

            trigger = 0;

            for (i = cross_1; i <= cross_2; i++)
            {
               if (sbs_alx_tma_basic_hi_data[i] > sbs_alx_tma_upper1_hi_data[i])
               {
                  trigger = 1;
                  break;
               }
            }
            
//--- Set the State ---/
            
            if (trigger == 0)
            {
               alx_tma_signal.basic_short_upper1_state     = SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE;
               alx_tma_signal.basic_short_upper1_trend_age = cross_1;
            }
            
         }
      }  //--- Check for HI Cross ---/

//--- Check for LO Cross ---/

      if (sbs_alx_tma_basic_short_hi_data[0] > sbs_alx_tma_upper1_md_data[0])
      {
         cross_1 = SBS_INDI_BARS_NO;
         cross_2 = SBS_INDI_BARS_NO;
      
//--- get cross_1 ---/

         for (i = 1; i < SBS_INDI_BARS_NO; i++)
         {
            if (sbs_alx_tma_basic_short_hi_data[i] < sbs_alx_tma_upper1_md_data[i])
            {
               cross_1 = i - 1;
               break;
            }
         }
         
         if (cross_1 < (SBS_INDI_BARS_NO - 1))
         {
//--- get cross_2 ---/

            for (i = (cross_1 + 1); i < SBS_INDI_BARS_NO; i++)
            {
               if (sbs_alx_tma_basic_short_hi_data[i] > sbs_alx_tma_upper1_md_data[i])
               {
                  cross_2 = i - 1;
                  break;
               }
            }

//--- check if basic lo lower upper1 lo ---/

            trigger = 0;

            for (i = cross_1; i <= cross_2; i++)
            {
               if (sbs_alx_tma_basic_lo_data[i] < sbs_alx_tma_upper1_lo_data[i])
               {
                  trigger = 1;
                  break;
               }
            }
            
//--- Set the State ---/
            
            if (trigger == 0)
            {
               alx_tma_signal.basic_short_upper1_state     = SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE;
               alx_tma_signal.basic_short_upper1_trend_age = cross_1;
            }
            
         }
      }  //--- Check for LO Cross ---/
        
   }  //=== SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE or SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE ===/

//=== SBS_ALX_CANDLE_GR_UPPER1_STATE or SBS_ALX_CANDLE_LE_UPPER1_STATE ===/

   if (
         (alx_tma_signal.basic_upper1_state       == SBS_ALX_NO_STATE) &&
         (alx_tma_signal.basic_short_upper1_state == SBS_ALX_NO_STATE) &&
         (alx_tma_signal.candle_upper1_state      == SBS_ALX_NO_STATE)
      )
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)
      {
         if (
               ((High[i] + (alx_tma_signal.candle_upper1_shift * n_Point)) >= sbs_alx_tma_upper1_hi_data[i]) &&
               (High[i-1] < sbs_alx_tma_upper1_hi_data[i-1])
            )
         {
            alx_tma_signal.candle_upper1_state = SBS_ALX_CANDLE_GR_UPPER1_STATE;
            alx_tma_signal.candle_upper1_trend_age = i - 1;
            break;
         }
         
         if (
               ((Low[i] - (alx_tma_signal.candle_upper1_shift * n_Point)) <= sbs_alx_tma_upper1_lo_data[i]) &&
               (Low[i-1] > sbs_alx_tma_upper1_lo_data[i-1])
            )
         {
            alx_tma_signal.candle_upper1_state = SBS_ALX_CANDLE_LE_UPPER1_STATE;
            alx_tma_signal.candle_upper1_trend_age = i - 1;
            break;
         }
      }
   }

//--------------------------- Get TMA xst_upper1_state ---------------------/

   if (
         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
         (XST_greater_or_cross_TMA(sbs_alx_xst_mtf_40_Dn_data,sbs_alx_tma_upper1_hi_data))
      )
   {
      alx_tma_signal.xst_upper1_state = SBS_ALX_XST_GR_UPPER1_STATE;
   }
   
   if (
         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
         (XST_less_or_cross_TMA(sbs_alx_xst_mtf_40_Up_data,sbs_alx_tma_upper1_lo_data))
      )
   {
      alx_tma_signal.xst_upper1_state = SBS_ALX_XST_LE_UPPER1_STATE;
   }

//--------------------------- Get TMA xst_basic_state ----------------------/

   if (
         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
         (XST_greater_or_cross_TMA(sbs_alx_xst_mtf_40_Dn_data,sbs_alx_tma_basic_hi_data))
      )
   {
      alx_tma_signal.xst_basic_state = SBS_ALX_XST_GR_BASIC_STATE;
   }
   
   if (
         (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
         (XST_less_or_cross_TMA(sbs_alx_xst_mtf_40_Up_data,sbs_alx_tma_basic_lo_data))
      )
   {
      alx_tma_signal.xst_basic_state = SBS_ALX_XST_LE_BASIC_STATE;
   }

//--------------------------- Get TMA upper1_trend -------------------------/

//--- Check for Down upper1_trend ---/

   if (
         (alx_tma_signal.upper1_trend == SBS_ALX_TREND_NONE) &&
         (sbs_alx_tma_upper1_hi_data[0] <= sbs_alx_tma_upper1_hi_data[1])
      )
   {
      for (i = 0; i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_tma_upper1_hi_data[i] > sbs_alx_tma_upper1_hi_data[i+1])
         {
            if (i >= (alx_tma_signal.upper1_trend_approval_bars - 1))
            {
               alx_tma_signal.upper1_trend = SBS_ALX_TREND_DOWN;
               alx_tma_signal.upper1_trend_age = i;
               break;
            }
         }
      }
   }

//--- Check for Up upper1_trend ---/

   if (
         (alx_tma_signal.upper1_trend == SBS_ALX_TREND_NONE) &&
         (sbs_alx_tma_upper1_lo_data[0] >= sbs_alx_tma_upper1_lo_data[1])
      )
   {
      for (i = 0; i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_tma_upper1_lo_data[i] < sbs_alx_tma_upper1_lo_data[i+1])
         {
            if (i >= (alx_tma_signal.upper1_trend_approval_bars - 1))
            {
               alx_tma_signal.upper1_trend = SBS_ALX_TREND_UP;
               alx_tma_signal.upper1_trend_age = i;
               break;
            }
         }
      }
   }

//--------------------------- Get TMA xst_upper1_numbers -------------------/

//--- xst_dn_upper1_dn_number ---/

   if (
         (alx_tma_signal.upper1_trend == SBS_ALX_TREND_DOWN) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_DOWN)
      )
   {
      alx_tma_signal.xst_dn_upper1_dn_number = XST_Down_Number_for_Bar(alx_tma_signal.upper1_trend_age);
   }

//--- xst_up_upper1_up_number ---/

   if (
         (alx_tma_signal.upper1_trend == SBS_ALX_TREND_UP) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_UP)
      )
   {
      alx_tma_signal.xst_up_upper1_up_number = XST_Up_Number_for_Bar(alx_tma_signal.upper1_trend_age);
   }

//--------------------------- Get TMA xst_basic-cross-upper1_numbers -------------------/

//--- xst_dn_basic_upper1_dn_number ---/

   if (
         (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_HI_STATE) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_DOWN)
      )
   {
      alx_tma_signal.xst_dn_basic_upper1_dn_number = XST_Down_Number_for_Bar(alx_tma_signal.basic_upper1_trend_age);
   }

//--- xst_up_basic_upper1_up_number ---/

   if (
         (alx_tma_signal.basic_upper1_state == SBS_ALX_BASIC_CROSS_UPPER1_LO_STATE) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_UP)
      )
   {
      alx_tma_signal.xst_up_basic_upper1_up_number = XST_Up_Number_for_Bar(alx_tma_signal.basic_upper1_trend_age);
   }

//--------------------------- Get TMA xst_basic_short-cross-upper1_numbers -------------/

//--- xst_dn_basic_sh_upper1_dn_number ---/

   if (
         (alx_tma_signal.basic_short_upper1_state == SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_DOWN)
      )
   {
      alx_tma_signal.xst_dn_basic_sh_upper1_dn_number = XST_Down_Number_for_Bar(alx_tma_signal.basic_short_upper1_trend_age);
   }

//--- xst_up_basic_sh_upper1_up_number ---/

   if (
         (alx_tma_signal.basic_short_upper1_state == SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_UP)
      )
   {
      alx_tma_signal.xst_up_basic_sh_upper1_up_number = XST_Up_Number_for_Bar(alx_tma_signal.basic_short_upper1_trend_age);
   }

//--------------------------- Get TMA xst__candle_upper1__number -------------/

//--- xst_dn_candle_upper1_gr_number ---/

   if (
         (alx_tma_signal.candle_upper1_state == SBS_ALX_CANDLE_GR_UPPER1_STATE) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_DOWN)
      )
   {
      alx_tma_signal.xst_dn_candle_upper1_gr_number = XST_Down_Number_for_Bar(alx_tma_signal.candle_upper1_trend_age);
   }

//--- xst_up_candle_upper1_le_number ---/

   if (
         (alx_tma_signal.candle_upper1_state == SBS_ALX_CANDLE_LE_UPPER1_STATE) &&
         (alx_xst_signal.trend_H1_40  == SBS_ALX_TREND_UP)
      )
   {
      alx_tma_signal.xst_up_candle_upper1_le_number = XST_Up_Number_for_Bar(alx_tma_signal.basic_short_upper1_trend_age);
   }

//--------------------------------------------------------------------------/

   return;
}

//================== eof sbs_alx_indi_data_proc_lbr.mqh ====================/

