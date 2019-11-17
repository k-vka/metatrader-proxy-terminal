//================== sbs_ft_zzl_cases_confirmation_101_201_2_lbr.mqh ===/

//================== SBS_FT_ZZL_Case_Confirmed_101_201_2 ===============/

bool     SBS_FT_ZZL_Case_Confirmed_101_201_2()
{
//------------------ SELL_ORDER,101,2 ----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == SELL_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 101) &&
         (sbs_ft_zzl_signal.case_subnumber == 2)
      )
   {
//--- Position 234-123 ---/
//--- Position 234-124 ---/

//--- Position 243-124 ---/

//--- Position 324-133 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            
            ((sbs_indi_position.ha_order == "243") && (sbs_indi_position.ft3_levels_ha == "124")) ||
            
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "133"))
         )
      {
         return(true);
      }

//--- Position 423-224 ---/
//--- Position 423-334 ---/

      if (
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "224")) ||
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "334"))
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
//--- Position 432-234 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "144")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 3)
         {
            return(true);
         }
         
         return(false);
      }

//--- Position 432-244 ---/
//--- Position 432-333 ---/
//--- Position 432-334 ---/
//--- Position 432-344 ---/
//--- Position 432-444 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "244")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "333")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "334")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "344")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "444"))
         )
      {
         return(true);
      }

//--- No more positions to check SELL_ORDER,101,2 ---/
   }

//------------------ BUY_ORDER,201,2 -----------------------------------/

   if (
         (sbs_ft_zzl_signal.signal         == BUY_ORDER) &&
         (sbs_ft_zzl_signal.case_number    == 201) &&
         (sbs_ft_zzl_signal.case_subnumber == 2)
      )
   {
//--- Position 432-234 ---/
//--- Position 432-134 ---/

//--- Position 342-134 ---/

//--- Position 423-224 ---/

      if (
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "234")) ||
            ((sbs_indi_position.ha_order == "432") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            
            ((sbs_indi_position.ha_order == "342") && (sbs_indi_position.ft3_levels_ha == "134")) ||
            
            ((sbs_indi_position.ha_order == "423") && (sbs_indi_position.ft3_levels_ha == "224"))
         )
      {
         return(true);
      }

//--- Position 324-133 ---/
//--- Position 324-122 ---/

      if (
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "133")) ||
            ((sbs_indi_position.ha_order == "324") && (sbs_indi_position.ft3_levels_ha == "122"))
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
//--- Position 234-123 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "114")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "123"))
         )
      {
         if (sbs_ft_zzl_profile.ft3_bar < 3)
         {
            return(true);
         }
         
         return(false);
      }


//--- Position 234-113 ---/
//--- Position 234-222 ---/
//--- Position 234-122 ---/
//--- Position 234-112 ---/
//--- Position 234-111 ---/

      if (
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "113")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "222")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "122")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "112")) ||
            ((sbs_indi_position.ha_order == "234") && (sbs_indi_position.ft3_levels_ha == "111"))
         )
      {
         return(true);
      }

//--- No more positions to check BUY_ORDER,201,2 ---/
   }

//------------------ NO Case to check ----------------------------------/

   return(true);
}

//================== eof sbs_ft_zzl_cases_confirmation_101_201_2_lbr.mqh/