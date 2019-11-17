//================== sbs_ft_zzl_cases_confirmation_105_205_1_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_105_205_1 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_105_205_1()
{
temp_extremum      local_extremum;

//------------------ SELL_ORDER,105,1 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 105) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (ha2_min > ha3_max)
         {
            return(true);
         }
         
         if (ha2_min <= ha3_max)
         {
            local_extremum = Get_Max_ZZL(3);
         
            if (
                  (local_extremum.val <= ha3_max_val[local_extremum.bar])
               )
            {
               if (Close[0] > sbs_ft_zzl_case.md_level)
               {
                  return(true);
               }
               
               return(false);
            }
         
            if (
                  (local_extremum.val > ha3_max_val[local_extremum.bar]) &&
                  (sbs_just_zzl_sell_signal[0].bar < 2) &&
                  (sbs_just_zzl_sell_signal[0].val > sbs_just_zzl_sell_signal[1].val)
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
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val >= sbs_ft_zzl_case.hi_level)
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
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val < (ha3_max_val[local_extremum.bar] + (ha3_max - ha3_min))) &&
               (sbs_just_zzl_sell_signal[0].bar < 2)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 234-134 ---/
//--- Position 324-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
         if (
               (sbs_just_zzl_sell_signal[0].bar < 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 324-114 ---/
//--- Position 324-123 ---/
//--- Position 324-124 ---/
//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "123")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         return(true);
      }

//--- Position 342-114 ---/

      if (
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (
               (ha4_min > ha3_max)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 342-124 ---/

      if (

            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) > 0.5)
            )
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
         local_extremum = Get_Max_ZZL(3);
         
         if (
               (local_extremum.val >= sbs_ft_zzl_case.hi_level)
            )
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
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val < sbs_ft_zzl_case.hi_level) &&
               (sbs_just_zzl_sell_signal[0].bar < 2)
            )
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

//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val < (sbs_ft_zzl_case.hi_level - (ha4_max - ha4_min))) &&
               (sbs_just_zzl_sell_signal[0].bar < 2)
            )
         {
            return(true);
         }
 
         return(false);
      }
      
//--- Position 432-114 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (
               (((ha4_min - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 1) &&
               (sbs_just_zzl_sell_signal[0].bar > 2)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 432-124 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         if (
               (ha4ha3_Cross_04() < (5 * 16))
            )
         {
            return(false);
         }
         
         if (
               (ha4ha3_Cross_04() >= (5 * 16)) &&
               (ha4ha3_Cross_04() >= (MAX_IREG_NO_04 - 1))
            )
         {
            return(true);
         }
         
         if (
               (ha4ha3_Cross_04() >= (5 * 16)) &&
               (ha4ha3_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (Close[0] > ha2_min)
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
         return(true);
      }

//--- Position 432-144 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (ha4ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            return(false);
         }
         
         if (ha4ha2_Cross_04() > sbs_ft_zzl_profile.ft3_bar)
         {
            if (((Close[0] - sbs_ft_zzl_case.md_level) / (ha4_max - ha4_min)) < 2)
            {
               return(false);
            }
            
            return(true);
         }

         return(true);
      }

//--- Position 432-224 ---/
//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "224")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         return(true);
      }

//--- Position 432-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
//         if (Close[0] < ha2_max)
//         {
//            return(true);
//         }
//         else
//         {
            return(false);
//         }
      }

//--- Position 432-334 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334"))
         )
      {
         return(true);
      }

//--- Position 432-344 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344"))
         )
      {
         local_extremum = Get_Max_ZZL(1);
         
         if (
               (local_extremum.val >= sbs_ft_zzl_case.hi_level)
            )
         {
            return(false);
         }

         return(true);
      }
      
//--- No more positions to check SELL_ORDER,105,1 ---/
   }

//------------------ BUY_ORDER,205,1 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 205) &&
         (sbs_ft_zzl_signal.case_subnumber == 1)
      )
   {
//--- Position 432-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (ha2_max < ha3_min)
         {
            return(true);
         }
         
         if (ha2_max >= ha3_min)
         {
            local_extremum = Get_Min_ZZL(3);
         
            if (
                  (local_extremum.val >= ha3_min_val[local_extremum.bar])
               )
            {
               if (Close[0] < sbs_ft_zzl_case.md_level)
               {
                  return(true);
               }
               
               return(false);
            }
         
            if (
                  (local_extremum.val < ha3_min_val[local_extremum.bar]) &&
                  (sbs_just_zzl_buy_signal[0].bar < 2) &&
                  (sbs_just_zzl_buy_signal[0].val < sbs_just_zzl_buy_signal[1].val)
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
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val <= sbs_ft_zzl_case.lo_level)
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
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val > (ha3_min_val[local_extremum.bar] - (ha3_max - ha3_min))) &&
               (sbs_just_zzl_buy_signal[0].bar < 2)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 432-124 ---/
//--- Position 423-244 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "244"))
         )
      {
         if (
               (sbs_just_zzl_buy_signal[0].bar < 2)
            )
         {
            return(true);
         }

         return(false);
      }

//--- Position 423-144 ---/
//--- Position 423-234 ---/
//--- Position 423-134 ---/
//--- Position 423-124 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "234")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "124"))
         )
      {
         return(true);
      }

//--- Position 243-144 ---/

      if (
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (
               (ha4_max < ha3_min)
            )
         {
            return(true);
         }
         else
         {
            return(false);
         }
      }

//--- Position 243-134 ---/

      if (

            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) > 0.5)
            )
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
         local_extremum = Get_Min_ZZL(3);
         
         if (
               (local_extremum.val <= sbs_ft_zzl_case.lo_level)
            )
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
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val > sbs_ft_zzl_case.lo_level) &&
               (sbs_just_zzl_buy_signal[0].bar < 2)
            )
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

//--- Position 324-134 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val > (sbs_ft_zzl_case.lo_level + (ha4_max - ha4_min))) &&
               (sbs_just_zzl_buy_signal[0].bar < 2)
            )
         {
            return(true);
         }
 
         return(false);
      }
      
//--- Position 234-144 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "144"))
         )
      {
         if (
               (((sbs_ft_zzl_case.md_level - ha4_max) / (ha4_max - ha4_min)) < 1) &&
               (sbs_just_zzl_buy_signal[0].bar > 2)
            )
         {
            return(false);
         }

         return(true);
      }

//--- Position 234-134 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "134"))
         )
      {
         if (
               (ha4ha3_Cross_04() < (5 * 16))
            )
         {
            return(false);
         }
         
         if (
               (ha4ha3_Cross_04() >= (5 * 16)) &&
               (ha4ha3_Cross_04() >= (MAX_IREG_NO_04 - 1))
            )
         {
            return(true);
         }
         
         if (
               (ha4ha3_Cross_04() >= (5 * 16)) &&
               (ha4ha3_Cross_04() < (MAX_IREG_NO_04 - 1)) &&
               (Close[0] < ha2_max)
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
         return(true);
      }

//--- Position 234-114 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114"))
         )
      {
         if (ha4ha2_Cross_04() <= sbs_ft_zzl_profile.ft3_bar)
         {
            return(false);
         }
         
         if (ha4ha2_Cross_04() > sbs_ft_zzl_profile.ft3_bar)
         {
            if (((sbs_ft_zzl_case.md_level - Close[0]) / (ha4_max - ha4_min)) < 2)
            {
               return(false);
            }
            
            return(true);
         }

         return(true);
      }

//--- Position 234-133 ---/
//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "133")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         return(true);
      }

//--- Position 234-113 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113"))
         )
      {
//         if (Close[0] > ha2_min)
//         {
//            return(true);
//         }
//         else
//         {
            return(false);
//         }
      }

//--- Position 234-122 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122"))
         )
      {
         return(true);
      }

//--- Position 234-112 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112"))
         )
      {
         local_extremum = Get_Min_ZZL(1);
         
         if (
               (local_extremum.val <= sbs_ft_zzl_case.lo_level)
            )
         {
            return(false);
         }

         return(true);
      }

//--- No more positions to check BUY_ORDER,205,1 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_105_205_1_lbr.mqh/