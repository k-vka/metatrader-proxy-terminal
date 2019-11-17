//================== sbs_ft_zzl_cases_confirmation_102_202_2_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_102_202_2 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_102_202_2()
{
temp_extremum      local_extremum;

//------------------ SELL_ORDER,102,2 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 102) &&
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
//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 234-122 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) > (16 * 1))
         {
            return(true);
         }
      
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar >= 16)
            )
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar < 16) &&
               (ha4ha3_Cross_04() < (16 * 8))
            )
         {
            return(true);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar < 16) &&
               (ha4ha3_Cross_04() >= (16 * 8)) &&
               (Close[0] > ha2_max)
            )
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar < 16) &&
               (ha4ha3_Cross_04() >= (16 * 8)) &&
               (Close[0] <= ha2_max)
            )
         {
            local_extremum = Get_Min_ZZL(4);
            
            if (
                  (local_extremum.val < sbs_ft_zzl_case.lo_level)
               )
            {
               return(false);
            }
         
            return(true);
         }
      
         return(false);
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         return(false);
      }

//--- Position 234-124 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (Close[0] > ha2_min)
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 234-133 ---/
//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(true);
      }

//--- Position 234-144 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }


//--- Position 243-124 ---/

//--- Position 324-113 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         return(true);
      }

//--- Position 324-123 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         local_extremum = Get_Max_ZZL(4);
            
         if (
               (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Min_ZZL(2);
            
         if (
               ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) < 2)
            )
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
         return(false);
      }

//--- Position 342-124 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(true);
      }

//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (
               (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 1)
            )
         {
            local_extremum = Get_Max_ZZL(1);
            
            if (
                  (((ha4_min - local_extremum.val) / (ha4_max - ha4_min)) < 1) &&
                  (ha4_max >= local_extremum.val)
               )
            {
               return(true);
            }
         
            return(false);
         
         }

         return(false);
      }

//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
            
         if (
               (local_extremum.val > ha3_min_val[local_extremum.bar])
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
         if (sbs_ft_zzl_profile.ft3_bar >= 14)
         {
            return(false);
         }
         
         if (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) < 1)
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
         if (Close[0] >= sbs_ft_zzl_case.md_level)
         {
            return(true);
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
         return(true);
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 8)
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
         local_extremum = Get_Max_ZZL(1);
            
         if (
               (local_extremum.bar > 3)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 432-224 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         if (Close[0] > ha3_max)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar >= 10)
         {
            return(false);
         }
      
         if (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1)
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               (ha3_mx_ha2_Cross_04() < (MAX_IREG_NO_04 - 1))
            )
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               (ha3_mx_ha2_Cross_04() >= (MAX_IREG_NO_04 - 1)) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 1))
            )
         {
            return(false);
         }
         
         if (
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               (ha3_mx_ha2_Cross_04() >= (MAX_IREG_NO_04 - 1)) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 1)) &&
               ((sbs_ft_zzl_case.lo_level - ha4_max) > (sbs_ft_zzl_case.md_level - sbs_ft_zzl_case.lo_level))
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
         if (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1)
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 2))
            )
         {
            local_extremum = Get_Max_ZZL(1);
            
            if (
                  (local_extremum.val > sbs_ft_zzl_case.md_level)
               )
            {
               return(false);
            }

            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2)) &&
               (sbs_ft_zzl_profile.ft3_bar <= 8)
            )
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2)) &&
               (sbs_ft_zzl_profile.ft3_bar > 8)
            )
         {
            local_extremum = Get_Min_ZZL(2);
            
            if (
                  (local_extremum.bar < 3)
               )
            {
               return(false);
            }

            return(true);
         }

         return(false);
      }

//--- Position 432-334 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334"))
         )
      {
         local_extremum = Get_Max_ZZL(3);
            
         if (
               (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         local_extremum = Get_Min_ZZL(2);
            
         if (
               ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) < 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- No more positions to check SELL_ORDER,102,2 ---/
   }

//------------------ BUY_ORDER,202,2 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 202) &&
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
//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         return(false);
      }

//--- Position 432-334 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) > (16 * 1))
         {
            return(true);
         }
      
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar >= 16)
            )
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar < 16) &&
               (ha4ha3_Cross_04() < (16 * 8))
            )
         {
            return(true);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar < 16) &&
               (ha4ha3_Cross_04() >= (16 * 8)) &&
               (Close[0] < ha2_min)
            )
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) <= (16 * 1)) &&
               (sbs_ft_zzl_profile.ft3_bar < 16) &&
               (ha4ha3_Cross_04() >= (16 * 8)) &&
               (Close[0] >= ha2_min)
            )
         {
            local_extremum = Get_Max_ZZL(4);
            
            if (
                  (local_extremum.val > sbs_ft_zzl_case.hi_level)
               )
            {
               return(false);
            }
         
            return(true);
         }
      
         return(false);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         return(false);
      }

//--- Position 432-134 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (Close[0] < ha2_max)
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 432-224 ---/
//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(true);
      }

//--- Position 432-114 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         return(false);
      }

//--- Position 342-134 ---/

//--- Position 423-244 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         return(true);
      }

//--- Position 423-234 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         local_extremum = Get_Min_ZZL(4);
            
         if (
               (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Max_ZZL(2);
            
         if (
               ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) < 2)
            )
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
         return(false);
      }

//--- Position 243-134 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(true);
      }

//--- Position 324-144 ---/
      
      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (
               (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) < 1)
            )
         {
            local_extremum = Get_Min_ZZL(1);
            
            if (
                  (((local_extremum.val - ha4_max) / (ha4_max - ha4_min)) < 1) &&
                  (ha4_min <= local_extremum.val)
               )
            {
               return(true);
            }
         
            return(false);
         
         }

         return(false);
      }

//--- Position 324-134 ---/
      
      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
            
         if (
               (local_extremum.val < ha3_max_val[local_extremum.bar])
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
         if (sbs_ft_zzl_profile.ft3_bar >= 14)
         {
            return(false);
         }
         
         if (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) < 1)
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
         if (Close[0] <= sbs_ft_zzl_case.md_level)
         {
            return(true);
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
         return(true);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 8)
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
         local_extremum = Get_Min_ZZL(1);
            
         if (
               (local_extremum.bar > 3)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 234-133 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         if (Close[0] < ha3_min)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar >= 10)
         {
            return(false);
         }
      
         if (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1)
         {
            return(true);
         }
         
         if (
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) >= 1) &&
               (ha3ha2_mx_Cross_04() < (MAX_IREG_NO_04 - 1))
            )
         {
            return(true);
         }
         
         if (
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) >= 1) &&
               (ha3ha2_mx_Cross_04() >= (MAX_IREG_NO_04 - 1)) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 1))
            )
         {
            return(false);
         }
         
         if (
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) >= 1) &&
               (ha3ha2_mx_Cross_04() >= (MAX_IREG_NO_04 - 1)) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 1)) &&
               ((ha4_min - sbs_ft_zzl_case.hi_level) > (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.md_level))
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
         if (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1)
         {
            return(true);
         }
         
         if (
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 2))
            )
         {
            local_extremum = Get_Min_ZZL(1);
            
            if (
                  (local_extremum.val < sbs_ft_zzl_case.md_level)
               )
            {
               return(false);
            }

            return(true);
         }
         
         if (
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2)) &&
               (sbs_ft_zzl_profile.ft3_bar <= 8)
            )
         {
            return(true);
         }
         
         if (
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2)) &&
               (sbs_ft_zzl_profile.ft3_bar > 8)
            )
         {
            local_extremum = Get_Max_ZZL(2);
            
            if (
                  (local_extremum.bar < 3)
               )
            {
               return(false);
            }

            return(true);
         }

         return(false);
      }

//--- Position 234-122 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122"))
         )
      {
         local_extremum = Get_Min_ZZL(3);
            
         if (
               (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            )
         {
            return(false);
         }

         return(true);
      }
      
//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         local_extremum = Get_Max_ZZL(2);
            
         if (
               ((local_extremum.bar - sbs_ft_zzl_profile.ft3_bar) < 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- No more positions to check BUY_ORDER,202,2 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_102_202_2_lbr.mqh/