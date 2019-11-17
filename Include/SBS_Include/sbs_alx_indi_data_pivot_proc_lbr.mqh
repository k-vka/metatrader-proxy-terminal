//================== sbs_alx_indi_data_pivot_proc_lbr.mqh ==================/

//=========================== SBS_ALX_Get_Pivot_Placement_Pos() ============/

int     SBS_ALX_Get_Pivot_Placement_Pos(int check_bar, double check_value)
{
int      placement;

   placement = 0;

   if                                                         (check_value <= sbs_alx_pivot_Supp3_data[check_bar])  {placement = 0;}
   if ((check_value > sbs_alx_pivot_Supp3_data[check_bar]) && (check_value <= sbs_alx_pivot_Supp2_data[check_bar])) {placement = 1;}
   if ((check_value > sbs_alx_pivot_Supp2_data[check_bar]) && (check_value <= sbs_alx_pivot_Supp1_data[check_bar])) {placement = 2;}
   if ((check_value > sbs_alx_pivot_Supp1_data[check_bar]) && (check_value <= sbs_alx_pivot_Pivot_data[check_bar])) {placement = 3;}
   if ((check_value > sbs_alx_pivot_Pivot_data[check_bar]) && (check_value <= sbs_alx_pivot_Res1_data[check_bar]))  {placement = 4;}
   if ((check_value > sbs_alx_pivot_Res1_data[check_bar])  && (check_value <= sbs_alx_pivot_Res2_data[check_bar]))  {placement = 5;}
   if ((check_value > sbs_alx_pivot_Res2_data[check_bar])  && (check_value <= sbs_alx_pivot_Res3_data[check_bar]))  {placement = 6;}
   if  (check_value > sbs_alx_pivot_Res3_data[check_bar])                                                           {placement = 7;}

//--------------------------------------------------------------------------/

   return(placement);
}

//=========================== SBS_ALX_Get_Pivot_Placement_Levels() =========/

pivot_placement_level_structure     SBS_ALX_Get_Pivot_Placement_Levels(int check_placement_pos, int check_bar)
{
pivot_placement_level_structure      placement_levels;

   placement_levels.hi = 0;
   placement_levels.lo = 0;
   
   if (check_placement_pos == 0)
   {
      placement_levels.hi = sbs_alx_pivot_Supp3_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Supp3_data[check_bar];
   }
   
   if (check_placement_pos == 1)
   {
      placement_levels.hi = sbs_alx_pivot_Supp2_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Supp3_data[check_bar];
   }
   
   if (check_placement_pos == 2)
   {
      placement_levels.hi = sbs_alx_pivot_Supp1_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Supp2_data[check_bar];
   }
   
   if (check_placement_pos == 3)
   {
      placement_levels.hi = sbs_alx_pivot_Pivot_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Supp1_data[check_bar];
   }
   
   if (check_placement_pos == 4)
   {
      placement_levels.hi = sbs_alx_pivot_Res1_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Pivot_data[check_bar];
   }
   
   if (check_placement_pos == 5)
   {
      placement_levels.hi = sbs_alx_pivot_Res2_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Res1_data[check_bar];
   }
   
   if (check_placement_pos == 6)
   {
      placement_levels.hi = sbs_alx_pivot_Res3_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Res2_data[check_bar];
   }
   
   if (check_placement_pos == 7)
   {
      placement_levels.hi = sbs_alx_pivot_Res3_data[check_bar];
      placement_levels.lo = sbs_alx_pivot_Res3_data[check_bar];
   }

//--------------------------------------------------------------------------/

   return(placement_levels);
}

//=========================== SBS_ALX_Get_Pivot_Stoploss_Sell() ============/

double   SBS_ALX_Get_Pivot_Stoploss_Sell()
{
pivot_placement_level_structure  placement_level_0;
pivot_placement_level_structure  placement_level_1;
pivot_placement_level_structure  placement_close_0;

double   recommended_sl;
double   extremum_sl;

   recommended_sl = 0;

//--------------------------- Get Placement Levels 0 & 1 -------------------/

//--- placement_level_0 ---/

   placement_level_0 = SBS_ALX_Get_Pivot_Placement_Levels(alx_pivot_signal.bounce_sell_pos_0,alx_pivot_signal.bounce_sell_bar_0);
   
   if (alx_pivot_signal.bounce_sell_pos_0 == 0)
   {
      placement_level_0.lo = alx_pivot_signal.bounce_buy_val_0;
   }
   
   if (alx_pivot_signal.bounce_sell_pos_0 == 7)
   {
      placement_level_0.hi = alx_pivot_signal.bounce_sell_val_0;
   }
   
//--- placement_level_1 ---/

   placement_level_1 = SBS_ALX_Get_Pivot_Placement_Levels(alx_pivot_signal.bounce_sell_pos_1,alx_pivot_signal.bounce_sell_bar_1);
   
   if (alx_pivot_signal.bounce_sell_pos_1 == 0)
   {
      placement_level_1.lo = alx_pivot_signal.bounce_buy_val_1;
   }
   
   if (alx_pivot_signal.bounce_sell_pos_1 == 7)
   {
      placement_level_1.hi = alx_pivot_signal.bounce_sell_val_1;
   }

//--- placement_close_0 ---/

   placement_close_0 = SBS_ALX_Get_Pivot_Placement_Levels(alx_pivot_signal.placement_pos,0);
   
   if (alx_pivot_signal.placement_pos == 0)
   {
      placement_close_0.lo = alx_pivot_signal.bounce_buy_val_1;
   }
   
   if (alx_pivot_signal.placement_pos == 7)
   {
      placement_close_0.hi = alx_pivot_signal.bounce_sell_val_1;
   }

//--------------------------- Get recommended_sl ---------------------------/

   recommended_sl = SBS_ALX_Define_Standard_Pivot_SL_Sell(placement_level_0,placement_level_1,placement_close_0);
   
   extremum_sl = Close[0] + (50 * n_Point);
   
   if (recommended_sl == 0)
   {
      recommended_sl = extremum_sl;
   }
   
   if (recommended_sl > extremum_sl)
   {
      recommended_sl = extremum_sl;
   }

//--------------------------------------------------------------------------/

   return(recommended_sl);
}

//=========================== SBS_ALX_Get_Pivot_Stoploss_Buy() ============/

double   SBS_ALX_Get_Pivot_Stoploss_Buy()
{
pivot_placement_level_structure  placement_level_0;
pivot_placement_level_structure  placement_level_1;
pivot_placement_level_structure  placement_close_0;

double   recommended_sl;
double   extremum_sl;

   recommended_sl = 0;

//--------------------------- Get Placement Levels 0 & 1 -------------------/

//--- placement_level_0 ---/

   placement_level_0 = SBS_ALX_Get_Pivot_Placement_Levels(alx_pivot_signal.bounce_buy_pos_0,alx_pivot_signal.bounce_buy_bar_0);
   
   if (alx_pivot_signal.bounce_buy_pos_0 == 0)
   {
      placement_level_0.lo = alx_pivot_signal.bounce_buy_val_0;
   }
   
   if (alx_pivot_signal.bounce_buy_pos_0 == 7)
   {
      placement_level_0.hi = alx_pivot_signal.bounce_sell_val_0;
   }
   
//--- placement_level_1 ---/

   placement_level_1 = SBS_ALX_Get_Pivot_Placement_Levels(alx_pivot_signal.bounce_buy_pos_1,alx_pivot_signal.bounce_buy_bar_1);
   
   if (alx_pivot_signal.bounce_buy_pos_1 == 0)
   {
      placement_level_1.lo = alx_pivot_signal.bounce_buy_val_1;
   }
   
   if (alx_pivot_signal.bounce_buy_pos_1 == 7)
   {
      placement_level_1.hi = alx_pivot_signal.bounce_sell_val_1;
   }

//--- placement_close_0 ---/

   placement_close_0 = SBS_ALX_Get_Pivot_Placement_Levels(alx_pivot_signal.placement_pos,0);
   
   if (alx_pivot_signal.placement_pos == 0)
   {
      placement_close_0.lo = alx_pivot_signal.bounce_buy_val_1;
   }
   
   if (alx_pivot_signal.placement_pos == 7)
   {
      placement_close_0.hi = alx_pivot_signal.bounce_sell_val_1;
   }

//--------------------------- Get recommended_sl ---------------------------/

   recommended_sl = SBS_ALX_Define_Standard_Pivot_SL_Buy(placement_level_0,placement_level_1,placement_close_0);
   
   extremum_sl = Close[0] - (50 * n_Point);
   
   if (recommended_sl == 0)
   {
      recommended_sl = extremum_sl;
   }
   
   if (recommended_sl < extremum_sl)
   {
      recommended_sl = extremum_sl;
   }

//--------------------------------------------------------------------------/

   return(recommended_sl);
}

//=========================== SBS_ALX_Define_Standard_Pivot_SL_Sell() ======/

double   SBS_ALX_Define_Standard_Pivot_SL_Sell(pivot_placement_level_structure &p_level_0,
                                               pivot_placement_level_structure &p_level_1,
                                               pivot_placement_level_structure &p_close_0)
{
double      standard_pivot_sl;

//--------------------------- Get SL for levels 0 --------------------------/

//--------------------------- placement_pos < bounce_sell_pos_0 ------------/

   if (alx_pivot_signal.placement_pos < alx_pivot_signal.bounce_sell_pos_0)
   {
//--- placement diff > 1 ---/

      if ((alx_pivot_signal.bounce_sell_pos_0 - alx_pivot_signal.placement_pos) > 1)
      {
         if (((p_close_0.hi - Close[0]) / (p_close_0.hi - p_close_0.lo)) > 0.5)
         {
            standard_pivot_sl = p_close_0.hi + ((alx_pivot_signal.level_0[alx_pivot_signal.placement_pos + 1] - p_close_0.hi) / 2);
         }
         else
         {
            if (alx_pivot_signal.placement_pos < 6)
            {
               standard_pivot_sl = alx_pivot_signal.level_0[alx_pivot_signal.placement_pos + 1];
            }
            else
            {
               standard_pivot_sl = p_level_0.hi;
            }
         }
      }

//--- placement diff == 1 ---/

      if ((alx_pivot_signal.bounce_sell_pos_0 - alx_pivot_signal.placement_pos) == 1)
      {
         if (alx_pivot_signal.bounce_sell_pos_0 < alx_pivot_signal.bounce_sell_pos_1)
         {
            if (p_level_1.hi > p_level_0.hi)
            {
               standard_pivot_sl = p_level_1.hi;
            }
            else
            {
               standard_pivot_sl = p_level_0.hi;
            }
         }
         
         if (alx_pivot_signal.bounce_sell_pos_0 == alx_pivot_signal.bounce_sell_pos_1)
         {
            if (((p_close_0.hi - Close[0]) / (p_close_0.hi - p_close_0.lo)) > 0.5)
            {
               standard_pivot_sl = p_close_0.hi;
            }
            else
            {
               if (alx_pivot_signal.placement_pos < 6)
               {
                  standard_pivot_sl = alx_pivot_signal.level_0[alx_pivot_signal.placement_pos + 1];
               }
               else
               {
                  standard_pivot_sl = p_close_0.hi;
               }
            }
         }
      }

   }

//--------------------------- placement_pos == bounce_sell_pos_0 -----------/
   
   if (alx_pivot_signal.placement_pos == alx_pivot_signal.bounce_sell_pos_0)
   {
//--- bounce placement diff > 1 ---/

      if ((alx_pivot_signal.bounce_sell_pos_1 - alx_pivot_signal.bounce_sell_pos_0) > 1)
      {
         standard_pivot_sl = p_level_0.hi - ((p_level_0.hi - alx_pivot_signal.bounce_sell_val_0) / 2);
      }
      
//--- bounce placement diff == 1 ---/

      if ((alx_pivot_signal.bounce_sell_pos_1 - alx_pivot_signal.bounce_sell_pos_0) == 1)
      {
         if (((p_level_0.hi - alx_pivot_signal.bounce_sell_val_0) / (alx_pivot_signal.bounce_sell_val_0 - p_level_0.lo)) < 0.5)
         {
            standard_pivot_sl = p_level_0.hi - ((p_level_0.hi - alx_pivot_signal.bounce_sell_val_0) / 2);
         }
         else           // !!!!!!
         {  
         }
      }

//--- bounce placement diff == 0 ---/

      if ((alx_pivot_signal.bounce_sell_pos_1 - alx_pivot_signal.bounce_sell_pos_0) == 0)
      {
         if ((alx_pivot_signal.bounce_sell_pos_1 - alx_pivot_signal.bounce_sell_pos_0) == 0)
         {
            standard_pivot_sl = p_level_0.hi - ((p_level_0.hi - alx_pivot_signal.bounce_sell_val_0) / 2);
         }
      }

   }

//--------------------------- Get Trailing Stoploss ------------------------/

   if (alx_pivot_signal.placement_pos == 7)
   {
      alx_pivot_signal.stoploss_trl_sell = MathMax(alx_pivot_signal.bounce_sell_pos_0,alx_pivot_signal.bounce_sell_pos_1);
   }
   
   if (alx_pivot_signal.placement_pos == 6)
   {
      alx_pivot_signal.stoploss_trl_sell = MathMax
                                             (
                                                MathMax(alx_pivot_signal.bounce_sell_pos_0,alx_pivot_signal.bounce_sell_pos_1),
                                                MathMax(alx_pivot_signal.level_0[6],alx_pivot_signal.level_1[6])
                                             );
   }

   if (alx_pivot_signal.placement_pos < 6)
   {
      alx_pivot_signal.stoploss_trl_sell = alx_pivot_signal.level_0[alx_pivot_signal.placement_pos + 1];
      
      if (
            ((alx_pivot_signal.placement_pos + 1) == 4) &&
            (alx_pivot_signal.level_0[alx_pivot_signal.placement_pos + 1] < alx_pivot_signal.level_1[alx_pivot_signal.placement_pos + 1]) &&
            (alx_pivot_signal.level_0[alx_pivot_signal.placement_pos] > alx_pivot_signal.level_1[alx_pivot_signal.placement_pos])
         )
      {
         alx_pivot_signal.stoploss_trl_sell = alx_pivot_signal.level_1[alx_pivot_signal.placement_pos + 1];
      }
   }

//--------------------------------------------------------------------------/

   return(standard_pivot_sl);
}

//=========================== SBS_ALX_Define_Standard_Pivot_SL_Buy() =======/

double   SBS_ALX_Define_Standard_Pivot_SL_Buy(pivot_placement_level_structure &p_level_0,
                                              pivot_placement_level_structure &p_level_1,
                                              pivot_placement_level_structure &p_close_0)
{
double      standard_pivot_sl;

//--------------------------- Get SL for levels 0 --------------------------/

//--------------------------- placement_pos > bounce_buy_pos_0 ------------/

   if (alx_pivot_signal.placement_pos > alx_pivot_signal.bounce_buy_pos_0)
   {
//--- placement diff > 1 ---/

      if ((alx_pivot_signal.placement_pos - alx_pivot_signal.bounce_buy_pos_0) > 1)
      {
         if (((p_close_0.hi - Close[0]) / (p_close_0.hi - p_close_0.lo)) < 0.5)
         {
            standard_pivot_sl = p_close_0.lo - ((p_close_0.lo - alx_pivot_signal.level_0[alx_pivot_signal.placement_pos - 2]) / 2);
         }
         else
         {
            if (alx_pivot_signal.placement_pos > 1)
            {
               standard_pivot_sl = alx_pivot_signal.level_0[alx_pivot_signal.placement_pos - 2];
            }
            else
            {
               standard_pivot_sl = p_level_0.lo;
            }
         }
      }

//--- placement diff == 1 ---/

      if ((alx_pivot_signal.placement_pos - alx_pivot_signal.bounce_buy_pos_0) == 1)
      {
         if (alx_pivot_signal.bounce_buy_pos_0 > alx_pivot_signal.bounce_buy_pos_1)
         {
            if (p_level_1.lo < p_level_0.lo)
            {
               standard_pivot_sl = p_level_1.lo;
            }
            else
            {
               standard_pivot_sl = p_level_0.lo;
            }
         }
         
         if (alx_pivot_signal.bounce_buy_pos_0 == alx_pivot_signal.bounce_buy_pos_1)
         {
            if (((p_close_0.hi - Close[0]) / (p_close_0.hi - p_close_0.lo)) < 0.5)
            {
               standard_pivot_sl = p_close_0.lo;
            }
            else
            {
               if (alx_pivot_signal.placement_pos > 0)
               {
                  standard_pivot_sl = alx_pivot_signal.level_0[MathMax(alx_pivot_signal.placement_pos - 2,0)];
               }
               else
               {
                  standard_pivot_sl = p_close_0.lo;
               }
            }
         }
      }

   }

//--------------------------- placement_pos == bounce_buy_pos_0 ------------/
   
   if (alx_pivot_signal.placement_pos == alx_pivot_signal.bounce_buy_pos_0)
   {
//--- bounce placement diff > 1 ---/

      if ((alx_pivot_signal.bounce_buy_pos_0 - alx_pivot_signal.bounce_buy_pos_1) > 1)
      {
         standard_pivot_sl = p_level_0.lo + ((alx_pivot_signal.bounce_buy_val_0 - p_level_0.lo) / 2);
      }
      
//--- bounce placement diff == 1 ---/

      if ((alx_pivot_signal.bounce_buy_pos_0 - alx_pivot_signal.bounce_buy_pos_1) == 1)
      {
         if (((p_level_0.hi - alx_pivot_signal.bounce_buy_val_0) / (alx_pivot_signal.bounce_buy_val_0 - p_level_0.lo)) > 0.5)
         {
            standard_pivot_sl = p_level_0.lo + ((alx_pivot_signal.bounce_buy_val_0 - p_level_0.lo) / 2);
         }
         else           // !!!!!!
         {  
         }
      }

//--- bounce placement diff == 0 ---/

      if ((alx_pivot_signal.bounce_buy_pos_0 - alx_pivot_signal.bounce_buy_pos_1) == 0)
      {
         if ((alx_pivot_signal.bounce_buy_pos_0 - alx_pivot_signal.bounce_buy_pos_1) == 0)
         {
            standard_pivot_sl = p_level_0.lo + ((alx_pivot_signal.bounce_buy_val_0 - p_level_0.lo) / 2);
         }
      }

   }

//--------------------------- Get Trailing Stoploss ------------------------/

   if (alx_pivot_signal.placement_pos == 0)
   {
      alx_pivot_signal.stoploss_trl_buy = MathMin(alx_pivot_signal.bounce_buy_pos_0,alx_pivot_signal.bounce_buy_pos_1);
   }
   
   if (alx_pivot_signal.placement_pos == 1)
   {
      alx_pivot_signal.stoploss_trl_buy = MathMin
                                             (
                                                MathMin(alx_pivot_signal.bounce_buy_pos_0,alx_pivot_signal.bounce_buy_pos_1),
                                                MathMin(alx_pivot_signal.level_0[0],alx_pivot_signal.level_1[0])
                                             );
   }

   if (alx_pivot_signal.placement_pos > 1)
   {
      alx_pivot_signal.stoploss_trl_buy = alx_pivot_signal.level_0[alx_pivot_signal.placement_pos - 2];
      
      if (
            ((alx_pivot_signal.placement_pos - 2) == 2) &&
            (alx_pivot_signal.level_0[alx_pivot_signal.placement_pos - 2] > alx_pivot_signal.level_1[alx_pivot_signal.placement_pos - 2]) &&
            (alx_pivot_signal.level_0[alx_pivot_signal.placement_pos - 1] < alx_pivot_signal.level_1[alx_pivot_signal.placement_pos - 1])
         )
      {
         alx_pivot_signal.stoploss_trl_buy = alx_pivot_signal.level_1[alx_pivot_signal.placement_pos - 2];
      }
   }

//--------------------------------------------------------------------------/

   return(standard_pivot_sl);
}

//================== eof sbs_alx_indi_data_pivot_proc_lbr.mqh ==============/

