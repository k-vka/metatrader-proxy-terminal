//================== sbs_ft_zzl_cases_confirmation_106_206_1_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_106_206_1 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_106_206_1()
{
temp_extremum     local_extremum;

//------------------ SELL_ORDER,106,1 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 106) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         return(true);
      }

//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (
               (ha3_max_val[sbs_ft_zzl_profile.ft3_bar] > sbs_ft_zzl_case.hi_level) &&
               (((ha3_min - sbs_ft_zzl_case.hi_level) / (ha3_max - ha3_min)) < 0.5)
            )
         {
            if (sbs_zzl_sell_signal[0].extremum_val > ha2_min_val[sbs_zzl_sell_signal[0].extremum_bar])
            {
               return(false);
            }
            
            return(true);
         }
         
         return(false);
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (
               ((sbs_ft_zzl_case.hi_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min) < 1)
            )
         {
            if (sbs_zzl_buy_signal[0].extremum_val < sbs_zzl_buy_signal[1].extremum_val)
            {
               return(true);
            }
            
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_case.hi_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min) >= 1)
            )
         {
            if (
                  (sbs_zzl_buy_signal[0].extremum_val < sbs_zzl_buy_signal[1].extremum_val) &&
                  (ha4_mx_ha2_Cross_04() < sbs_ft_zzl_profile.ft3_bar) &&
                  (sbs_zzl_sell_signal[2].extremum_val > ha2_min_val[sbs_zzl_sell_signal[2].extremum_bar])
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 1))
         {
            if (
                  (sbs_zzl_buy_signal[0].extremum_val > sbs_zzl_buy_signal[1].extremum_val)
               )
            {
               local_extremum = Get_Max_ZZL(2);
         
               if (
                     (local_extremum.val > ha2_max_val[local_extremum.bar])
                  )
               {
                  return(false);
               }
               
               return(true);
            }
            
            if (
                  (sbs_zzl_buy_signal[0].extremum_val <= sbs_zzl_buy_signal[1].extremum_val)
               )
            {
               if (sbs_ft_zzl_profile.ft3_bar < (16 * 3.5))
               {
                  return(true);
               }
               
               return(false);
            }
            
            return(true);
         }
      
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 1))
         {
            local_extremum = Get_Max_ZZL(2);
         
            if (
                  (local_extremum.val <= ha2_max_val[local_extremum.bar])
               )
            {
               return(true);
            }
            
            if (
                  (local_extremum.val > ha2_max_val[local_extremum.bar])
               )
            {
               if (
                     (sbs_zzl_sell_signal[0].extremum_val > sbs_zzl_sell_signal[1].extremum_val)
                  )
               {
                  return(true);
               }
               
               return(false);
            }  
            
            return(false);
         }
      
         return(true);
      }

//--- Position 234-124 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (ha4ha3_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            return(true);
         }
         
         if (
               (ha4ha3_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(false);
         }
         
         if (
               (ha4ha3_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4ha2_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) > 1)
            )
         {
            if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1))
            {
               return(true);
            }

            return(false);
         }
         
         if (
               (ha4ha3_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4ha2_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) <= 1)
            )
         {
            if (ha3_mx_ha2_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            {
               local_extremum = Get_Max_ZZL(4);
            
               if (
                     (local_extremum.val < sbs_ft_zzl_case.hi_level)
                  )
               {
                  return(true);
               }
               
               return(false);
            }
            
            if (ha3_mx_ha2_Cross_04() >= sbs_ft_zzl_profile.ft3_bar)
            {
               local_extremum = Get_Max_ZZL(1);
               
               if (
                     (local_extremum.val >= sbs_ft_zzl_case.hi_level)
                  )
               {
                  local_extremum = Second_Max_Val();
         
                  if (local_extremum.val == -1)
                  {
                     return(false);
                  }
         
                  if (((sbs_ft_zzl_case.hi_level - local_extremum.val) / (ha4_max - ha4_min)) < 1)
                  {
                     return(true);
                  }
                  
                  if (((sbs_ft_zzl_case.hi_level - local_extremum.val) / (ha4_max - ha4_min)) >= 1)
                  {
                     if (
                           (sbs_zzl_sell_signal[0].val < sbs_zzl_sell_signal[1].val)
                        )
                     {
                        return(true);
                     }

                     return(false);
                  }

                  return(false);
               }
               
               if (
                     (local_extremum.val < sbs_ft_zzl_case.hi_level)
                  )
               {
                  local_extremum = Get_Min_ZZL(2);
               
                  if (
                        (local_extremum.val <= sbs_ft_zzl_case.md_level)
                     )
                  {
                     return(true);
                  }
                  
                  return(false);
               }
            
               return(false);
            }

            return(false);
         }
         
         return(false);
      }

//--- Position 234-133 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         if (((ha3_min_val[sbs_zzl_sell_signal[0].extremum_bar] - sbs_zzl_sell_signal[0].extremum_val) / (ha3_max - ha3_min)) < 1)
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Max_ZZL(2);
         
         if (
               (local_extremum.val > ha3_min_val[local_extremum.bar])
            )
         {
            return(true);
         }
         
         if (
               (ha3_mx_ha2_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4_mx_ha2_Cross_04() > sbs_ft_zzl_profile.ft3_bar)
            )
         {
            if (ha4_mx_ha3_Cross_04() > sbs_ft_zzl_profile.ft3_bar)
            {
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha2_min_val[sbs_ft_zzl_profile.ft3_bar] > ha3_max_val[sbs_ft_zzl_profile.ft3_bar]) &&
               (ha3_min_val[sbs_ft_zzl_profile.ft3_bar] > ha4_max_val[sbs_ft_zzl_profile.ft3_bar])
            )
         {
            if (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 0.5)
            {
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha4_mx_ha3_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(false);
         }
         
         if (((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 2)
         {
            return(false);
         }
         
         if (((sbs_ft_zzl_case.hi_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min)) > 1.5)
         {
            return(true);
         }
         
         if (((sbs_ft_zzl_case.hi_level - ha2_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha2_max - ha2_min)) < 2)
         {
            local_extremum = Get_Max_ZZL(3);
         
            if (
                  (((local_extremum.val - ha2_max_val[local_extremum.bar]) / (ha2_max - ha2_min)) > 2)
               )
            {
               return(true);
            }
         
            return(false);
         }
         
         return(false);
      }

//--- Position 234-144 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 243-114 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(true);
      }

//--- Position 243-124 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val > ha2_min_val[local_extremum.bar])
            )
         {
            return(true);
         }
         
         if (
               (ha2_min_val[sbs_ft_zzl_profile.ft3_bar] > ha3_max_val[sbs_ft_zzl_profile.ft3_bar])
            )
         {
            if (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 0.5)
            {
               if (((ha3_min - ha4_max) / (ha3_max - ha3_min)) < 0.5)
               {
                  return(true);
               }

               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha2_min_val[sbs_ft_zzl_profile.ft3_bar] <= ha3_max_val[sbs_ft_zzl_profile.ft3_bar])
            )
         {
            if (((ha3_min - ha4_max) / (ha3_max - ha3_min)) < 0.5)
            {
               return(false);
            }

            return(true);
         }

         return(false);
      }

//--- Position 243-134 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) < 1)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 243-144 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < (16 * 5))
         {
            return(true);
         }
         
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val > ha4_min_val[local_extremum.bar])
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-114 ---/
//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(false);
      }
      
//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 2)
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-144 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(true);
      }
      
//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(true);
      }

//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (ha2_max_val[sbs_ft_zzl_profile.ft3_bar] < ha3_min_val[sbs_ft_zzl_profile.ft3_bar])
         {
            return(true);
         }
         
         if (ha2_max_val[sbs_ft_zzl_profile.ft3_bar] >= ha3_min_val[sbs_ft_zzl_profile.ft3_bar])
         {
            local_extremum = Get_Max_ZZL(2);
         
            if (
                  (local_extremum.val < ha4_max_val[local_extremum.bar])
               )
            {
               return(true);
            }

            return(false);
         }

         return(false);
      }
      
//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(false);
      }

//--- Position 423-144 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (((ha2_min - ha4_max) / (ha4_max - ha4_min)) <= 1)
         {
            local_extremum = Get_Max_ZZL(1);
         
            if (
                  (local_extremum.val > ha2_max_val[local_extremum.bar])
               )
            {
               return(true);
            }
            
            return(false);
         }
         
         if (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) <= 1)
         {
            if (sbs_zzl_sell_signal[0].extremum_val < sbs_zzl_sell_signal[1].extremum_val)
            {
               return(true);
            }
            
            return(false);
         }
      
         if (((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) > 2)
         {
            local_extremum = Get_Max_ZZL(1);
         
            if (
                  (local_extremum.val >= ha2_min_val[local_extremum.bar])
               )
            {
               if (sbs_zzl_sell_signal[0].extremum_val < sbs_zzl_sell_signal[1].extremum_val)
               {
                  return(true);
               }
            
               return(false);
            }
            
            if (
                  (local_extremum.val < ha2_min_val[local_extremum.bar])
               )
            {
               if (sbs_zzl_sell_signal[0].extremum_val > sbs_zzl_sell_signal[1].extremum_val)
               {
                  return(true);
               }
            
               return(false);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 423-234 ---/
//--- Position 423-244 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         return(false);
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(true);
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val < ha3_min_val[local_extremum.bar])
            )
         {
            local_extremum = Get_Min_ZZL(1);
            
            if (local_extremum.val > sbs_ft_zzl_case.lo_level)
            {
               return(true);
            }
            
            return(false);
         }
         
         if (
               (local_extremum.val >= ha3_min_val[local_extremum.bar]) &&
               (local_extremum.val >= ha2_min_val[local_extremum.bar])
            )
         {
            local_extremum = Get_Min_ZZL(1);
            
            if (local_extremum.val <= sbs_ft_zzl_case.lo_level)
            {
               return(true);
            }
            
            return(false);
         }
      
         return(false);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 2)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }
      
//--- Position 432-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (
               (sbs_zzl_sell_signal[0].extremum_val >= sbs_ft_zzl_case.md_level) &&
               (sbs_zzl_sell_signal[0].extremum_bar < 10)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }
      
//--- No more positions to check SELL_ORDER,106,1 ---/
   }

//------------------ BUY_ORDER,206,1 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 206) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         return(true);
      }

//--- Position 432-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (
               (ha3_min_val[sbs_ft_zzl_profile.ft3_bar] < sbs_ft_zzl_case.lo_level) &&
               (((sbs_ft_zzl_case.lo_level - ha3_max) / (ha3_max - ha3_min)) < 0.5)
            )
         {
            if (sbs_zzl_buy_signal[0].extremum_val < ha2_max_val[sbs_zzl_buy_signal[0].extremum_bar])
            {
               return(false);
            }
            
            return(true);
         }
         
         return(false);
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (
               ((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min) < 1)
            )
         {
            if (sbs_zzl_sell_signal[0].extremum_val > sbs_zzl_sell_signal[1].extremum_val)
            {
               return(true);
            }
            
            return(false);
         }
         
         if (
               ((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min) >= 1)
            )
         {
            if (
                  (sbs_zzl_sell_signal[0].extremum_val > sbs_zzl_sell_signal[1].extremum_val) &&
                  (ha4ha2_mx_Cross_04() < sbs_ft_zzl_profile.ft3_bar) &&
                  (sbs_zzl_buy_signal[2].extremum_val < ha2_max_val[sbs_zzl_buy_signal[2].extremum_bar])
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (
               ((sbs_ft_zzl_case.md_level - ha3_min) < (ha3_min - sbs_ft_zzl_case.lo_level)) &&
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) > 3)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 432-134 ---/
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (ha4_mx_ha3_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            return(true);
         }
         
         if (
               (ha4_mx_ha3_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4_mx_ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(false);
         }
         
         if (
               (ha4_mx_ha3_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4_mx_ha2_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (((sbs_ft_zzl_case.hi_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min)) > 1)
            )
         {
            if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1))
            {
               return(true);
            }

            return(false);
         }
         
         if (
               (ha4_mx_ha3_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4_mx_ha2_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (((sbs_ft_zzl_case.hi_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min)) <= 1)
            )
         {
            if (ha3ha2_mx_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            {
               local_extremum = Get_Min_ZZL(4);
            
               if (
                     (local_extremum.val > sbs_ft_zzl_case.lo_level)
                  )
               {
                  return(true);
               }
               
               return(false);
            }
            
            if (ha3ha2_mx_Cross_04() >= sbs_ft_zzl_profile.ft3_bar)
            {
               local_extremum = Get_Min_ZZL(1);
               
               if (
                     (local_extremum.val <= sbs_ft_zzl_case.lo_level)
                  )
               {
                  local_extremum = Second_Min_Val();
         
                  if (local_extremum.val == -1)
                  {
                     return(false);
                  }
         
                  if (((local_extremum.val - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 1)
                  {
                     return(true);
                  }
                  
                  if (((local_extremum.val - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) >= 1)
                  {
                     if (
                           (sbs_zzl_buy_signal[0].val > sbs_zzl_buy_signal[1].val)
                        )
                     {
                        return(true);
                     }

                     return(false);
                  }

                  return(false);
               }
               
               if (
                     (local_extremum.val > sbs_ft_zzl_case.lo_level)
                  )
               {
                  local_extremum = Get_Max_ZZL(2);
               
                  if (
                        (local_extremum.val >= sbs_ft_zzl_case.md_level)
                     )
                  {
                     return(true);
                  }
                  
                  return(false);
               }
            
               return(false);
            }

            return(false);
         }
         
         return(false);
      }

//--- Position 432-224 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         if (((sbs_zzl_buy_signal[0].extremum_val - ha3_max_val[sbs_zzl_buy_signal[0].extremum_bar]) / (ha3_max - ha3_min)) < 1)
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 432-124 ---/
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Min_ZZL(2);
         
         if (
               (local_extremum.val < ha3_max_val[local_extremum.bar])
            )
         {
            return(true);
         }
         
         if (
               (ha3ha2_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar) &&
               (ha4ha2_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar)
            )
         {
            if (ha4ha3_mx_Cross_04() > sbs_ft_zzl_profile.ft3_bar)
            {
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha2_max_val[sbs_ft_zzl_profile.ft3_bar] < ha3_min_val[sbs_ft_zzl_profile.ft3_bar]) &&
               (ha3_max_val[sbs_ft_zzl_profile.ft3_bar] < ha4_min_val[sbs_ft_zzl_profile.ft3_bar])
            )
         {
            if (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) < 0.5)
            {
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha4ha3_mx_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(false);
         }
         
         if (((sbs_ft_zzl_case.md_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min)) < 2)
         {
            return(false);
         }
         
         if (((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) > 1.5)
         {
            return(true);
         }
         
         if (((ha2_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha2_max - ha2_min)) < 2)
         {
            local_extremum = Get_Min_ZZL(3);
         
            if (
                  (((ha2_min_val[local_extremum.bar] - local_extremum.val) / (ha2_max - ha2_min)) > 2)
               )
            {
               return(true);
            }
         
            return(false);
         }
         
         return(false);
      }

//--- Position 432-114 ---/ statistics needed

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 342-144 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(true);
      }

//--- Position 342-134 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val < ha2_max_val[local_extremum.bar])
            )
         {
            return(true);
         }
         
         if (
               (ha2_max_val[sbs_ft_zzl_profile.ft3_bar] < ha3_min_val[sbs_ft_zzl_profile.ft3_bar])
            )
         {
            if (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) < 0.5)
            {
               if (((ha4_min - ha3_max) / (ha3_max - ha3_min)) < 0.5)
               {
                  return(true);
               }

               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha2_max_val[sbs_ft_zzl_profile.ft3_bar] >= ha3_min_val[sbs_ft_zzl_profile.ft3_bar])
            )
         {
            if (((ha4_min - ha3_max) / (ha3_max - ha3_min)) < 0.5)
            {
               return(false);
            }

            return(true);
         }

         return(false);
      }

//--- Position 342-124 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 1)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 342-114 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < (16 * 5))
         {
            return(true);
         }
         
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val < ha4_max_val[local_extremum.bar])
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-144 ---/
//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(false);
      }
      
//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (((sbs_ft_zzl_case.md_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min)) < 2)
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(true);
      }

//--- Position 324-144 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(true);
      }

//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (ha2_min_val[sbs_ft_zzl_profile.ft3_bar] > ha3_max_val[sbs_ft_zzl_profile.ft3_bar])
         {
            return(true);
         }
         
         if (ha2_min_val[sbs_ft_zzl_profile.ft3_bar] <= ha3_max_val[sbs_ft_zzl_profile.ft3_bar])
         {
            local_extremum = Get_Min_ZZL(2);
         
            if (
                  (local_extremum.val > ha4_min_val[local_extremum.bar])
               )
            {
               return(true);
            }

            return(false);
         }

         return(false);
      }

//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(false);
      }

//--- Position 324-114 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (((ha4_min - ha2_max) / (ha4_max - ha4_min)) <= 1)
         {
            local_extremum = Get_Min_ZZL(1);
         
            if (
                  (local_extremum.val < ha2_min_val[local_extremum.bar])
               )
            {
               return(true);
            }
            
            return(false);
         }
         
         if (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) <= 1)
         {
            if (sbs_zzl_buy_signal[0].extremum_val > sbs_zzl_buy_signal[1].extremum_val)
            {
               return(true);
            }
            
            return(false);
         }
      
         if (((sbs_ft_zzl_case.hi_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha4_max - ha4_min)) > 2)
         {
            local_extremum = Get_Min_ZZL(1);
         
            if (
                  (local_extremum.val <= ha2_max_val[local_extremum.bar])
               )
            {
               if (sbs_zzl_buy_signal[0].extremum_val > sbs_zzl_buy_signal[1].extremum_val)
               {
                  return(true);
               }
            
               return(false);
            }
            
            if (
                  (local_extremum.val > ha2_max_val[local_extremum.bar])
               )
            {
               if (sbs_zzl_buy_signal[0].extremum_val < sbs_zzl_buy_signal[1].extremum_val)
               {
                  return(true);
               }
            
               return(false);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 324-123 ---/
//--- Position 324-113 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         return(false);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(true);
      }
      
//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val > ha3_max_val[local_extremum.bar])
            )
         {
            local_extremum = Get_Max_ZZL(1);
            
            if (local_extremum.val < sbs_ft_zzl_case.hi_level)
            {
               return(true);
            }
            
            return(false);
         }
         
         if (
               (local_extremum.val <= ha3_max_val[local_extremum.bar]) &&
               (local_extremum.val <= ha2_max_val[local_extremum.bar])
            )
         {
            local_extremum = Get_Max_ZZL(1);
            
            if (local_extremum.val >= sbs_ft_zzl_case.hi_level)
            {
               return(true);
            }
            
            return(false);
         }
      
         return(false);
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 2)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (
               (sbs_zzl_buy_signal[0].extremum_val <= sbs_ft_zzl_case.md_level) &&
               (sbs_zzl_buy_signal[0].extremum_bar < 10)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- No more positions to check BUY_ORDER,206,1 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_106_206_1_lbr.mqh/