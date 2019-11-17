//================== sbs_order_extra_data_lbr.mqh ======================/

//================== Get_SBS_FT_ZZL_State ==============================/

void     Get_SBS_FT_ZZL_State()
{
//------------------ Get_SBS_FT_ZZL_FT3_Profile ------------------------/

   Get_SBS_FT_ZZL_FT3_Profile();
   
   if (                                         // check existance of FT3 scope
         (sbs_ft_zzl_profile.ft3_second_bar == NO_BAR_NUMBER)
      )
   {
      return;
   }
   
//   Get_SBS_FT_ZZL_FT1_Profile();

   if (Get_SBS_Just_ZZL_Profile() < SBS_MAX_JUST_ZZL_SIGNALS)
   {
      return;
   }

   Get_SBS_FT_ZZL_ZZL_Profile();

//----------------------------------------------------------------------/

   return;
}

//================== Get_SBS_Just_ZZL_Profile ==========================/

int      Get_SBS_Just_ZZL_Profile()
{
int      i;
int      sell_signals;
int      buy_signals;
int      counter;

//------------------ Reset counters ------------------------------------/

   sell_signals = 0;
   buy_signals = 0;
   
//------------------ Fill in just zzl signal values --------------------/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (
            (sbs_indi_zzl_down_data[i] != 0) &&
            (sell_signals < SBS_MAX_JUST_ZZL_SIGNALS)
         )
      {
         sbs_just_zzl_sell_signal[sell_signals].bar = i;
         sbs_just_zzl_sell_signal[sell_signals].val = sbs_indi_zzl_down_data[i];
         sell_signals = sell_signals + 1;
      }
      
      if (
            (sbs_indi_zzl_up_data[i] != 0) &&
            (buy_signals < SBS_MAX_JUST_ZZL_SIGNALS)
         )
      {
         sbs_just_zzl_buy_signal[buy_signals].bar = i;
         sbs_just_zzl_buy_signal[buy_signals].val = sbs_indi_zzl_up_data[i];
         buy_signals = buy_signals + 1;
      }
      
      if (
            (sell_signals >= SBS_MAX_JUST_ZZL_SIGNALS) &&
            (buy_signals >= SBS_MAX_JUST_ZZL_SIGNALS)
         )
      {
         break;
      }
   }

//----------------------------------------------------------------------/

   if (
         (sell_signals >= SBS_MAX_JUST_ZZL_SIGNALS) &&
         (buy_signals >= SBS_MAX_JUST_ZZL_SIGNALS)
      )
   {
      counter = SBS_MAX_JUST_ZZL_SIGNALS;
   }
   else
   {
      counter = 0;
   }

   return(counter);
}

//================== Get_SBS_FT_ZZL_FT3_Profile ========================/

void     Get_SBS_FT_ZZL_FT3_Profile()
{
int      i;

//------------------ Reset ZZL_FT3 Profile -----------------------------/

   sbs_ft_zzl_profile.ft3_signal       = NO_ORDER;
   sbs_ft_zzl_profile.ft3_bar          = NO_BAR_NUMBER;
   sbs_ft_zzl_profile.ft3_second_bar   = NO_BAR_NUMBER;
   sbs_ft_zzl_profile.ft3_bounce_bar   = NO_BAR_NUMBER;
   sbs_ft_zzl_profile.ft3_extremum_bar = NO_BAR_NUMBER;
   
//------------------ Find 1-st FT3 Signal ------------------------------/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (
            (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE)
//            (sbs_indi_ft_buy_data[2][i+1] == EMPTY_VALUE)
         )
      {
         sbs_ft_zzl_profile.ft3_signal = SELL_ORDER;
         sbs_ft_zzl_profile.ft3_bar    = i;
         break;
      }
      
      if (
            (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE)
//            (sbs_indi_ft_sell_data[2][i+1] == EMPTY_VALUE)
         )
      {
         sbs_ft_zzl_profile.ft3_signal = BUY_ORDER;
         sbs_ft_zzl_profile.ft3_bar    = i;
         break;
      }
   }

   if (sbs_ft_zzl_profile.ft3_bar == NO_BAR_NUMBER)
   {
      return;
   }

//------------------ Find 2-nd FT3 Signal (Opposite 1-st one) ----------/

   if (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER)
   {
      for (i = sbs_ft_zzl_profile.ft3_bar; i < SBS_INDI_BARS_NO; i++)
      {
         if (
               (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE)
//               (sbs_indi_ft_sell_data[2][i+1] == EMPTY_VALUE)
            )
         {
            sbs_ft_zzl_profile.ft3_second_bar = i;
            break;
         }
      }
   }
   
   if (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER)
   {
      for (i = sbs_ft_zzl_profile.ft3_bar; i < SBS_INDI_BARS_NO; i++)
      {
         if (
               (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE)
//               (sbs_indi_ft_buy_data[2][i+1] == EMPTY_VALUE)
            )
         {
            sbs_ft_zzl_profile.ft3_second_bar = i;
            break;
         }
      }
   }
   
   if (sbs_ft_zzl_profile.ft3_second_bar == NO_BAR_NUMBER)
   {
      return;
   }

//------------------ Find FT3 Signal Bounce Bar & Value ----------------/

   if (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER)
   {
      sbs_ft_zzl_profile.ft3_bounce_bar = iHighest(NULL,0,MODE_HIGH,
              (sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar + 1),
               sbs_ft_zzl_profile.ft3_bar);

      sbs_ft_zzl_profile.ft3_bounce_val = High[sbs_ft_zzl_profile.ft3_bounce_bar];
   }
   
   if (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER)
   {
      sbs_ft_zzl_profile.ft3_bounce_bar = iLowest(NULL,0,MODE_LOW,
              (sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar + 1),
               sbs_ft_zzl_profile.ft3_bar);

      sbs_ft_zzl_profile.ft3_bounce_val = Low[sbs_ft_zzl_profile.ft3_bounce_bar];
   }

//------------------ Find FT3 Signal Extremum Bar & Value --------------/

   if (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER)
   {
      sbs_ft_zzl_profile.ft3_extremum_bar = iLowest(NULL,0,MODE_LOW,
               sbs_ft_zzl_profile.ft3_bounce_bar,
               0);

      sbs_ft_zzl_profile.ft3_extremum_val = Low[sbs_ft_zzl_profile.ft3_extremum_bar];
   }
   
   if (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER)
   {
      sbs_ft_zzl_profile.ft3_extremum_bar = iHighest(NULL,0,MODE_HIGH,
               sbs_ft_zzl_profile.ft3_bounce_bar,
               0);

      sbs_ft_zzl_profile.ft3_extremum_val = High[sbs_ft_zzl_profile.ft3_extremum_bar];
   }

//----------------------------------------------------------------------/

   return;
}

//================== Get_SBS_FT_ZZL_FT1_Profile ========================/

void     Get_SBS_FT_ZZL_FT1_Profile()
{
int      i;

//------------------ Reset ZZL_FT1 Profile -----------------------------/

   sbs_ft_zzl_profile.ft1_signal     = NO_ORDER;
   sbs_ft_zzl_profile.ft1_bar        = NO_BAR_NUMBER;
   sbs_ft_zzl_profile.ft1_second_bar = NO_BAR_NUMBER;
   
//------------------ Find 1-st FT1 Signal ------------------------------/

   for (i = 0; i < sbs_ft_zzl_profile.ft3_bar; i++)
   {
      if (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE)
      {
         sbs_ft_zzl_profile.ft1_signal = SELL_ORDER;
         sbs_ft_zzl_profile.ft1_bar    = i;
         break;
      }
      
      if (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE)
      {
         sbs_ft_zzl_profile.ft1_signal = BUY_ORDER;
         sbs_ft_zzl_profile.ft1_bar    = i;
         break;
      }
   }

   if (sbs_ft_zzl_profile.ft1_bar == NO_BAR_NUMBER)
   {
      return;
   }

//------------------ Find 2-nd FT1 Signal (Opposite 1-st one) ----------/

   if (sbs_ft_zzl_profile.ft1_signal == SELL_ORDER)
   {
      for (i = sbs_ft_zzl_profile.ft1_bar; i < sbs_ft_zzl_profile.ft3_bar; i++)
      {
         if (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE)
         {
            sbs_ft_zzl_profile.ft1_second_bar = i;
            break;
         }
      }
   }
   
   if (sbs_ft_zzl_profile.ft1_signal == BUY_ORDER)
   {
      for (i = sbs_ft_zzl_profile.ft1_bar; i < sbs_ft_zzl_profile.ft3_bar; i++)
      {
         if (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE)
         {
            sbs_ft_zzl_profile.ft1_second_bar = i;
            break;
         }
      }
   }
   
   if (sbs_ft_zzl_profile.ft1_second_bar == NO_BAR_NUMBER)
   {
      sbs_ft_zzl_profile.ft1_second_bar = sbs_ft_zzl_profile.ft3_bar;
   }

//------------------ Find FT1 Signal Bounce Bar & Value ----------------/

   if (sbs_ft_zzl_profile.ft1_signal == SELL_ORDER)
   {
      sbs_ft_zzl_profile.ft1_bounce_bar = iHighest(NULL,0,MODE_HIGH,
              (sbs_ft_zzl_profile.ft1_second_bar - sbs_ft_zzl_profile.ft1_bar + 1),
               sbs_ft_zzl_profile.ft1_bar);

      sbs_ft_zzl_profile.ft1_bounce_val = High[sbs_ft_zzl_profile.ft1_bounce_bar];
   }
   
   if (sbs_ft_zzl_profile.ft1_signal == BUY_ORDER)
   {
      sbs_ft_zzl_profile.ft1_bounce_bar = iLowest(NULL,0,MODE_LOW,
              (sbs_ft_zzl_profile.ft1_second_bar - sbs_ft_zzl_profile.ft1_bar + 1),
               sbs_ft_zzl_profile.ft1_bar);

      sbs_ft_zzl_profile.ft1_bounce_val = Low[sbs_ft_zzl_profile.ft1_bounce_bar];
   }

//------------------ Find FT1 Signal Extremum Bar & Value --------------/

   if (sbs_ft_zzl_profile.ft1_signal == SELL_ORDER)
   {
      sbs_ft_zzl_profile.ft1_extremum_bar = iLowest(NULL,0,MODE_LOW,
               sbs_ft_zzl_profile.ft1_bounce_bar,
               0);

      sbs_ft_zzl_profile.ft1_extremum_val = Low[sbs_ft_zzl_profile.ft1_extremum_bar];
   }
   
   if (sbs_ft_zzl_profile.ft1_signal == BUY_ORDER)
   {
      sbs_ft_zzl_profile.ft1_extremum_bar = iHighest(NULL,0,MODE_HIGH,
               sbs_ft_zzl_profile.ft1_bounce_bar,
               0);

      sbs_ft_zzl_profile.ft1_extremum_val = High[sbs_ft_zzl_profile.ft1_extremum_bar];
   }

//----------------------------------------------------------------------/

   return;
}

//================== Get_SBS_FT_ZZL_ZZL_Profile ========================/

void     Get_SBS_FT_ZZL_ZZL_Profile()
{
int      i;
int      j;
int      opposite_zzl_bar;

//------------------ Reset FT_ZZL zzl Profile --------------------------/

   sbs_ft_zzl_profile.zzl_signal        = NO_ORDER;   // 1-st zzl signal
   sbs_ft_zzl_profile.zzl_signal_number = 0;          // number of 1-st signal
   sbs_ft_zzl_profile.zzl_sell_signals  = 0;
   sbs_ft_zzl_profile.zzl_buy_signals   = 0;

//------------------ Collect zzl signals -------------------------------/

   for (i = 0; i < sbs_ft_zzl_profile.ft3_bar; i++)            // was ft3_bounce_bar
   {
      if (sbs_indi_zzl_down_data[i] != 0)
      {
         sbs_zzl_sell_signal[sbs_ft_zzl_profile.zzl_sell_signals].bar = i;
         sbs_zzl_sell_signal[sbs_ft_zzl_profile.zzl_sell_signals].val = sbs_indi_zzl_down_data[i];
         sbs_ft_zzl_profile.zzl_sell_signals = sbs_ft_zzl_profile.zzl_sell_signals + 1;
         
         if (sbs_ft_zzl_profile.zzl_sell_signals >= SBS_MAX_ZZL_SIGNALS)
         {
            break;
         }
      }
      
      if (sbs_indi_zzl_up_data[i] != 0)
      {
         sbs_zzl_buy_signal[sbs_ft_zzl_profile.zzl_buy_signals].bar = i;
         sbs_zzl_buy_signal[sbs_ft_zzl_profile.zzl_buy_signals].val = sbs_indi_zzl_up_data[i];
         sbs_ft_zzl_profile.zzl_buy_signals = sbs_ft_zzl_profile.zzl_buy_signals + 1;
         
         if (sbs_ft_zzl_profile.zzl_buy_signals >= SBS_MAX_ZZL_SIGNALS)
         {
            break;
         }
      }
   }

//------------------ Set 1-st zzl signal type --------------------------/

//--- both signal types ---/

   if (
         (sbs_ft_zzl_profile.zzl_sell_signals > 0) &&
         (sbs_ft_zzl_profile.zzl_buy_signals > 0)
      )
   {
      if (sbs_zzl_sell_signal[0].bar < sbs_zzl_buy_signal[0].bar)
      {
         sbs_ft_zzl_profile.zzl_signal = SELL_ORDER;
      }
      else
      {
         sbs_ft_zzl_profile.zzl_signal = BUY_ORDER;
      }
   }

//--- sell signal only ---/

   if (
         (sbs_ft_zzl_profile.zzl_sell_signals > 0) &&
         (sbs_ft_zzl_profile.zzl_buy_signals == 0)
      )
   {
      sbs_ft_zzl_profile.zzl_signal = SELL_ORDER;
   }

//--- buy signal only ---/

   if (
         (sbs_ft_zzl_profile.zzl_sell_signals == 0) &&
         (sbs_ft_zzl_profile.zzl_buy_signals > 0)
      )
   {
      sbs_ft_zzl_profile.zzl_signal = BUY_ORDER;
   }

//------------------ Get No of 1-st zzl signal (starting from ft3 bar) -/

   if (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER)
   {
      for (i = 0; i < sbs_ft_zzl_profile.zzl_sell_signals; i++)
      {
         if (sbs_zzl_sell_signal[i].bar > sbs_ft_zzl_profile.ft3_bar)
         {
            break;
         }
         
         sbs_ft_zzl_profile.zzl_signal_number = sbs_ft_zzl_profile.zzl_signal_number + 1;
      }
   }
   
   if (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER)
   {
      for (i = 0; i < sbs_ft_zzl_profile.zzl_buy_signals; i++)
      {
         if (sbs_zzl_buy_signal[i].bar > sbs_ft_zzl_profile.ft3_bar)
         {
            break;
         }
         
         sbs_ft_zzl_profile.zzl_signal_number = sbs_ft_zzl_profile.zzl_signal_number + 1;
      }
   }

//------------------ Get extremums (bar & val) data --------------------/

   if (
         (sbs_ft_zzl_profile.zzl_signal != SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal != BUY_ORDER)
      )
   {
      return;
   }

//------------------ Get Sell Signal Extremums -------------------------/

   if (sbs_ft_zzl_profile.zzl_sell_signals > 0)
   {
      if (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER)
      {
         j = 0;      // pointer to previous buy zzl signal
      }
   
      if (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER)
      {
         j = 1;      // pointer to prvious buy zzl signal
      }

      for (i = 0; i < sbs_ft_zzl_profile.zzl_sell_signals; i++)
      {
         if (j < sbs_ft_zzl_profile.zzl_buy_signals)
         {
            opposite_zzl_bar = sbs_zzl_buy_signal[j].bar;
            j = j + 1;
         }
         else
         {
            opposite_zzl_bar = sbs_ft_zzl_profile.ft3_bar;
         }

         sbs_zzl_sell_signal[i].extremum_bar = iHighest(NULL,0,MODE_HIGH,
               (opposite_zzl_bar - sbs_zzl_sell_signal[i].bar + 1),
                sbs_zzl_sell_signal[i].bar);

         sbs_zzl_sell_signal[i].extremum_val = High[sbs_zzl_sell_signal[i].extremum_bar];
      }
   }

//------------------ Get Buy Signal Extremums --------------------------/

   if (sbs_ft_zzl_profile.zzl_buy_signals > 0)
   {
      if (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER)
      {
         j = 0;      // pointer to previous sell zzl signal
      }
   
      if (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER)
      {
         j = 1;      // pointer to prvious sell zzl signal
      }

      for (i = 0; i < sbs_ft_zzl_profile.zzl_buy_signals; i++)
      {
         if (j < sbs_ft_zzl_profile.zzl_sell_signals)
         {
            opposite_zzl_bar = sbs_zzl_sell_signal[j].bar;
            j = j + 1;
         }
         else
         {
            opposite_zzl_bar = sbs_ft_zzl_profile.ft3_bar;
         }

         sbs_zzl_buy_signal[i].extremum_bar = iLowest(NULL,0,MODE_LOW,
               (opposite_zzl_bar - sbs_zzl_buy_signal[i].bar + 1),
                sbs_zzl_buy_signal[i].bar);

         sbs_zzl_buy_signal[i].extremum_val = Low[sbs_zzl_buy_signal[i].extremum_bar];
      }
   }

//----------------------------------------------------------------------/

   return;
}

//================== Get_SBS_Order_Extra_Data ==========================/

void     Get_SBS_Order_Extra_Data()
{
//------------------ Set Profile Default Order Direction ---------------/

   sbs_trail_order.direction  = ORDER_NORMAL_DIRECTION;
   
//------------------ Set Profile Default Stoploss ----------------------/

   sbs_profile_default_sl = (i_Reg1[IR_TOP][0] - i_Reg1[IR_MIDDLE][0]) / n_Point;

//----------------------------------------------------------------------/

   return;
}

//================== SBS_Init_Order_State ==============================/

void     SBS_Init_Order_State()
{
//------------------ Set State & Case Data -----------------------------/

   sbs_trail_order.state          = sbs_order.state;
   sbs_trail_order.case_number    = sbs_order.case_number;
   sbs_trail_order.subcase_number = sbs_order.subcase_number;
   
//------------------ SBS_Set_Trail_Order_Bounce_Data -------------------/
   
//   SBS_Set_Trail_Order_Bounce_Data();

//------------------ SBS_Set_Trail_Order_Profile_Data ------------------/
   
   SBS_Set_Trail_Order_Profile_Data();

//------------------ Set Order Initial Step ----------------------------/

   sbs_trail_order.step = ORDER_STEP_INITIAL;

//----------------------------------------------------------------------/

   return;
}

//================== SBS_Set_Trail_Order_Profile_Data ==================/

void     SBS_Set_Trail_Order_Profile_Data()
{
//------------------ Reset StopLoss ------------------------------------/

   sbs_trail_order.profile_sl = sbs_profile_default_sl;    // (in pips)

//----------------------------------------------------------------------/

   return;
}

//================== SBS_Set_Trail_Order_Bounce_Data ===================/

void     SBS_Set_Trail_Order_Bounce_Data()
{
int      i;

//--------------------- Process SELL_ORDER -----------------------------/

   if (sbs_indi_ft_series_order_signal.signal == SELL_ORDER)
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)    // Search BUY Signal (3rd or 4th)
      {
         if (
               (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[3][i] != EMPTY_VALUE)
            )
         {
            break;
         }
      }
      
      sbs_trail_order.bounce_bar = iHighest(NULL,0,MODE_HIGH,(i+1),0);
      sbs_trail_order.bounce_val = High[sbs_trail_order.bounce_bar];
   
   
   } // if (sbs_indi_ft_series_order_signal.signal == SELL_ORDER)

//--------------------- Process BUY_ORDER ------------------------------/

   if (sbs_indi_ft_series_order_signal.signal == BUY_ORDER)
   {
      for (i = 1; i < SBS_INDI_BARS_NO; i++)    // Search SELL Signal (3rd or 4th)
      {
         if (
               (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[3][i] != EMPTY_VALUE)
            )
         {
            break;
         }
      }
      
      sbs_trail_order.bounce_bar = iLowest(NULL,0,MODE_LOW,(i+1),0);
      sbs_trail_order.bounce_val = Low[sbs_trail_order.bounce_bar];
   
   
   } // if (sbs_indi_ft_series_order_signal.signal == BUY_ORDER)

//----------------------------------------------------------------------/

   return;
}

//================== SBS_Trail_Order ===================================/

void     SBS_Trail_Order_State()
{
//------------------ ORDER_STEP_INITIAL --------------------------------/

//----------------------------------------------------------------------/

   return;
}

//================== eof sbs_order_extra_data_lbr.mqh ==================/