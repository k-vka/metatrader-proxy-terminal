//================== sbs_ft_zzl_cases_confirmation_103_203_1_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_103_203_1 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_103_203_1()
{
temp_extremum      local_extremum;

//------------------ SELL_ORDER,103,1 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 103) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         return(false);
      }

//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) < 0.5)
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
         local_extremum = Get_Max_ZZL(1);
            
         if (local_extremum.val >= sbs_ft_zzl_case.hi_level)
         {
            return(true);
         }
         
         local_extremum = Get_Max_ZZL(2);
         
         if (
               ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) > 1)
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
         if (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 0.75)
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) >= 0.75) &&
               (((ha3_min - sbs_ft_zzl_case.md_level) / (ha3_max - ha3_min)) < 0.75)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 234-124 ---/
//--- Position 234-134 ---/

//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.bar < 5) &&
               (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) < 1)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-134 ---/

//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(true);
      }

//--- Position 423-124 ---/
//--- Position 423-234 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         return(false);
      }

//--- Position 423-244 ---/

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244")) ||
            
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Max_ZZL(2);
            
         if ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) > 1)
         {
            return(true);
         }
      
         return(false);
      }

//--- Position 432-144 ---/
//--- Position 432-224 ---/
//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         local_extremum = Get_Max_ZZL(2);
            
         if (local_extremum.bar > 1)
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
         return(false);
      }

//--- Position 432-334 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334"))
         )
      {
         local_extremum = Get_Max_ZZL(2);
            
         if (
               (local_extremum.bar > 1) &&
               (local_extremum.bar >= sbs_ft_zzl_case.hi_level)
            )
         {
            return(true);
         }
      
         return(false);
      }

//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (
               (local_extremum.bar > 1)
            )
         {
            return(true);
         }
      
         return(false);
      }
      
//--- No more positions to check SELL_ORDER,103,1 ---/
   }

//------------------ BUY_ORDER,203,1 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 203) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         return(false);
      }

//--- Position 432-244 ---/
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 0.5)
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
         local_extremum = Get_Min_ZZL(1);
            
         if (local_extremum.val <= sbs_ft_zzl_case.lo_level)
         {
            return(true);
         }
         
         local_extremum = Get_Min_ZZL(2);
         
         if (
               ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) > 1)
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
         if (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 0.75)
         {
            return(true);
         }
         
         if (
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) >= 0.75) &&
               (((sbs_ft_zzl_case.md_level - ha3_max) / (ha3_max - ha3_min)) < 0.75)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 432-134 ---/
//--- Position 432-124 ---/

//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.bar < 5) &&
               (((ha4_min - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 1)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-124 ---/

//--- Position 324-144 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(true);
      }

//--- Position 324-134 ---/
//--- Position 324-123 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         return(false);
      }

//--- Position 324-113 ---/

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113")) ||
            
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Min_ZZL(2);
            
         if ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) > 1)
         {
            return(true);
         }
      
         return(false);
      }

//--- Position 234-114 ---/
//--- Position 234-133 ---/
//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         local_extremum = Get_Min_ZZL(2);
            
         if (local_extremum.bar > 1)
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
         return(false);
      }

//--- Position 234-122 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122"))
         )
      {
         local_extremum = Get_Min_ZZL(2);
            
         if (
               (local_extremum.bar > 1) &&
               (local_extremum.bar <= sbs_ft_zzl_case.lo_level)
            )
         {
            return(true);
         }
      
         return(false);
      }

//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (
               (local_extremum.bar > 1)
            )
         {
            return(true);
         }
      
         return(false);
      }

//--- No more positions to check BUY_ORDER,203,1 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_103_203_1_lbr.mqh/