//================== sbs_ft_zzl_cases_confirmation_101_201_1_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_101_201_1 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_101_201_1()
{
temp_extremum      local_extremum;

//------------------ SELL_ORDER,101,1 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 101) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) >= (Close[0] - sbs_ft_zzl_case.md_level))
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level)) &&
               ((ha2_min - sbs_ft_zzl_case.md_level) < (ha2_max - ha2_min)) &&
               ((ha3_min - sbs_ft_zzl_case.hi_level) > (ha3_max - ha3_min))
            )
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level)) &&     //r04
               ((ha3_min - sbs_ft_zzl_case.hi_level) <= (ha3_max - ha3_min))
            )
         {
            local_extremum = Get_Min_ZZL(2);
            
            if (
                  ((Close[0] - ha3_max) < (ha3_min - local_extremum.val))
               )
            {
               return(true);
            }
            else
            {
               local_extremum = Get_Min_ZZL(4);
               if (local_extremum.val < (sbs_ft_zzl_case.lo_level + n_Point))
               {
                  return(true);
               }
               else
               {
                  return(false);
               }
            }
         }

         return(true);

      }

//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) >= (Close[0] - sbs_ft_zzl_case.md_level))
         {
            return(false);
         }
         
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            if (
                  (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1) &&
                  (sbs_ft_zzl_profile.ft3_bar < 8)
               )
            {
               return(true);
            }
            else
            {
               return(false);
            }
         }

         return(true);
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (
               (Close[0] > ha3_min) &&
               ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
            )
         {
            if (ha4ha2_mx_Cross_04() < (12 * 16))
            {
               return(true);
            }
         
            if (
                  (ha4ha2_mx_Cross_04() >= (12 * 16)) &&
                  (((sbs_ft_zzl_case.hi_level - ha4_max) / (ha4_max - ha4_min)) < 1) &&
                  (sbs_ft_zzl_profile.ft3_bar < 5)
               )
            {
               return(true);
            }
            
            return(false);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-122 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122"))
         )
      {
         if (((sbs_ft_zzl_case.hi_level - Close[0]) / Not_Zero(Close[0] - sbs_ft_zzl_case.md_level)) > 0.7)
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.hi_level - Close[0]) / Not_Zero(Close[0] - sbs_ft_zzl_case.md_level)) <= 0.7) &&
               (((ha3_min - sbs_ft_zzl_case.hi_level) / (ha3_max - ha3_min)) < 0.3)
            )
         {
            local_extremum = Get_Min_ZZL(3);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - (ha4_max - ha4_min)))
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
         if (((sbs_ft_zzl_case.hi_level - Close[0]) / Not_Zero(Close[0] - sbs_ft_zzl_case.md_level)) < 0.5)
         {
            local_extremum = Get_Max_ZZL(3);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            {
               return(false);
            }
         
            if (
                  (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1) &&
                  (sbs_ft_zzl_profile.ft3_bar > 5)
               )
            {
               return(false);
            }
         
            return(true);
         }
         
         if (((sbs_ft_zzl_case.hi_level - Close[0]) / Not_Zero(Close[0] - sbs_ft_zzl_case.md_level)) >= 0.5)
         {
            if (
                  (((ha4_min - sbs_ft_zzl_case.hi_level) / (ha4_max - ha4_min)) < 1)
               )
            {
               return(false);
            }
            
            if (
                  (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 1)
               )
            {
               return(false);
            }
            
            if (
                  (ha3ha2_Cross_04() < (16 * 10))
               )
            {
               return(false);
            }
            
            local_extremum = Get_Max_ZZL(4);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            {
               return(false);
            }
            
            return(true);            
         }         
         
         return(false);
      }

//--- Position 234-124 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (Close[0] > ha3_min)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-133 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         if (Close[0] > sbs_ft_zzl_case.md_level)
         {
            if (ha3ha2_Cross_04() < (16 * 8))
            {
               return(false);
            }

            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-134 ---/         Statistics needed

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > 10)
         {
            return(true);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) <= 10)
            )
         {
            local_extremum = Get_Min_ZZL(4);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            {
               return(true);
            }

            return(false);
         }

         return(false);
      }

//--- Position 234-144 ---/
//--- Position 234-222 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "222"))
         )
      {
         return(false);
      }

//--- Position 234-223 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "223"))
         )
      {
         if (Close[0] < ha3_max)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 243-114 ---/
//--- Position 243-124 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (Close[0] < ha4_max)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }
      
//--- Position 243-134 ---/
//--- Position 243-144 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 324-113 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
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
         if (
               (sbs_ft_zzl_profile.ft3_bar >= 3)
            )
         {
            local_extremum = Get_Max_ZZL(4);
            
            if (local_extremum.val > ha4_max)
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
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            if (ha4_max < sbs_ft_zzl_case.hi_level)
            {
               return(true);
            }
            else
            {
               return(false);
            }
         }
         else
         {
            return(false);
         }
      }

//--- Position 324-133 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         if (ha4_min >= sbs_ft_zzl_case.hi_level)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= 10)
         {
            if (
                  (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 1) &&
                  (((ha4_min_val[(16 * 5)] - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 1)
               )
            {
               return(false);
            }
            else
            {
               return(true);
            }
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 10) &&
               (Close[0] > sbs_ft_zzl_case.md_level)
            )
         {
            local_extremum = Get_Min_ZZL(4);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            {
               return(true);
            }
            
            local_extremum = Get_Max_ZZL(4);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            {
               return(true);
            }

            return(false);
         }
      
         return(false);
      }

//--- Position 324-144 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 8)
            {
               return(true);
            }

            return(false);
         }

         return(false);
      }

//--- Position 342-114 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= 10)
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
         return(false);
      }

//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
            )
         {
            local_extremum = Get_Max_ZZL(4);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            {
               return(true);
            }

            return(false);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 2))
            )
         {
            if ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
            {
               return(true);
            }
            
            if (
                  ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 2)) &&
                  ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 5))
               )
            {
               if (ha4_mx_ha2_Cross_04() < (16 * 8))
               {
                  return(false);
               }
               
               if (ha3_mx_ha2_Cross_04() < (16 * 8))
               {
                  return(false);
               }

               return(true);
            }
            
            return(false);
         }
         
         return(true);
      }

//--- Position 423-134 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level))
         {
            if ((ha4_low_Cross_04() - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
            {
               return(true);
            }

            return(false);
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-144 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (ha4ha2_Cross_04() < (16 * 8))
         {
            return(false);
         }
         else
         {
            return(true);
         }
      }

//--- Position 423-224 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 4)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-234 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 12)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-244 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
         {
            if ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) < 12)
            {
               return(false);
            }

            return(true);
         }
         else
         {
            return(false);
         }
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
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 3)
         {
            return(true);
         }
         
         if ((ha4_low_Cross_04() - sbs_ft_zzl_profile.ft3_bar) < 8)
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
         return(false);
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 4))
         {
            return(true);
         }
      
         if ((ha4_low_Cross_04() - sbs_ft_zzl_profile.ft3_bar) > 8)
         {
            return(false);
         }
         
         if ((sbs_ft_zzl_case.hi_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.md_level))
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
//         if (Close[0] > ha3_max)
//         {
//            return(true);
//         }
//         else
//         {
            return(false);
//         }
      }

//--- Position 432-233 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "233"))
         )
      {
         return(true);
      }

//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) >= 1)
         {
            return(true);
         }
         
         if (                                                                       // for future analysis
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 1) &&
               (((ha2_min - sbs_ft_zzl_case.md_level) / (ha2_max - ha2_min)) >= 0.75)
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
         if (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) >= 1)
         {
            return(true);
         }
         
         if (
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 1) &&
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (sbs_ft_zzl_case.md_level - sbs_ft_zzl_case.lo_level)) < 1)
            )
         {
            return(true);
         }
         
         if (
               (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 1) &&
               (((sbs_ft_zzl_case.lo_level - ha4_max) / (sbs_ft_zzl_case.md_level - sbs_ft_zzl_case.lo_level)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (2 * 16))
            )
         {
            return(true);
         }
         
         if ((sbs_ft_zzl_case.hi_level - ha2_min) < (ha2_min - sbs_ft_zzl_case.md_level))      // rg04
         {
            if (ha3_max_val[16 * 10] < sbs_ft_zzl_case.hi_level)
            {
               return(true);
            }
            
            return(false);
         }

         return(false);
      }

//--- Position 432-334 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334"))
         )
      {
         if (
               ((sbs_ft_zzl_case.hi_level - Close[0]) < (Close[0] - sbs_ft_zzl_case.md_level)) &&
               (((sbs_ft_zzl_case.lo_level - ha3_max) / (ha3_max - ha3_min)) < 0.5) &&
               (ha4ha3_Cross_04() < (MAX_IREG_NO_04 - 1))
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         return(false);
      }

//--- No more positions to check SELL_ORDER,101,1 ---/
   }

//------------------ BUY_ORDER,201,1 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 201) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 432-344 ---/
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) <= (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            return(false);
         }
         
         if (
               ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level)) &&
               ((sbs_ft_zzl_case.md_level - ha2_max) < (ha2_max - ha2_min)) &&
               ((sbs_ft_zzl_case.lo_level - ha3_max) > (ha3_max - ha3_min))
            )
         {
            return(false);
         }

         if (
               ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level)) &&     //r04
               ((sbs_ft_zzl_case.lo_level - ha3_max) <= (ha3_max - ha3_min))
            )
         {
            local_extremum = Get_Max_ZZL(2);
            
            if (
                  ((ha3_min - Close[0]) < (local_extremum.val - ha3_max))
               )
            {
               return(true);
            }
            else
            {
               local_extremum = Get_Max_ZZL(4);
               if (local_extremum.val > (sbs_ft_zzl_case.hi_level - n_Point))
               {
                  return(true);
               }
               else
               {
                  return(false);
               }
            }
         }

         return(true);

      }

//--- Position 432-244 ---/
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) <= (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            return(false);
         }
         
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            if (
                  (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1) &&
                  (sbs_ft_zzl_profile.ft3_bar < 8)
               )
            {
               return(true);
            }
            else
            {
               return(false);
            }
         }

         return(true);
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (
               (Close[0] < ha3_max) &&
               ((Close[0] - sbs_ft_zzl_case.lo_level) < (sbs_ft_zzl_case.md_level - Close[0]))
            )
         {
            if (ha4ha2_mx_Cross_04() < (12 * 16))
            {
               return(true);
            }
         
            if (
                  (ha4ha2_mx_Cross_04() >= (12 * 16)) &&
                  (((ha4_max - sbs_ft_zzl_case.lo_level) / (ha4_max - ha4_min)) < 1) &&
                  (sbs_ft_zzl_profile.ft3_bar < 5)
               )
            {
               return(true);
            }
            
            return(false);
         }
         else
         {
            return(false);
         }
      }

//--- Position 432-334 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334"))
         )
      {
         if (((Close[0] - sbs_ft_zzl_case.lo_level) / Not_Zero(sbs_ft_zzl_case.md_level - Close[0])) > 0.7)
         {
            return(true);
         }
         
         if (
               (((Close[0] - sbs_ft_zzl_case.lo_level) / Not_Zero(sbs_ft_zzl_case.md_level - Close[0])) <= 0.7) &&
               (((sbs_ft_zzl_case.lo_level - ha3_max) / (ha3_max - ha3_min)) < 0.3)
            )
         {
            local_extremum = Get_Max_ZZL(3);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + (ha4_max - ha4_min)))
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
         if (((Close[0] - sbs_ft_zzl_case.lo_level) / Not_Zero(sbs_ft_zzl_case.md_level - Close[0])) < 0.5)      //zero divide !!!!!
         {
            local_extremum = Get_Min_ZZL(3);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            {
               return(false);
            }
         
            if (
                  (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1) &&
                  (sbs_ft_zzl_profile.ft3_bar > 5)
               )
            {
               return(false);
            }
         
            return(true);
         }
         
         if (((Close[0] - sbs_ft_zzl_case.lo_level) / Not_Zero(sbs_ft_zzl_case.md_level - Close[0])) >= 0.5)
         {
            if (
                  (((sbs_ft_zzl_case.lo_level - ha4_max) / (ha4_max - ha4_min)) < 1)
               )
            {
               return(false);
            }
            
            if (
                  (((ha3_min - sbs_ft_zzl_case.lo_level) / (ha3_max - ha3_min)) < 1)
               )
            {
               return(false);
            }
            
            if (
                  (ha3ha2_Cross_04() < (16 * 10))
               )
            {
               return(false);
            }
            
            local_extremum = Get_Min_ZZL(4);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            {
               return(false);
            }
            
            return(true);            
         }         
         
         return(false);
      }

//--- Position 432-134 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (Close[0] < ha3_max)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }
      
//--- Position 432-224 ---/
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         if (Close[0] < sbs_ft_zzl_case.md_level)
         {
            if (ha3ha2_Cross_04() < (16 * 8))
            {
               return(false);
            }

            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }
      
      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) > 10)
         {
            return(true);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_bar - sbs_ft_zzl_profile.ft3_second_bar) <= 10)
            )
         {
            local_extremum = Get_Max_ZZL(4);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            {
               return(true);
            }

            return(false);
         }

         return(false);
      }

//--- Position 432-114 ---/
//--- Position 432-333 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "333"))
         )
      {
         return(false);
      }

//--- Position 432-233 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "233"))
         )
      {
         if (Close[0] > ha3_min)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 342-144 ---/
//--- Position 342-134 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (Close[0] > ha4_min)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 342-124 ---/
//--- Position 342-114 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-244 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
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
         if (
               (sbs_ft_zzl_profile.ft3_bar >= 3)
            )
         {
            local_extremum = Get_Min_ZZL(4);
            
            if (local_extremum.val < ha4_min)
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
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            if (ha4_min > sbs_ft_zzl_case.lo_level)
            {
               return(true);
            }
            else
            {
               return(false);
            }
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-224 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         if (ha4_max <= sbs_ft_zzl_case.lo_level)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 423-124 ---/
      
      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= 10)
         {
            if (
                  (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) < 1) &&
                  (((sbs_ft_zzl_case.md_level - ha4_max_val[(16 * 5)]) / (ha4_max - ha4_min)) < 1)
               )
            {
               return(false);
            }
            else
            {
               return(true);
            }
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 10) &&
               (Close[0] < sbs_ft_zzl_case.md_level)
            )
         {
            local_extremum = Get_Min_ZZL(4);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            {
               return(true);
            }
            
            local_extremum = Get_Max_ZZL(4);
            
            if (local_extremum.val > (sbs_ft_zzl_case.hi_level + n_Point))
            {
               return(true);
            }

            return(false);
         }
      
         return(false);
      }

//--- Position 423-114 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 8)
            {
               return(true);
            }

            return(false);
         }
         
         return(false);
      }

//--- Position 243-144 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= 10)
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
         return(false);
      }

//--- Position 324-144 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
            )
         {
            local_extremum = Get_Min_ZZL(4);
            
            if (local_extremum.val < (sbs_ft_zzl_case.lo_level - n_Point))
            {
               return(true);
            }

            return(false);
         }
         
         if (
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 2))
            )
         {
            if ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
            {
               return(true);
            }
            
            if (
                  ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 2)) &&
                  ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 5))
               )
            {
               if (ha4ha2_mx_Cross_04() < (16 * 8))
               {
                  return(false);
               }
               
               if (ha3ha2_mx_Cross_04() < (16 * 8))
               {
                  return(false);
               }

               return(true);
            }
            
            return(false);
         }
         
         return(true);
      }


//--- Position 324-124 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if ((sbs_ft_zzl_case.md_level - Close[0]) > (Close[0] - sbs_ft_zzl_case.lo_level))
         {
            if ((ha4_high_Cross_04() - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
            {
               return(true);
            }

            return(false);
         }
         else
         {
            return(false);
         }
      }

//--- Position 324-114 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (ha4ha2_Cross_04() < (16 * 8))
         {
            return(false);
         }
         else
         {
            return(true);
         }
      }

//--- Position 324-133 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 4)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 324-123 ---/
      
      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 12)
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }
      
//--- Position 324-113 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < (16 * 2))
         {
            if ((sbs_ft_zzl_profile.ft3_bounce_bar - sbs_ft_zzl_profile.ft3_bar) < 12)
            {
               return(false);
            }

            return(true);
         }
         else
         {
            return(false);
         }
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
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) < 3)
         {
            return(true);
         }
         
         if ((ha4_high_Cross_04() - sbs_ft_zzl_profile.ft3_bar) < 8)
         {
            return(false);
         }
         
         return(true);
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (16 * 4))
         {
            return(true);
         }
      
         if ((ha4_high_Cross_04() - sbs_ft_zzl_profile.ft3_bar) > 8)
         {
            return(false);
         }
         
         if ((Close[0] - sbs_ft_zzl_case.lo_level) > (sbs_ft_zzl_case.md_level - Close[0]))
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
         return(false);
      }

//--- Position 234-133 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
//         if (Close[0] < ha3_min)
//         {
//            return(true);
//         }
//         else
//         {
            return(false);
//         }
      }

//--- Position 234-223 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "223"))
         )
      {
         return(true);
      }

//--- Position 234-123 ---/
      
      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) >= 1)
         {
            return(true);
         }
         
         if (                                                                       // for future analysis
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 1) &&
               (((sbs_ft_zzl_case.md_level - ha2_max) / (ha2_max - ha2_min)) >= 0.75)
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
         if (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) >= 1)
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 1) &&
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.md_level)) < 1)
            )
         {
            return(true);
         }
         
         if (
               (((sbs_ft_zzl_case.hi_level - ha3_max) / (ha3_max - ha3_min)) < 1) &&
               (((ha4_min - sbs_ft_zzl_case.hi_level) / (sbs_ft_zzl_case.hi_level - sbs_ft_zzl_case.md_level)) >= 1) &&
               ((sbs_ft_zzl_profile.ft3_second_bar - sbs_ft_zzl_profile.ft3_bar) >= (2 * 16))
            )
         {
            return(true);
         }
         
         if ((ha2_max - sbs_ft_zzl_case.lo_level) < (sbs_ft_zzl_case.md_level - ha2_max))      // rg04
         {
            if (ha3_min_val[16 * 10] > sbs_ft_zzl_case.lo_level)
            {
               return(true);
            }
            
            return(false);
         }
         
         return(false);
      }

//--- Position 234-122 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122"))
         )
      {
         if (
               ((Close[0] - sbs_ft_zzl_case.lo_level) < (sbs_ft_zzl_case.md_level - Close[0])) &&
               (((ha3_min - sbs_ft_zzl_case.hi_level) / (ha3_max - ha3_min)) < 0.5) &&
               (ha4ha3_Cross_04() < (MAX_IREG_NO_04 - 1))
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         return(false);
      }

//--- No more positions to check BUY_ORDER,201,1 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_101_201_1_lbr.mqh/