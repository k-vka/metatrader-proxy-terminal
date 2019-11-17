//================== sbs_cases_service_lbr.mqh =========================/

//================== Set SHV Zone Case Number & Subnumber ==============/

void     Set_SHV_Case_Number(int num,int subnum)
{
   shv_zone_case.number    = num;
   shv_zone_case.subnumber = subnum;
   
   return;
}

//================== Set SHV Level Case Number & Subnumber =============/

void     Set_SHV_Level_Case_Number(int num,int subnum)
{
   shv_level_case.number    = num;
   shv_level_case.subnumber = subnum;
   
   return;
}

//================== Get Local (INDI 01 & High Zone) High Max Value ====/
   
void     Get_Zone_Local_High_Maximum()
{
int      i;

int      last_max_bar;
int      last_min_bar;

int      first_min_bar;

//------------------ Find Indi 01 first low level cross up -------------/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_indi_01_data[i] < sbs_indi_01_level.low_level)
      {
         break;
      }
   }
   
   last_max_bar = i;
   
//------------------ Then Find Indi 01 first up level cross down -------/

   for (i = last_max_bar; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_indi_01_data[i] > sbs_indi_01_level.up_level)
      {
         break;
      }
   }
   
   last_min_bar = i;

//------------------ Correct Chart Local Extremum Bars (Zone age) --------/

   if (last_max_bar > sbs_indi_shv_high_zone.age)
   {
      last_max_bar = sbs_indi_shv_high_zone.age;
   }
   
   if (last_min_bar > sbs_indi_shv_low_zone.age)
   {
      last_min_bar = sbs_indi_shv_low_zone.age;
   }
   
   if (last_max_bar < last_min_bar)
   {
      last_max_bar = last_min_bar;
   }

//------------------ Find Chart Local Maximum --------------------------/

   first_min_bar = last_max_bar;

   last_max_bar = iHighest(NULL,0,MODE_HIGH,last_max_bar,0);
   
   shv_zone_case.local_high_max_val = High[last_max_bar];
   
//------------------ Find Chart Local Minimum after LMax ---------------/

   last_min_bar = iLowest(NULL,0,MODE_LOW,last_min_bar,first_min_bar);
   
   shv_zone_case.local_min_after_max = Low[last_min_bar];

//----------------------------------------------------------------------/

   return;
}

//================== Get Local (INDI 01 & High Zone) Low Min Value =====/
   
void     Get_Zone_Local_Low_Minimum()
{
int      i;

int      last_max_bar;
int      last_min_bar;

int      first_max_bar;

//------------------ Find Indi 01 first up level cross down ------------/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_indi_01_data[i] > sbs_indi_01_level.up_level)
      {
         break;
      }
   }
   
   last_min_bar = i;
   
//------------------ Then Find Indi 01 first low level cross up --------/

   for (i = 2; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_indi_01_data[i] < sbs_indi_01_level.low_level)
      {
         break;
      }
   }
   
   last_max_bar = i;
   
//------------------ Correct Chart Local Extremum Bars (Zone age) ------/

   if (last_min_bar > sbs_indi_shv_low_zone.age)
   {
      last_min_bar = sbs_indi_shv_low_zone.age;
   }
   
   if (last_max_bar > sbs_indi_shv_high_zone.age)
   {
      last_max_bar = sbs_indi_shv_high_zone.age;
   }
   
   if (last_min_bar < last_max_bar)
   {
      last_min_bar = last_max_bar;
   }

//------------------ Find Chart Local Minimum  ---------------/

   first_max_bar = last_min_bar;

   last_min_bar = iLowest(NULL,0,MODE_LOW,last_min_bar,0);
   
   shv_zone_case.local_low_min_val  = Low[last_min_bar];

//------------------ Find Chart Local Maximum after LMin ---------------/

   last_max_bar = iHighest(NULL,0,MODE_HIGH,last_max_bar,first_max_bar);
   
   shv_zone_case.local_max_after_min = High[last_max_bar];
   
//----------------------------------------------------------------------/

   return;
}

//============================ Get SBS SHV Zone Data (GV) ==============/

void     Get_SBS_SHV_Zone_Data_Global_V(double chk_price)
{
shv_zone_data_struct    current_zone;

int      gv_total;
int      gv_i;

string   gv_name;
string   gv_name_pattern;
double   temp_gv_value;

//------------------------------ Reset High & Low zones ------------------/

   sbs_indi_shv_high_zone.zone_found = false;
   sbs_indi_shv_high_zone.hi = 9999999;
   
   sbs_indi_shv_low_zone.zone_found = false;
   sbs_indi_shv_low_zone.lo = -9999999;

//------------------------------ Process Zone GV -------------------------/

   gv_total = GlobalVariablesTotal();
   
   for (gv_i = 0; gv_i < gv_total; gv_i++)
   {
//------------------------------ Get GV Name -----------------------------/

      gv_name = GlobalVariableName(gv_i);
      
//------------------------------ Search Zone GV <Strength> Pattern -------/

      gv_name_pattern = "SSSR_STRENGTH_"+Symbol()+Period();
      
      if (StringFind(gv_name,gv_name_pattern,0) != 0)    continue;
      
//------------------------------ Get Zone GV id --------------------------/

      current_zone.id = StringToInteger(StringSubstr(gv_name,StringLen(gv_name_pattern),-1));
      
      if (!GlobalVariableGet(gv_name,temp_gv_value))
      {
         Print ("GV_Get Error: "+gv_name);
         continue;
      }
      
      current_zone.strength = temp_gv_value;
      
//------------------------------ Verify Zone GV <Strength> Code ----------/
      
      if (
            !(
               (
                  (current_zone.strength == SBS_INDI_SHV_ZONE_VERIFIED) &&    // check GV Strength Value
                  (current_zone.strength >= 1)
               ) ||
               (current_zone.strength == SBS_INDI_SHV_ZONE_PROVEN)
            )
         )
      {
         continue;
      }

//------------------------------ Get Zone GV hi --------------------------/

      gv_name = "SSSR_HI_"+Symbol()+Period()+current_zone.id;

      if (!GlobalVariableGet(gv_name,temp_gv_value))
      {
         Print ("GV_Get Error: "+gv_name);
         continue;
      }
      
      current_zone.hi = temp_gv_value;

//------------------------------ Get Zone GV lo --------------------------/

      gv_name = "SSSR_LO_"+Symbol()+Period()+current_zone.id;

      if (!GlobalVariableGet(gv_name,temp_gv_value))
      {
         Print ("GV_Get Error: "+gv_name);
         continue;
      }
      
      current_zone.lo = temp_gv_value;

//------------------------------ Get Zone GV hits ------------------------/

      gv_name = "SSSR_HITS_"+Symbol()+Period()+current_zone.id;

      if (!GlobalVariableGet(gv_name,temp_gv_value))
      {
         Print ("GV_Get Error: "+gv_name);
         continue;
      }
      
      current_zone.hits = temp_gv_value;

//------------------------------ Get Zone GV age -------------------------/

      gv_name = "SSSR_AGE_"+Symbol()+Period()+current_zone.id;

      if (!GlobalVariableGet(gv_name,temp_gv_value))
      {
         Print ("GV_Get Error: "+gv_name);
         continue;
      }
      
      current_zone.age = temp_gv_value;
      
//------------------------------ Check High Zone -------------------------/

      if ((current_zone.hi >= chk_price) &&
          (current_zone.hi < sbs_indi_shv_high_zone.hi))
      {
         sbs_indi_shv_high_zone.zone_found = true;
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

//============================ (IF) HA_ZZL_Jumped =========================/

bool     HA_ZZL_Jumped()
{
//-------------------------- (FT3 SELL/ZZL BUY) zzl signal ----------------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == SELL_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == BUY_ORDER)
      )
   {
      if (sbs_ft_zzl_profile.ft3_bounce_val > ha3_max)
      {
         return(true);
      }
      
      if (
            (sbs_ft_zzl_profile.ft3_bounce_val <= ha3_max) &&
            ((ha2_min - sbs_ft_zzl_case.lo_level) > (sbs_ft_zzl_case.ha2_effective_jump_level * (sbs_ft_zzl_profile.ft3_bounce_val - ha2_max)))
         )
      {
         return(true);
      }
   }

//-------------------------- (FT3 BUY/ZZL SELL) zzl signal ----------------/

   if (
         (sbs_ft_zzl_profile.ft3_signal == BUY_ORDER) &&
         (sbs_ft_zzl_profile.zzl_signal == SELL_ORDER)
      )
   {
      if (sbs_ft_zzl_profile.ft3_bounce_val < ha3_min)
      {
         return(true);
      }
      
      if (
            (sbs_ft_zzl_profile.ft3_bounce_val >= ha3_min) &&
            ((sbs_ft_zzl_case.hi_level - ha2_max) > (sbs_ft_zzl_case.ha2_effective_jump_level * (ha2_min - sbs_ft_zzl_profile.ft3_bounce_val)))
         )
      {
         return(true);
      }
   }

//-------------------------------------------------------------------------/

   return(false);
}

//======================= Get ha3_min cross ha2_min Bar Number ===============/

int   ha3ha2_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha3_min_val[i-1] >= ha2_min_val[i-1]) &&
          (ha3_min_val[i] <= ha2_min_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha3_min_val[i-1] <= ha2_min_val[i-1]) &&
          (ha3_min_val[i] >= ha2_min_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha3_max cross ha2_max Bar Number ===============/

int   ha3_mx_ha2_mx_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha3_max_val[i-1] >= ha2_max_val[i-1]) &&
          (ha3_max_val[i] <= ha2_max_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha3_max_val[i-1] <= ha2_max_val[i-1]) &&
          (ha3_max_val[i] >= ha2_max_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha3_min cross ha2_max Bar Number ===============/

int   ha3ha2_mx_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha3_min_val[i-1] >= ha2_max_val[i-1]) &&
          (ha3_min_val[i] <= ha2_max_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha3_min_val[i-1] <= ha2_max_val[i-1]) &&
          (ha3_min_val[i] >= ha2_max_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha3_max cross ha2_min Bar Number ===============/

int   ha3_mx_ha2_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha3_max_val[i-1] >= ha2_min_val[i-1]) &&
          (ha3_max_val[i] <= ha2_min_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha3_max_val[i-1] <= ha2_min_val[i-1]) &&
          (ha3_max_val[i] >= ha2_min_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_min cross ha2_min Bar Number ===============/

int   ha4ha2_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_min_val[i-1] >= ha2_min_val[i-1]) &&
          (ha4_min_val[i] < ha2_min_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_min_val[i-1] < ha2_min_val[i-1]) &&
          (ha4_min_val[i] >= ha2_min_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_min cross ha2_max Bar Number ===============/

int   ha4ha2_mx_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_min_val[i-1] >= ha2_max_val[i-1]) &&
          (ha4_min_val[i] < ha2_max_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_min_val[i-1] < ha2_max_val[i-1]) &&
          (ha4_min_val[i] >= ha2_max_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_max cross ha2_min Bar Number ===============/

int   ha4_mx_ha2_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_max_val[i-1] >= ha2_min_val[i-1]) &&
          (ha4_max_val[i] < ha2_min_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_max_val[i-1] < ha2_min_val[i-1]) &&
          (ha4_max_val[i] >= ha2_min_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_max cross ha2_max Bar Number ===============/

int   ha4_mx_ha2_mx_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_max_val[i-1] >= ha2_max_val[i-1]) &&
          (ha4_max_val[i] < ha2_max_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_max_val[i-1] < ha2_max_val[i-1]) &&
          (ha4_max_val[i] >= ha2_max_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_min cross ha3_min Bar Number ===============/

int   ha4ha3_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_min_val[i-1] >= ha3_min_val[i-1]) &&
          (ha4_min_val[i] < ha3_min_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_min_val[i-1] < ha3_min_val[i-1]) &&
          (ha4_min_val[i] >= ha3_min_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_min cross ha3_max Bar Number ===============/

int   ha4ha3_mx_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_min_val[i-1] >= ha3_max_val[i-1]) &&
          (ha4_min_val[i] < ha3_max_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_min_val[i-1] < ha3_max_val[i-1]) &&
          (ha4_min_val[i] >= ha3_max_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_max cross ha3_min Bar Number ===============/

int   ha4_mx_ha3_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_max_val[i-1] >= ha3_min_val[i-1]) &&
          (ha4_max_val[i] < ha3_min_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_max_val[i-1] < ha3_min_val[i-1]) &&
          (ha4_max_val[i] >= ha3_min_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_max cross ha3_max Bar Number ===============/

int   ha4_mx_ha3_mx_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_max_val[i-1] >= ha3_max_val[i-1]) &&
          (ha4_max_val[i] < ha3_max_val[i])
         ) 
      {
         return(i);
      }   
      
      if ((ha4_max_val[i-1] < ha3_max_val[i-1]) &&
          (ha4_max_val[i] >= ha3_max_val[i])
         ) 
      {
         return(i);
      }
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_min cross Low Bar Number ===============/

int   ha4_low_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_min_val[i-1] <= Low[i-1]) &&
          (ha4_min_val[i] > Low[i])
         ) 
      {
         return(i);
      }   
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get ha4_max cross High Bar Number ===============/

int   ha4_high_Cross_04()
{
int      i;

   for(i = 1; i < MAX_IREG_NO_04; i++)
   {
      if ((ha4_max_val[i-1] >= High[i-1]) &&
          (ha4_max_val[i] < High[i])
         ) 
      {
         return(i);
      }   
   }

   return(MAX_IREG_NO_04 - 1);
}

//======================= Get_Min_ZZL ================================/

temp_extremum   Get_Min_ZZL(int zzl_signal_no)
{
int            extremum_bar;
double         extremum_val;
int            zzl_signal_number;
temp_extremum  t_extremum;

   zzl_signal_number = zzl_signal_no;
   
   if (zzl_signal_number > SBS_MAX_JUST_ZZL_SIGNALS)
   {
      zzl_signal_number = SBS_MAX_JUST_ZZL_SIGNALS;
   }
   
   if (zzl_signal_number < 1)
   {
      zzl_signal_number = 1;
   }

   extremum_bar = iLowest(NULL,0,MODE_LOW,
               sbs_just_zzl_sell_signal[zzl_signal_number - 1].bar,
               0);

   extremum_val = Low[extremum_bar];
   
   t_extremum.bar = extremum_bar;
   t_extremum.val = extremum_val;

   return(t_extremum);
}

//======================= Get_Min_ZZL ================================/

temp_extremum   Get_Max_ZZL(int zzl_signal_no)
{
int            extremum_bar;
double         extremum_val;
int            zzl_signal_number;
temp_extremum  t_extremum;

   zzl_signal_number = zzl_signal_no;
   
   if (zzl_signal_number > SBS_MAX_JUST_ZZL_SIGNALS)
   {
      zzl_signal_number = SBS_MAX_JUST_ZZL_SIGNALS;
   }
   
   if (zzl_signal_number < 1)
   {
      zzl_signal_number = 1;
   }

   extremum_bar = iHighest(NULL,0,MODE_HIGH,
               sbs_just_zzl_buy_signal[zzl_signal_number - 1].bar,
               0);

   extremum_val = High[extremum_bar];
   
   t_extremum.bar = extremum_bar;
   t_extremum.val = extremum_val;

   return(t_extremum);
}

//======================= Second_Max_Val ================================/

temp_extremum     Second_Max_Val()
{
int            i;
temp_extremum  t_extremum;

   t_extremum.bar = -1;
   t_extremum.val = -1;

   if (sbs_ft_zzl_profile.zzl_sell_signals < 2)
   {
      return(t_extremum);
   }
   
   t_extremum.bar = sbs_zzl_sell_signal[1].extremum_bar;
   t_extremum.val = sbs_zzl_sell_signal[1].extremum_val;
   
   if (sbs_ft_zzl_profile.zzl_sell_signals == 2)
   {
      return(t_extremum);
   }
   
   for(i = 2; i < sbs_ft_zzl_profile.zzl_sell_signals; i++)
   {
      if (sbs_zzl_sell_signal[i].extremum_val > t_extremum.val)
      {
         t_extremum.bar = sbs_zzl_sell_signal[i].extremum_bar;
         t_extremum.val = sbs_zzl_sell_signal[i].extremum_val;
      }
   }

   return(t_extremum);
}

//======================= Second_Min_Val ================================/

temp_extremum     Second_Min_Val()
{
int            i;
temp_extremum  t_extremum;

   t_extremum.bar = -1;
   t_extremum.val = -1;

   if (sbs_ft_zzl_profile.zzl_buy_signals < 2)
   {
      return(t_extremum);
   }
   
   t_extremum.bar = sbs_zzl_buy_signal[1].extremum_bar;
   t_extremum.val = sbs_zzl_buy_signal[1].extremum_val;
   
   if (sbs_ft_zzl_profile.zzl_buy_signals == 2)
   {
      return(t_extremum);
   }
   
   for(i = 2; i < sbs_ft_zzl_profile.zzl_buy_signals; i++)
   {
      if (sbs_zzl_buy_signal[i].extremum_val < t_extremum.val)
      {
         t_extremum.bar = sbs_zzl_buy_signal[i].extremum_bar;
         t_extremum.val = sbs_zzl_buy_signal[i].extremum_val;
      }
   }

   return(t_extremum);
}

//======================= Second_Min_Val ================================/

double     Not_Zero(double d)
{
   if (d == 0)
   {
      return(n_Point);
   }
   
   return(d);
}

//======================= SBS_DMF_Get_Time_String ======================/

string   SBS_DMF_Get_Time_String(datetime dtime)
{
string         time_str;
MqlDateTime    date_time_data;

   TimeToStruct(dtime,date_time_data);
   
   time_str = IntegerToString(date_time_data.year,4,'0') + "." +
              IntegerToString(date_time_data.mon, 2,'0') + "." +
              IntegerToString(date_time_data.day, 2,'0') + " " +
              IntegerToString(date_time_data.hour,2,'0') + ":" +
              IntegerToString(date_time_data.min, 2,'0')
              ;

//----------------------------------------------------------------------/

   return(time_str);
}

//================== eof sbs_cases_service_lbr.mqh =====================/
