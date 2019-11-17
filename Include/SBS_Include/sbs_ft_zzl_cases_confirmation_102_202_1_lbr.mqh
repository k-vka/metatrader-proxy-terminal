//================== sbs_ft_zzl_cases_confirmation_102_202_1_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_102_202_1 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_102_202_1()
{
temp_extremum      local_extremum;

//------------------ SELL_ORDER,102,1 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 102) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 8)
         {
            if (
                  (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 0.5) &&
                  (((ha3_min - sbs_ft_zzl_case.md_level) / (ha3_max - ha3_min)) >= 2)
               )
            {
               return(false);
            }
            
            return(true);
         }
      
         if (sbs_ft_zzl_profile.ft3_bar >= 8)
         {
            local_extremum = Get_Max_ZZL(1);
            
            if (local_extremum.val >= sbs_ft_zzl_case.md_level)
            {
               return(true);
            }
            
            if (
                  (local_extremum.val < sbs_ft_zzl_case.md_level) &&
                  (sbs_just_zzl_buy_signal[0].bar < 3)
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (local_extremum.val >= ha3_max)
         {
            return(true);
         }
            
         if (
               (local_extremum.val < ha3_max) &&
               (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 0.5) &&
               ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > (16 * 3))
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 234-124 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 0.5) &&
               (((ha3_min - sbs_ft_zzl_case.md_level) / (ha3_max - ha3_min)) < 2)
            )
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
         return(false);
      }

//--- Position 243-144 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (
              (local_extremum.val >= ha3_min_val[local_extremum.bar])
            )
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
         if ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > (16 * 2))
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
         local_extremum = Get_Max_ZZL(1);
            
         if ((sbs_ft_zzl_case.md_level - local_extremum.val) < (local_extremum.val - sbs_ft_zzl_case.md_level))
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-123 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (
              (local_extremum.val >= ha3_min_val[local_extremum.bar])
            )
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (local_extremum.val >= ha3_max)
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (
               (local_extremum.val >= ha3_min) &&
               (sbs_just_zzl_sell_signal[0].bar < 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 342-134 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(true);
      }

//--- Position 423-114 ---/
//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(false);
      }

//--- Position 432-114 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(true);
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               (((ha3_min - sbs_ft_zzl_case.md_level) / (ha3_max - ha3_min)) < 0.5) &&
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 2)
            )
         {
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
               ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > (16 * 4))
            )
         {
            local_extremum = Get_Max_ZZL(2);
            
            if (
                  (local_extremum.val >= ha2_max_val[local_extremum.bar])
               )
            {
               return(true);
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
         local_extremum = Get_Max_ZZL(1);
            
         if (
               (local_extremum.val >= ha3_min_val[local_extremum.bar])
            )
         {
            return(true);
         }

         return(false);

      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (ha2_min < sbs_ft_zzl_case.md_level)
         {
            local_extremum = Get_Max_ZZL(1);
            
            if (
                  (local_extremum.val >= ha3_min_val[local_extremum.bar])
               )
            {
               return(true);
            }
            
            return(false);
         }
         
         if (ha2_min >= sbs_ft_zzl_case.md_level)
         {
            if (
                  (((sbs_ft_zzl_case.md_level - ha3_max) / (ha3_max - ha3_min)) < 0.5) &&
                  (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) > 1.5)
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 432-244 ---/
//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         return(false);
      }

//--- No more positions to check SELL_ORDER,102,1 ---/
   }

//------------------ BUY_ORDER,202,1 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 202) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 432-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 8)
         {
            if (
                  (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 0.5) &&
                  (((sbs_ft_zzl_case.md_level - ha3_max) / (ha3_max - ha3_min)) >= 2)
               )
            {
               return(false);
            }
            
            return(true);
         }
      
         if (sbs_ft_zzl_profile.ft3_bar >= 8)
         {
            local_extremum = Get_Min_ZZL(1);
            
            if (local_extremum.val <= sbs_ft_zzl_case.md_level)
            {
               return(true);
            }
            
            if (
                  (local_extremum.val > sbs_ft_zzl_case.md_level) &&
                  (sbs_just_zzl_sell_signal[0].bar < 3)
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }
      
//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (local_extremum.val <= ha3_min)
         {
            return(true);
         }
            
         if (
               (local_extremum.val > ha3_min) &&
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 0.5) &&
               ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > (16 * 3))
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 432-134 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 0.5) &&
               (((sbs_ft_zzl_case.md_level - ha3_max) / (ha3_max - ha3_min)) < 2)
            )
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
         return(false);
      }

//--- Position 342-114 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (
              (local_extremum.val <= ha3_max_val[local_extremum.bar])
            )
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
         if ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > (16 * 2))
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-144 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if ((local_extremum.val - sbs_ft_zzl_case.md_level) < (sbs_ft_zzl_case.hi_level - local_extremum.val))
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-234 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (
              (local_extremum.val <= ha3_max_val[local_extremum.bar])
            )
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (local_extremum.val <= ha3_min)
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (
               (local_extremum.val <= ha3_max) &&
               (sbs_just_zzl_buy_signal[0].bar < 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 243-124 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(true);
      }

//--- Position 324-144 ---/
//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(false);
      }

//--- Position 234-144 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(true);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               (((sbs_ft_zzl_case.md_level - ha3_max) / (ha3_max - ha3_min)) < 0.5) &&
               (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 2)
            )
         {
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
               ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > (16 * 4))
            )
         {
            local_extremum = Get_Min_ZZL(2);
            
            if (
                  (local_extremum.val <= ha2_min_val[local_extremum.bar])
               )
            {
               return(true);
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
         local_extremum = Get_Min_ZZL(1);
            
         if (
               (local_extremum.val <= ha3_max_val[local_extremum.bar])
            )
         {
            return(true);
         }

         return(false);

      }
      
//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (ha2_max > sbs_ft_zzl_case.md_level)
         {
            local_extremum = Get_Min_ZZL(1);
            
            if (
                  (local_extremum.val <= ha3_max_val[local_extremum.bar])
               )
            {
               return(true);
            }
            
            return(false);
         }
         
         if (ha2_max <= sbs_ft_zzl_case.md_level)
         {
            if (
                  (((ha3_min - sbs_ft_zzl_case.md_level) / (ha3_max - ha3_min)) < 0.5) &&
                  (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) > 1.5)
               )
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 234-113 ---/
//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         return(false);
      }

//--- No more positions to check BUY_ORDER,202,1 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_102_202_1_lbr.mqh/