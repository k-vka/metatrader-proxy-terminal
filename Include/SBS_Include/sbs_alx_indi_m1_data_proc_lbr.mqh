//================== sbs_alx_indi_m1_data_proc_lbr.mqh =====================/

//=========================== Get_ALX_TMA_M1_State_and_Rules() =============/

void     Get_ALX_TMA_M1_State_and_Rules()
{
//--------------------------- Reset MULTI_TMA States -----------------------/
   
   sbs_alx_multi_tma_signal.trend_m1  = SBS_ALX_TREND_NONE;
   sbs_alx_multi_tma_signal.trend_m5  = SBS_ALX_TREND_NONE;
   sbs_alx_multi_tma_signal.trend_m15 = SBS_ALX_TREND_NONE;
   sbs_alx_multi_tma_signal.trend_h1  = SBS_ALX_TREND_NONE;
   
   sbs_alx_multi_tma_signal.trend_age_m1  = 0;
   sbs_alx_multi_tma_signal.trend_age_m5  = 0;
   sbs_alx_multi_tma_signal.trend_age_m15 = 0;
   sbs_alx_multi_tma_signal.trend_age_h1  = 0;

//--------------------------- Set MULTI_TMA Parameters ---------------------/

   sbs_alx_multi_tma_signal.trend_age_bars     = 5;      // for M1 & M5
   
   sbs_alx_multi_tma_signal.trend_m15_age_bars = 15;
   sbs_alx_multi_tma_signal.trend_h1_age_bars  = 20;

//--------------------------- Get MULTI_TMA Trends (M1, M5) ----------------/

//--- trend_m1 ---/

   Get_Multi_TMA_Trend(sbs_alx_multi_tma_signal.trend_m1, 
                       sbs_alx_multi_tma_signal.trend_age_m1, 
                       sbs_alx_multi_tma_m1_md_data,
                       sbs_alx_multi_tma_signal.trend_age_bars);

//--- trend_m5 ---/

   Get_Multi_TMA_Trend(sbs_alx_multi_tma_signal.trend_m5, 
                       sbs_alx_multi_tma_signal.trend_age_m5, 
                       sbs_alx_multi_tma_m5_md_data,
                       sbs_alx_multi_tma_signal.trend_age_bars);

//--------------------------- Check if M1 RGLR Processing needed -----------/

   if (sbs_global_expert_profile != SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
   {
      return;
   }

//--------------------------- Get MULTI_TMA Trends (M15, H1) ----------------/

//--- trend_m15 ---/

   Get_Multi_TMA_Trend(sbs_alx_multi_tma_signal.trend_m15, 
                       sbs_alx_multi_tma_signal.trend_age_m15, 
                       sbs_alx_multi_tma_m15_md_data,
                       sbs_alx_multi_tma_signal.trend_m15_age_bars);

//--- trend_h1 ---/

   Get_Multi_TMA_Trend(sbs_alx_multi_tma_signal.trend_h1, 
                       sbs_alx_multi_tma_signal.trend_age_h1, 
                       sbs_alx_multi_tma_h1_md_data,
                       sbs_alx_multi_tma_signal.trend_h1_age_bars);

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_WPR_M1_State_and_Rules() =============/

void     Get_ALX_WPR_M1_State_and_Rules()
{
int      cross_bar_hi;
int      cross_bar_lo;
int      i;

//--------------------------- Reset WPR_M1 States & Trends -----------------/

   alx_wpr_signal.state_21  = SBS_ALX_NO_STATE;
   alx_wpr_signal.state_105 = SBS_ALX_NO_STATE;

   alx_wpr_signal.trend_21      = SBS_ALX_TREND_NONE;
   alx_wpr_signal.trend_105     = SBS_ALX_TREND_NONE;
   alx_wpr_signal.trend_general = SBS_ALX_TREND_NONE;
   
   alx_wpr_signal.pre_strong_bar_21 = 0;

//--------------------------- Set WPR_M1 Levels ----------------------------/
   
   alx_wpr_signal.wpr_21_hi_level  = (-20);
   alx_wpr_signal.wpr_21_lo_level  = (-80);
   
   alx_wpr_signal.wpr_105_hi_level = (-50);
   alx_wpr_signal.wpr_105_lo_level = (-50);

//--------------------------- Set WPR_M1 Zero (0) Values -------------------/

   alx_wpr_signal.wpr_21_value  = sbs_alx_wpr_21_data[0];
   alx_wpr_signal.wpr_105_value = sbs_alx_wpr_105_data[0];

//--------------------------- Set WPR_M1 States ----------------------------/

//--- state_21 ---/

   if (alx_wpr_signal.wpr_21_value >= alx_wpr_signal.wpr_21_hi_level)
   {
      alx_wpr_signal.state_21 = SBS_ALX_WPR_21_HI_STATE;
   }
   
   if (
         (alx_wpr_signal.wpr_21_value < alx_wpr_signal.wpr_21_hi_level) &&
         (alx_wpr_signal.wpr_21_value > alx_wpr_signal.wpr_21_lo_level)
      )
   {
      alx_wpr_signal.state_21 = SBS_ALX_WPR_21_MD_STATE;
   }
   
   if (alx_wpr_signal.wpr_21_value <= alx_wpr_signal.wpr_21_lo_level)
   {
      alx_wpr_signal.state_21 = SBS_ALX_WPR_21_LO_STATE;
   }

//--- state_105 ---/

   if (alx_wpr_signal.wpr_105_value >= alx_wpr_signal.wpr_21_hi_level)
   {
      alx_wpr_signal.state_105 = SBS_ALX_WPR_105_HI_STATE;
   }
   
   if (alx_wpr_signal.wpr_105_value <= alx_wpr_signal.wpr_21_lo_level)
   {
      alx_wpr_signal.state_105 = SBS_ALX_WPR_105_LO_STATE;
   }
   
   if (
         (alx_wpr_signal.wpr_105_value < alx_wpr_signal.wpr_21_hi_level) &&
         (alx_wpr_signal.wpr_105_value >= alx_wpr_signal.wpr_105_hi_level)
      )
   {
      alx_wpr_signal.state_105 = SBS_ALX_WPR_105_MD_HI_STATE;
   }
   
   if (
         (alx_wpr_signal.wpr_105_value > alx_wpr_signal.wpr_21_lo_level) &&
         (alx_wpr_signal.wpr_105_value <= alx_wpr_signal.wpr_105_lo_level)
      )
   {
      alx_wpr_signal.state_105 = SBS_ALX_WPR_105_MD_LO_STATE;
   }

//--------------------------- Set WPR_M1 Trends ----------------------------/

//--- trend_21 ---/

   if (alx_wpr_signal.state_21 == SBS_ALX_WPR_21_MD_STATE)
   {
      cross_bar_hi = SBS_Get_Indi_Array_Cross_Level_Bar(sbs_alx_wpr_21_data,alx_wpr_signal.wpr_21_hi_level);
      cross_bar_lo = SBS_Get_Indi_Array_Cross_Level_Bar(sbs_alx_wpr_21_data,alx_wpr_signal.wpr_21_lo_level);
      
      if (
            (cross_bar_hi <  (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo >= (SBS_INDI_BARS_NO - 1))
         )
      {
         alx_wpr_signal.trend_21 = SBS_ALX_TREND_DOWN_STRONG;
      }
      
      if (
            (cross_bar_hi >= (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo <  (SBS_INDI_BARS_NO - 1))
         )
      {
         alx_wpr_signal.trend_21 = SBS_ALX_TREND_UP_STRONG;
      }

      if (
            (cross_bar_hi < (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo < (SBS_INDI_BARS_NO - 1))
         )
      {
         if (cross_bar_hi <= cross_bar_lo)
         {
            alx_wpr_signal.trend_21 = SBS_ALX_TREND_DOWN_STRONG;
         }
         
         if (cross_bar_hi > cross_bar_lo)
         {
            alx_wpr_signal.trend_21 = SBS_ALX_TREND_UP_STRONG;
         }
      }
   }

//--- pre_strong_bar_21 ---/

   if (
         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_DOWN_STRONG) &&
         (cross_bar_hi < (SBS_INDI_BARS_NO - 2))
      )
   {
      for (i = (cross_bar_hi + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_wpr_21_data[i] < alx_wpr_signal.wpr_21_hi_level)
         {
            alx_wpr_signal.pre_strong_bar_21 = i;
            break;
         }
      }
   }
   
   if (
         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_UP_STRONG) &&
         (cross_bar_lo < (SBS_INDI_BARS_NO - 2))
      )
   {
      for (i = (cross_bar_lo + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_wpr_21_data[i] > alx_wpr_signal.wpr_21_lo_level)
         {
            alx_wpr_signal.pre_strong_bar_21 = i;
            break;
         }
      }
   }

//--- trend_105 ---/

   if (
         (alx_wpr_signal.state_105 == SBS_ALX_WPR_105_MD_LO_STATE) ||
         (alx_wpr_signal.state_105 == SBS_ALX_WPR_105_MD_HI_STATE)
      )
   {
      cross_bar_hi = SBS_Get_Indi_Array_Cross_Level_Bar(sbs_alx_wpr_105_data,alx_wpr_signal.wpr_21_hi_level);
      cross_bar_lo = SBS_Get_Indi_Array_Cross_Level_Bar(sbs_alx_wpr_105_data,alx_wpr_signal.wpr_21_lo_level);
      
      if (
            (cross_bar_hi <  (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo >= (SBS_INDI_BARS_NO - 1))
         )
      {
         alx_wpr_signal.trend_105 = SBS_ALX_TREND_DOWN_STRONG;
      }

      if (
            (cross_bar_hi < (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo < (SBS_INDI_BARS_NO - 1))
         )
      {
         if (cross_bar_hi < cross_bar_lo)
         {
            alx_wpr_signal.trend_105 = SBS_ALX_TREND_DOWN_STRONG;
         }
      }
   }
   
   if (
         (alx_wpr_signal.state_105 == SBS_ALX_WPR_105_MD_HI_STATE) ||
         (alx_wpr_signal.state_105 == SBS_ALX_WPR_105_MD_LO_STATE)
      )
   {
      cross_bar_hi = SBS_Get_Indi_Array_Cross_Level_Bar(sbs_alx_wpr_105_data,alx_wpr_signal.wpr_21_hi_level);
      cross_bar_lo = SBS_Get_Indi_Array_Cross_Level_Bar(sbs_alx_wpr_105_data,alx_wpr_signal.wpr_21_lo_level);
      
      if (
            (cross_bar_hi >= (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo <  (SBS_INDI_BARS_NO - 1))
         )
      {
         alx_wpr_signal.trend_105 = SBS_ALX_TREND_UP_STRONG;
      }

      if (
            (cross_bar_hi < (SBS_INDI_BARS_NO - 1)) &&
            (cross_bar_lo < (SBS_INDI_BARS_NO - 1))
         )
      {
         if (cross_bar_hi > cross_bar_lo)
         {
            alx_wpr_signal.trend_105 = SBS_ALX_TREND_UP_STRONG;
         }
      }
   }
//--- trend_general ---/

   if (
         (alx_wpr_signal.trend_21  == SBS_ALX_TREND_DOWN_STRONG) &&
         (alx_wpr_signal.trend_105 == SBS_ALX_TREND_DOWN_STRONG)
      )
   {
      alx_wpr_signal.trend_general = SBS_ALX_TREND_DOWN_STRONG;
   }
   
   if (
         (alx_wpr_signal.trend_21  == SBS_ALX_TREND_UP_STRONG) &&
         (alx_wpr_signal.trend_105 == SBS_ALX_TREND_UP_STRONG)
      )
   {
      alx_wpr_signal.trend_general = SBS_ALX_TREND_UP_STRONG;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_KC_M1_State_and_Rules() ==============/

void     Get_ALX_KC_M1_State_and_Rules()
{
int      i;

//--------------------------- Reset KC_M1 States & Trends ------------------/

   sbs_alx_multi_kc_signal.cross_m1      = SBS_ALX_TREND_NONE;
   sbs_alx_multi_kc_signal.cross_m1_wide = SBS_ALX_TREND_NONE;

//--------------------------- Set KC_M1 Trends -----------------------------/

//------ Check for SBS_ALX_TREND_DOWN ------/

   if (
         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_DOWN_STRONG)
      )
   {
//--- cross_m1 ---/

      if (Close[0] < sbs_alx_multi_kc_m1_upper_data[0])
      {
         for (i = 0; i < alx_wpr_signal.pre_strong_bar_21; i++)
         {
            if (High[i] > sbs_alx_multi_kc_m1_upper_data[i])
            {
               sbs_alx_multi_kc_signal.cross_m1 = SBS_ALX_TREND_DOWN;
               break;
            }
         }
      }

//--- cross_m1_wide ---/

      if (Close[0] < sbs_alx_multi_kc_m1_wide_upper_data[0])
      {
         for (i = 0; i < alx_wpr_signal.pre_strong_bar_21; i++)
         {
            if (High[i] > sbs_alx_multi_kc_m1_wide_upper_data[i])
            {
               sbs_alx_multi_kc_signal.cross_m1_wide = SBS_ALX_TREND_DOWN;
               break;
            }
         }
      }
   }

//------ Check for SBS_ALX_TREND_UP ------/

   if (
         (alx_wpr_signal.trend_21 == SBS_ALX_TREND_UP_STRONG)
      )
   {
//--- cross_m1 ---/

      if (Close[0] > sbs_alx_multi_kc_m1_lower_data[0])
      {
         for (i = 0; i < alx_wpr_signal.pre_strong_bar_21; i++)
         {
            if (Low[i] < sbs_alx_multi_kc_m1_lower_data[i])
            {
               sbs_alx_multi_kc_signal.cross_m1 = SBS_ALX_TREND_UP;
               break;
            }
         }
      }

//--- cross_m1_wide ---/

      if (Close[0] > sbs_alx_multi_kc_m1_wide_lower_data[0])
      {
         for (i = 0; i < alx_wpr_signal.pre_strong_bar_21; i++)
         {
            if (Low[i] < sbs_alx_multi_kc_m1_wide_lower_data[i])
            {
               sbs_alx_multi_kc_signal.cross_m1_wide = SBS_ALX_TREND_UP;
               break;
            }
         }
      }
   }
   
//--------------------------------------------------------------------------/

   return;
}

//================== eof sbs_alx_indi_m1_data_proc_lbr.mqh =================/
