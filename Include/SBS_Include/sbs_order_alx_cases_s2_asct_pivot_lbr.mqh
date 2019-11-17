//===================== sbs_order_alx_cases_s2_asct_pivot_lbr.mqh ========/

//========================== Process_S2_Case_ASCT4_PIVOT_Strong ==========/
//--- ASCT(4 signal) + PIVOT 341/441 ---/

void     Process_S2_Case_ASCT4_PIVOT_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN) &&

//--- PIVOT ---/

         (Close[0] < alx_pivot_signal.Pivot)

      )
   {
//--- PIVOT Trend Type 01 (341(1x)/441(1x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN)
         )
      {
         if (Case_ASCT4_PIVOT_Type_01(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 02 (341(2x)/441(2x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
         if (Case_ASCT4_PIVOT_Type_02(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 03 (341(3x)/441(3x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
         if (Case_ASCT4_PIVOT_Type_03(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 04 (341(4x)/441(4x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN)
         )
      {
         if (Case_ASCT4_PIVOT_Type_04(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 05 (341(5x)/441(5x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
         if (Case_ASCT4_PIVOT_Type_05(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 06 (341(6x)/441(6x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
      }

//--- PIVOT Trend Type 07 (341(7x)/441(7x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN)
         )
      {
         if (Case_ASCT4_PIVOT_Type_07(SELL_ORDER))
         {
            return;
         }
      }
      
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Case_ASCT3_PIVOT_Strong ==========/
//--- ASCT(3 signal) + PIVOT 342/442 ---/

void     Process_S2_Case_ASCT3_PIVOT_Strong()
{
//-------------------------- Check for SELL ---------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- PIVOT ---/

         (Close[0] < alx_pivot_signal.Pivot)

      )
   {
//--- PIVOT Trend Type 01 (342(1x)/442(1x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN)
         )
      {
         if (Case_ASCT3_PIVOT_Type_01(SELL_ORDER))
         {
            return;
         }
      }
      
//--- PIVOT Trend Type 02 (342(2x)/442(2x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
         if (Case_ASCT3_PIVOT_Type_02(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 03 (342(3x)/442(3x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
         if (Case_ASCT3_PIVOT_Type_03(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 04 (342(4x)/442(4x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN)
         )
      {
         if (Case_ASCT3_PIVOT_Type_04(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 05 (342(5x)/442(5x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
      }

//--- PIVOT Trend Type 06 (342(6x)/442(6x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP)
         )
      {
         if (Case_ASCT3_PIVOT_Type_06(SELL_ORDER))
         {
            return;
         }
      }

//--- PIVOT Trend Type 07 (342(7x)/442(7x)) ---/

      if (
            (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
            (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
            (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN)
         )
      {
      }
     
   }

//------------------------------------------------------------------------/

   return;
}

//========================== ASCT4 =======================================/

//========================== Case_ASCT4_PIVOT_Type_01 ====================/
//--- 341(1x)/441(1x) ---/

bool     Case_ASCT4_PIVOT_Type_01(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 341,11 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 >= 6)

//--- TDI_MDL ---/

//--- TDI_04 ---/

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,11);
      return(true);
   }
   
//--- 341,12 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 3) &&
         (alx_pivot_signal.bounce_buy_pos_1  == 1) &&

         ((sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 <= 4) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (
            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) ||
            (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_bandMiddle_data[0])
         )

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,12);
      return(true);
   }

//--- 341,13 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&
         
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&

         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,13);
      return(true);
   }

//--- 341,14 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&
         
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&

         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,14);
      return(true);
   }

//--- 341,15 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 2) &&
         (alx_pivot_signal.bounce_buy_pos_1  == 0) &&

         ((sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 <= 4) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,15);
      return(true);
   }

//--- 341,16 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 3) &&
         (alx_pivot_signal.bounce_buy_pos_1  <= 2) &&

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 1)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 <= 4) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,16);
      return(true);
   }

//--- 341,17 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 >= 3) &&
         (alx_pivot_signal.bounce_sell_pos_1 <= 4) &&
         
         (alx_pivot_signal.bounce_buy_pos_1  >= 0) &&
         (alx_pivot_signal.bounce_buy_pos_1  <= 2) &&

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 1)) &&

         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&
         
         ((alx_pivot_signal.bounce_buy_val_0 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,17);
      return(true);
   }

//--- 341,18 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&
         
         (alx_pivot_signal.bounce_buy_pos_1  >= 0) &&
         (alx_pivot_signal.bounce_buy_pos_1  <= 2) &&

         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,18);
      return(true);
   }

//--- 341,19 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 3) &&
         
         (alx_pivot_signal.bounce_buy_pos_1  >= 0) &&
         (alx_pivot_signal.bounce_buy_pos_1  <= 2) &&
         
         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) / 2)) &&

         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,19);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT4_PIVOT_Type_02 ====================/
//--- 341(2x)/441(2x) ---/

bool     Case_ASCT4_PIVOT_Type_02(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/
   
//--- 341,21 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 7) &&
         (alx_pivot_signal.bounce_buy_pos_1  == 4) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0]) &&
         (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,21);
      return(true);
   }

//--- 341,22 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_buy_pos_1  == 3) &&
         
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 1)) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 == 5) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
         (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,22);
      return(true);
   }

//--- 341,23 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1  >= 5) &&
         
         (alx_pivot_signal.bounce_buy_pos_1  >= 3) &&
         (alx_pivot_signal.bounce_buy_pos_1  <= 4) &&

         (alx_pivot_signal.bounce_sell_pos_0 <= 4) &&
         
         ((alx_pivot_signal.bounce_sell_val_0 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 1.5)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])
//         (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,23);
      return(true);
   }

//--- 341,24 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_buy_pos_1  == 3) &&
         
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 1)) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 >= 5) &&
         (alx_pivot_signal.bounce_sell_pos_0 <= 6) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
//         (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,24);
      return(true);
   }

//--- 341,25 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1  == 4) &&
         (alx_pivot_signal.bounce_buy_pos_1  == 3) &&
         
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) > 
          ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) / 2)) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((alx_pivot_signal.bounce_sell_val_0 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/
         
         (
            (sbs_alx_tdi_04_rsiPriceLine_data[0] >= sbs_alx_tdi_04_bandUp_data[0]) ||
            (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0)
         )

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,25);
      return(true);
   }

//--- 341,26 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1  >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_1  <= 5) &&
         
         (alx_pivot_signal.bounce_buy_pos_1  == 3) &&
         
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) > 
          ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) / 1.5)) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((alx_pivot_signal.bounce_sell_val_0 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

//         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/
         
         (
            (sbs_alx_tdi_04_rsiPriceLine_data[0] >= sbs_alx_tdi_04_bandUp_data[0]) ||
            (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0)
         )

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,26);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT4_PIVOT_Type_03 ====================/
//--- 341(3x)/441(3x) ---/

bool     Case_ASCT4_PIVOT_Type_03(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 341,31 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,31);
      return(true);
   }

//--- 341,32 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 1.5)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 1.5)) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) < 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,32);
      return(true);
   }

//--- 341,33 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) > 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,33);
      return(true);
   }

//--- 341,34 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_buy_val_1) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 >= 4) &&
         (alx_pivot_signal.bounce_buy_pos_0 <= 2) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,34);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT4_PIVOT_Type_04 ====================/
//--- 341(4x)/441(4x) ---/

bool     Case_ASCT4_PIVOT_Type_04(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 341,41 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1]) < 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiPriceLine_data[1])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,41);
      return(true);
   }

//--- 341,42 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 >= 5) &&
         (alx_pivot_signal.bounce_sell_pos_1 <= 6) &&
         
         (alx_pivot_signal.bounce_buy_pos_1 >= 2) &&
         (alx_pivot_signal.bounce_buy_pos_1 <= 3) &&

         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,42);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT4_PIVOT_Type_05 ====================/
//--- 341(5x)/441(5x) ---/

bool     Case_ASCT4_PIVOT_Type_05(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 341,51 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 0.8)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 <= 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) > 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,51);
      return(true);
   }

//--- 341,52 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/ (as 51)

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 0.8)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 <= 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) > 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,52);
      return(true);
   }

//--- 341,53 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 0.8)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 <= 5) &&
         
         (MathAbs(sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 1)) &&
          
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,53);
      return(true);
   }

//--- 341,54 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&
         (alx_pivot_signal.bounce_buy_pos_1 == 3) &&

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_buy_val_1) > 
          ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&
         
         ((alx_pivot_signal.bounce_sell_val_0 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 1.5)) &&
          
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,54);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT4_PIVOT_Type_07 ====================/
//--- 341(7x)/441(7x) ---/

bool     Case_ASCT4_PIVOT_Type_07(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 341,71 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_1 <= 5) &&
         
         (alx_pivot_signal.bounce_buy_pos_1 >= 2) &&
         (alx_pivot_signal.bounce_buy_pos_1 <= 3) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 2)) &&
          
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_0 <= 5) &&

         (alx_pivot_signal.bounce_buy_pos_1 == 3) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,341,71);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== ASCT3 =======================================/

//========================== Case_ASCT3_PIVOT_Type_01 ====================/
//--- 342(1x)/442(1x) ---/

bool     Case_ASCT3_PIVOT_Type_01(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 342,11 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&

         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&

         (alx_pivot_signal.bounce_buy_pos_0 == 3) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,11);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT3_PIVOT_Type_02 ====================/
//--- 342(2x)/442(2x) ---/

bool     Case_ASCT3_PIVOT_Type_02(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 342,21 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 6) &&
         (alx_pivot_signal.bounce_buy_pos_1 == 3) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 0.8)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,21);
      return(true);
   }

//--- 342,22 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 6) &&
         
         (alx_pivot_signal.bounce_buy_pos_1 >= 3) &&
         (alx_pivot_signal.bounce_buy_pos_1 <= 4) &&
         
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&

         ((alx_pivot_signal.bounce_sell_val_0 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,22);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT3_PIVOT_Type_03 ====================/
//--- 342(3x)/442(3x) ---/

bool     Case_ASCT3_PIVOT_Type_03(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 342,31 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 1.5)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) < 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,31);
      return(true);
   }

//--- 342,32 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&

         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 0.8)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 == 4) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) > 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) < 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,32);
      return(true);
   }

//--- 342,32 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 == 4) &&
         (alx_pivot_signal.bounce_buy_pos_1 == 3) &&

         ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_buy_val_1) < 
          ((sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) / 2)) &&
          
         ((alx_pivot_signal.bounce_sell_val_1 - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Pivot_data[alx_pivot_signal.last_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_0 <= 5) &&
         
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) < 
          (sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0] - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]))&&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,33);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT3_PIVOT_Type_04 ====================/
//--- 342(4x)/442(4x) ---/

bool     Case_ASCT3_PIVOT_Type_04(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 342,41 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_1 <= 5) &&
         
         (alx_pivot_signal.bounce_buy_pos_1 >= 2) &&
         (alx_pivot_signal.bounce_buy_pos_1 <= 3) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 2)) &&
          
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_0 <= 5) &&

         (alx_pivot_signal.bounce_buy_pos_1 >= 2) &&
         (alx_pivot_signal.bounce_buy_pos_1 <= 3) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&
          
         ((alx_pivot_signal.bounce_buy_val_0 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0)

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,41);
      return(true);
   }


//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_ASCT3_PIVOT_Type_06 ====================/
//--- 342(6x)/442(6x) ---/

bool     Case_ASCT3_PIVOT_Type_06(int check_order_type)
{
//-------------------------- Check for SELL ------------------------------/

//--- 342,61 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.bounce_sell_pos_1 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_1 <= 5) &&
         
         (alx_pivot_signal.bounce_buy_pos_1 >= 2) &&
         (alx_pivot_signal.bounce_buy_pos_1 <= 3) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_1] - alx_pivot_signal.bounce_sell_val_1) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_1]) / 2)) &&
          
         ((alx_pivot_signal.bounce_buy_val_1 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_1]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_1] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_1]) / 2)) &&
          
         (alx_pivot_signal.bounce_sell_pos_0 >= 4) &&
         (alx_pivot_signal.bounce_sell_pos_0 <= 5) &&

         (alx_pivot_signal.bounce_buy_pos_1 == 3) &&
          
         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 2)) &&
          
         ((alx_pivot_signal.bounce_buy_val_0 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_buy_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_buy_bar_0]) / 2)) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&
         
//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

//--- TDI_04 ---/

//         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,342,61);
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//===================== eof sbs_order_alx_cases_s2_asct_pivot_lbr.mqh ====/