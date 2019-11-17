//================== sbs_order_ft_zzl_cases_lbr.mqh ======================/

//========================== Get_SBS_FT_ZZL_Order_Case ===================/

void     Get_SBS_FT_ZZL_Order_Case()
{
//-------------------------- Reset FT ZZL Signal Data --------------------/

   Reset_SBS_FT_ZZL_Signal_Case();

//-------------------------- Set Case Profile ----------------------------/

   Set_FT_ZZL_Case_Profile();
   
//--------------------------Get_SBS_Indis_Position -----------------------/
   
   Get_SBS_Indis_Position();

//-------------------------- First ZZL signal processing -----------------/

   Process_FT_ZZL_First_zzl_Case();
   
//-------------------------- Second ZZL signal processing ----------------/

   Process_FT_ZZL_Second_zzl_Case();

//-------------------------- Third ZZL signal processing -----------------/

   Process_FT_ZZL_Third_Plus_zzl_Case();

//-------------------------- Extra bounce ZZL signal processing ----------/

   Process_FT_ZZL_Extra_Bounce_zzl_Case();

//------------------------------------------------------------------------/

   return;
}

void     Reset_SBS_FT_ZZL_Signal_Case()
{
//-------------------------- Reset FT ZZL Signal Data --------------------/

   sbs_ft_zzl_signal.signal         = NO_ORDER;
   sbs_ft_zzl_signal.case_number    = 0;
   sbs_ft_zzl_signal.case_subnumber = 0;

//------------------------------------------------------------------------/

   return;
}

//========================== Set_FT_ZZL_Case_Profile =====================/

void     Set_FT_ZZL_Case_Profile()
{
//-------------------------- SELL ft3 signal -----------------------------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bounce_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_extremum_bar != NO_BAR_NUMBER)
      )
   {
      sbs_ft_zzl_case.hi_level = NormalizeDouble(sbs_ft_zzl_profile.ft3_bounce_val,Digits);
      sbs_ft_zzl_case.lo_level = NormalizeDouble(sbs_ft_zzl_profile.ft3_extremum_val,Digits);
      sbs_ft_zzl_case.md_level = NormalizeDouble(((sbs_ft_zzl_case.hi_level + sbs_ft_zzl_case.lo_level) / 2),Digits);
   }

//-------------------------- BUY ft3 signal ------------------------------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.ft3_bounce_bar != NO_BAR_NUMBER) &&
         (sbs_ft_zzl_profile.ft3_extremum_bar != NO_BAR_NUMBER)
      )
   {
      sbs_ft_zzl_case.lo_level = NormalizeDouble(sbs_ft_zzl_profile.ft3_bounce_val,Digits);
      sbs_ft_zzl_case.hi_level = NormalizeDouble(sbs_ft_zzl_profile.ft3_extremum_val,Digits);
      sbs_ft_zzl_case.md_level = NormalizeDouble(((sbs_ft_zzl_case.hi_level + sbs_ft_zzl_case.lo_level) / 2),Digits);
   }

//-------------------------- Very 1st opposite zzl signal threshold ------/

   sbs_ft_zzl_case.first_o_signal_threshold = FIRST_O_ZZL_SIGNAL_THRESHOLD;
   
//-------------------------- Min ha2 jump after ft3 bounce to be effective opposite zzl signals -/   
   
   sbs_ft_zzl_case.ha2_effective_jump_level = H2_EFFECTIVE_JUMP_LEVEL;

//-------------------------- Levels deviation points ---------------------/
   
   sbs_ft_zzl_case.level_deviation_points = LEVEL_DEVIATION_POINTS;
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_FT_ZZL_First_zzl_Case ===============/

void     Process_FT_ZZL_First_zzl_Case()
{
//-------------------------- Very first opposite (SELL/BUY) zzl signal ---/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal_number == 1) &&
         (HA_ZZL_Jumped())
      )
   {
      if (((Close[0] - sbs_ft_zzl_case.lo_level) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.lo_level)) 
          > sbs_ft_zzl_case.first_o_signal_threshold)
      {
         Set_FT_ZZL_Signal(BUY_ORDER,201,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_101_201_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- Very first opposite (BUY/SELL) zzl signal ---/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal_number == 1) &&
         (HA_ZZL_Jumped())
      )
   {
      if (((sbs_ft_zzl_case.hi_level - Close[0]) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.lo_level)) 
          > sbs_ft_zzl_case.first_o_signal_threshold)
      {
         Set_FT_ZZL_Signal(SELL_ORDER,101,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_101_201_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- After first opposite zzl signal (SELL/SELL) -/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_buy_signals == 1)
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] < (sbs_zzl_buy_signal[0].extremum_val - sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,102,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_102_202_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
      
      if (                                               // cross mid level (bounce)
            (sbs_zzl_sell_signal[0].extremum_val >= (sbs_ft_zzl_case.md_level - sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,102,2);
         
         if (SBS_FT_ZZL_Case_Confirmed_102_202_2())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- After first opposite zzl signal (BUY/BUY) ---/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_sell_signals == 1)
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] > (sbs_zzl_sell_signal[0].extremum_val + sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,202,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_102_202_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
      
      if (                                               // cross mid level (bounce)
            (sbs_zzl_buy_signal[0].extremum_val <= (sbs_ft_zzl_case.md_level + sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,202,2);
                  
         if (SBS_FT_ZZL_Case_Confirmed_102_202_2())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- Very first the same (SELL/SELL) zzl signal --/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_sell_signals == 1) &&
         (sbs_ft_zzl_profile.zzl_buy_signals == 0)
      )
   {
      if ((Close[0] - sbs_ft_zzl_case.lo_level) == 0)
      {
         Set_FT_ZZL_Signal(SELL_ORDER,101,2);
         
         if (SBS_FT_ZZL_Case_Confirmed_101_201_2())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- Very first the same (BUY/BUY) zzl signal ----/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_sell_signals == 0) &&
         (sbs_ft_zzl_profile.zzl_buy_signals == 1)
      )
   {
      if ((sbs_ft_zzl_case.hi_level - Close[0]) == 0)
      {
         Set_FT_ZZL_Signal(BUY_ORDER,201,2);
         
         if (SBS_FT_ZZL_Case_Confirmed_101_201_2())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_FT_ZZL_Second_zzl_Case ==============/

void     Process_FT_ZZL_Second_zzl_Case()
{
//-------------------------- Second opposite (BUY/SELL) zzl signal -------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal_number == 2) &&
         (HA_ZZL_Jumped())
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] < (sbs_zzl_buy_signal[0].extremum_val - sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,103,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_103_203_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- Second opposite (SELL/BUY) zzl signal -------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal_number == 2) &&
         (HA_ZZL_Jumped())
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] > (sbs_zzl_sell_signal[0].extremum_val + sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,203,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_103_203_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- After second opposite zzl signal (SELL/SELL) /

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_buy_signals == 2)
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] < (sbs_zzl_buy_signal[0].extremum_val - sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,104,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_104_204_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- After second opposite zzl signal (BUY/BUY) --/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_sell_signals == 2)
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] > (sbs_zzl_sell_signal[0].extremum_val + sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,204,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_104_204_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_FT_ZZL_Third_Plus_zzl_Case ==========/

void     Process_FT_ZZL_Third_Plus_zzl_Case()
{
//-------------------------- Third+ opposite (BUY/SELL) zzl signal -------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal_number >= 3) &&
         (HA_ZZL_Jumped())
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] < (sbs_zzl_buy_signal[0].extremum_val - sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,105,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_105_205_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
      
      if (                                               // bounce from hi_level
            (sbs_zzl_sell_signal[0].extremum_val >= (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.level_deviation_points)) &&
            (((sbs_ft_zzl_case.hi_level - Close[0]) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.lo_level)) 
             > sbs_ft_zzl_case.first_o_signal_threshold)
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,105,2);
                  
         if (SBS_FT_ZZL_Case_Confirmed_105_205_2())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- Third+ opposite (SELL/BUY) zzl signal -------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal_number >= 3) &&
         (HA_ZZL_Jumped())
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] > (sbs_zzl_sell_signal[0].extremum_val + sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,205,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_105_205_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
      
      if (                                               // bounce from lo_level
            (sbs_zzl_buy_signal[0].extremum_val <= (sbs_ft_zzl_case.lo_level + sbs_ft_zzl_case.level_deviation_points)) &&
            (((Close[0] - sbs_ft_zzl_case.lo_level) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.lo_level)) 
             > sbs_ft_zzl_case.first_o_signal_threshold)
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,205,2);
                           
         if (SBS_FT_ZZL_Case_Confirmed_105_205_2())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- After third+ opposite zzl signal (SELL/SELL) /

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_buy_signals >= 3)
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] < (sbs_zzl_buy_signal[0].extremum_val - sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,106,1);
                                    
         if (SBS_FT_ZZL_Case_Confirmed_106_206_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- After third+ opposite zzl signal (BUY/BUY) ---/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_sell_signals >= 3)
      )
   {
      if (                                               // exceed previous zzl extremum
            (Close[0] > (sbs_zzl_sell_signal[0].extremum_val + sbs_ft_zzl_case.level_deviation_points))
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,206,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_106_206_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_FT_ZZL_Extra_Bounce_zzl_Case ========/

void     Process_FT_ZZL_Extra_Bounce_zzl_Case()
{
temp_extremum     local_extremum;

//-------------------------- (FT3 SELL/ZZL SELL) -------------------------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_buy_signals >= 1)
      )
   {
      local_extremum = Get_Min_ZZL(1);

      if (
            (sbs_ft_zzl_case.lo_level < local_extremum.val) &&
            (
               ((sbs_zzl_sell_signal[0].extremum_val - local_extremum.val) / 
                (sbs_zzl_sell_signal[0].extremum_val - sbs_ft_zzl_case.lo_level)
               ) > 0.5
            ) &&
            (Close[0] > sbs_zzl_sell_signal[0].extremum_val)
            
         )
      {
         Set_FT_ZZL_Signal(SELL_ORDER,111,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_111_211_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//-------------------------- (FT3 BUY/ZZL BUY) ---------------------------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_sell_signals >= 1)
      )
   {
      local_extremum = Get_Max_ZZL(1);
      
      if (
            (sbs_ft_zzl_case.hi_level > local_extremum.val) &&
            (
               ((sbs_zzl_buy_signal[0].extremum_val - local_extremum.val) / 
                (sbs_ft_zzl_case.hi_level - sbs_zzl_buy_signal[0].extremum_val)
               ) > 0.5
            ) &&
            (Close[0] < sbs_zzl_buy_signal[0].extremum_val)
            
         )
      {
         Set_FT_ZZL_Signal(BUY_ORDER,211,1);
         
         if (SBS_FT_ZZL_Case_Confirmed_111_211_1())
         {
            return;
         }
         else
         {
            Reset_SBS_FT_ZZL_Signal_Case();
         }
      }
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Set_FT_ZZL_Signal ===========================/

void     Set_FT_ZZL_Signal(int order_t, int case_no, int case_subno)
{
   sbs_ft_zzl_signal.signal         = order_t;
   sbs_ft_zzl_signal.case_number    = case_no;
   sbs_ft_zzl_signal.case_subnumber = case_subno;

//------------------------------------------------------------------------/

   return;
}

//================== eof sbs_order_ft_zzl_cases_lbr.mqh ==================/