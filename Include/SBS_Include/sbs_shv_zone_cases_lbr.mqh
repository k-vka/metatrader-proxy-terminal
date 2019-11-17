//================== sbs_shv_zone_cases_lbr.mqh ========================/

//============================ Get SHV Level Order Type & Case =========/

void   Get_SBS_SHV_Level_Order_Case()
{
double      window_size;

//---------------------------- Reset SHV Level Case --------------------/

   shv_level_case.order_req = NO_ORDER;
   Set_SHV_Level_Case_Number(0,0);

//---------------------------- 321(1) ----------------------------------/

   Set_SHV_Level_Case_Number(321,1);
   
   if (
         (sbs_indi_shv_high_zone.zone_found) &&
         (sbs_indi_shv_low_zone.zone_found)
      )
   {
      window_size = 0.01 * (sbs_indi_shv_high_zone.lo - sbs_indi_shv_low_zone.hi);
   }
   
   if (
         (sbs_indi_shv_high_zone.zone_found) &&
         (!sbs_indi_shv_low_zone.zone_found)
      )
   {
      window_size =  0.01 * (sbs_indi_shv_high_zone.hi - sbs_indi_shv_high_zone.lo);
   }

   if (
         (sbs_indi_shv_high_zone.zone_found) &&
//         (Close[0] < (sbs_indi_shv_high_zone.lo - (0 * (sbs_indi_shv_high_zone.hi - sbs_indi_shv_high_zone.lo)))) &&
         (High[iHighest(NULL,0,MODE_HIGH,3,0)] > sbs_indi_shv_high_zone.lo) &&
         ((sbs_indi_shv_high_zone.lo - Close[0]) > window_size)
      )
   {
      shv_level_case.order_req = SELL_ORDER;
      return;
   }

//---------------------------- 421(1) ----------------------------------/

   Set_SHV_Level_Case_Number(421,1);
   
   if (
         (sbs_indi_shv_high_zone.zone_found) &&
         (sbs_indi_shv_low_zone.zone_found)
      )
   {
      window_size = 0.01 * (sbs_indi_shv_high_zone.lo - sbs_indi_shv_low_zone.hi);
   }
   
   if (
         (!sbs_indi_shv_high_zone.zone_found) &&
         (sbs_indi_shv_low_zone.zone_found)
      )
   {
      window_size = 0.01 * (sbs_indi_shv_low_zone.hi - sbs_indi_shv_low_zone.lo);
   }
   
   if (
         (sbs_indi_shv_low_zone.zone_found) &&
//         (Close[0] > (sbs_indi_shv_low_zone.hi + (0 * (sbs_indi_shv_low_zone.hi - sbs_indi_shv_low_zone.lo)))) &&
         (Low[iLowest(NULL,0,MODE_LOW,3,0)] < sbs_indi_shv_low_zone.hi) &&
         ((Close[0] - sbs_indi_shv_low_zone.hi) > window_size)
      )
   {
      shv_level_case.order_req = BUY_ORDER;
      return;
   }

//----------------------------------------------------------------------/

   return;
}

//============================ Get_SBS_Case_SHV_Zone_Position ==========/

void     Get_SBS_Case_SHV_Zone_Position(double chk_price)
{
//---------------------------- Reset Position value --------------------/

   shv_zone_case.zone_position = CASE_ZONE_POS_NOT_DEFINED;
   
   if ((!sbs_indi_shv_high_zone.zone_found) && 
       (!sbs_indi_shv_low_zone.zone_found))     return;

//----------------------------------------------------------------------/
       
   if ((!sbs_indi_shv_high_zone.zone_found) && 
       (sbs_indi_shv_low_zone.zone_found))     
   {
      shv_zone_case.zone_position = CASE_ZONE_POS_LOW_ONLY;
      return;
   }

//----------------------------------------------------------------------/

   if ((sbs_indi_shv_high_zone.zone_found) && 
       (!sbs_indi_shv_low_zone.zone_found))     
   {
      shv_zone_case.zone_position = CASE_ZONE_POS_HIGH_ONLY;
      return;
   }

//----------------------------------------------------------------------/

   if ((sbs_indi_shv_high_zone.zone_found) && 
       (sbs_indi_shv_low_zone.zone_found) &&
       (sbs_indi_shv_high_zone.id == sbs_indi_shv_low_zone.id))     
   {
      shv_zone_case.zone_position = CASE_ZONE_POS_INSIDE_ZONE;
      return;
   }

//----------------------------------------------------------------------/

   if ((sbs_indi_shv_high_zone.zone_found) && 
       (sbs_indi_shv_low_zone.zone_found) &&
       (sbs_indi_shv_high_zone.id != sbs_indi_shv_low_zone.id) &&
       (
         (sbs_indi_shv_high_zone.lo - (sbs_indi_shv_high_zone.hi - sbs_indi_shv_high_zone.lo)) >
         (sbs_indi_shv_low_zone.hi  + (sbs_indi_shv_low_zone.hi - sbs_indi_shv_low_zone.lo))
       ))     
   {
      shv_zone_case.zone_position = CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_NOVLPD;
      return;
   }

//----------------------------------------------------------------------/

   if ((sbs_indi_shv_high_zone.zone_found) && 
       (sbs_indi_shv_low_zone.zone_found) &&
       (sbs_indi_shv_high_zone.id != sbs_indi_shv_low_zone.id) &&
       (
         (sbs_indi_shv_high_zone.lo - (sbs_indi_shv_high_zone.hi - sbs_indi_shv_high_zone.lo)) <=
         (sbs_indi_shv_low_zone.hi  + (sbs_indi_shv_low_zone.hi - sbs_indi_shv_low_zone.lo))
       ))     
   {
      shv_zone_case.zone_position = CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_OVLPD;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Process_SBS_Case_SHV_Zone_Position ======/

void     Process_SBS_Case_SHV_Zone_Position()
{
//---------------------------- Reset SHV Case --------------------------/

   shv_zone_case.order_req = NO_ORDER;
   Set_SHV_Case_Number(0,0);

//---------------------------- Process SELL Signal ---------------------/

   if (sbs_indi_ft_01[0].signal == SELL_ORDER)
   {
      switch(shv_zone_case.zone_position)
      {
         case CASE_ZONE_POS_NOT_DEFINED:                 {Proc_SELL_Case_ZP_ND(); break;}
         case CASE_ZONE_POS_LOW_ONLY:                    {Proc_SELL_Case_ZP_LO(); break;}
         case CASE_ZONE_POS_INSIDE_ZONE:                 {Proc_SELL_Case_ZP_IZ(); break;}
         case CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_NOVLPD: {Proc_SELL_Case_ZP_NOVLP(); break;}
         case CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_OVLPD:  {Proc_SELL_Case_ZP_OVLP(); break;}
         case CASE_ZONE_POS_HIGH_ONLY:                   {Proc_SELL_Case_ZP_HO(); break;}
      }
      
      return;
   }

//---------------------------- Process BUY Signal ----------------------/

   if (sbs_indi_ft_01[0].signal == BUY_ORDER)
   {
      switch(shv_zone_case.zone_position)
      {
         case CASE_ZONE_POS_NOT_DEFINED:                 {Proc_BUY_Case_ZP_ND(); break;}
         case CASE_ZONE_POS_LOW_ONLY:                    {Proc_BUY_Case_ZP_LO(); break;}
         case CASE_ZONE_POS_INSIDE_ZONE:                 {Proc_BUY_Case_ZP_IZ(); break;}
         case CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_NOVLPD: {Proc_BUY_Case_ZP_NOVLP(); break;}
         case CASE_ZONE_POS_BETWEEN_HIGH_AND_LOW_OVLPD:  {Proc_BUY_Case_ZP_OVLP(); break;}
         case CASE_ZONE_POS_HIGH_ONLY:                   {Proc_BUY_Case_ZP_HO(); break;}
      }
      
      return;
   }

//----------------------------------------------------------------------/

   return;
}

//======================================================================/
//                         SELL CASES SECTION                           /
//======================================================================/

//============================ Proc_SELL_Case_ZP_ND() ==================/

void     Proc_SELL_Case_ZP_ND()
{
//---------------------------- 121(1) ----------------------------------/

   Set_SHV_Case_Number(121,1);
   shv_zone_case.order_req = REJECT_ORDER;

//----------------------------------------------------------------------/

   return;
}

//============================ Proc_SELL_Case_ZP_LO() ==================/

void     Proc_SELL_Case_ZP_LO()
{
//---------------------------- 131(1) ----------------------------------/

   Set_SHV_Case_Number(131,1);
   
   if (sbs_indi_ma_01_data[0] <= sbs_indi_shv_low_zone.hi)
   {
      shv_zone_case.order_req = SELL_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }

//---------------------------- 131(2) ----------------------------------/

   Set_SHV_Case_Number(131,2);
   
   if ((Close[0] - sbs_indi_shv_low_zone.hi) > (2 * (sbs_indi_shv_low_zone.hi - sbs_indi_shv_low_zone.lo)))
   {
      shv_zone_case.order_req = SELL_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_SELL_Case_ZP_IZ() (High == Low) =====/

void     Proc_SELL_Case_ZP_IZ()
{
//---------------------------- 141(1) ----------------------------------/

   Set_SHV_Case_Number(141,1);
   
   if (sbs_indi_ma_01_data[0] <= sbs_indi_shv_low_zone.hi)
   {
      shv_zone_case.order_req = SELL_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_SELL_Case_ZP_NOVLP() (High > Low) ==/

void     Proc_SELL_Case_ZP_NOVLP()
{

//----------------- Get Local (INDI 01 & High Zone) High Max Value -----/
   
   Get_Zone_Local_High_Maximum();
   
//---------------------------- 151(1) ----------------------------------/

   Set_SHV_Case_Number(151,1);
   
   if (
         (sbs_indi_shv_high_zone.lo - shv_zone_case.local_high_max_val) < 
         (shv_zone_case.local_high_max_val - sbs_indi_shv_low_zone.hi)
      )
   {
      shv_zone_case.order_req = SELL_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_SELL_Case_ZP_OVLP() (High > Low) ===/

void     Proc_SELL_Case_ZP_OVLP()
{

//----------------- Get Local (INDI 01 & High Zone) High Max Value -----/
   
   Get_Zone_Local_High_Maximum();
   
//---------------------------- 161(1) ----------------------------------/

   Set_SHV_Case_Number(161,1);
   
   if (
         (shv_zone_case.local_high_max_val - sbs_indi_shv_high_zone.lo) < 
         (sbs_indi_shv_low_zone.hi - shv_zone_case.local_min_after_max)
      )
   {
      shv_zone_case.order_req = SELL_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_SELL_Case_ZP_HO() (no Low) =========/

void     Proc_SELL_Case_ZP_HO()
{
 
//---------------------------- 171(1) ----------------------------------/

   Set_SHV_Case_Number(171,1);
   
   shv_zone_case.order_req = SELL_ORDER;
   
//----------------------------------------------------------------------/

   return;
}

//======================================================================/
//                         BUY CASES SECTION                            /
//======================================================================/

//============================ Proc_BUY_Case_ZP_ND() ===================/

void     Proc_BUY_Case_ZP_ND()
{
//---------------------------- 221(1) ----------------------------------/

   Set_SHV_Case_Number(221,1);
   shv_zone_case.order_req = REJECT_ORDER;

//----------------------------------------------------------------------/

   return;
}

//============================ Proc_BUY_Case_ZP_LO() (no High) =========/

void     Proc_BUY_Case_ZP_LO()
{
 
//---------------------------- 231(1) ----------------------------------/

   Set_SHV_Case_Number(231,1);
   
   shv_zone_case.order_req = BUY_ORDER;
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_BUY_Case_ZP_IZ() (High == Low) =====/

void     Proc_BUY_Case_ZP_IZ()
{
//---------------------------- 241(1) ----------------------------------/

   Set_SHV_Case_Number(241,1);
   
   if (sbs_indi_ma_01_data[0] >= sbs_indi_shv_high_zone.lo)
   {
      shv_zone_case.order_req = BUY_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }

//----------------------------------------------------------------------/

   return;
}

//============================ Proc_BUY_Case_ZP_NOVLP() (High > Low) ===/

void     Proc_BUY_Case_ZP_NOVLP()
{

//----------------- Get Local (INDI 01 & High Zone) Low Min Value -----/
   
   Get_Zone_Local_Low_Minimum();
   
//---------------------------- 251(1) ----------------------------------/

   Set_SHV_Case_Number(251,1);
   
   if (
         (sbs_indi_shv_high_zone.lo - shv_zone_case.local_low_min_val) > 
         (shv_zone_case.local_low_min_val - sbs_indi_shv_low_zone.hi)
      )
   {
      shv_zone_case.order_req = BUY_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_BUY_Case_ZP_OVLP() (High > Low) ====/

void     Proc_BUY_Case_ZP_OVLP()
{

//----------------- Get Local (INDI 01 & High Zone) Low Min Value -----/
   
   Get_Zone_Local_Low_Minimum();
   
//---------------------------- 261(1) ----------------------------------/

   Set_SHV_Case_Number(261,1);
   
   if (
         (sbs_indi_shv_low_zone.hi - shv_zone_case.local_low_min_val) <
         (shv_zone_case.local_max_after_min - sbs_indi_shv_high_zone.lo)
      )
   {
      shv_zone_case.order_req = BUY_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//============================ Proc_BUY_Case_ZP_HO() ===================/

void     Proc_BUY_Case_ZP_HO()
{
//---------------------------- 271(1) ----------------------------------/

   Set_SHV_Case_Number(271,1);
   
   if (sbs_indi_ma_01_data[0] >= sbs_indi_shv_high_zone.lo)
   {
      shv_zone_case.order_req = BUY_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }

//---------------------------- 271(2) ----------------------------------/

   Set_SHV_Case_Number(271,2);
   
   if ((sbs_indi_shv_high_zone.lo - Close[0]) > (2 * (sbs_indi_shv_high_zone.hi - sbs_indi_shv_high_zone.lo)))
   {
      shv_zone_case.order_req = BUY_ORDER;
      return;
   }
   else
   {
      shv_zone_case.order_req = REJECT_ORDER;
      return;
   }
   
//----------------------------------------------------------------------/

   return;
}

//================== eof sbs_shv_zone_cases_lbr.mqh ====================/
