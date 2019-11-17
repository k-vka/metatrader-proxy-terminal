//================== sbs_exp_indi_data_proc_lbr.mqh =======================/

//============================ Analyze SBS_INDI Data ======================/

void  Analyze_SBS_Indi_Data()
{
//--------------------------- Get SBS_Indi_Trends -------------------------/

//   Get_SBS_Indi_Trend(sbs_indi_01_trend, sbs_indi_01_data, sbs_indi_01_level);
//   Get_SBS_Indi_Trend(sbs_indi_02_trend, sbs_indi_02_data, sbs_indi_02_level);

//--------------------------- Get Order Type & Case -----------------------/

//   Get_SBS_Order_Case();

//---------------------------- Get SBS SHV Zone Data ----------------------/
   
//   Get_SBS_SHV_Zone_Data(Close[0]);

//--------------------------- Get SHV Level Order Type & Case -------------/

//   Get_SBS_SHV_Level_Order_Case();
   
//--------------------------- Get DSS of MACD Signal Type (Trend) ---------/

//   Get_SBS_DSS_of_MACD_Signal();

//--------------------------- Get FT/SHV Order Type & Case ----------------/

//   Get_SBS_FT_SHV_Order_Case();

//--------------------------- Get FT/DSS Order Type & Case ----------------/

//   Get_SBS_FT_DSS_Order_Case();

//--------------------------- Get RMI RSX State ---------------------------/

   Get_SBS_RMI_RSX_State();
   
//--------------------------- Get FT/RMI Order Type & Case ----------------/

   Get_SBS_FT_RMI_RSX_Order_Case();

   return;
}

//============================= Get_SBS_DSS_of_MACD_SIgnal ================/

void  Get_SBS_DSS_of_MACD_Signal()
{
int      i;

   sbs_indi_dss_of_macd_01.signal = NO_ORDER;
   
   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (
            (sbs_indi_dss_of_macd_01_data[i]    < sbs_indi_dss_of_macd_01_level.up_level) &&
            (sbs_indi_dss_of_macd_01_data[i+1] >= sbs_indi_dss_of_macd_01_level.up_level)
         )
      {
         sbs_indi_dss_of_macd_01.signal         = SELL_ORDER;
         sbs_indi_dss_of_macd_01.bar_number     = i;
         sbs_indi_dss_of_macd_01.case_number    = 501;
         sbs_indi_dss_of_macd_01.case_subnumber = 1;
         
         break;
      }
      
      if (
            (sbs_indi_dss_of_macd_01_data[i]    > sbs_indi_dss_of_macd_01_level.low_level) &&
            (sbs_indi_dss_of_macd_01_data[i+1] <= sbs_indi_dss_of_macd_01_level.low_level)
         )
      {
         sbs_indi_dss_of_macd_01.signal     = BUY_ORDER;
         sbs_indi_dss_of_macd_01.case_number    = 601;
         sbs_indi_dss_of_macd_01.case_subnumber = 1;
         
         sbs_indi_dss_of_macd_01.bar_number = i;
         break;
      }
   
   }


//-------------------------------------------------------------------------/

   return;
}

//============================ Get_SBS_FT_DSS_Order_Case ==================/

void     Get_SBS_FT_DSS_Order_Case()
{
//---------------------------- Reset Signal structure ---------------------/

   sbs_indi_dss_of_macd_01.signal         = NO_ORDER;
   sbs_indi_dss_of_macd_01.bar_number     = 0;
   sbs_indi_dss_of_macd_01.case_number    = 0;
   sbs_indi_dss_of_macd_01.case_subnumber = 0;

//---------------------------- Check SELL Signal --------------------------/

   if (
         (sbs_indi_ft_01[0].signal == SELL_ORDER) &&
         (sbs_indi_ft_01[0].bar_number == 0) &&
         (
            (sbs_indi_02_trend.state == SBS_INDI_UPPER_STATE) ||
            (sbs_indi_02_trend.state == SBS_INDI_DOWN_STATE)
         ) //&&
//         (sbs_indi_dss_of_macd_01_data[0] != EMPTY_VALUE) &&
//         (sbs_indi_dss_of_macd_03_data[0] != EMPTY_VALUE) &&
//         (sbs_indi_dss_of_macd_01_data[0] < sbs_indi_dss_of_macd_03_data[0])
      )
   {
      sbs_indi_dss_of_macd_01.signal         = SELL_ORDER;
      sbs_indi_dss_of_macd_01.bar_number     = 0;
      sbs_indi_dss_of_macd_01.case_number    = 511;
      sbs_indi_dss_of_macd_01.case_subnumber = 1;

      return;
   }

//---------------------------- Check BUY Signal ---------------------------/

   if (
         (sbs_indi_ft_01[0].signal == BUY_ORDER) &&
         (sbs_indi_ft_01[0].bar_number == 0) &&
         (
            (sbs_indi_02_trend.state == SBS_INDI_LOWER_STATE) ||
            (sbs_indi_02_trend.state == SBS_INDI_UP_STATE)
         ) //&&
//         (sbs_indi_dss_of_macd_01_data[0] != EMPTY_VALUE) &&
//         (sbs_indi_dss_of_macd_03_data[0] != EMPTY_VALUE) &&
//         (sbs_indi_dss_of_macd_01_data[0] > sbs_indi_dss_of_macd_03_data[0])
      )
   {
      sbs_indi_dss_of_macd_01.signal         = BUY_ORDER;
      sbs_indi_dss_of_macd_01.bar_number     = 0;
      sbs_indi_dss_of_macd_01.case_number    = 611;
      sbs_indi_dss_of_macd_01.case_subnumber = 1;
      
      return;
   }

//-------------------------------------------------------------------------/

   return;
}

//============================ Get_SBS_Indi_Trend =========================/

void  Get_SBS_Indi_Trend(sbs_indi_trend_struct        &indi_trend, 
                         double                       &indi_data[], 
                         const sbs_indi_level_struct  &indi_level)
{
int   j;

//--------------------------- Reset Trend State ---------------------------/

   indi_trend.state = SBS_INDI_NO_STATE;
   
//--------------------------- Check SBS_INDI_UPPER_STATE ------------------/
   
   if (indi_data[0] >= indi_level.up_level)
   {
      indi_trend.state = SBS_INDI_UPPER_STATE;
      
      for (j = 1; j < SBS_INDI_BARS_NO; j++)
      {
         if (indi_data[j] < indi_level.up_level)
         {
            indi_trend.cross_bar = j;
            return;
         }
      }
      
      indi_trend.cross_bar = SBS_INDI_BARS_NO;     // no cross
      return;
   }
   
//--------------------------- Check SBS_INDI_LOWER_STATE ------------------/
   
   if (indi_data[0] <= indi_level.low_level)
   {
      indi_trend.state = SBS_INDI_LOWER_STATE;
      
      for (j = 1; j < SBS_INDI_BARS_NO; j++)
      {
         if (indi_data[j] > indi_level.low_level)
         {
            indi_trend.cross_bar = j;
            return;
         }
      }
      
      indi_trend.cross_bar = SBS_INDI_BARS_NO;     // no cross
      return;
   }

//------------------------- Check SBS_INDI_UP_STATE / SBS_INDI_DOWN_STATE -/
   
   if ((indi_data[0] > indi_level.low_level) && (indi_data[0] < indi_level.up_level))
   {
      for (j = 1; j < SBS_INDI_BARS_NO; j++)
      {
         if (indi_data[j] >= indi_level.up_level)
         {
            indi_trend.state     = SBS_INDI_DOWN_STATE;
            indi_trend.cross_bar = j;
            return;
         }
         
         if (indi_data[j] <= indi_level.low_level)
         {
            indi_trend.state     = SBS_INDI_UP_STATE;
            indi_trend.cross_bar = j;
            return;
         }
      }
      
      indi_trend.cross_bar = SBS_INDI_BARS_NO;     // no cross, no state
      return;
   }

//-------------------------------------------------------------------------/

   return;
}

//============================ Get Order Type & Case ======================/

void  Get_SBS_Order_Case()
{
//---------------------------- Reset sbs_order data -----------------------/

   sbs_order.state           = NO_ORDER;
   sbs_order.case_number     = 0;
   sbs_order.subcase_number  = 0;

//---------------------------- Case 101 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_DOWN_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_DOWN_STATE) &&
       (sbs_indi_ttc_01_data[0] < sbs_indi_ttc_01_level.low_level))
   {
      sbs_order.state        = SELL_ORDER;
      sbs_order.case_number  = 101;
   }

//---------------------------- Case 102 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_DOWN_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_LOWER_STATE) &&
       (sbs_indi_ttc_01_data[0] < sbs_indi_ttc_01_level.low_level))
   {
      sbs_order.state        = SELL_ORDER;
      sbs_order.case_number  = 102;
   }

//---------------------------- Case 301 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_LOWER_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_DOWN_STATE) &&
       (sbs_indi_ttc_01_data[0] < sbs_indi_ttc_01_level.low_level))
   {
      sbs_order.state        = SELL_ORDER;
      sbs_order.case_number  = 301;
   }

//---------------------------- Case 302 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_LOWER_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_LOWER_STATE) &&
       (sbs_indi_ttc_01_data[0] < sbs_indi_ttc_01_level.low_level))
   {
      sbs_order.state        = SELL_ORDER;
      sbs_order.case_number  = 302;
   }

//---------------------------- Case 201 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_UP_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_UP_STATE) &&
       (sbs_indi_ttc_01_data[0] > sbs_indi_ttc_01_level.up_level))
   {
      sbs_order.state        = BUY_ORDER;
      sbs_order.case_number  = 201;
   }

//---------------------------- Case 202 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_UP_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_UPPER_STATE) &&
       (sbs_indi_ttc_01_data[0] > sbs_indi_ttc_01_level.up_level))
   {
      sbs_order.state        = BUY_ORDER;
      sbs_order.case_number  = 202;
   }

//---------------------------- Case 401 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_UPPER_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_UP_STATE) &&
       (sbs_indi_ttc_01_data[0] > sbs_indi_ttc_01_level.up_level))
   {
      sbs_order.state        = BUY_ORDER;
      sbs_order.case_number  = 401;
   }

//---------------------------- Case 402 -----------------------------------/

   if ((sbs_indi_01_trend.state == SBS_INDI_UPPER_STATE) && 
       (sbs_indi_02_trend.state == SBS_INDI_UPPER_STATE) &&
       (sbs_indi_ttc_01_data[0] > sbs_indi_ttc_01_level.up_level))
   {
      sbs_order.state        = BUY_ORDER;
      sbs_order.case_number  = 402;
   }

//---------------------------- Check Indi Trend Cross Bars (Subcases) -----/

   if (sbs_indi_02_trend.cross_bar == 1)
   {
      sbs_order.subcase_number = 1;
      return;
   }
/* 
   if ((sbs_indi_02_trend.cross_bar  > 1) &&
       (sbs_indi_01_trend.cross_bar == 1))
   {
      sbs_order.subcase_number = 2;
      return;
   }
*/    
//---------------------------- No Subcase (No Case) -----------------------/

   sbs_order.state           = NO_ORDER;
   sbs_order.case_number     = 0;
   sbs_order.subcase_number  = 0;
   
   return;
}

//============================ Get FT/SHV Order Type & Case ===============/

void     Get_SBS_FT_SHV_Order_Case()
{
//---------------------------- Reset SHV Case -----------------------------/

   shv_zone_case.order_req = NO_ORDER;
   Set_SHV_Case_Number(0,0);

//---------------------------- Check FT signal for fresh ------------------/

   if (sbs_indi_ft_signal_no == 0)        return;  // no any signal
   
   if (sbs_indi_ft_01[0].bar_number != 0) return;  // late signal discovered
   
//---------------------------- Get SBS Case SHV Zone Position -------------/
   
   Get_SBS_Case_SHV_Zone_Position(Close[0]);
   
//---------------------------- Process SBS Case SHV Zone Position ---------/
   
   Process_SBS_Case_SHV_Zone_Position();

//-------------------------------------------------------------------------/

   return;
}

//============================ Get SBS SHV Zone Data (Rect Obj) ===========/

void     Get_SBS_SHV_Zone_Data(double chk_price)
{
int      i;

shv_zone_data_struct    current_zone;

int      obj_total;
string   found_obj_name;
string   obj_name;
string   strength_name;
string   obj_pattern      = "SSSR#";
string   obj_patternR     = "SSSR#R";
string   obj_patternS     = "SSSR#S";
string   strength_pattern = " Strength=";
datetime obj_age_time;

int      delimeter_pos;

//------------------------------ Reset High & Low zones ------------------/

   shv_zones_total    = 0;
   shv_zones_rejected = 0;
   shv_zones_accepted = 0;

   sbs_indi_shv_high_zone.zone_found = false;
   sbs_indi_shv_high_zone.hi         = 9999999;
   
   sbs_indi_shv_low_zone.zone_found = false;
   sbs_indi_shv_low_zone.lo         = -9999999;

//------------------------------ Process Zone Rect. Objects --------------/

   obj_total = ObjectsTotal();
   
   for (i = 0; i < obj_total; i++)
   {
//------------------------------ Get GV Name -----------------------------/

      found_obj_name = ObjectName(i);
      
      obj_name = found_obj_name;

// SSSR#R39 Strength=Verified, Test Count=1
      
//------------------------------ Search Zone by name pattern -------------/

      if (!(
            (StringFind(obj_name,obj_patternR,0) == 0) ||
            (StringFind(obj_name,obj_patternS,0) == 0)
         ))
      {
         continue;   // not zone
      }
      
      shv_zones_total = shv_zones_total + 1;
      
//------------------------------ Get Zone type ---------------------------/

      obj_name = StringSubstr(obj_name,StringLen(obj_pattern),-1);

// R39 Strength=Verified, Test Count=1

      current_zone.type = StringSubstr(obj_name,0,1);
      
//------------------------------ Get Zone id -----------------------------/

      obj_name = StringSubstr(obj_name,1,-1);
      
// 39 Strength=Verified, Test Count=1

      delimeter_pos = StringFind(obj_name," ",0);
      
      if (delimeter_pos < 1)                           // " " not found or id not found
      {
         Print(__FUNCTION__," : (",obj_name,"), blnk dlm or id not found");
         shv_zones_rejected = shv_zones_rejected + 1;
         continue;
      }
      
      current_zone.id = StringToInteger(StringSubstr(obj_name,0,delimeter_pos));
  
//------------------------------ Get Zone Strength Code ------------------/

      obj_name = StringSubstr(obj_name,delimeter_pos,-1);
      
//  Strength=Verified, Test Count=1
      
      delimeter_pos = StringFind(obj_name,strength_pattern,0);
      
      if (delimeter_pos != 0)                           // " Strength=" not found
      {
         Print(__FUNCTION__," : (",obj_name,"), (",strength_pattern,") dlm not found");
         shv_zones_rejected = shv_zones_rejected + 1;
         continue;
      }
      
      obj_name = StringSubstr(obj_name,StringLen(strength_pattern),-1);

// Verified, Test Count=1
// Untested

      delimeter_pos = StringFind(obj_name,",",0);
      
      if (delimeter_pos == -1)                           // "," not found (Untested)
      {
         strength_name = obj_name;
      }
      else
      {
         strength_name = StringSubstr(obj_name,0,delimeter_pos);
      }
      
      current_zone.strength = -1;

      if (strength_name == "Proven")
      {
         current_zone.strength = SBS_INDI_SHV_ZONE_PROVEN;
      }
      
      if (strength_name == "Verified")
      {
         current_zone.strength = SBS_INDI_SHV_ZONE_VERIFIED;
      }
/*      
      if (strength_name == "Untested")
      {
         current_zone.strength = SBS_INDI_SHV_ZONE_UNTESTED;
      }
*/    
      if (current_zone.strength == -1)                    // found zone is not Proven, Verified, Untested
      {
         continue;
      }

//------------------------------ Get Zone hi value -----------------------/

      current_zone.hi = ObjectGet(found_obj_name,OBJPROP_PRICE1);

//------------------------------ Get Zone lo value -----------------------/

      current_zone.lo = ObjectGet(found_obj_name,OBJPROP_PRICE2);
      
//------------------------------ Check Zone Thikness ---------------------/
/*
      if ((current_zone.hi - current_zone.lo) < (3 * n_Point))
      {
         continue;
      }
*/
//------------------------------ Get Zone GV age -------------------------/

      obj_age_time = ObjectGet(found_obj_name,OBJPROP_TIME1);
      
      current_zone.age = iBarShift(NULL,0,obj_age_time,false);
      
      if ((current_zone.age) < 250)
      {
         continue;
      }
      
//------------------------------ Zone is accepted ------------------------/

      shv_zones_accepted = shv_zones_accepted + 1;

//------------------------------ Get Zone GV hits ------------------------/

      current_zone.strength = 0;                   // not calculated

//------------------------------ Check High Zone -------------------------/

      if ((current_zone.hi >= chk_price) &&
          (current_zone.hi < sbs_indi_shv_high_zone.hi))
      {
         sbs_indi_shv_high_zone.zone_found = true;
         sbs_indi_shv_high_zone.type       = current_zone.type;
         sbs_indi_shv_high_zone.id         = current_zone.id;
         sbs_indi_shv_high_zone.hi         = current_zone.hi;
         sbs_indi_shv_high_zone.lo         = current_zone.lo;
         sbs_indi_shv_high_zone.strength   = current_zone.strength;
         sbs_indi_shv_high_zone.hits       = current_zone.hits;
         sbs_indi_shv_high_zone.age        = current_zone.age;
      }

//------------------------------ Check Low Zone --------------------------/

      if ((current_zone.lo <= chk_price) &&
          (current_zone.lo > sbs_indi_shv_low_zone.lo))
      {
         sbs_indi_shv_low_zone.zone_found = true;
         sbs_indi_shv_low_zone.type       = current_zone.type;
         sbs_indi_shv_low_zone.id         = current_zone.id;
         sbs_indi_shv_low_zone.hi         = current_zone.hi;
         sbs_indi_shv_low_zone.lo         = current_zone.lo;
         sbs_indi_shv_low_zone.strength   = current_zone.strength;
         sbs_indi_shv_low_zone.hits       = current_zone.hits;
         sbs_indi_shv_low_zone.age        = current_zone.age;
      }

//------------------------------ eof "For ..." cycle ----------------------/
      
   }

//-------------------------------------------------------------------------/

   return;
}

//================== eof sbs_exp_indi_data_proc_lbr.mqh ===================/