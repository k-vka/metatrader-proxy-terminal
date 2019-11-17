//===================== sbs_order_alx_cases_s2_xst_lbr.mqh ===============/

//========================== Process_S2_Case_XST_Strong ==================/
//--- XST signal 343/443 ---/

void     Process_S2_Case_XST_Strong()
{
//-------------------------- Check for SELL ------------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_NEGATIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_DOWN) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_DOWN)
      )
   {
//--- XST Trend Type 01 (343(10x)/443(10x)) ---/

      if (
            (alx_xst_signal.trend_H1    == SBS_ALX_TREND_DOWN) &&
            (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
            (alx_xst_signal.age_H1_40 > (alx_xst_signal.age_H1 - 2)) &&
            ((alx_xst_signal.age_H1 + alx_xst_signal.age_H1_40) >= 6)
//            (alx_xst_signal.age_H1      >= 1) &&
//            (alx_xst_signal.age_H1_40   >= 5)
         )
      {
         if (Case_XST_Type_01(SELL_ORDER))            
         {
            return;
         }
      }

//--- XST Trend Type 01 (343(20x)/443(20x)) ---/

      if (
            (alx_xst_signal.trend_H1    == SBS_ALX_TREND_DOWN) &&
            (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_DOWN) &&
            (alx_xst_signal.age_H1_40 <= alx_xst_signal.age_H1) &&
            (
               (
                  (alx_xst_signal.age_H1      >= 4) &&
                  (alx_xst_signal.age_H1_40   >= 2)
               ) ||
               (
                  (alx_xst_signal.age_H1      >= 2) &&
                  (alx_xst_signal.age_H1_40   >= 2)
               )
            )
         )
      {
         if (Case_XST_Type_02(SELL_ORDER))            
         {
            return;
         }
      }
      
   }

//-------------------------- Check for BUY -------------------------------/

   if (
//--- APB ---/

         (alx_apb_signal.bar_00_trend == SBS_ALX_APB_BAR_TREND_POSITIVE) &&
         
//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_M15 == SBS_ALX_TREND_UP) &&
         (alx_asctrend_4tf_signal.trend_M30 == SBS_ALX_TREND_UP)
      )
   {
//--- XST Trend Type 01 (343(10x)/443(10x)) ---/

      if (
            (alx_xst_signal.trend_H1    == SBS_ALX_TREND_UP) &&
            (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
            (alx_xst_signal.age_H1_40 > (alx_xst_signal.age_H1 - 2)) &&
            ((alx_xst_signal.age_H1 + alx_xst_signal.age_H1_40) >= 6)
//            (alx_xst_signal.age_H1      >= 1) &&
//            (alx_xst_signal.age_H1_40   >= 5)
         )
      {
         if (Case_XST_Type_01(BUY_ORDER))            
         {
            return;
         }
      }

//--- XST Trend Type 01 (343(20x)/443(20x)) ---/

      if (
            (alx_xst_signal.trend_H1    == SBS_ALX_TREND_UP) &&
            (alx_xst_signal.trend_H1_40 == SBS_ALX_TREND_UP) &&
            (alx_xst_signal.age_H1_40 <= alx_xst_signal.age_H1) &&
            (
               (
                  (alx_xst_signal.age_H1      >= 4) &&
                  (alx_xst_signal.age_H1_40   >= 2)
               ) ||
               (
                  (alx_xst_signal.age_H1      >= 2) &&
                  (alx_xst_signal.age_H1_40   >= 2)
               )
            )
         )
      {
         if (Case_XST_Type_02(BUY_ORDER))            
         {
            return;
         }
      }
      
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Case_XST_Type_01 ============================/
//--- 343(10x)/443(10x) ---/

bool     Case_XST_Type_01(int check_order_type)
{
//-------------------------- Check for SELL/BUY --------------------------/

//--- SELL 343,101 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (
            !(
               (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
               (tdi_04_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1)
            ) ||
            (
               (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
               (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)
            )
         )
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,101);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,101 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_04 ---/

         (
            !(
               (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
               (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1)
            ) ||
            (
               (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
               (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)
            )
         )
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,101);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,102 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) 
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,102);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,102 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) 
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,102);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,1031 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,1031);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,1031 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,1031);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,1032 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] < sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
         (tdi_04_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1)
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,1032);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,1032 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 

//--- TDI_04 ---/

         (sbs_alx_tdi_04_rsiPriceLine_data[0] > sbs_alx_tdi_04_rsiSignalLine_data[0]) &&
         (tdi_04_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1)
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,1032);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,1033 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 
         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,1033);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,1033 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 
         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,1033);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,1034 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&
         
         (sbs_alx_pivot_Res3_data[alx_pivot_signal.last_bar_1] < sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) &&

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,1034);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,1034 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&
         
         (sbs_alx_pivot_Supp3_data[alx_pivot_signal.last_bar_1] > sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) &&

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,1034);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,1035 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&
         
         (sbs_alx_pivot_Res2_data[alx_pivot_signal.last_bar_1] < sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0]) &&

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,1035);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,1035 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&
         
         (sbs_alx_pivot_Supp2_data[alx_pivot_signal.last_bar_1] > sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) &&

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,1035);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,104 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0)

//--- TDI_MDL ---/

//         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 
//         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,104);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,104 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0)

//--- TDI_MDL ---/

//         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
//         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 
//         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,104);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,105 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 
//         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,105);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,105 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 
//         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,105);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,106 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) 
//         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,106);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,106 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

//         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
         (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) 
//         (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,106);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,107 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,107);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,107 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&
//         (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0])

      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,107);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//========================== Case_XST_Type_02 ============================/
//--- 343(20x)/443(20x) ---/

bool     Case_XST_Type_02(int check_order_type)
{
//-------------------------- Check for SELL/BUY --------------------------/

//--- SELL 343,201 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (
            (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) ||
            (
               (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
               (sbs_alx_tdi_MDL_rsiSignalLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
               (tdi_04_rsiSignalLine_CROSS_tdi_bandMiddle() > alx_pivot_signal.last_bar_0)
            ) ||
            (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_DOWN)
         )
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,201);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,201 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (
            (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) ||
            (
               (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_rsiSignalLine_data[0]) &&
               (sbs_alx_tdi_MDL_rsiSignalLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
               (tdi_04_rsiSignalLine_CROSS_tdi_bandMiddle() > alx_pivot_signal.last_bar_0)
            ) ||
            (alx_asctrend_4tf_signal.trend_H4  == SBS_ALX_TREND_UP)
         )
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,201);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,202 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (
            (tdi_MDL_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_1) ||
            (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)
         )
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,202);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,202 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0]) &&
         (
            (tdi_MDL_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_1) ||
            (((sbs_alx_tdi_MDL_bandUp_data[0] - sbs_alx_tdi_MDL_bandDown_data[0]) / (alx_tdi_LevelUp - alx_tdi_LevelMiddle)) < 0.75)
         )
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,202);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- SELL 343,203 ---/

   if (
         (check_order_type == SELL_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_DOWN) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_DOWN) &&

         ((sbs_alx_pivot_Res1_data[alx_pivot_signal.last_bar_0] - alx_pivot_signal.bounce_sell_val_0) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 1)) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_DOWN) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] < sbs_alx_tdi_MDL_bandMiddle_data[0])
 
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,343,203);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//--- BUY 443,203 ---/

   if (
         (check_order_type == BUY_ORDER) &&

//--- PIVOT ---/

         (alx_pivot_signal.Pivot_trend == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Res1_trend  == SBS_ALX_TREND_UP) &&
         (alx_pivot_signal.Supp1_trend == SBS_ALX_TREND_UP) &&

         ((alx_pivot_signal.bounce_buy_val_0 - sbs_alx_pivot_Supp1_data[alx_pivot_signal.last_bar_0]) < 
          ((sbs_alx_pac_HMA_data[alx_pivot_signal.bounce_sell_bar_0] - sbs_alx_pac_LMA_data[alx_pivot_signal.bounce_sell_bar_0]) / 1)) &&

//--- ASCTREND_4TF ---/

         (alx_asctrend_4tf_signal.trend_H1  == SBS_ALX_TREND_UP) &&

//--- TDI (M15) ---/

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() <= alx_pivot_signal.last_bar_0) &&

//--- TDI_MDL ---/

         (sbs_alx_tdi_MDL_rsiPriceLine_data[0] > sbs_alx_tdi_MDL_bandMiddle_data[0])
 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,443,203);         // xst sl type 1 (middle between xst H1 & H1_40)
      return(true);
   }

//------------------------------------------------------------------------/

   return(false);
}

//===================== eof sbs_order_alx_cases_s2_xst_lbr.mqh ===========/