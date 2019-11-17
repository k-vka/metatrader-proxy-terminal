//================== sbs_alx_cases_service_lbr.mqh =====================/


//======= Get tdi_rsiPriceLine_CROSS_tdi_bandMiddle Bar Number =========/

int   tdi_rsiPriceLine_CROSS_tdi_bandMiddle()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= sbs_alx_tdi_bandMiddle_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= sbs_alx_tdi_bandMiddle_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_tdi_rsiSignalLine Bar Number ======/

int   tdi_rsiPriceLine_CROSS_tdi_rsiSignalLine()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= sbs_alx_tdi_rsiSignalLine_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= sbs_alx_tdi_rsiSignalLine_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine Bar Number ===========/

int   tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine()
{
int      i;
int      cross_bar_01;

   cross_bar_01 = SBS_INDI_BARS_NO;

   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= sbs_alx_tdi_rsiSignalLine_data[i])
         ) 
      {
         cross_bar_01 = i;
         break;
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= sbs_alx_tdi_rsiSignalLine_data[i])
         ) 
      {
         cross_bar_01 = i;
         break;
      }
   }
   
   if (cross_bar_01 == SBS_INDI_BARS_NO)
   {
      return(SBS_INDI_BARS_NO - 1);
   }
   
   for (i = (cross_bar_01 + 1); i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= sbs_alx_tdi_rsiSignalLine_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= sbs_alx_tdi_rsiSignalLine_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_tdi_bandUp Bar Number ===========/

int   tdi_rsiPriceLine_CROSS_tdi_bandUp()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_bandUp_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= sbs_alx_tdi_bandUp_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_bandUp_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= sbs_alx_tdi_bandUp_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_tdi_bandDown Bar Number =====/

int   tdi_rsiPriceLine_CROSS_tdi_bandDown()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= sbs_alx_tdi_bandDown_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= sbs_alx_tdi_bandDown_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= sbs_alx_tdi_bandDown_data[i+1]) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= sbs_alx_tdi_bandDown_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_tdi_LevelUp Bar Number =====/

int   tdi_rsiPriceLine_CROSS_tdi_LevelUp()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= alx_tdi_LevelUp) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= alx_tdi_LevelUp)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= alx_tdi_LevelUp) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= alx_tdi_LevelUp)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_upper_tdi_LevelUp_Middle Bar Number =====/

int   tdi_rsiPriceLine_CROSS_upper_tdi_LevelUp_Middle(double position)
{
int      i;
double   level;

   level = alx_tdi_LevelUp - ((alx_tdi_LevelUp - alx_tdi_LevelMiddle) * position);

   if (sbs_alx_tdi_rsiPriceLine_data[0] > level)
   {
      return(0);
   }

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= level) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= level)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= level) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= level)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_lower_tdi_LevelDown_Middle Bar Number =====/

int   tdi_rsiPriceLine_CROSS_lower_tdi_LevelDown_Middle(double position)
{
int      i;
double   level;

   level = alx_tdi_LevelDown + ((alx_tdi_LevelMiddle - alx_tdi_LevelDown) * position);

   if (sbs_alx_tdi_rsiPriceLine_data[0] < level)
   {
      return(0);
   }

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= level) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= level)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= level) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= level)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiPriceLine_CROSS_tdi_LevelDown Bar Number =====/

int   tdi_rsiPriceLine_CROSS_tdi_LevelDown()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] >= alx_tdi_LevelDown) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] <= alx_tdi_LevelDown)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiPriceLine_data[i+1] <= alx_tdi_LevelDown) &&
          (sbs_alx_tdi_rsiPriceLine_data[i] >= alx_tdi_LevelDown)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_bandMiddle_CROSS_tdi_LevelMiddle Bar Number =====/

int   tdi_bandMiddle_CROSS_tdi_LevelMiddle()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_bandMiddle_data[i+1] >= alx_tdi_LevelMiddle) &&
          (sbs_alx_tdi_bandMiddle_data[i] <= alx_tdi_LevelMiddle)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_bandMiddle_data[i+1] <= alx_tdi_LevelMiddle) &&
          (sbs_alx_tdi_bandMiddle_data[i] >= alx_tdi_LevelMiddle)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_rsiSignalLine_CROSS_tdi_bandMiddle Bar Number =========/

int   tdi_rsiSignalLine_CROSS_tdi_bandMiddle()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_rsiSignalLine_data[i+1] >= sbs_alx_tdi_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_rsiSignalLine_data[i] <= sbs_alx_tdi_bandMiddle_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_rsiSignalLine_data[i+1] <= sbs_alx_tdi_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_rsiSignalLine_data[i] >= sbs_alx_tdi_bandMiddle_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get vlt_val_CROSS_vlt_threshold Bar Number ===========/

int   vlt_val_CROSS_vlt_threshold()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_vlt_data[i+1] > alx_vlt_signal.threshold) &&
          (sbs_alx_vlt_data[i] <= alx_vlt_signal.threshold)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_vlt_data[i+1] <= alx_vlt_signal.threshold) &&
          (sbs_alx_vlt_data[i] > alx_vlt_signal.threshold)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get vlt_min_value ==========================================/

double   vlt_min_value(int bars_no)
{
int      bars_to_check;
int      i;
double   vlt_min;

   bars_to_check = bars_no;
   
   if (bars_to_check > SBS_INDI_BARS_NO)
   {
      bars_to_check = SBS_INDI_BARS_NO;
   }
   
   vlt_min = sbs_alx_vlt_data[0];

   for (i = 0; i < (bars_to_check - 1); i++)
   {
      if (
            (sbs_alx_vlt_data[i+1] < sbs_alx_vlt_data[i])
         ) 
      {
         vlt_min = sbs_alx_vlt_data[i+1];
      }   
   }

   return(vlt_min);
}

//======= Get vlt_pre_flat_bars Bars Number ===========/

int   vlt_pre_flat_bars(double threshold_modified)
{
int      i;
int      flat_start_bar;
int      flat_bars;

   flat_start_bar     = SBS_INDI_BARS_NO;
   flat_bars          = 0;

   for(i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_alx_vlt_data[i] <= threshold_modified)
      {
         flat_start_bar = i;
         break;
      }
   }
   
   if (flat_start_bar == SBS_INDI_BARS_NO)
   {
      return(SBS_INDI_BARS_NO - 1);
   }

   for(i = flat_start_bar; i < SBS_INDI_BARS_NO; i++)
   {
      if (sbs_alx_vlt_data[i] > threshold_modified)
      {
         return(flat_bars);
      }
      
      flat_bars = flat_bars + 1;
   }

   return(flat_bars);
}

//======= Get rf_Linear_Value_CROSS_rf_Upper_Limit Bar Number =========/

int   rf_Linear_Value_CROSS_rf_Upper_Limit()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_rf_Linear_Value_data[i+1] >= sbs_alx_rf_Upper_Limit_data[i+1]) &&
          (sbs_alx_rf_Linear_Value_data[i] <= sbs_alx_rf_Upper_Limit_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_rf_Linear_Value_data[i+1] <= sbs_alx_rf_Upper_Limit_data[i+1]) &&
          (sbs_alx_rf_Linear_Value_data[i] >= sbs_alx_rf_Upper_Limit_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get rf_Linear_Value_CROSS_rf_Lower_Limit Bar Number =========/

int   rf_Linear_Value_CROSS_rf_Lower_Limit()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_rf_Linear_Value_data[i+1] >= sbs_alx_rf_Lower_Limit_data[i+1]) &&
          (sbs_alx_rf_Linear_Value_data[i] <= sbs_alx_rf_Lower_Limit_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_rf_Linear_Value_data[i+1] <= sbs_alx_rf_Lower_Limit_data[i+1]) &&
          (sbs_alx_rf_Linear_Value_data[i] >= sbs_alx_rf_Lower_Limit_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get rf_min_value ===========================================/

double   rf_min_value(int bars_no)
{
int      bars_to_check;
int      i;
double   rf_min;

   bars_to_check = bars_no;
   
   if (bars_to_check > SBS_INDI_BARS_NO)
   {
      bars_to_check = SBS_INDI_BARS_NO;
   }
   
   rf_min = sbs_alx_rf_Linear_Value_data[0];

   for (i = 0; i < (bars_to_check - 1); i++)
   {
      if (
            (sbs_alx_rf_Linear_Value_data[i+1] < sbs_alx_rf_Linear_Value_data[i])
         ) 
      {
         rf_min = sbs_alx_rf_Linear_Value_data[i+1];
      }   
   }

   return(rf_min);
}

//======= Get rf_max_value ===========================================/

double   rf_max_value(int bars_no)
{
int      bars_to_check;
int      i;
double   rf_max;

   bars_to_check = bars_no;
   
   if (bars_to_check > SBS_INDI_BARS_NO)
   {
      bars_to_check = SBS_INDI_BARS_NO;
   }
   
   rf_max = sbs_alx_rf_Linear_Value_data[0];

   for (i = 0; i < (bars_to_check - 1); i++)
   {
      if (
            (sbs_alx_rf_Linear_Value_data[i+1] > sbs_alx_rf_Linear_Value_data[i])
         ) 
      {
         rf_max = sbs_alx_rf_Linear_Value_data[i+1];
      }   
   }

   return(rf_max);
}

//======= dsr_channel_bounce_dn_Resistance =============================/

bool   dsr_channel_bounce_dn_Resistance()
{
bool     channel_bounce;
int      i;

   channel_bounce = false;
   
   if (Close[0] > alx_dsr_signal.Resistance) {return(channel_bounce);}
   if (Close[0] < alx_dsr_signal.SR_Mean)    {return(channel_bounce);}
   
   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (High[i] >= alx_dsr_signal.Resistance)
      {
         channel_bounce = true;
         break;
      }
      
      if (Low[i] <= alx_dsr_signal.SR_Mean)
      {
         break;
      }
   }

   return(channel_bounce);
}

//======= dsr_channel_bounce_dn_SR_Mean ================================/

bool   dsr_channel_bounce_dn_SR_Mean()
{
bool     channel_bounce;
int      i;

   channel_bounce = false;
   
   if (Close[0] > alx_dsr_signal.SR_Mean)    {return(channel_bounce);}
   if (Close[0] < alx_dsr_signal.Support)    {return(channel_bounce);}
   
   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (High[i] >= alx_dsr_signal.SR_Mean)
      {
         channel_bounce = true;
         break;
      }
      
      if (Low[i] <= alx_dsr_signal.Support)
      {
         break;
      }
   }

   return(channel_bounce);
}

//======= dsr_channel_bounce_up_SR_Mean ================================/

bool   dsr_channel_bounce_up_SR_Mean()
{
bool     channel_bounce;
int      i;

   channel_bounce = false;
   
   if (Close[0] > alx_dsr_signal.Resistance) {return(channel_bounce);}
   if (Close[0] < alx_dsr_signal.SR_Mean)    {return(channel_bounce);}
   
   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (Low[i] <= alx_dsr_signal.SR_Mean)
      {
         channel_bounce = true;
         break;
      }
      
      if (High[i] >= alx_dsr_signal.Resistance)
      {
         break;
      }
   }

   return(channel_bounce);
}

//======= dsr_channel_bounce_up_SR_Support =============================/

bool   dsr_channel_bounce_up_Support()
{
bool     channel_bounce;
int      i;

   channel_bounce = false;
   
   if (Close[0] > alx_dsr_signal.SR_Mean)    {return(channel_bounce);}
   if (Close[0] < alx_dsr_signal.Support)    {return(channel_bounce);}
   
   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (Low[i] <= alx_dsr_signal.Support)
      {
         channel_bounce = true;
         break;
      }
      
      if (High[i] >= alx_dsr_signal.SR_Mean)
      {
         break;
      }
   }

   return(channel_bounce);
}

//======= Get tdi_04_rsiPriceLine_CROSS_tdi_bandMiddle Bar Number =========/

int   tdi_04_rsiPriceLine_CROSS_tdi_bandMiddle()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] >= sbs_alx_tdi_04_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] <= sbs_alx_tdi_04_bandMiddle_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] <= sbs_alx_tdi_04_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] >= sbs_alx_tdi_04_bandMiddle_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_04_rsiPriceLine_CROSS_tdi_bandUp Bar Number =========/

int   tdi_04_rsiPriceLine_CROSS_tdi_bandUp()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] >= sbs_alx_tdi_04_bandUp_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] <= sbs_alx_tdi_04_bandUp_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] <= sbs_alx_tdi_04_bandUp_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] >= sbs_alx_tdi_04_bandUp_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_04_rsiPriceLine_CROSS_tdi_bandDown Bar Number =========/

int   tdi_04_rsiPriceLine_CROSS_tdi_bandDown()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] >= sbs_alx_tdi_04_bandDown_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] <= sbs_alx_tdi_04_bandDown_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] <= sbs_alx_tdi_04_bandDown_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] >= sbs_alx_tdi_04_bandDown_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_04_rsiPriceLine_CROSS_tdi_rsiSignalLine Bar Number =========/

int   tdi_04_rsiPriceLine_CROSS_tdi_rsiSignalLine()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] >= sbs_alx_tdi_04_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] <= sbs_alx_tdi_04_rsiSignalLine_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_04_rsiPriceLine_data[i+1] <= sbs_alx_tdi_04_rsiSignalLine_data[i+1]) &&
          (sbs_alx_tdi_04_rsiPriceLine_data[i] >= sbs_alx_tdi_04_rsiSignalLine_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_04_rsiSignalLine_CROSS_tdi_bandMiddle Bar Number =========/

int   tdi_04_rsiSignalLine_CROSS_tdi_bandMiddle()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_04_rsiSignalLine_data[i+1] >= sbs_alx_tdi_04_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_04_rsiSignalLine_data[i] <= sbs_alx_tdi_04_bandMiddle_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_04_rsiSignalLine_data[i+1] <= sbs_alx_tdi_04_bandMiddle_data[i+1]) &&
          (sbs_alx_tdi_04_rsiSignalLine_data[i] >= sbs_alx_tdi_04_bandMiddle_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp Bar Number ===========/

int   tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] >= sbs_alx_tdi_MDL_bandUp_data[i+1]) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] <= sbs_alx_tdi_MDL_bandUp_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] <= sbs_alx_tdi_MDL_bandUp_data[i+1]) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] >= sbs_alx_tdi_MDL_bandUp_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown Bar Number =====/

int   tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] >= sbs_alx_tdi_MDL_bandDown_data[i+1]) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] <= sbs_alx_tdi_MDL_bandDown_data[i])
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] <= sbs_alx_tdi_MDL_bandDown_data[i+1]) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] >= sbs_alx_tdi_MDL_bandDown_data[i])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_MDL_rsiPriceLine_CROSS_tdi_LevelUp Bar Number =====/

int   tdi_MDL_rsiPriceLine_CROSS_tdi_LevelUp()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] >= alx_tdi_LevelUp) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] <= alx_tdi_LevelUp)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] <= alx_tdi_LevelUp) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] >= alx_tdi_LevelUp)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get tdi_MDL_rsiPriceLine_CROSS_tdi_LevelDown Bar Number =====/

int   tdi_MDL_rsiPriceLine_CROSS_tdi_LevelDown()
{
int      i;

   for(i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] >= alx_tdi_LevelDown) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] <= alx_tdi_LevelDown)
         ) 
      {
         return(i);
      }   
      
      if ((sbs_alx_tdi_MDL_rsiPriceLine_data[i+1] <= alx_tdi_LevelDown) &&
          (sbs_alx_tdi_MDL_rsiPriceLine_data[i] >= alx_tdi_LevelDown)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get stoch_mtf_H1_Kline_CROSS_stoch_mtf_Level Bar Number =====/

int   stoch_mtf_H1_Kline_CROSS_stoch_mtf_Level(double level)
{
int      i;

   for(i = 1; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (
            (sbs_alx_stoch_mtf_H1_Kline_data[i] != EMPTY_VALUE) &&
            (sbs_alx_stoch_mtf_H1_Kline_data[i+1] != EMPTY_VALUE) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[i+1] >= level) &&
            (sbs_alx_stoch_mtf_H1_Kline_data[i] <= level)
         ) 
      {
         return(i);
      }   
      
      if (
            (sbs_alx_stoch_mtf_H1_Kline_data[i] != EMPTY_VALUE) &&
            (sbs_alx_stoch_mtf_H1_Kline_data[i+1] != EMPTY_VALUE) &&
            
            (sbs_alx_stoch_mtf_H1_Kline_data[i+1] <= level) &&
            (sbs_alx_stoch_mtf_H1_Kline_data[i] >= level)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//======= Get stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level Bar Number =====/

int   stoch_mtf_H4_Kline_CROSS_stoch_mtf_Level(double level)
{
int      i;

   for(i = 1; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (
            (sbs_alx_stoch_mtf_H4_Kline_data[i] != EMPTY_VALUE) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[i+1] != EMPTY_VALUE) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[i+1] >= level) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[i] <= level)
         ) 
      {
         return(i);
      }   
      
      if (
            (sbs_alx_stoch_mtf_H4_Kline_data[i] != EMPTY_VALUE) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[i+1] != EMPTY_VALUE) &&
            
            (sbs_alx_stoch_mtf_H4_Kline_data[i+1] <= level) &&
            (sbs_alx_stoch_mtf_H4_Kline_data[i] >= level)
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//================== Check if XST_greater_or_cross_TMA =================/

bool  XST_greater_or_cross_TMA(double &xst_Dn_data[],double &tma_data[])
{
int   i;

//------------------ Check XST vs TMA ----------------------------------/
   
   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (xst_Dn_data[i] == EMPTY_VALUE)
      {
         break;
      }
      
      if (xst_Dn_data[i] >= tma_data[i])
      {
         return(true);
      }
   }

//----------------------------------------------------------------------/

   return(false);
}

//================== Check if XST_less_or_cross_TMA ====================/

bool  XST_less_or_cross_TMA(double &xst_Up_data[],double &tma_data[])
{
int   i;

//------------------ Check XST vs TMA ----------------------------------/
   
   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (xst_Up_data[i] == EMPTY_VALUE)
      {
         break;
      }
      
      if (xst_Up_data[i] <= tma_data[i])
      {
         return(true);
      }
   }

//----------------------------------------------------------------------/

   return(false);
}

//================== Get XST_Down_Number_for_Bar =======================/

int   XST_Down_Number_for_Bar(int   bar_no)
{
int   i;
int   xst_signal_number;

//------------------ Reset xst_signal_number ---------------------------/

   xst_signal_number = 1;

//------------------ Check if TMA & XST get down -----------------------/

   if (
         (alx_tma_signal.upper1_trend != SBS_ALX_TREND_DOWN) ||
         (alx_xst_signal.trend_H1_40  != SBS_ALX_TREND_DOWN)
      )
   {
      return(0);
   }

//------------------ Check XST down signal number ----------------------/

   for (i = 1; i <= bar_no; i++)
   {
      if (
            (sbs_alx_xst_mtf_40_Dn_data[i]   != EMPTY_VALUE) &&
            (sbs_alx_xst_mtf_40_Dn_data[i-1] == EMPTY_VALUE)
         )
      {
         xst_signal_number = xst_signal_number + 1;
      }
   }

//----------------------------------------------------------------------/

   return(xst_signal_number);
}

//================== Get XST_Up_Number_for_Bar =======================/

int   XST_Up_Number_for_Bar(int   bar_no)
{
int   i;
int   xst_signal_number;

//------------------ Reset xst_signal_number ---------------------------/

   xst_signal_number = 1;

//------------------ Check if TMA & XST get up -------------------------/

   if (
         (alx_tma_signal.upper1_trend != SBS_ALX_TREND_UP) ||
         (alx_xst_signal.trend_H1_40  != SBS_ALX_TREND_UP)
      )
   {
      return(0);
   }

//------------------ Check XST up signal number ------------------------/

   for (i = 1; i <= bar_no; i++)
   {
      if (
            (sbs_alx_xst_mtf_40_Up_data[i]   != EMPTY_VALUE) &&
            (sbs_alx_xst_mtf_40_Up_data[i-1] == EMPTY_VALUE)
         )
      {
         xst_signal_number = xst_signal_number + 1;
      }
   }

//----------------------------------------------------------------------/

   return(xst_signal_number);
}

//================= SBS_Get_Indi_Array_Cross_Level_Bar =================/

int   SBS_Get_Indi_Array_Cross_Level_Bar(double &indi_array[], double check_level)
{
int      i;

   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (
            (indi_array[i]   >= check_level) &&
            (indi_array[i+1] <= check_level)
         ) 
      {
         return(i+1);
      }   
      
      if (
            (indi_array[i]   <= check_level) &&
            (indi_array[i+1] >= check_level)
         ) 
      {
         return(i+1);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//================= Get_Multi_TMA_Trend ================================/

void   Get_Multi_TMA_Trend(int &trend, int &trend_age, double &m_tma_data[], int trend_age_bars)
{
int      i;

//----------------- Check for DOWN Trend -------------------------------/

   if (
         (trend == SBS_ALX_TREND_NONE) &&
         (m_tma_data[0] <= m_tma_data[1])
      )
   {
      for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (m_tma_data[i] > m_tma_data[i+1])
         {
            if (
                  (i >= (trend_age_bars - 1)) &&
                  (m_tma_data[0] < m_tma_data[i])
               )
            {
               trend = SBS_ALX_TREND_DOWN;
               trend_age = i;
               
               return;
            }
         }
      }
   }

//----------------- Check for UP Trend ---------------------------------/

   if (
         (trend == SBS_ALX_TREND_NONE) &&
         (m_tma_data[0] >= m_tma_data[1])
      )
   {
      for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
      {
         if (m_tma_data[i] < m_tma_data[i+1])
         {
            if (
                  (i >= (trend_age_bars - 1)) &&
                  (m_tma_data[0] > m_tma_data[i])
               )
            {
               trend = SBS_ALX_TREND_UP;
               trend_age = i;
               
               return;
            }
         }
      }
   }

//----------------------------------------------------------------------/

   return;
}

//================= SBS_High_Cross_Multi_TMA ===========================/

bool   SBS_High_Cross_Multi_TMA(double &m_tma_data[], datetime t_stamp)
{
int      i;
int      last_bar;

   last_bar = iBarShift(NULL,0,t_stamp,false);

   for (i = 0; i <= last_bar; i++)
   {
      if (
            (High[i] > m_tma_data[i])
         ) 
      {
         return(True);
      }   

   }

   return(False);
}

//================= SBS_Low_Cross_Multi_TMA ============================/

bool   SBS_Low_Cross_Multi_TMA(double &m_tma_data[], datetime t_stamp)
{
int      i;
int      last_bar;

   last_bar = iBarShift(NULL,0,t_stamp,false);

   for (i = 0; i <= last_bar; i++)
   {
      if (
            (Low[i] < m_tma_data[i])
         ) 
      {
         return(True);
      }   

   }

   return(False);
}

//================= SBS_ALX_Indi_Cross_Bar =============================/

int   SBS_ALX_Indi_Cross_Bar(double &indi_array_01[], double &indi_array_02[])
{
int      i;

   for (i = 0; i < (SBS_INDI_BARS_NO - 1); i++)
   {
      if (
            (indi_array_01[i]   >= indi_array_02[i]) &&
            (indi_array_01[i+1] <= indi_array_02[i+1])
         ) 
      {
         return(i);
      }   
      
      if (
            (indi_array_01[i]   <= indi_array_02[i]) &&
            (indi_array_01[i+1] >= indi_array_02[i+1])
         ) 
      {
         return(i);
      }
   }

   return(SBS_INDI_BARS_NO - 1);
}

//================= SBS_ALX_Indi_Heigth_Move_Direction =================/

int   SBS_ALX_Indi_Heigth_Move_Direction(double &indi_array_01[], double &indi_array_02[], int arrays_cross_bar)
{
int      i;
int      max_heigth_bar;
int      finish_bar;
int      heigth_direction;

double   max_heigth_val;
double   current_heigth_val;

//----------------- Set finish_bar -------------------------------------/

   if (arrays_cross_bar < SBS_INDI_BARS_NO)
   {
      finish_bar = arrays_cross_bar;
   }
   else
   {
      finish_bar = SBS_INDI_BARS_NO - 1;
   }

//----------------- Get max_heigth_bar ---------------------------------/

   max_heigth_bar = SBS_INDI_BARS_NO;
   max_heigth_val = 0;

   for (i = 0; i <= finish_bar; i++)
   {
      current_heigth_val = MathAbs(indi_array_01[i] - indi_array_02[i]);

      if (current_heigth_val > max_heigth_val)
      {
         max_heigth_val = current_heigth_val;
         max_heigth_bar = i;
      }
   }

//----------------- Get heigth_direction -------------------------------/

   heigth_direction = SBS_ALX_HEIGTH_GETS_NONE;

   if (max_heigth_bar < SBS_INDI_BARS_NO)
   {
      if ((MathAbs(indi_array_01[0] - indi_array_02[0]) / max_heigth_val) < 0.95)
      {
         heigth_direction = SBS_ALX_HEIGTH_GETS_LOWER;
      }
      else
      {
         heigth_direction = SBS_ALX_HEIGTH_GETS_HIGHER;
      }
   }

//----------------------------------------------------------------------/

   return(heigth_direction);
}

//================== eof sbs_alx_cases_service_lbr.mqh =================/
