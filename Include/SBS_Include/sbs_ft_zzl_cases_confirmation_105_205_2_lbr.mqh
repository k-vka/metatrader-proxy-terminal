//================== sbs_ft_zzl_cases_confirmation_105_205_2_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_105_205_2 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_105_205_2()
{
temp_extremum     local_extremum;

//------------------ SELL_ORDER,105,2 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 105) &&
         (sbs_ft_zzl_signal.case_subnumber == 2)
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
         if ((ha4_min - sbs_ft_zzl_case.hi_level) < (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.lo_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - ha4_max) < (ha4_max - ha4_min))
         {
            return(false);
         }

         if (
               ((sbs_ft_zzl_case.hi_level - ha4_max) >= (ha4_max - ha4_min)) &&
               (sbs_just_zzl_sell_signal[0].bar >= 2)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < (16 * 1))
         {
            return(true);
         }
         
         if (
               (sbs_ft_zzl_profile.ft3_bar >= (16 * 1))
            )
         {
            local_extremum = Get_Min_ZZL(2);
         
            if (
                  (local_extremum.val <= ha2_max_val[local_extremum.bar]) &&
                  ((sbs_just_zzl_sell_signal[1].bar - sbs_just_zzl_sell_signal[0].bar) < (16 * 1.5))
               )
            {
               return(false);
            }
         
            return(true);
         }

         return(true);
      }

//--- Position 234-124 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(true);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) < 2)
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-113 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar >= (16 * 5))
         {
            return(false);
         }
         
         if (
               (sbs_ft_zzl_profile.ft3_bar < (16 * 5)) &&
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 324-114 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 324-123 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         return(true);
      }

//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if ((ha4_min - sbs_ft_zzl_case.md_level) <= (ha4_max - ha4_min))
         {
            return(false);
         }

         if (((ha4_min - ha2_max) / (ha4_max - ha4_min)) < 0.1)
         {
            return(true);
         }
         
         if (
               (((ha4_min - ha2_max) / (ha4_max - ha4_min)) >= 0.1) &&
               (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) < 1)
            )
         {
            return(true);
         }
         
         if (
               (((ha4_min - ha2_max) / (ha4_max - ha4_min)) >= 0.1) &&
               (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               (ha3ha2_Cross_04() < (sbs_ft_zzl_profile.ft3_bar + 8)) &&
               (sbs_just_zzl_sell_signal[0].bar >= 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-133 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         return(true);
      }

//--- Position 324-134 ---/
//--- Position 324-144 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 342-114 ---/
//--- Position 342-124 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if ((ha4_min - sbs_ft_zzl_case.md_level) > (ha4_max - ha4_min))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 342-134 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (sbs_just_zzl_sell_signal[0].bar >= 2)
         {
            return(true);
         }

         return(false);
      }

//--- Position 342-144 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (((ha3_min - ha2_max) / (ha3_max - ha3_min)) < 0.1)
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-144 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Second_Max_Val();
         
         if (local_extremum.val == -1)
         {
            return(false);
         }
         
         if (((sbs_ft_zzl_case.hi_level - local_extremum.val) / (ha4_max - ha4_min)) < 2.5)
         {
            return(true);
         }

         return(false);
      }
 
//--- Position 423-244 ---/

//--- Position 432-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244")) ||
            
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               (ha3ha2_mx_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3_mx_ha2_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3ha2_mx_Cross_04() <= (sbs_ft_zzl_profile.ft3_bar - 8)) &&
               (ha3_mx_ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(false);
         }
         
         return(true);
      }

//--- Position 432-134 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               (ha3_mx_ha2_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3_mx_ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar) &&
               (ha4_mx_ha2_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha4_mx_ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(true);
         }
      
         if (
               (ha4ha3_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            )
         {
            local_extremum = Second_Max_Val();
         
            if (local_extremum.val == -1)
            {
               return(true);
            }
         
            if (((sbs_ft_zzl_case.hi_level - local_extremum.val) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.md_level)) < 0.25)
            {
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha4ha3_Cross_04() >= sbs_ft_zzl_profile.ft3_bar) &&
               (ha3ha2_Cross_04() >= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            local_extremum = Second_Max_Val();
         
            if (local_extremum.val == -1)
            {
               return(true);
            }
         
            if (sbs_zzl_sell_signal[0].extremum_val >= sbs_ft_zzl_case.hi_level)
            {
               if (((sbs_ft_zzl_case.hi_level - local_extremum.val) / (ha4_max - ha4_min)) < 1.5)
               {
                  return(true);
               }
               
               if (
                     (((sbs_ft_zzl_case.hi_level - local_extremum.val) / (ha4_max - ha4_min)) >= 1.5) &&
                     (ha4_min_val[sbs_ft_zzl_profile.ft3_bar] < sbs_ft_zzl_case.lo_level) &&
                     ((sbs_ft_zzl_case.lo_level - ha4_max_val[sbs_ft_zzl_profile.ft3_bar]) < 0.25) &&
                     (((ha2_min - sbs_ft_zzl_case.lo_level) / (sbs_ft_zzl_case.md_level - sbs_ft_zzl_case.lo_level)) < 0.4)
                  )
               {
                  return(true);
               }
               
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha4ha3_Cross_04() >= sbs_ft_zzl_profile.ft3_bar) &&
               (ha3ha2_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            )
         {
            if (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 1.5)
            {
               return(true);
            }
            
            return(false);
         
         }

         return(true);
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (ha4ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            return(true);
         }
         
         if (ha3ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            if (
                  (sbs_just_zzl_sell_signal[0].bar < 2) &&
                  (sbs_zzl_buy_signal[0].extremum_val < ha3_min_val[sbs_zzl_buy_signal[0].extremum_bar]) &&
                  (sbs_zzl_buy_signal[0].extremum_val < ha2_min_val[sbs_zzl_buy_signal[0].extremum_bar])
               )
            {
               return(true);
            }
         
            return(false);
         }
      
         return(true);
      }

//--- Position 432-224 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         return(true);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (
               (ha3ha2_mx_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            if (sbs_zzl_buy_signal[0].extremum_val <= sbs_ft_zzl_case.md_level)
            {
               return(true);
            }
            
            return(false);
         }
      
         if ((sbs_ft_zzl_case.md_level - ha3_max) <= 0.2)
         {
            return(true);
         }
         
         if (
               ((sbs_ft_zzl_case.md_level - ha3_max) > 0.2) &&
               ((sbs_ft_zzl_case.lo_level - ha4_max) < 1.5) &&
               (((sbs_ft_zzl_case.hi_level - sbs_zzl_sell_signal[1].extremum_val) / Not_Zero(sbs_zzl_sell_signal[1].extremum_val - sbs_ft_zzl_case.md_level)) < 0.5)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 432-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (((ha3_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) > 0.5)
         {
            return(false);
         }

         if (
               (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 1.25) &&
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 1.5)
            )
         {
            if (sbs_ft_zzl_profile.ft3_bar > 18)
            {
               return(true);
            }
            
            return(false);
         }
         
         if (!(
               (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 1.25) &&
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 1.5)
            ) )
         {
            if (
                  (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1.5) &&
                  (sbs_zzl_sell_signal[0].bar < 2)
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(true);
      }

//--- Position 432-334 ---/
//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         if (sbs_zzl_buy_signal[0].extremum_val < ha2_max_val[sbs_zzl_buy_signal[0].extremum_bar])
         {
            return(true);
         }
         
         return(false);
      }
      
//--- No more positions to check SELL_ORDER,105,2 ---/
   }

//------------------ BUY_ORDER,205,2 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 205) &&
         (sbs_ft_zzl_signal.case_subnumber == 2)
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
         if ((sbs_ft_zzl_case.lo_level - ha4_max) < (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.lo_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if ((ha4_min - sbs_ft_zzl_case.lo_level) < (ha4_max - ha4_min))
         {
            return(false);
         }

         if (
               ((ha4_min - sbs_ft_zzl_case.lo_level) >= (ha4_max - ha4_min)) &&
               (sbs_just_zzl_buy_signal[0].bar >= 2)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < (16 * 1))
         {
            return(true);
         }
         
         if (
               (sbs_ft_zzl_profile.ft3_bar >= (16 * 1))
            )
         {
            local_extremum = Get_Max_ZZL(2);
         
            if (
                  (local_extremum.val >= ha2_min_val[local_extremum.bar]) &&
                  ((sbs_just_zzl_buy_signal[1].bar - sbs_just_zzl_buy_signal[0].bar) < (16 * 1.5))
               )
            {
               return(false);
            }
         
            return(true);
         }

         return(true);
      }

//--- Position 432-134 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(true);
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 2)
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-244 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar >= (16 * 5))
         {
            return(false);
         }
         
         if (
               (sbs_ft_zzl_profile.ft3_bar < (16 * 5)) &&
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 423-144 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 423-234 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         return(true);
      }

//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - ha4_max) <= (ha4_max - ha4_min))
         {
            return(false);
         }

         if (((ha2_min - ha4_max) / (ha4_max - ha4_min)) < 0.1)
         {
            return(true);
         }
         
         if (
               (((ha2_min - ha4_max) / (ha4_max - ha4_min)) >= 0.1) &&
               (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 1)
            )
         {
            return(true);
         }
         
         if (
               (((ha2_min - ha4_max) / (ha4_max - ha4_min)) >= 0.1) &&
               (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) >= 1) &&
               (ha3_mx_ha2_mx_Cross_04() < (sbs_ft_zzl_profile.ft3_bar + 8)) &&
               (sbs_just_zzl_buy_signal[0].bar >= 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-224 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         return(true);
      }

//--- Position 423-124 ---/
//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 243-144 ---/
//--- Position 243-134 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - ha4_max) > (ha4_max - ha4_min))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 243-124 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (sbs_just_zzl_buy_signal[0].bar >= 2)
         {
            return(true);
         }

         return(false);
      }

//--- Position 243-114 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (((ha2_min - ha3_max) / (ha3_max - ha3_min)) < 0.1)
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-114 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         local_extremum = Second_Min_Val();
         
         if (local_extremum.val == -1)
         {
            return(false);
         }
         
         if (((local_extremum.val - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 2.5)
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-113 ---/

//--- Position 234-144 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113")) ||
            
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               (ha3_mx_ha2_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3ha2_mx_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3_mx_ha2_Cross_04() <= (sbs_ft_zzl_profile.ft3_bar - 8)) &&
               (ha3ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(false);
         }
         
         return(true);
      }

//--- Position 234-124 ---/
         
      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               (ha3ha2_mx_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar) &&
               (ha4ha2_mx_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha4ha2_mx_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            return(true);
         }
      
         if (
               (ha4_mx_ha3_mx_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            )
         {
            local_extremum = Second_Min_Val();
         
            if (local_extremum.val == -1)
            {
               return(true);
            }
         
            if (((local_extremum.val - sbs_ft_zzl_case.lo_level) / (sbs_ft_zzl_case.md_level - sbs_ft_zzl_case.lo_level)) < 0.25)
            {
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha4_mx_ha3_mx_Cross_04() >= sbs_ft_zzl_profile.ft3_bar) &&
               (ha3_mx_ha2_mx_Cross_04() >= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            local_extremum = Second_Min_Val();
         
            if (local_extremum.val == -1)
            {
               return(true);
            }
         
            if (sbs_zzl_buy_signal[0].extremum_val <= sbs_ft_zzl_case.lo_level)
            {
               if (((local_extremum.val - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 1.5)
               {
                  return(true);
               }
               
               if (
                     (((local_extremum.val - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) >= 1.5) &&
                     (ha4_max_val[sbs_ft_zzl_profile.ft3_bar] > sbs_ft_zzl_case.hi_level) &&
                     ((ha4_min_val[sbs_ft_zzl_profile.ft3_bar] - sbs_ft_zzl_case.hi_level) < 0.25) &&
                     (((sbs_ft_zzl_case.hi_level - ha2_max) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.md_level)) < 0.4)
                  )
               {
                  return(true);
               }
               
               return(false);
            }
            
            return(true);
         }
         
         if (
               (ha4_mx_ha3_mx_Cross_04() >= sbs_ft_zzl_profile.ft3_bar) &&
               (ha3_mx_ha2_mx_Cross_04() < sbs_ft_zzl_profile.ft3_bar)
            )
         {
            if (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) < 1.5)
            {
               return(true);
            }
            
            return(false);
         
         }

         return(true);
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (ha4_mx_ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            return(true);
         }
         
         if (ha3_mx_ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            if (
                  (sbs_just_zzl_buy_signal[0].bar < 2) &&
                  (sbs_zzl_sell_signal[0].extremum_val < ha3_max_val[sbs_zzl_sell_signal[0].extremum_bar]) &&
                  (sbs_zzl_sell_signal[0].extremum_val < ha2_max_val[sbs_zzl_sell_signal[0].extremum_bar])
               )
            {
               return(true);
            }
         
            return(false);
         }
      
         return(true);
      }

//--- Position 234-133 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         return(true);
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (
               (ha3_mx_ha2_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (ha3_mx_ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
            )
         {
            if (sbs_zzl_sell_signal[0].extremum_val >= sbs_ft_zzl_case.md_level)
            {
               return(true);
            }
            
            return(false);
         }
      
         if ((ha3_min - sbs_ft_zzl_case.md_level) <= 0.2)
         {
            return(true);
         }
         
         if (
               ((ha3_min - sbs_ft_zzl_case.md_level) > 0.2) &&
               ((ha4_min - sbs_ft_zzl_case.hi_level) < 1.5) &&
               (((sbs_zzl_buy_signal[1].extremum_val - sbs_ft_zzl_case.lo_level) / Not_Zero(sbs_ft_zzl_case.md_level - sbs_zzl_buy_signal[1].extremum_val)) < 0.5)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (((sbs_ft_zzl_case.hi_level - ha3_max_val[sbs_ft_zzl_profile.ft3_bar]) / (ha3_max - ha3_min)) > 0.5)
         {
            return(false);
         }

         if (
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 1.25) &&
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 1.5)
            )
         {
            if (sbs_ft_zzl_profile.ft3_bar > 18)
            {
               return(true);
            }
            
            return(false);
         }
         
         if (!(
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 1.25) &&
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 1.5)
            ) )
         {
            if (
                  (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1.5) &&
                  (sbs_zzl_buy_signal[0].bar < 2)
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(true);
      }

//--- Position 234-122 ---/
//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         if (sbs_zzl_sell_signal[0].extremum_val > ha2_min_val[sbs_zzl_sell_signal[0].extremum_bar])
         {
            return(true);
         }
         
         return(false);
      }

//--- No more positions to check BUY_ORDER,205,2 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_105_205_2_lbr.mqh/