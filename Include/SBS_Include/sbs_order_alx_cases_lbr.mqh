//===================== sbs_order_alx_cases_lbr.mqh ======================/

//========================== Get_SBS_ALX_Order_Case ======================/

void     Get_SBS_ALX_Order_Case()
{
//-------------------------- Reset ALX Signal Data -----------------------/

   Reset_SBS_ALX_Signal_Case();

//-------------------------- Open order ALX signal processing ------------/

//   Process_SBS_ALX_Open_Case();
   
//-------------------------- Close order ALX signal processing -----------/

//   Process_SBS_ALX_Close_Case();

//-------------------------- Process_SM_Basic_Entry_Case -----------------/

//   Process_SM_Basic_Entry_Case();         // Check SM Basic Entry Rules
//   Process_SM_Extra_Band_Entry_Case();    // Check SM Extra Band (bandUp > 50; bandDown < 50) Entry Rules

//-------------------------- Process Series II Entry Cases ---------------/
/*
   Process_S2_Entry_Case_01();      // Described by BUY CASE #1
   Process_S2_Entry_Case_02();      // Described by BUY CASE #2
   Process_S2_Entry_Case_03();      // Described by BUY CASE #3
   Process_S2_Entry_Case_04();      // Described by BUY CASE #4
   Process_S2_Entry_Case_05();      // Described by BUY CASE #5
   Process_S2_Entry_Case_06();      // Described by BUY CASE #6
   
   Process_S2_Entry_Case_07();      // Described by SELL CASE #1
   Process_S2_Entry_Case_08();      // Described by SELL CASE #2
   Process_S2_Entry_Case_09();      // Described by SELL CASE #3
   Process_S2_Entry_Case_10();      // Described by SELL CASE #6
   Process_S2_Entry_Case_11();      // Described by SELL CASE #7
   Process_S2_Entry_Case_12();      // Described by SELL CASE #8
   Process_S2_Entry_Case_13();      // Described by SELL CASE #4
*/
//-------------------------- Process_SM_Basic_Exit_Cases -----------------/

//   Process_SM_APB_Basic_Exit_Case();
//   Process_SM_PAC_Basic_Exit_Case();
//   Process_SM_TDI_Basic_Exit_Case();

//-------------------------- Process Series II BAR Entry Cases -----------/

//   Process_S2_Case_Bar1_Much_Shorter();         // 311/411
//   Process_S2_Case_Bar1_Reversed();             // 312/412
//   Process_S2_Case_Bar2_Reversed();             // 313/413
//   Process_S2_Case_No_Bars_Reversed();          // 314/414
   
//   Process_S2_Case_After_Much_Shorter();        // 321/421

//-------------------------- Process Series II BAR Exit Cases ------------/

/////   Process_SM_Basic_Exit_Case();

/////   Process_S2_Case_Bar1_Much_Shorter_Exit();
/////   Process_S2_Case_Bar2_Reversed_Exit();

//-------------------------- Process Series II TDI Entry Cases -----------/

//   Process_S2_Case_TDI_Cross_Signal_bandMiddle();

///   Process_S2_ALX1_Case_01_TDI_Strong();
///   Process_S2_ALX1_Case_02_TDI_Strong();

//   Process_S2_Case_TDI_Weak();

///   Process_S2_Case_TDI_Exit();
///   Process_S2_ALX1_Case_TDI_Exit_Conditional();

//   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_PROFILE)
//   {
//      Process_S2_ALX1_Case_M15_H1_TDI_Strong();
//     Process_S2_ALX1_Case_M15_H1_TDI_Exit();
//   }
/*
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_4H_PROFILE)
   {
//      Process_S2_Case_TDI_PS_Strong();
//      Process_S2_Case_TDI_PS_Strong_Fake();
      
//      Process_S2_Case_TDI_PB_Strong();          // H4 PriceLine cross band (Up or Down) 332/432
      
//++      Process_S2_Case_TDI_MDL_PB_Strong();      // H1 PriceLine cross band (Up or Down) 333/433

//      Process_S2_Case_TDI_MDL_PL_Strong();

//      Process_S2_Case_WCCI_H1NT_H4NT();         // WCCI strong signal 334/434 (H1 new trend, H4 new trend)
//      Process_S2_Case_WCCI_H1OT_H4OT();         // WCCI strong signal 335/435 (H1 old trend, H4 old trend)
//      Process_S2_Case_WCCI_H1OT_H4NT();         // WCCI strong signal 336/436 (H1 old trend, H4 new trend)
//      Process_S2_Case_WCCI_H1NT_H4OT();         // WCCI strong signal 337/437 (H1 new trend, H4 old trend)

//++      Process_S2_Case_ASCT4_PIVOT_Strong();     // ASCT(4 signal) + PIVOT 341/441
//++      Process_S2_Case_ASCT3_PIVOT_Strong();     // ASCT(3 signal) + PIVOT 342/442
      
//++      Process_S2_Case_XST_Strong();             // XST signal 343/443
      
//      Process_S2_Case_XST_3Sig();               // XST signal 344/444
      
      Process_S2_Case_TMA();               // TMA signal 345/445
      
   }

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
      )
   {
      Process_S2_M1_Case_TMA();           // TMA signal 355/455
   }
   
//   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_GMTS_PROFILE)
//   {
//      Process_S2_Case_GMTS_Strong();
//      Process_S2_Case_GMTS_Strong_Exit();
//   }

//---------------------- Process_ISLANDS_Cases ---------------------------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
      )
   {
      Process_ISLANDS_Cases();             // ISLANDS signals 365/465
   }
*/
//---------------------- Process_Chart_Pattern_Cases ---------------------/
   
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
//      Process_Chart_Pattern_Cases();

//      Process_Chart_Pattern_55_Cases();          // 301/401
//      Process_Chart_Pattern_Combo_Cases();       // 302/402
//      Process_Chart_Pattern_KC_Trend_Cases();    // 303/403
//      Process_Chart_Pattern_KM_Cases();

/*
      if (Period() == PERIOD_M1)
      {
         Process_Pattern_Impulse_Cases();             // 304-309/404-409
      }
*/
      
//      if (Period() == PERIOD_M5)
//      {
//         Process_Pattern_ALX_123_Cases();             // 310/410
//      }

      SBS_Process_Triangle_Cases();                    // CASE 311/411 - 1,2
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_SM_Basic_Entry_Case =================/

void     Process_SM_Basic_Entry_Case()
{
//-------------------------- Check for SELL (Short) ----------------------/

   if (
         (alx_apb_signal.HA_Close < alx_pac_signal.LMA) &&
         (alx_pac_signal.trend == SBS_ALX_TREND_DOWN) &&
         (alx_tdi_signal.Short_Basic_Entry)
//         (alx_tdi_signal.Short_Basic_Entry_Consider_01) &&
//         (!alx_tdi_signal.Short_Basic_Entry_Avoid_01)
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,122,1);
      return;
   }

//-------------------------- Check for BUY (Long) ------------------------/

   if (
         (alx_apb_signal.HA_Close > alx_pac_signal.HMA) &&
         (alx_pac_signal.trend == SBS_ALX_TREND_UP) &&
         (alx_tdi_signal.Long_Basic_Entry) 
//         (alx_tdi_signal.Long_Basic_Entry_Consider_01) &&
//         (!alx_tdi_signal.Long_Basic_Entry_Avoid_01)
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,222,1);
      return;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_SM_Extra_Band_Entry_Case ============/

void     Process_SM_Extra_Band_Entry_Case()
{
//-------------------------- Check for SELL (Short) ----------------------/

   if (
         (alx_apb_signal.HA_Close < alx_pac_signal.LMA) &&
         (alx_pac_signal.trend == SBS_ALX_TREND_DOWN) &&
         (alx_tdi_signal.Short_Extra_Band_Entry)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,123,1);
      return;
   }

//-------------------------- Check for BUY (Long) ------------------------/

   if (
         (alx_apb_signal.HA_Close > alx_pac_signal.HMA) &&
         (alx_pac_signal.trend == SBS_ALX_TREND_UP) &&
         (alx_tdi_signal.Long_Extra_Band_Entry) 
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,223,1);
      return;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_SM_Basic_Exit_Case ==================/

void     Process_SM_Basic_Exit_Case()
{
//-------------------------- Check for Close BUY (Long Exit) -------------/

   if (
//--- Process_SM_APB_Basic_Exit_Case ---/

         (alx_apb_signal.Long_Basic_Exit) &&

//--- Process_SM_PAC_Basic_Exit_Case ---/

         (alx_pac_signal.Long_Basic_Exit) &&
         
//--- Process_SM_TDI_Basic_Exit_Case ---/
        
         (alx_tdi_signal.Long_Basic_Exit) &&
         
//--- VLT ---/

         (alx_vlt_signal.diff < ((-0.33) * alx_vlt_signal.threshold)) &&

//--- TDI ---/

         (alx_tdi_signal.bandMiddle < alx_tdi_LevelMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandUp() < tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine()) &&
         (alx_tdi_signal.rsiSignalLine < (alx_tdi_LevelUp - 2))
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,302,2);
      return;
   }

//-------------------------- Check for Close SELL (Short Exit) -----------/

   if (
//--- Process_SM_APB_Basic_Exit_Case ---/

         (alx_apb_signal.Short_Basic_Exit) &&

//--- Process_SM_PAC_Basic_Exit_Case ---/

         (alx_pac_signal.Short_Basic_Exit) &&
         
//--- Process_SM_TDI_Basic_Exit_Case ---/
        
         (alx_tdi_signal.Short_Basic_Exit) &&

//--- VLT ---/

         (alx_vlt_signal.diff < ((-0.33) * alx_vlt_signal.threshold)) &&

//--- TDI ---/

         (alx_tdi_signal.bandMiddle > alx_tdi_LevelMiddle) &&
         (tdi_rsiPriceLine_CROSS_tdi_bandDown() < tdi_rsiPriceLine_CROSS2_tdi_rsiSignalLine()) &&
         (alx_tdi_signal.rsiSignalLine > (alx_tdi_LevelDown + 2))
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,402,2);
      return;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_SM_APB_Basic_Exit_Case ==============/

void     Process_SM_APB_Basic_Exit_Case()
{
//-------------------------- Check for Close BUY (Long Exit) -------------/

   if (
         (alx_apb_signal.Long_Basic_Exit)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,302,1);
      return;
   }

//-------------------------- Check for Close SELL (Short Exit) -----------/

   if (
         (alx_apb_signal.Short_Basic_Exit)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,402,1);
      return;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_SM_PAC_Basic_Exit_Case ==============/

void     Process_SM_PAC_Basic_Exit_Case()
{
//-------------------------- Check for Close BUY (Long Exit) -------------/

   if (
         (alx_pac_signal.Long_Basic_Exit)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,303,1);
      return;
   }

//-------------------------- Check for Close SELL (Short Exit) -----------/

   if (
         (alx_pac_signal.Short_Basic_Exit)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,403,1);
      return;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Process_SM_TDI_Basic_Exit_Case ==============/

void     Process_SM_TDI_Basic_Exit_Case()
{
//-------------------------- Check for Close BUY (Long Exit) -------------/

   if (
         (alx_tdi_signal.Long_Basic_Exit)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,304,1);
      return;
   }

//-------------------------- Check for Close SELL (Short Exit) -----------/

   if (
         (alx_pac_signal.Short_Basic_Exit)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,404,1);
      return;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================== Reset_SBS_ALX_Signal_Case ===================/

void     Reset_SBS_ALX_Signal_Case()
{
//-------------------------- Reset SBS ALX Signal Data -------------------/

   sbs_alx_signal.signal         = NO_ORDER;
   sbs_alx_signal.case_number    = 0;
   sbs_alx_signal.case_subnumber = 0;

//------------------------------------------------------------------------/

   return;
}

//========================== Process_SBS_ALX_Open_Case ===================/

void     Process_SBS_ALX_Open_Case()
{
//-------------------------- Check for SELL ------------------------------/

   if (
         (alx_tdi_signal.trend == SELL_ORDER) &&
         (alx_ft_signal.trend == SELL_ORDER)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,121,1);
      return;
   }

//-------------------------- Check for BUY -------------------------------/

   if (
         (alx_tdi_signal.trend == BUY_ORDER) &&
         (alx_ft_signal.trend == BUY_ORDER)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,221,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_SBS_ALX_Close_Case ==================/

void     Process_SBS_ALX_Close_Case()
{
//-------------------------- Check for CLOSE_SELL ------------------------/

   if (
         (alx_tdi_signal.trend == CLOSE_SELL_ORDER) &&
         (alx_ft_signal.trend == BUY_ORDER)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_SELL_ORDER,301,1);
      return;
   }

//-------------------------- Check for CLOSE_BUY -------------------------/

   if (
         (alx_tdi_signal.trend == CLOSE_BUY_ORDER) &&
         (alx_ft_signal.trend == SELL_ORDER)
      )
   {
      Set_SBS_ALX_Signal(CLOSE_BUY_ORDER,401,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Set_SBS_ALX_Signal ==========================/

void     Set_SBS_ALX_Signal(int order_t, int case_no, int case_subno)
{
//========================= SBS_GLOBAL_EXPERT_PATTERNS_PROFILE ===========/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
//--- Reset sbs_alx_signal data ---/

      sbs_alx_signal.signal         = NO_ORDER;
      sbs_alx_signal.case_number    = 0;
      sbs_alx_signal.case_subnumber = 0;

//--- Check Post Conditions ---/

      Set_SBS_P_Conditions_Data(order_t,case_no,case_subno);

//--- Check Post Conditions Gap State ---/
      
      if (
            (sbs_alx_signal.sbs_post_condition.action == SBS_P_CONDITION_ACCEPTED) &&
            (sbs_alx_signal.sbs_post_condition.type   == SBS_P_CONDITION_TYPE_DEFINED)
         )
      {
         SBS_Get_P_Conditions_Gap_State();
      }

//--- Set sbs_alx_signal data ---/
      
      if (
            (sbs_alx_signal.sbs_post_condition.action == SBS_P_CONDITION_ACCEPTED) &&
            (sbs_alx_signal.sbs_post_condition.type   == SBS_P_CONDITION_TYPE_DEFINED)
         )
      {
         sbs_alx_signal.signal         = order_t;
         sbs_alx_signal.case_number    = case_no;
         sbs_alx_signal.case_subnumber = case_subno;
      }

//------------------------------------------------------------------------/

      return;
   }

//========================= OTHERS =======================================/

//------------------------- Check if ISLANDS Profile Activated -----------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
      )
   {
      Set_SBS_ALX_ILND_Order_Profile(order_t, case_no, case_subno);
   }
   
//------------------------- Process other profiles -----------------------/

   if (sbs_alx_signal.signal == NO_ORDER)
   {

//------------------------- Set sbs_alx_signal ---------------------------/

      sbs_alx_signal.signal         = order_t;
      sbs_alx_signal.case_number    = case_no;
      sbs_alx_signal.case_subnumber = case_subno;

//------------------------- Set open_order_profile -----------------------/

//--- General Parameters ---/
/*
      if (
            (order_status == NO_ORDER) ||
            (
               (order_status == SELL_ORDER) &&
               (order_t == BUY_ORDER)
            ) ||
            (
               (order_status == BUY_ORDER) &&
               (order_t == SELL_ORDER)
            )
         )
      {

         open_order_profile.order_time     = Time[0];

         open_order_profile.signal         = sbs_alx_signal.signal;
         open_order_profile.case_number    = sbs_alx_signal.case_number;
         open_order_profile.case_subnumber = sbs_alx_signal.case_subnumber;
         
         open_order_profile.order_price    = Close[0];
*/
//--- Stoploss parameters ---/

//--- XST 3Sig sl parameters---/
         
//         open_order_profile.sl_points         = 10;         // xst stoploss parameters profile
//         open_order_profile.sl_primary_shift  = 10;
//         open_order_profile.sl_primary_points = 3;

//--- SELL_ORDER processing ---/
/*  
         if (order_t == SELL_ORDER)
         {
          
            if (
                  (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) &&
                  (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
               )
            {
               if (alx_xst_signal.val_H1 < alx_xst_signal.val_H1_60_34)
               {
                  sl_candidate         = alx_xst_signal.val_H1;
                  next_to_sl_candidate = alx_xst_signal.val_H1_60_34;
               }
               else
               {
                  sl_candidate         = alx_xst_signal.val_H1_60_34;
                  next_to_sl_candidate = alx_xst_signal.val_H1;
               }
            }
            
            if (
                  (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) &&
                  (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
               )
            {
               sl_candidate         = alx_xst_signal.val_H1;
               next_to_sl_candidate = sl_candidate;
            }
            
            if (
                  (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) &&
                  (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
               )
            {
               sl_candidate         = alx_xst_signal.val_H1_60_34;
               next_to_sl_candidate = sl_candidate;
            }
            
            
            sl_candidate         = alx_xst_signal.val_H1_40 + (10 * n_Point);
            next_to_sl_candidate = sl_candidate;

            if (
                  ((next_to_sl_candidate - alx_xst_signal.val_H1_40) < (5 * n_Point))
               )
            {
               sl_candidate = next_to_sl_candidate + (10 * n_Point);
            }
            
            open_order_profile.sl_value = sl_candidate;

            open_order_profile.sl_value = Close[0] + (StopLoss_FIX * n_Point); // Fix SL
         }

//--- BUY_ORDER processing ---/

         if (order_t == BUY_ORDER)
         {

            if (
                  (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) &&
                  (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
               )
            {
               if (alx_xst_signal.val_H1 > alx_xst_signal.val_H1_60_34)
               {
                  sl_candidate         = alx_xst_signal.val_H1;
                  next_to_sl_candidate = alx_xst_signal.val_H1_60_34;
               }
               else
               {
                  sl_candidate         = alx_xst_signal.val_H1_60_34;
                  next_to_sl_candidate = alx_xst_signal.val_H1;
               }
            }
            
            if (
                  (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) &&
                  (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
               )
            {
               sl_candidate         = alx_xst_signal.val_H1;
               next_to_sl_candidate = sl_candidate;
            }
            
            if (
                  (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) &&
                  (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
               )
            {
               sl_candidate         = alx_xst_signal.val_H1_60_34;
               next_to_sl_candidate = sl_candidate;
            }
            
            
            sl_candidate         = alx_xst_signal.val_H1_40 - (10 * n_Point);
            next_to_sl_candidate = sl_candidate;
            
            if ((alx_xst_signal.val_H1_40 - next_to_sl_candidate) < (5 * n_Point))
            {
               sl_candidate = next_to_sl_candidate - (10 * n_Point);
            }
            
            open_order_profile.sl_value = sl_candidate;


            open_order_profile.sl_value = Close[0] - (StopLoss_FIX * n_Point);    // Fix SL
         }
      }
*/
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_01 ====================/

void     Process_S2_Entry_Case_01()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&
         
         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&
         
         (alx_tdi_signal.rsiSignalLine < alx_tdi_LevelUp) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_LevelMiddle < alx_tdi_signal.rsiPriceLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value > alx_rf_signal.Upper_Limit) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,131,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&
         
         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&
         
         (alx_tdi_signal.rsiSignalLine > alx_tdi_LevelDown) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_LevelMiddle > alx_tdi_signal.rsiPriceLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value < alx_rf_signal.Lower_Limit) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,231,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_02 ====================/

void     Process_S2_Entry_Case_02()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&
         
         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&
         
         (alx_tdi_signal.bandMiddle < alx_tdi_LevelUp) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_LevelMiddle < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandDown) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelDown) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.Linear_Value < alx_rf_signal.Lower_Limit) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,132,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&
         
         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandMiddle > alx_tdi_LevelDown) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_LevelMiddle > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandUp) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelUp) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.Linear_Value > alx_rf_signal.Upper_Limit) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,232,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_03 ====================/

void     Process_S2_Entry_Case_03()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&
         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         
         (alx_tdi_signal.rsiSignalLine < alx_tdi_LevelUp) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_LevelDown < alx_tdi_signal.bandMiddle) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,133,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&
         
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&
         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         
         (alx_tdi_signal.rsiSignalLine > alx_tdi_LevelDown) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_LevelUp > alx_tdi_signal.bandMiddle) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value <= alx_rf_signal.Upper_Limit) &&
         (alx_rf_signal.Linear_Value >= alx_rf_signal.Lower_Limit) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,233,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_04 ====================/

void     Process_S2_Entry_Case_04()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&
         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandDown) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_LevelDown < alx_tdi_signal.rsiPriceLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,134,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&
         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandUp) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_LevelUp > alx_tdi_signal.rsiPriceLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,234,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_05 ====================/

void     Process_S2_Entry_Case_05()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&
         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_signal.rsiSignalLine < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_LevelDown) &&

         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.bandDown < alx_tdi_signal.rsiPriceLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,135,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&
         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&
         
         (alx_tdi_signal.rsiSignalLine > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_LevelUp) &&

         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.bandUp > alx_tdi_signal.rsiPriceLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,235,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_06 ====================/

void     Process_S2_Entry_Case_06()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,136,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&
         
         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,236,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_07 ====================/

void     Process_S2_Entry_Case_07()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_LevelDown < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_LevelUp) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value < alx_rf_signal.Lower_Limit) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,137,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_LevelUp > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_LevelDown) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value > alx_rf_signal.Upper_Limit) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,237,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_08 ====================/

void     Process_S2_Entry_Case_08()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_LevelMiddle < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.val > alx_vlt_signal.threshold)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,138,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_LevelMiddle > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.val > alx_vlt_signal.threshold)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,238,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_09 ====================/

void     Process_S2_Entry_Case_09()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_LevelMiddle < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_LevelUp) &&

//--- RF ---/

         (alx_rf_signal.trend == SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_vlt_signal.val > alx_vlt_signal.threshold)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,139,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_LevelMiddle > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_LevelDown) &&

//--- RF ---/

         (alx_rf_signal.trend == SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,239,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_10 ====================/

void     Process_S2_Entry_Case_10()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.S2_G_Cross_B_SELL_Rule) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_LevelDown < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_LevelUp) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
         (
//            (alx_vlt_signal.trend == SBS_ALX_TREND_FLAT) ||
            (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
         )
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,140,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.S2_G_Cross_B_BUY_Rule) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

//         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_LevelUp > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_LevelDown) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (
//            (alx_vlt_signal.trend == SBS_ALX_TREND_FLAT) ||
            (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
         )
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,240,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_11 ====================/

void     Process_S2_Entry_Case_11()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
         (
            (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) ||
            (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
         )
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,141,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
         (
            (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) ||
            (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
         )
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,241,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_12 ====================/

void     Process_S2_Entry_Case_12()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&

         (alx_tdi_LevelDown < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle < alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_LevelMiddle) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&
         (alx_rf_signal.Linear_Value < alx_rf_signal.Lower_Limit) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,142,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandDown < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_LevelUp > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&
         (alx_tdi_signal.bandMiddle > alx_tdi_signal.rsiPriceLine) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_LevelMiddle) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&
         (alx_rf_signal.Linear_Value < alx_rf_signal.Upper_Limit) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,242,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//========================== Process_S2_Entry_Case_13 ====================/

void     Process_S2_Entry_Case_13()
{
//-------------------------- Check for SELL -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == SELL_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceDn) && 

//--- TDI ---/

         (alx_tdi_signal.bandDown > alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandDown < alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandUp > alx_tdi_LevelUp) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_DOWN) &&
         
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.bandDown) &&
         (alx_tdi_signal.rsiPriceLine < alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine < alx_tdi_signal.bandMiddle) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_DOWN) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(SELL_ORDER,143,1);
      return;
   }
   
//-------------------------- Check for BUY -------------------------------/

   if (
//--- FT_01 ---/

         (alx_ft_signal.trend == BUY_ORDER) &&

//--- DSR ---/
         
         (alx_dsr_signal.BounceUp) && 

//--- TDI ---/

         (alx_tdi_signal.bandUp < alx_tdi_LevelMiddle) &&
         (alx_tdi_signal.bandUp > alx_tdi_LevelDown) &&
         

         (alx_tdi_signal.bandDown < alx_tdi_LevelDown) &&

         (alx_tdi_signal.bandMiddle_trend == SBS_ALX_TREND_UP) &&

         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.bandUp) &&
         (alx_tdi_signal.rsiPriceLine > alx_tdi_signal.rsiSignalLine) &&
         (alx_tdi_signal.rsiSignalLine > alx_tdi_signal.bandMiddle) &&

//--- RF ---/

//         (alx_rf_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_rf_signal.direction == SBS_ALX_TREND_UP) &&

//--- VLT ---/
         
//         (alx_vlt_signal.trend != SBS_ALX_TREND_FLAT) &&
         (alx_vlt_signal.direction == SBS_ALX_TREND_UP)
      )
   {
      Set_SBS_ALX_Signal(BUY_ORDER,243,1);
      return;
   }

//------------------------------------------------------------------------/

   return;
}

//===================== eof sbs_order_alx_cases_lbr.mqh ==================/