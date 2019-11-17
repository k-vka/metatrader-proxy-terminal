//================== sbs_islands_case_123_322_lbr.mqh ====================/

//========================== Process_ISLANDS_Case_123_322_Open ===========/
//--- ISLANDS signals 365(10X,11X)/465(10X,11X) ---/

void     Process_ISLANDS_Case_123_322_Open()                // AND 332
{
//-------------------------- Check for SELL (365(10X,11X)) ---------------/

//-------------------------- Check sbs_alx_fxi3_semafor_signal) ----------/

   if (
         (sbs_alx_fxi3_semafor_signal.NP_trend         == SBS_ALX_TREND_DOWN) &&
         (sbs_alx_fxi3_semafor_signal.NP_trend_type    == SBS_ALX_FXI3_SEMAFOR_TREND_MIXED_TYPE) &&
         (
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 322) ||             // SUN - BIG_DOT - BIG_DOT
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 332)
         )
      )
   {

//-------------------------- Check for SELL CASES ------------------------/

   if (
//--- ISLANDS ---/

         (sbs_alx_islands_signal.trend == SBS_ALX_TREND_DOWN) &&

//--- TREND_CCI ---/

         (sbs_alx_trend_cci_signal.fast_cci_val < 0) &&

//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE)
   
      )
   {
//-------------------------- SELL SUBCASES -------------------------------/
   
//------ (CASE 101), trend_zone=UP,HIGHER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_UP) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_HIGHER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3])
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,365,101);
         return;
      }
*/
//------ (CASE 102), trend_zone=UP,LOWER ------/

      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_UP) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
//            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3])

//--- FXI3_HP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.HP_trend == SBS_ALX_TREND_DOWN) 
//            (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 == sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,365,102);
         return;
      }

//------ (CASE 103), trend_zone=UP,LOWER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_UP) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]) &&

//--- FXI3_HP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.HP_trend == SBS_ALX_TREND_DOWN) 
//            (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 == sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,365,103);
         return;
      }
*/

//------ (CASE 111), trend_zone=DOWN,LOWER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3])
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,365,111);
         return;
      }
*/
//------ (CASE 112), trend_zone=DOWN,LOWER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]) &&

//--- MA_510 break trhough ---/

            (Close[0] < sbs_alx_MA_510_data[0])
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,365,112);
         return;
      }
*/
//------ (CASE 113), trend_zone=DOWN,HIGHER ------/

      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_HIGHER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
//            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]) &&

//--- FXI3_HP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.HP_trend == SBS_ALX_TREND_DOWN) 
//            (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 == sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1)
         )
      {
         Set_SBS_ALX_Signal(SELL_ORDER,365,113);
         return;
      }

   }  // EOF SELL SUBCASES
   
//========================================================================/
   
   }  // EOF "Check sbs_alx_fxi3_semafor_signal" for SELL


//-------------------------- Check for BUY (465(10X,11X)) ----------------/

//-------------------------- Check sbs_alx_fxi3_semafor_signal) ----------/

   if (
         (sbs_alx_fxi3_semafor_signal.NP_trend         == SBS_ALX_TREND_UP) &&
         (sbs_alx_fxi3_semafor_signal.NP_trend_type    == SBS_ALX_FXI3_SEMAFOR_TREND_MIXED_TYPE) &&
         (
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 322) ||             // SUN - BIG_DOT - BIG_DOT
            (sbs_alx_fxi3_semafor_signal.NP_trend_mixture == 332)
         )
      )
   {

//-------------------------- Check for BUY CASES -------------------------/

   if (
//--- ISLANDS ---/

         (sbs_alx_islands_signal.trend == SBS_ALX_TREND_UP) &&

//--- TREND_CCI ---/

         (sbs_alx_trend_cci_signal.fast_cci_val > 0) &&

//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE)
   
      )
   {
//-------------------------- BUY SUBCASES --------------------------------/
   
//------ (CASE 101), trend_zone=DOWN,HIGHER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_HIGHER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3])
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,465,101);
         return;
      }
*/
//------ (CASE 102), trend_zone=DOWN,LOWER ------/

      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
//            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3])

//--- FXI3_HP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.HP_trend == SBS_ALX_TREND_UP) 
//            (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 == sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,465,102);
         return;
      }

//------ (CASE 103), trend_zone=DOWN,LOWER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_DOWN) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]) &&

//--- FXI3_HP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.HP_trend == SBS_ALX_TREND_UP) 
//            (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 == sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,465,103);
         return;
      }
*/

//------ (CASE 111), trend_zone=UP,LOWER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_UP) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 > sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_MA_510_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3])
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,465,111);
         return;
      }
*/
//------ (CASE 112), trend_zone=UP,LOWER ------/
/*
      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_UP) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_LOWER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]) &&

//--- MA_510 break trhough ---/

            (Close[0] > sbs_alx_MA_510_data[0])
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,465,112);
         return;
      }
*/
//------ (CASE 113), trend_zone=UP,HIGHER ------/

      if (
//--- TREND_ZONE ---/
            
            (sbs_alx_trend_zone_signal.trend == SBS_ALX_TREND_UP) &&
            (sbs_alx_trend_zone_signal.heigth_move_direction == SBS_ALX_HEIGTH_GETS_HIGHER) &&

//--- FXI3_NP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_1 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1]) &&
//            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_2 < sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_2]) &&
            (sbs_alx_fxi3_semafor_signal.NP_semafor.val_3 > sbs_alx_TMA_CEP_280_data[sbs_alx_fxi3_semafor_signal.NP_semafor.bar_3]) &&

//--- FXI3_HP_SEMAFOR ---/

            (sbs_alx_fxi3_semafor_signal.HP_trend == SBS_ALX_TREND_UP) 
//            (sbs_alx_fxi3_semafor_signal.HP_semafor.bar_3 == sbs_alx_fxi3_semafor_signal.NP_semafor.bar_1)
         )
      {
         Set_SBS_ALX_Signal(BUY_ORDER,465,113);
         return;
      }

   }  // EOF BUY SUBCASES
   
//------------------------------------------------------------------------/
   
   }  // EOF "Check sbs_alx_fxi3_semafor_signal" for BUY

//------------------------------------------------------------------------/

   return;
}


//================== eof sbs_islands_case_123_322_lbr.mqh ================/
