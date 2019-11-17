//================== sbs_alx_ILND_M1_data_proc_lbr.mqh =====================/

//=========================== Get_ALX_FXI3_SEMAFOR_M1_State_and_Rules() ====/

void     Get_ALX_FXI3_SEMAFOR_M1_State_and_Rules()
{
int      i;
int      HP_semafor_3_flag;
int      HP_global_semafor_3_flag;

//--------------------------- Reset FXI3_SEMAFOR States --------------------/

   HP_semafor_3_flag        = 0;
   HP_global_semafor_3_flag = 0;

//--- Reset Trends ---/

   sbs_alx_fxi3_semafor_signal.HP_trend        = SBS_ALX_TREND_NONE;
   sbs_alx_fxi3_semafor_signal.HP_global_trend = SBS_ALX_TREND_NONE;
   sbs_alx_fxi3_semafor_signal.NP_trend        = SBS_ALX_TREND_NONE;
   sbs_alx_fxi3_semafor_signal.FP_trend        = SBS_ALX_TREND_NONE;
   
   sbs_alx_fxi3_semafor_signal.HP_trend_type        = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_global_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.NP_trend_type        = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.FP_trend_type        = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
   
   sbs_alx_fxi3_semafor_signal.NP_trend_mixture = 0;

//--- Reset HP_semafor ---/
   
   sbs_alx_fxi3_semafor_signal.HP_semafor.type_3      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.HP_semafor.val_3       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.HP_semafor.type_2      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.HP_semafor.val_2       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.HP_semafor.type_1      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.HP_semafor.val_1       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.HP_semafor.strong_type        = 0;
   
   for (i = 0; i < 5; i++)
   {
      sbs_alx_fxi3_semafor_signal.HP_semafor.strong_level[i] = FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED;
   }

//--- Reset HP_global_semafor ---/
   
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.type_3      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.direction_3 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.bar_3       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.val_3       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.type_2      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.direction_2 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.bar_2       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.val_2       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.type_1      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.direction_1 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.bar_1       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.val_1       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.HP_global_semafor.strong_type        = 0;
   
   for (i = 0; i < 5; i++)
   {
      sbs_alx_fxi3_semafor_signal.HP_global_semafor.strong_level[i] = FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED;
   }

//--- Reset NP_semafor ---/
   
   sbs_alx_fxi3_semafor_signal.NP_semafor.type_3      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.NP_semafor.val_3       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.NP_semafor.type_2      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.NP_semafor.val_2       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.NP_semafor.type_1      = FXI3_SEMAFOR_NO_TYPE;
   sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 = FXI3_SEMAFOR_NO_DIRECTION;
   sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1       = SBS_INDI_BARS_NO;
   sbs_alx_fxi3_semafor_signal.NP_semafor.val_1       = 0.0;
   
   sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type  = 0;
   
   for (i = 0; i < 5; i++)
   {
      sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[i] = FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED;
   }

//--------------------------- Set FXI3_SEMAFOR NP (SUNS + BIG DOTS) State --/

//--- Get NP_semafor 3 ---/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
/*
      if (sbs_alx_fxi3_semafor_HP_Dn_data[i] != 0)
      {
         sbs_alx_fxi3_semafor_signal.NP_semafor.type_3      = FXI3_SEMAFOR_HP_TYPE;
         sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 = FXI3_SEMAFOR_DN_DIRECTION;
         sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3       = i;
         sbs_alx_fxi3_semafor_signal.NP_semafor.val_3       = sbs_alx_fxi3_semafor_HP_Dn_data[i];
         break;
      }
      
      if (sbs_alx_fxi3_semafor_HP_Up_data[i] != 0)
      {
         sbs_alx_fxi3_semafor_signal.NP_semafor.type_3      = FXI3_SEMAFOR_HP_TYPE;
         sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 = FXI3_SEMAFOR_UP_DIRECTION;
         sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3       = i;
         sbs_alx_fxi3_semafor_signal.NP_semafor.val_3       = sbs_alx_fxi3_semafor_HP_Up_data[i];
         break;
      }
*/
      if (
            (sbs_alx_fxi3_semafor_NP_Dn_data[i] != 0) &&
            (sbs_alx_islands_signal.trend == SBS_ALX_TREND_DOWN)
         )
      {
         sbs_alx_fxi3_semafor_signal.NP_semafor.type_3      = FXI3_SEMAFOR_NP_TYPE;
         sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 = FXI3_SEMAFOR_DN_DIRECTION;
         sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3       = i;
         sbs_alx_fxi3_semafor_signal.NP_semafor.val_3       = sbs_alx_fxi3_semafor_NP_Dn_data[i];
         break;
      }
      
      if (
            (sbs_alx_fxi3_semafor_NP_Up_data[i] != 0) &&
            (sbs_alx_islands_signal.trend == SBS_ALX_TREND_UP)
         )
      {
         sbs_alx_fxi3_semafor_signal.NP_semafor.type_3      = FXI3_SEMAFOR_NP_TYPE;
         sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 = FXI3_SEMAFOR_UP_DIRECTION;
         sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3       = i;
         sbs_alx_fxi3_semafor_signal.NP_semafor.val_3       = sbs_alx_fxi3_semafor_NP_Up_data[i];
         break;
      }
   }

//--- Get NP_semafor 2 ---/

   if (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3 < (SBS_INDI_BARS_NO - 1))
   {
      for (i = (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3 + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_fxi3_semafor_HP_Dn_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_2      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 = FXI3_SEMAFOR_DN_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_2       = sbs_alx_fxi3_semafor_HP_Dn_data[i];
            break;
         }
      
         if (sbs_alx_fxi3_semafor_HP_Up_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_2      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 = FXI3_SEMAFOR_UP_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_2       = sbs_alx_fxi3_semafor_HP_Up_data[i];
            break;
         }
         
         if (sbs_alx_fxi3_semafor_NP_Dn_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_2      = FXI3_SEMAFOR_NP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 = FXI3_SEMAFOR_DN_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_2       = sbs_alx_fxi3_semafor_NP_Dn_data[i];
            break;
         }
      
         if (sbs_alx_fxi3_semafor_NP_Up_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_2      = FXI3_SEMAFOR_NP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 = FXI3_SEMAFOR_UP_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_2       = sbs_alx_fxi3_semafor_NP_Up_data[i];
            break;
         }
      }
   }

//--- Get NP_semafor 1 ---/

   if (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2 < (SBS_INDI_BARS_NO - 1))
   {
      for (i = (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2 + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_fxi3_semafor_HP_Dn_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_1      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 = FXI3_SEMAFOR_DN_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_1       = sbs_alx_fxi3_semafor_HP_Dn_data[i];
            break;
         }
      
         if (sbs_alx_fxi3_semafor_HP_Up_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_1      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 = FXI3_SEMAFOR_UP_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_1       = sbs_alx_fxi3_semafor_HP_Up_data[i];
            break;
         }
         
         if (sbs_alx_fxi3_semafor_NP_Dn_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_1      = FXI3_SEMAFOR_NP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 = FXI3_SEMAFOR_DN_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_1       = sbs_alx_fxi3_semafor_NP_Dn_data[i];
            break;
         }
      
         if (sbs_alx_fxi3_semafor_NP_Up_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.type_1      = FXI3_SEMAFOR_NP_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 = FXI3_SEMAFOR_UP_DIRECTION;
            sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1       = i;
            sbs_alx_fxi3_semafor_signal.NP_semafor.val_1       = sbs_alx_fxi3_semafor_NP_Up_data[i];
            break;
         }
      }
   }

//--- Set NP_trend, NP_trend_type ---/

//--- Check for TREND_DOWN ---/

   if (
         (
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_3 == FXI3_SEMAFOR_HP_TYPE) ||
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_3 == FXI3_SEMAFOR_NP_TYPE)
         ) &&
         
         (
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_2 == FXI3_SEMAFOR_HP_TYPE) ||
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_2 == FXI3_SEMAFOR_NP_TYPE)
         ) &&
         
         (
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_1 == FXI3_SEMAFOR_HP_TYPE) ||
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_1 == FXI3_SEMAFOR_NP_TYPE)
         ) &&
         
         (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 == FXI3_SEMAFOR_DN_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 == FXI3_SEMAFOR_UP_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 == FXI3_SEMAFOR_DN_DIRECTION) &&
         
         (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3 < sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2 < sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1 < SBS_INDI_BARS_NO) &&

         (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_fxi3_semafor_signal.NP_semafor.val_3) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_fxi3_semafor_signal.NP_semafor.val_1)
      )
   {
      sbs_alx_fxi3_semafor_signal.NP_trend      = SBS_ALX_TREND_DOWN;
      sbs_alx_fxi3_semafor_signal.NP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE;
   }

//--- Check for TREND_UP ---/

   if (
         (
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_3 == FXI3_SEMAFOR_HP_TYPE) ||
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_3 == FXI3_SEMAFOR_NP_TYPE)
         ) &&
         
         (
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_2 == FXI3_SEMAFOR_HP_TYPE) ||
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_2 == FXI3_SEMAFOR_NP_TYPE)
         ) &&
         
         (
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_1 == FXI3_SEMAFOR_HP_TYPE) ||
            (sbs_alx_fxi3_semafor_signal.NP_semafor.type_1 == FXI3_SEMAFOR_NP_TYPE)
         ) &&
         
         (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_3 == FXI3_SEMAFOR_UP_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2 == FXI3_SEMAFOR_DN_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1 == FXI3_SEMAFOR_UP_DIRECTION) &&
         
         (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3 < sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2 < sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1 < SBS_INDI_BARS_NO) &&

         (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_fxi3_semafor_signal.NP_semafor.val_3) &&
         (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_fxi3_semafor_signal.NP_semafor.val_2)
      )
   {
      sbs_alx_fxi3_semafor_signal.NP_trend      = SBS_ALX_TREND_UP;
      sbs_alx_fxi3_semafor_signal.NP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE;
   }

//------ Get NP_trend_mixture ------/

   if (sbs_alx_fxi3_semafor_signal.NP_trend != SBS_ALX_TREND_NONE)
   {
//--- Check type_3 ---/

      if (sbs_alx_fxi3_semafor_signal.NP_semafor.type_3 == FXI3_SEMAFOR_HP_TYPE)
      {
         sbs_alx_fxi3_semafor_signal.NP_trend_mixture = sbs_alx_fxi3_semafor_signal.NP_trend_mixture + 3;
      }
      
      if (sbs_alx_fxi3_semafor_signal.NP_semafor.type_3 == FXI3_SEMAFOR_NP_TYPE)
      {
         sbs_alx_fxi3_semafor_signal.NP_trend_mixture = sbs_alx_fxi3_semafor_signal.NP_trend_mixture + 2;
      }

//--- Check type_2 ---/

      if (sbs_alx_fxi3_semafor_signal.NP_semafor.type_2 == FXI3_SEMAFOR_HP_TYPE)
      {
         sbs_alx_fxi3_semafor_signal.NP_trend_mixture = sbs_alx_fxi3_semafor_signal.NP_trend_mixture + (10 * 3);
      }
      
      if (sbs_alx_fxi3_semafor_signal.NP_semafor.type_2 == FXI3_SEMAFOR_NP_TYPE)
      {
         sbs_alx_fxi3_semafor_signal.NP_trend_mixture = sbs_alx_fxi3_semafor_signal.NP_trend_mixture + (10 * 2);
      }

//--- Check type_1 ---/

      if (sbs_alx_fxi3_semafor_signal.NP_semafor.type_1 == FXI3_SEMAFOR_HP_TYPE)
      {
         sbs_alx_fxi3_semafor_signal.NP_trend_mixture = sbs_alx_fxi3_semafor_signal.NP_trend_mixture + (100 * 3);
      }
      
      if (sbs_alx_fxi3_semafor_signal.NP_semafor.type_1 == FXI3_SEMAFOR_NP_TYPE)
      {
         sbs_alx_fxi3_semafor_signal.NP_trend_mixture = sbs_alx_fxi3_semafor_signal.NP_trend_mixture + (100 * 2);
      }
   }

//--------------------------- Check NP_trend_mixture -----------------------/

//--- NP_trend_mixture != 222 ---/

   if (sbs_alx_fxi3_semafor_signal.NP_trend_mixture != 222)       // BIG_DOTS ONLY Filter
   {
      sbs_alx_fxi3_semafor_signal.NP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_MIXED_TYPE;
   }

//--- NP_trend_mixture == 333 ---/
/*
   if (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 333)       // SUNS ONLY (EQ HP_semafor) Filter
   {
      sbs_alx_fxi3_semafor_signal.NP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
      sbs_alx_fxi3_semafor_signal.NP_trend      = SBS_ALX_TREND_NONE;
   }
*/
//--------------------------- NP_trend_mixture == (322 OR 332) -------------/

   if (
         (
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 322) ||       // 322 "SUN - BIG_DOT - BIG_DOT"
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 332)
         ) &&
         
         (
            (sbs_alx_fxi3_semafor_signal.NP_trend == SBS_ALX_TREND_UP) ||
            (sbs_alx_fxi3_semafor_signal.NP_trend == SBS_ALX_TREND_DOWN)
         )
      )
   {
//--- SEMAFOR Approval ---/

      SBS_Approve_FXI3_SEMAFOR_Trend(sbs_alx_fxi3_semafor_signal.NP_semafor);

//--- NP_trend == SBS_ALX_TREND_DOWN ---/
      
      if (sbs_alx_fxi3_semafor_signal.NP_trend == SBS_ALX_TREND_DOWN)
      {
         if (
               (
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[2] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED) ||
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[3] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED) ||
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[4] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED)
               ) &&
               
               (
                  (sbs_alx_trend_cci_signal.fast_cci_val < 0) ||
                  (sbs_alx_trend_cci_signal.slow_cci_val < 0)
               )
            )
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type = 1;
         }
         
         if (
               (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type == 0) &&
               
               (
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[0] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED) ||
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[1] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED)
               ) &&
               
               (sbs_alx_trend_cci_signal.slow_cci_val < 0)
            )
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type = 2;
         }
         
         if (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type == 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_trend      = SBS_ALX_TREND_NONE;
         }
      } // EOF NP_trend == SBS_ALX_TREND_DOWN

//--- NP_trend == SBS_ALX_TREND_UP ---/
      
      if (sbs_alx_fxi3_semafor_signal.NP_trend == SBS_ALX_TREND_UP)
      {
         if (
               (
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[2] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED) ||
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[3] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED) ||
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[4] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED)
               ) &&

               (
                  (sbs_alx_trend_cci_signal.fast_cci_val > 0) ||
                  (sbs_alx_trend_cci_signal.slow_cci_val > 0)
               )
            )
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type = 1;
         }
         
         if (
               (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type == 0) &&
               
               (
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[0] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED) ||
                  (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_level[1] == FXI3_SEMAFOR_STRONG_LEVEL_DEFINED)
               ) &&
               
               (sbs_alx_trend_cci_signal.slow_cci_val > 0)
            )
         {
            sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type = 2;
         }
         
         if (sbs_alx_fxi3_semafor_signal.NP_semafor.strong_type == 0)
         {
            sbs_alx_fxi3_semafor_signal.NP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE;
            sbs_alx_fxi3_semafor_signal.NP_trend      = SBS_ALX_TREND_NONE;
         }
      } // EOF NP_trend == SBS_ALX_TREND_UP
      
      
   }  // EOF NP_trend_mixture == (322 OR 332)

//--------------------------- Set FXI3_SEMAFOR HP (SUNS ONLY) State --------/

//--- Get HP_semafor 3 (NP_trend_mixture == (322 OR 332) ---/

   if (
         (
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 322) ||       // 322 "SUN - BIG_DOT - BIG_DOT"
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 332)
         ) &&
         (
            (sbs_alx_fxi3_semafor_signal.NP_trend == SBS_ALX_TREND_UP) ||
            (sbs_alx_fxi3_semafor_signal.NP_trend == SBS_ALX_TREND_DOWN)
         )
      )
   {
      if (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 322)
      {
         sbs_alx_fxi3_semafor_signal.HP_semafor.type_3      = FXI3_SEMAFOR_HP_TYPE;
         sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 = sbs_alx_fxi3_semafor_signal.NP_semafor.direction_1;
         sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3       = sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1;
         sbs_alx_fxi3_semafor_signal.HP_semafor.val_3       = sbs_alx_fxi3_semafor_signal.NP_semafor.val_1;
         
         HP_semafor_3_flag = 1;
      }
      
      if (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 332)
      {
         sbs_alx_fxi3_semafor_signal.HP_semafor.type_3      = FXI3_SEMAFOR_HP_TYPE;
         sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 = sbs_alx_fxi3_semafor_signal.NP_semafor.direction_2;
         sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3       = sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2;
         sbs_alx_fxi3_semafor_signal.HP_semafor.val_3       = sbs_alx_fxi3_semafor_signal.NP_semafor.val_2;
         
         HP_semafor_3_flag = 1;
      }
   }  // EOF Get HP_semafor 3 (NP_trend_mixture == (322 OR 332)
   
//--- Check if HP_semafor_3 SET ---/
   
   if (
         (HP_semafor_3_flag        == 0) &&
         (HP_global_semafor_3_flag == 0)
      )
   {
      return;
   }

//--------------------------- Get FXI3_SEMAFOR HP 2 & 1 (SUNS ONLY) State ---/

//--- HP_semafor_3_flag == 1 ---/

   if (HP_semafor_3_flag == 1)
   {

/*
   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      if (
            (sbs_alx_fxi3_semafor_HP_Dn_data[i] != 0) &&
            (sbs_alx_islands_signal.trend == SBS_ALX_TREND_DOWN)
         )
      {
         sbs_alx_fxi3_semafor_signal.HP_semafor.type_3      = FXI3_SEMAFOR_HP_TYPE;
         sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 = FXI3_SEMAFOR_DN_DIRECTION;
         sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3       = i;
         sbs_alx_fxi3_semafor_signal.HP_semafor.val_3       = sbs_alx_fxi3_semafor_HP_Dn_data[i];
         break;
      }
      
      if (
            (sbs_alx_fxi3_semafor_HP_Up_data[i] != 0) &&
            (sbs_alx_islands_signal.trend == SBS_ALX_TREND_UP)
         )
      {
         sbs_alx_fxi3_semafor_signal.HP_semafor.type_3      = FXI3_SEMAFOR_HP_TYPE;
         sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 = FXI3_SEMAFOR_UP_DIRECTION;
         sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3       = i;
         sbs_alx_fxi3_semafor_signal.HP_semafor.val_3       = sbs_alx_fxi3_semafor_HP_Up_data[i];
         break;
      }
   }
*/

//--- Get HP_semafor 2 ---/

   if (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 < (SBS_INDI_BARS_NO - 1))
   {
      for (i = (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_fxi3_semafor_HP_Dn_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.HP_semafor.type_2      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 = FXI3_SEMAFOR_DN_DIRECTION;
            sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2       = i;
            sbs_alx_fxi3_semafor_signal.HP_semafor.val_2       = sbs_alx_fxi3_semafor_HP_Dn_data[i];
            break;
         }
      
         if (sbs_alx_fxi3_semafor_HP_Up_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.HP_semafor.type_2      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 = FXI3_SEMAFOR_UP_DIRECTION;
            sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2       = i;
            sbs_alx_fxi3_semafor_signal.HP_semafor.val_2       = sbs_alx_fxi3_semafor_HP_Up_data[i];
            break;
         }
      }
   }

//--- Get HP_semafor 1 ---/

   if (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2 < (SBS_INDI_BARS_NO - 1))
   {
      for (i = (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2 + 1); i < SBS_INDI_BARS_NO; i++)
      {
         if (sbs_alx_fxi3_semafor_HP_Dn_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.HP_semafor.type_1      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 = FXI3_SEMAFOR_DN_DIRECTION;
            sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1       = i;
            sbs_alx_fxi3_semafor_signal.HP_semafor.val_1       = sbs_alx_fxi3_semafor_HP_Dn_data[i];
            break;
         }
      
         if (sbs_alx_fxi3_semafor_HP_Up_data[i] != 0)
         {
            sbs_alx_fxi3_semafor_signal.HP_semafor.type_1      = FXI3_SEMAFOR_HP_TYPE;
            sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 = FXI3_SEMAFOR_UP_DIRECTION;
            sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1       = i;
            sbs_alx_fxi3_semafor_signal.HP_semafor.val_1       = sbs_alx_fxi3_semafor_HP_Up_data[i];
            break;
         }
      }
   }

//--- Set HP_trend, HP_trend_type ---/

//--- Check for TREND_DOWN ---/

   if (
         (sbs_alx_fxi3_semafor_signal.HP_semafor.type_3 == FXI3_SEMAFOR_HP_TYPE) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.type_2 == FXI3_SEMAFOR_HP_TYPE) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.type_1 == FXI3_SEMAFOR_HP_TYPE) &&
         
         (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 == FXI3_SEMAFOR_DN_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 == FXI3_SEMAFOR_UP_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 == FXI3_SEMAFOR_DN_DIRECTION) &&
         
         (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 < sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2 < sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1 < SBS_INDI_BARS_NO) &&

         (sbs_alx_fxi3_semafor_signal.HP_semafor.val_2 < sbs_alx_fxi3_semafor_signal.HP_semafor.val_3) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.val_3 < sbs_alx_fxi3_semafor_signal.HP_semafor.val_1)
      )
   {
      sbs_alx_fxi3_semafor_signal.HP_trend      = SBS_ALX_TREND_DOWN;
      sbs_alx_fxi3_semafor_signal.HP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE;
   }

//--- Check for TREND_UP ---/

   if (
         (sbs_alx_fxi3_semafor_signal.HP_semafor.type_3 == FXI3_SEMAFOR_HP_TYPE) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.type_2 == FXI3_SEMAFOR_HP_TYPE) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.type_1 == FXI3_SEMAFOR_HP_TYPE) &&
         
         (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_3 == FXI3_SEMAFOR_UP_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_2 == FXI3_SEMAFOR_DN_DIRECTION) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.direction_1 == FXI3_SEMAFOR_UP_DIRECTION) &&
         
         (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 < sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_2 < sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_1 < SBS_INDI_BARS_NO) &&

         (sbs_alx_fxi3_semafor_signal.HP_semafor.val_1 < sbs_alx_fxi3_semafor_signal.HP_semafor.val_3) &&
         (sbs_alx_fxi3_semafor_signal.HP_semafor.val_3 < sbs_alx_fxi3_semafor_signal.HP_semafor.val_2)
      )
   {
      sbs_alx_fxi3_semafor_signal.HP_trend      = SBS_ALX_TREND_UP;
      sbs_alx_fxi3_semafor_signal.HP_trend_type = SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE;
   }
   
   }  // if (HP_semafor_3_flag == 1)


//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_TREND_ZONE_M1_State_and_Rules() ======/

void     Get_ALX_TREND_ZONE_M1_State_and_Rules()
{
int      end_bar;

//--------------------------- Reset TREND_ZONE States ----------------------/

   sbs_alx_trend_zone_signal.trend                 = SBS_ALX_TREND_NONE;
   sbs_alx_trend_zone_signal.cross_bar             = SBS_INDI_BARS_NO;
   sbs_alx_trend_zone_signal.heigth_move_direction = SBS_ALX_HEIGTH_GETS_NONE;

//--------------------------- Set TREND_ZONE trend -------------------------/

   if (sbs_alx_TMA_CEP_280_data[0] > sbs_alx_MA_510_data[0])
   {
      sbs_alx_trend_zone_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_TMA_CEP_280_data[0] < sbs_alx_MA_510_data[0])
   {
      sbs_alx_trend_zone_signal.trend = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------- Set TREND_ZONE cross_bar ---------------------/

   sbs_alx_trend_zone_signal.cross_bar = SBS_ALX_Indi_Cross_Bar(sbs_alx_MA_510_data,sbs_alx_TMA_CEP_280_data);
   
//--------------------------- Set TREND_ZONE heigth_move_direction ---------/

   if (sbs_alx_trend_zone_signal.cross_bar < SBS_INDI_BARS_NO)
   {
      end_bar = sbs_alx_trend_zone_signal.cross_bar;
   }
   else
   {
      end_bar = SBS_INDI_BARS_NO - 1;
   }
   
   sbs_alx_trend_zone_signal.heigth_move_direction = SBS_ALX_Indi_Heigth_Move_Direction(sbs_alx_MA_510_data,sbs_alx_TMA_CEP_280_data, end_bar);

//--------------------------------------------------------------------------/

   return;
}

//=========================== Get_ALX_ISLANDS_M1_State_and_Rules() =========/

void     Get_ALX_ISLANDS_M1_State_and_Rules()
{
//--------------------------- Reset ISLANDS States -------------------------/

   sbs_alx_islands_signal.trend                 = SBS_ALX_TREND_NONE;
   sbs_alx_islands_signal.cross_bar             = SBS_INDI_BARS_NO;

//--------------------------- Set ISLANDS trend ----------------------------/

   if (sbs_alx_MA_3_data[0] > sbs_alx_MA_34_data[0])
   {
      sbs_alx_islands_signal.trend = SBS_ALX_TREND_UP;
   }
   
   if (sbs_alx_MA_3_data[0] < sbs_alx_MA_34_data[0])
   {
      sbs_alx_islands_signal.trend = SBS_ALX_TREND_DOWN;
   }
   
//--------------------------- Set ISLANDS cross_bar ------------------------/

   sbs_alx_islands_signal.cross_bar = SBS_ALX_Indi_Cross_Bar(sbs_alx_MA_3_data,sbs_alx_MA_34_data);
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== SBS_Approve_FXI3_SEMAFOR_NP_Trend() ==========/

void     SBS_Approve_FXI3_SEMAFOR_Trend(fxi3_smf_type &semafor)
{
//--- MA510 Cross Check ---/

   if (SBS_FXI3_SEMAFOR_Cross_TrendLine(semafor,sbs_alx_MA_510_data) == True)
   {
      semafor.strong_level[4] = FXI3_SEMAFOR_STRONG_LEVEL_DEFINED;
   }

//--- CEP280 Cross Check ---/

   if (SBS_FXI3_SEMAFOR_Cross_TrendLine(semafor,sbs_alx_TMA_CEP_280_data) == True)
   {
      semafor.strong_level[3] = FXI3_SEMAFOR_STRONG_LEVEL_DEFINED;
   }

//--- MA55,27 Cross Check ---/

   if (SBS_FXI3_SEMAFOR_Cross_TrendLine(semafor,sbs_alx_MA_55_27_data) == True)
   {
      semafor.strong_level[2] = FXI3_SEMAFOR_STRONG_LEVEL_DEFINED;
   }

//--- CEP48 Cross Check ---/

   if (SBS_FXI3_SEMAFOR_Cross_TrendLine(semafor,sbs_alx_TMA_CEP_48_data) == True)
   {
      semafor.strong_level[1] = FXI3_SEMAFOR_STRONG_LEVEL_DEFINED;
   }

//--- NO ANY CROSS Check ---/

   if (
         (semafor.strong_level[4] == FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED) &&
         (semafor.strong_level[3] == FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED) &&
         (semafor.strong_level[2] == FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED) &&
         (semafor.strong_level[1] == FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED)
      )
   {
      semafor.strong_level[0] = FXI3_SEMAFOR_STRONG_LEVEL_DEFINED;
   }
   
//--------------------------------------------------------------------------/

   return;
}

//=========================== SBS_FXI3_SEMAFOR_Cross_TrendLine =============/

bool     SBS_FXI3_SEMAFOR_Cross_TrendLine(fxi3_smf_type &semafor, double &trend_array[])
{
int      flag_hi;
int      flag_lo;

//--------------------------- MA510 Cross Check ----------------------------/

   flag_hi = 0;
   flag_lo = 0;
   
   if (semafor.val_1 >= trend_array[semafor.bar_1])   {flag_hi = 1;}
   if (semafor.val_1 <= trend_array[semafor.bar_1])   {flag_lo = 1;}
   
   if (semafor.val_2 >= trend_array[semafor.bar_2])   {flag_hi = 1;}
   if (semafor.val_2 <= trend_array[semafor.bar_2])   {flag_lo = 1;}
   
   if (semafor.val_3 >= trend_array[semafor.bar_3])   {flag_hi = 1;}
   if (semafor.val_3 <= trend_array[semafor.bar_3])   {flag_lo = 1;}
   
   if (
         (flag_hi == 1) &&
         (flag_lo == 1)
      )
   {
      return(True);
   }

//--------------------------------------------------------------------------/

   return(False);
}

//================== eof sbs_alx_ILND_M1_data_proc_lbr.mqh =================/
