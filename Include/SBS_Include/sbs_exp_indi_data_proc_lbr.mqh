//================== sbs_exp_indi_data_proc_lbr.mqh =======================/

//============================ Analyze_SBS_Indi_Data ======================/

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

//   Get_SBS_RMI_RSX_State();

//--------------------------- Get DSS of MACD State -----------------------/

//   Get_SBS_DSS_of_MACD_State();

//--------------------------- Reset FT Series Order Signal ----------------/

//   sbs_indi_ft_series_order_signal.signal         = NO_ORDER;
//   sbs_indi_ft_series_order_signal.case_number    = 0;
//   sbs_indi_ft_series_order_signal.case_subnumber = 0;

//--------------------------- Get FT Series State (Default 3-rd Signal) ---/

//   Get_SBS_FT_Series_State();
   
//--------------------------- Get FT Series State (Extra 4-th Signal) -----/

//   Get_SBS_FT_Series_Extra_State();

//--------------------------- Get Indis Positions -------------------------/

//   Get_SBS_Indis_Position();

//--------------------------- Get FT Series Order Type & Case -------------/

//   Get_SBS_FT_Series_Order_Case();

//--------------------------- Get_SBS_Order_Extra_Data --------------------/

//   Get_SBS_Order_Extra_Data();

//--------------------------- Get_SBS_FT_ZZL_State ------------------------/

//   Get_SBS_FT_ZZL_State();

//--------------------------- Get_SBS_FT_ZZL_Order_Case -------------------/

//   Get_SBS_FT_ZZL_Order_Case();

//--------------------------- Get SBS ALX State ---------------------------/

   Get_SBS_ALX_State();             // Semafors

//---------------------- SBS_Get_Chart_Pattern ----------------------------/
   
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
//      SBS_Get_Pattern_KC_Trend_Description();

      SBS_Get_Chart_Pattern_Description();
      
//      SBS_Get_Chart_Pattern_55_Description();
//      SBS_Get_Pattern_Condition_Description();

      SBS_Get_Chart_Triangle_Description();        // TRIANGLE !!!
      
   }

//--------------------------- Get_SBS_ALX_Order_Case ----------------------/

   Get_SBS_ALX_Order_Case();

//-------------------------------------------------------------------------/

   return;
}

//=========================== Get_SBS_Indis_Position() ====================/

void     Get_SBS_Indis_Position()
{
//   Get_iR1iR2_Position();
//   Get_ha4iR2_Position();
//   Get_ha2ha3_Position();

   Get_HA_Position();
   Get_FT3_Levels_HA_Position();
   
//-------------------------------------------------------------------------/

   return;
}

//=========================== Get_SBS_FT_Series_Order_Case ================/

void     Get_SBS_FT_Series_Order_Case()
{
//--------------------------- Process SELL States -------------------------/

   if (sbs_indi_ft_series_state.signal == SELL_ORDER)
   {
      sbs_indi_ft_series_order_signal.signal         = SELL_ORDER;
      sbs_indi_ft_series_order_signal.case_number    = 0;
      sbs_indi_ft_series_order_signal.case_subnumber = 0;
      
      switch (sbs_indi_ft_series_state.state)
      {
//-------------------------- Default cases (3-rd signal) ------------------/

         case SBS_FT_SERIES_RGLR_012:        {
                                                sbs_indi_ft_series_order_signal.case_number    = 101;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_RGLR_2MXD:       {
                                                sbs_indi_ft_series_order_signal.case_number    = 102;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_012:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 111;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_2MXD:         {
                                                sbs_indi_ft_series_order_signal.case_number    = 112;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_0_2:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 113;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_012:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 121;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_2MXD:    {
                                                sbs_indi_ft_series_order_signal.case_number    = 122;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_0_2:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 123;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_FAKE_OL_2:  {
                                                sbs_indi_ft_series_order_signal.case_number    = 131;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }

//-------------------------- Extra cases (4-th signal) --------------------/

         case SBS_FT_SERIES_RGLR_013:        {
                                                sbs_indi_ft_series_order_signal.case_number    = 101;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_RGLR_3MXD:       {
                                                sbs_indi_ft_series_order_signal.case_number    = 102;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_013:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 111;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_3MXD:         {
                                                sbs_indi_ft_series_order_signal.case_number    = 112;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_0_3:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 113;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_013:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 121;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_3MXD:    {
                                                sbs_indi_ft_series_order_signal.case_number    = 122;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_0_3:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 123;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_FAKE_OL_3:  {
                                                sbs_indi_ft_series_order_signal.case_number    = 131;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
      }
   
   }

//--------------------------- Process BUY States --------------------------/

   if (sbs_indi_ft_series_state.signal == BUY_ORDER)
   {
      sbs_indi_ft_series_order_signal.signal         = BUY_ORDER;
      sbs_indi_ft_series_order_signal.case_number    = 0;
      sbs_indi_ft_series_order_signal.case_subnumber = 0;
      
      switch (sbs_indi_ft_series_state.state)
      {
//-------------------------- Default cases (3-rd signal) ------------------/

         case SBS_FT_SERIES_RGLR_012:        {
                                                sbs_indi_ft_series_order_signal.case_number    = 201;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_RGLR_2MXD:       {
                                                sbs_indi_ft_series_order_signal.case_number    = 202;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_012:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 211;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_2MXD:         {
                                                sbs_indi_ft_series_order_signal.case_number    = 212;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_0_2:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 213;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_012:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 221;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_2MXD:    {
                                                sbs_indi_ft_series_order_signal.case_number    = 222;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_0_2:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 223;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_FAKE_OL_2:  {
                                                sbs_indi_ft_series_order_signal.case_number    = 231;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 1;
                                                break;
                                             }

//-------------------------- Extra cases (4-th signal) --------------------/

         case SBS_FT_SERIES_RGLR_013:        {
                                                sbs_indi_ft_series_order_signal.case_number    = 201;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_RGLR_3MXD:       {
                                                sbs_indi_ft_series_order_signal.case_number    = 202;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_013:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 211;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_3MXD:         {
                                                sbs_indi_ft_series_order_signal.case_number    = 212;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_OL_0_3:          {
                                                sbs_indi_ft_series_order_signal.case_number    = 213;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_013:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 221;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_3MXD:    {
                                                sbs_indi_ft_series_order_signal.case_number    = 222;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_OL_0_3:     {
                                                sbs_indi_ft_series_order_signal.case_number    = 223;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
         case SBS_FT_SERIES_POST_FAKE_OL_3:  {
                                                sbs_indi_ft_series_order_signal.case_number    = 231;
                                                sbs_indi_ft_series_order_signal.case_subnumber = 2;
                                                break;
                                             }
      }
   
   }

//-------------------------------------------------------------------------/

   return;
}

//=========================== Get_SBS_FT_Series_Extra_State ===============/

void     Get_SBS_FT_Series_Extra_State()
{
int      i;
      
   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)     return;
   
//--------------------------- Pre Processing ------------------------------/

   for (i = 0; i < SBS_INDI_BARS_NO; i++)
   {
      sbs_indi_ft_buy_data[2][i]  = sbs_indi_ft_buy_data[3][i];
      sbs_indi_ft_sell_data[2][i] = sbs_indi_ft_sell_data[3][i];
   }

//--------------------------- Processing ----------------------------------/

   Get_SBS_FT_Series_State();

//--------------------------- Post Processing -----------------------------/

   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)
   {
      switch (sbs_indi_ft_series_state.state)
      {
         case SBS_FT_SERIES_RGLR_012:       {sbs_indi_ft_series_state.state = SBS_FT_SERIES_RGLR_013;       break;}
         case SBS_FT_SERIES_RGLR_2MXD:      {sbs_indi_ft_series_state.state = SBS_FT_SERIES_RGLR_3MXD;      break;}
         case SBS_FT_SERIES_OL_012:         {sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_013;         break;}
         case SBS_FT_SERIES_OL_2MXD:        {sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_3MXD;        break;}
         case SBS_FT_SERIES_OL_0_2:         {sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_0_3;         break;}
         case SBS_FT_SERIES_POST_OL_012:    {sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_013;    break;}
         case SBS_FT_SERIES_POST_OL_2MXD:   {sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_3MXD;   break;}
         case SBS_FT_SERIES_POST_OL_0_2:    {sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_0_3;    break;}
         case SBS_FT_SERIES_POST_FAKE_OL_2: {sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_FAKE_OL_3; break;}
      }
   
      sbs_indi_ft_series_state.signal_04_bar   = sbs_indi_ft_series_state.signal_03_bar;
      sbs_indi_ft_series_state.signal_04_value = sbs_indi_ft_series_state.signal_03_value;
      
      sbs_indi_ft_series_state.signal_03_bar   = SBS_FT_SERIES_BAR_NO_VALUE;
      sbs_indi_ft_series_state.signal_03_value = EMPTY_VALUE;
   }

//-------------------------------------------------------------------------/

   return;
}

//=========================== Get_SBS_FT_Series_State =====================/

void     Get_SBS_FT_Series_State()
{
//--------------------------- Reset FT Series State -----------------------/

   Reset_SBS_FT_Series_State(sbs_indi_ft_series_state);

//--------------------------- Check "Regular" FT Series State -------------/

   Get_SBS_FT_Series_Regular_State(0,sbs_indi_ft_series_state);
   
   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)     return;

//--------------------------- Check "Mixed" FT Series State ---------------/

   Get_SBS_FT_Series_Mixed_State(0,sbs_indi_ft_series_state);
   
   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)     return;

//--------------------------- Check "OneLine Regular" FT Series State -----/
// To Regular embedded

//--------------------------- Check "OneLine Short (0_2)" FT Series State -/

   Get_SBS_FT_Series_OneLine_Short_State(0,sbs_indi_ft_series_state);
   
//--------------------------- Check "Post (After) OneLine" FT Series State /

   Get_SBS_FT_Series_Post_OL_State(0,sbs_indi_ft_series_state);
   
   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)     return;

//--------------------------- Check "Post_Fake" FT Series State -----------/

   Get_SBS_FT_Series_Post_Fake_OL_State(0,sbs_indi_ft_series_state);
   
   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)     return;

//--------------------------- Check "Holiday" FT Series State -------------/

//-------------------------------------------------------------------------/

   return;
}

//=========================== Reset FT Series State =======================/

void     Reset_SBS_FT_Series_State(sbs_indi_ft_series_state_struct &ft_series_state)
{
   ft_series_state.signal          = NO_ORDER;
   ft_series_state.state           = SBS_FT_SERIES_NO_STATE;
   
   ft_series_state.signal_01_bar   = SBS_FT_SERIES_BAR_NO_VALUE;
   ft_series_state.signal_01_value = EMPTY_VALUE;
   ft_series_state.signal_02_bar   = SBS_FT_SERIES_BAR_NO_VALUE;
   ft_series_state.signal_02_value = EMPTY_VALUE;
   ft_series_state.signal_03_bar   = SBS_FT_SERIES_BAR_NO_VALUE;
   ft_series_state.signal_03_value = EMPTY_VALUE;
   ft_series_state.signal_04_bar   = SBS_FT_SERIES_BAR_NO_VALUE;
   ft_series_state.signal_04_value = EMPTY_VALUE;

//-------------------------------------------------------------------------/

   return;
}

//=========================== Check "Post Fake" FT Series State ===========/

void     Get_SBS_FT_Series_Post_Fake_OL_State(int start_bar, 
                                               sbs_indi_ft_series_state_struct &ft_series_state)
{
int      i;

int      i_ol_candidate      = -1;
int      i_post_ol_candidate = -1;

int      post_ol_candidate_state = SBS_FT_SERIES_NO_STATE;

//-------------------- Buy (SBS_FT_SERIES_POST_FAKE_OL_2) -----------------/

   if (
         (sbs_indi_ft_buy_data[0][start_bar] != EMPTY_VALUE) ||   // check for post fake candidate
         (sbs_indi_ft_buy_data[1][start_bar] != EMPTY_VALUE)
      )
   {
      for (i = start_bar; i < (sbs_ft_series_ol_post_fake_gap + sbs_ft_series_ol_gap + start_bar); i++)
      {
         if (                                                     // check for potential OL signal
               (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE)
            )
         {
            i_ol_candidate = i;
            break;
         }

      } //for(i = ...
      
      if (i_ol_candidate != -1)           // OL candidate was found
      {
      
//-------------------- Check for OL signal ----------------------------------/
      
         Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
         Get_SBS_FT_Series_Regular_State(i_ol_candidate,sbs_indi_ft_series_post_state); // check OL_012
   
         if (
               (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_012) &&
               (sbs_indi_ft_series_post_state.signal == BUY_ORDER)
            )
         {
            post_ol_candidate_state = SBS_FT_SERIES_POST_OL_012;   // Post 012 signal found
         }
         else
         {
            Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
            Get_SBS_FT_Series_OneLine_Short_State(i_ol_candidate,sbs_indi_ft_series_post_state); // check OL_0_2
               
            if (
                  (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_0_2) &&
                  (sbs_indi_ft_series_post_state.signal == BUY_ORDER)
               )
            {
               post_ol_candidate_state = SBS_FT_SERIES_POST_OL_0_2;   // Post OL_0_2 signal found
            }
            else
            {
               Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
               Get_SBS_FT_Series_Mixed_State(i_ol_candidate,sbs_indi_ft_series_post_state);   // check OL_2MXD
               
               if (
                     (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_2MXD) &&
                     (sbs_indi_ft_series_post_state.signal == BUY_ORDER)
                  )
               {
                  post_ol_candidate_state = SBS_FT_SERIES_POST_OL_2MXD;   // Post OL_2MXD signal found
               }
            }
         }

//-------------------- Check for Post OL signal ---------------------------/

         if (post_ol_candidate_state != SBS_FT_SERIES_NO_STATE)
         {
            for (i = i_ol_candidate; i < start_bar; i++)
            {
               if (                    // check for potential Post OL signal
                     (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE) ||
                     (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE)
                  )
               {
                  i_post_ol_candidate = i;
                  break;
               }
            }
            
            if (i_post_ol_candidate != -1)         // fake ol was detected
            {
               if ((i_post_ol_candidate - start_bar) <= sbs_ft_series_ol_post_fake_gap)
               {
                  sbs_indi_ft_series_state.state  = SBS_FT_SERIES_POST_FAKE_OL_2;
                  ft_series_state.signal          = BUY_ORDER;
            
                  ft_series_state.signal_01_bar   = start_bar;
                  ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][start_bar];

                  ft_series_state.signal_02_bar   = start_bar;
                  ft_series_state.signal_02_value = sbs_indi_ft_buy_data[1][start_bar];
               }
            }
         }
      
      } //if (i_ol_candidate != -1)
      
   }

//--------------------------- Check FT Series State -----------------------/

   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)  return;

//-------------------- Sell (SBS_FT_SERIES_POST_FAKE_OL_2) ----------------/

   if (
         (sbs_indi_ft_sell_data[0][start_bar] != EMPTY_VALUE) ||   // check for post fake candidate
         (sbs_indi_ft_sell_data[1][start_bar] != EMPTY_VALUE)
      )
   {
      for (i = start_bar; i < (sbs_ft_series_ol_post_fake_gap + sbs_ft_series_ol_gap + start_bar); i++)
      {
         if (                                                     // check for potential OL signal
               (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE)
            )
         {
            i_ol_candidate = i;
            break;
         }

      } //for(i = ...
      
      if (i_ol_candidate != -1)           // OL candidate was found
      {
      
//-------------------- Check for OL signal ----------------------------------/
      
         Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
         Get_SBS_FT_Series_Regular_State(i_ol_candidate,sbs_indi_ft_series_post_state); // check OL_012
   
         if (
               (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_012) &&
               (sbs_indi_ft_series_post_state.signal == SELL_ORDER)
            )
         {
            post_ol_candidate_state = SBS_FT_SERIES_POST_OL_012;   // Post 012 signal found
         }
         else
         {
            Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
            Get_SBS_FT_Series_OneLine_Short_State(i_ol_candidate,sbs_indi_ft_series_post_state); // check OL_0_2
               
            if (
                  (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_0_2) &&
                  (sbs_indi_ft_series_post_state.signal == SELL_ORDER)
               )
            {
               post_ol_candidate_state = SBS_FT_SERIES_POST_OL_0_2;   // Post OL_0_2 signal found
            }
            else
            {
               Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
               Get_SBS_FT_Series_Mixed_State(i_ol_candidate,sbs_indi_ft_series_post_state);   // check OL_2MXD
               
               if (
                     (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_2MXD) &&
                     (sbs_indi_ft_series_post_state.signal == SELL_ORDER)
                  )
               {
                  post_ol_candidate_state = SBS_FT_SERIES_POST_OL_2MXD;   // Post OL_2MXD signal found
               }
            }
         }

//-------------------- Check for Post OL signal ---------------------------/

         if (post_ol_candidate_state != SBS_FT_SERIES_NO_STATE)
         {
            for (i = i_ol_candidate; i < start_bar; i++)
            {
               if (                    // check for potential Post OL signal
                     (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE) ||
                     (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE)
                  )
               {
                  i_post_ol_candidate = i;
                  break;
               }
            }
            
            if (i_post_ol_candidate != -1)         // fake ol was detected
            {
               if ((i_post_ol_candidate - start_bar) <= sbs_ft_series_ol_post_fake_gap)
               {
                  sbs_indi_ft_series_state.state  = SBS_FT_SERIES_POST_FAKE_OL_2;
                  ft_series_state.signal          = SELL_ORDER;
            
                  ft_series_state.signal_01_bar   = start_bar;
                  ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][start_bar];

                  ft_series_state.signal_02_bar   = start_bar;
                  ft_series_state.signal_02_value = sbs_indi_ft_buy_data[1][start_bar];
               }
            }
         }
      
      } //if (i_ol_candidate != -1)
      
   }

//-------------------------------------------------------------------------/

   return;
}

//=========================== Check "Mixed" FT Series State ===============/

void     Get_SBS_FT_Series_OneLine_Short_State(int start_bar, 
                                               sbs_indi_ft_series_state_struct &ft_series_state)
{
int      i;

//-------------------- Buy (SBS_FT_SERIES_OL_0_2) -------------------------/

   if (
         (sbs_indi_ft_buy_data[2][start_bar] != EMPTY_VALUE)   // found third signal
      )
   {
      for (i = start_bar; i < (sbs_ft_series_ol_short_range + start_bar); i++)
      {
         if (                                                     // check for any sell signal
               (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE)
            )  break;
         
         if (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE)     // found first signal
         {
            sbs_indi_ft_series_state.state  = SBS_FT_SERIES_POST_OL_0_2;
            ft_series_state.signal          = BUY_ORDER;
            
            ft_series_state.signal_01_bar   = i;
            ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][i];

            ft_series_state.signal_03_bar   = start_bar;
            ft_series_state.signal_03_value = sbs_indi_ft_buy_data[2][start_bar];
         }
            
      } // for (i= ...
   }

//--------------------------- Check FT Series State -----------------------/

   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)  return;

//-------------------- Sell (SBS_FT_SERIES_OL_0_2) ------------------------/

   if (
         (sbs_indi_ft_sell_data[2][start_bar] != EMPTY_VALUE)   // found third signal
      )
   {
      for (i = start_bar; i < (sbs_ft_series_ol_short_range + start_bar); i++)
      {
         if (                                                     // check for any sell signal
               (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE)
            )  break;
         
         if (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE)     // found first signal
         {
            sbs_indi_ft_series_state.state  = SBS_FT_SERIES_POST_OL_0_2;
            ft_series_state.signal          = SELL_ORDER;
            
            ft_series_state.signal_01_bar   = i;
            ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][i];

            ft_series_state.signal_03_bar   = start_bar;
            ft_series_state.signal_03_value = sbs_indi_ft_buy_data[2][start_bar];
         }
            
      } // for (i= ...
   }
   
//-------------------------------------------------------------------------/

   return;
}

//=========================== Check "Mixed" FT Series State ===============/

void     Get_SBS_FT_Series_Mixed_State(int start_bar, 
                                       sbs_indi_ft_series_state_struct &ft_series_state)
{
int      i;
int      j;
int      n1 = -1;
int      n2 = -1;
int      n3 = -1;
int      n_temp;

//-------------------- Buy (SBS_FT_SERIES_RGLR_2MXD, SBS_FT_SERIES_OL_2MXD) -/

   if (
         (sbs_indi_ft_buy_data[2][start_bar] != EMPTY_VALUE) ||   // found third signal
         (sbs_indi_ft_buy_data[1][start_bar] != EMPTY_VALUE) ||
         (sbs_indi_ft_buy_data[0][start_bar] != EMPTY_VALUE)
      )
   {
      if (sbs_indi_ft_buy_data[2][start_bar] != EMPTY_VALUE)      // define rest 2 candidates
      {
         n1 = 2;
         n2 = 1;
         n3 = 0;
      }
      else
      {
         if (sbs_indi_ft_buy_data[1][start_bar] != EMPTY_VALUE)
         {
            n1 = 1;
            n2 = 2;
            n3 = 0;
         }
         else
         {
            if (sbs_indi_ft_buy_data[0][start_bar] != EMPTY_VALUE)
            {
               n1 = 0;
               n2 = 2;
               n3 = 1;
            }
         }
      }
      
      if ((n1 == -1) || (n2 == -1) || (n3 == -1))     return;     // checking
   
      for (i = start_bar; i < (sbs_ft_series_regular_range + start_bar); i++)
      {
         if (                                                     // check for any sell signal
               (sbs_indi_ft_sell_data[n1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[n2][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[n3][i] != EMPTY_VALUE)
            )  break;
            
         if (
               (sbs_indi_ft_buy_data[n2][i] != EMPTY_VALUE) ||     // found second signal
               (sbs_indi_ft_buy_data[n3][i] != EMPTY_VALUE)
            )
         {
            if (sbs_indi_ft_buy_data[n2][i] != EMPTY_VALUE)
            {
               n3 = n3;
            }
            else
            {
               if (sbs_indi_ft_buy_data[n3][i] != EMPTY_VALUE)
               {
                  n_temp = n2;
                  n2 = n3;
                  n3 = n_temp;
               }
            }
            
            if ((n1 == -1) || (n2 == -1) || (n3 == -1))     return;  // checking

            for (j = i; j < (sbs_ft_series_regular_range + start_bar); j++)
            {
               if (                                                     // check for any sell signal
                     (sbs_indi_ft_sell_data[n1][j] != EMPTY_VALUE) ||
                     (sbs_indi_ft_sell_data[n2][j] != EMPTY_VALUE) ||
                     (sbs_indi_ft_sell_data[n3][j] != EMPTY_VALUE)
                  )  break;
               
               if (sbs_indi_ft_buy_data[n3][j] != EMPTY_VALUE)     // found first signal
               {
                  if (j >= (start_bar + sbs_ft_series_ol_range))
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_RGLR_2MXD;
                  }
                  else
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_2MXD;
                  }
                  
                  ft_series_state.signal = BUY_ORDER;
                  
                  switch(n1)
                  {
                     case 2: {ft_series_state.signal_03_bar = start_bar; break;}
                     case 1: {ft_series_state.signal_02_bar = start_bar; break;}
                     case 0: {ft_series_state.signal_01_bar = start_bar; break;}
                  }
                  
                  switch(n2)
                  {
                     case 2: {ft_series_state.signal_03_bar = i; break;}
                     case 1: {ft_series_state.signal_02_bar = i; break;}
                     case 0: {ft_series_state.signal_01_bar = i; break;}
                  }
                  
                  switch(n3)
                  {
                     case 2: {ft_series_state.signal_03_bar = j; break;}
                     case 1: {ft_series_state.signal_02_bar = j; break;}
                     case 0: {ft_series_state.signal_01_bar = j; break;}
                  }

                  ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][ft_series_state.signal_01_bar];
                  ft_series_state.signal_02_value = sbs_indi_ft_buy_data[1][ft_series_state.signal_02_bar];
                  ft_series_state.signal_03_value = sbs_indi_ft_buy_data[2][ft_series_state.signal_03_bar];
                  
                  break;
               }
            } //for(j = ...
            
            break;
         }
      } // for (i = ...
   } //if "buy signal"
   
//--------------------------- Check FT Series State -----------------------/

   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)  return;
   
//-------------------- Sell (SBS_FT_SERIES_RGLR_2MXD, SBS_FT_SERIES_OL_2MXD) -/

   if (
         (sbs_indi_ft_sell_data[2][start_bar] != EMPTY_VALUE) ||   // found third signal
         (sbs_indi_ft_sell_data[1][start_bar] != EMPTY_VALUE) ||
         (sbs_indi_ft_sell_data[0][start_bar] != EMPTY_VALUE)
      )
   {
      if (sbs_indi_ft_sell_data[2][start_bar] != EMPTY_VALUE)      // define rest 2 candidates
      {
         n1 = 2;
         n2 = 1;
         n3 = 0;
      }
      else
      {
         if (sbs_indi_ft_sell_data[1][start_bar] != EMPTY_VALUE)
         {
            n1 = 1;
            n2 = 2;
            n3 = 0;
         }
         else
         {
            if (sbs_indi_ft_sell_data[0][start_bar] != EMPTY_VALUE)
            {
               n1 = 0;
               n2 = 2;
               n3 = 1;
            }
         }
      }
      
      if ((n1 == -1) || (n2 == -1) || (n3 == -1))     return;     // checking
   
      for (i = start_bar; i < (sbs_ft_series_regular_range + start_bar); i++)
      {
         if (                                                     // check for any buy signal
               (sbs_indi_ft_buy_data[n1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[n2][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[n3][i] != EMPTY_VALUE)
            )  break;
            
         if (
               (sbs_indi_ft_sell_data[n2][i] != EMPTY_VALUE) ||     // found second signal
               (sbs_indi_ft_sell_data[n3][i] != EMPTY_VALUE)
            )
         {
            if (sbs_indi_ft_sell_data[n2][i] != EMPTY_VALUE)
            {
               n3 = n3;
            }
            else
            {
               if (sbs_indi_ft_sell_data[n3][i] != EMPTY_VALUE)
               {
                  n_temp = n2;
                  n2 = n3;
                  n3 = n_temp;
               }
            }
            
            if ((n1 == -1) || (n2 == -1) || (n3 == -1))     return;  // checking

            for (j = i; j < (sbs_ft_series_regular_range + start_bar); j++)
            {
               if (                                                     // check for any sell signal
                     (sbs_indi_ft_buy_data[n1][j] != EMPTY_VALUE) ||
                     (sbs_indi_ft_buy_data[n2][j] != EMPTY_VALUE) ||
                     (sbs_indi_ft_buy_data[n3][j] != EMPTY_VALUE)
                  )  break;
               
               if (sbs_indi_ft_sell_data[n3][j] != EMPTY_VALUE)     // found first signal
               {
                  if (j >= (start_bar + sbs_ft_series_ol_range))
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_RGLR_2MXD;
                  }
                  else
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_2MXD;
                  }
                  
                  ft_series_state.signal = SELL_ORDER;
                  
                  switch(n1)
                  {
                     case 2: {ft_series_state.signal_03_bar = start_bar; break;}
                     case 1: {ft_series_state.signal_02_bar = start_bar; break;}
                     case 0: {ft_series_state.signal_01_bar = start_bar; break;}
                  }
                  
                  switch(n2)
                  {
                     case 2: {ft_series_state.signal_03_bar = i; break;}
                     case 1: {ft_series_state.signal_02_bar = i; break;}
                     case 0: {ft_series_state.signal_01_bar = i; break;}
                  }
                  
                  switch(n3)
                  {
                     case 2: {ft_series_state.signal_03_bar = j; break;}
                     case 1: {ft_series_state.signal_02_bar = j; break;}
                     case 0: {ft_series_state.signal_01_bar = j; break;}
                  }

                  ft_series_state.signal_01_value = sbs_indi_ft_sell_data[0][ft_series_state.signal_01_bar];
                  ft_series_state.signal_02_value = sbs_indi_ft_sell_data[1][ft_series_state.signal_02_bar];
                  ft_series_state.signal_03_value = sbs_indi_ft_sell_data[2][ft_series_state.signal_03_bar];
                  
                  break;
               }
            } //for(j = ...
            
            break;
         }
      } // for (i = ...
   } //if "sell signal"

//-------------------------------------------------------------------------/

   return;
}

//=========================== Check "Post (After) OneLine" FT Series State /

void     Get_SBS_FT_Series_Post_OL_State(int start_bar, 
                                         sbs_indi_ft_series_state_struct &ft_series_state)
{
int      i;

//-------------------- Buy (SBS_FT_SERIES_POST_OL) ------------------------/

   if (
         (sbs_indi_ft_buy_data[0][start_bar] != EMPTY_VALUE) ||   // found any signal
         (sbs_indi_ft_buy_data[1][start_bar] != EMPTY_VALUE) ||
         (sbs_indi_ft_buy_data[2][start_bar] != EMPTY_VALUE)
      )
   {
      for (i = start_bar; i < (sbs_ft_series_ol_gap + start_bar); i++)
      {
         if (
               (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE)
            )     break;                                          // same direction found
         
         if (
               (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE)
            )
         {
            Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
            Get_SBS_FT_Series_Regular_State(i,sbs_indi_ft_series_post_state); // check OL_012
   
            if (
                  (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_012) &&
                  (sbs_indi_ft_series_post_state.signal == SELL_ORDER)
               )
            {
               sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_012;   // Post 012 signal found
            }
            else
            {
               Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
               Get_SBS_FT_Series_OneLine_Short_State(i,sbs_indi_ft_series_post_state); // check OL_0_2
               
               if (
                     (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_0_2) &&
                     (sbs_indi_ft_series_post_state.signal == SELL_ORDER)
                  )
               {
                  sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_0_2;   // Post OL_0_2 signal found
               }
               else
               {
                  Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
                  Get_SBS_FT_Series_Mixed_State(i,sbs_indi_ft_series_post_state);   // check OL_2MXD
               
                  if (
                        (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_2MXD) &&
                        (sbs_indi_ft_series_post_state.signal == SELL_ORDER)
                     )
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_2MXD;   // Post OL_2MXD signal found
                  }
                  else
                  {
                     return;           // Post OL not found
                  }
               }
            }
            
            ft_series_state.signal = BUY_ORDER;
            
            if (sbs_indi_ft_buy_data[0][start_bar] != EMPTY_VALUE)
            {
               ft_series_state.signal_01_bar   = start_bar;
               ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][start_bar];
            }
            
            if (sbs_indi_ft_buy_data[1][start_bar] != EMPTY_VALUE)
            {
               ft_series_state.signal_02_bar   = start_bar;
               ft_series_state.signal_02_value = sbs_indi_ft_buy_data[0][start_bar];
            }
            
            if (sbs_indi_ft_buy_data[2][start_bar] != EMPTY_VALUE)
            {
               ft_series_state.signal_03_bar   = start_bar;
               ft_series_state.signal_03_value = sbs_indi_ft_buy_data[0][start_bar];
            }
            
            break;
         }
         
      }
   }

//--------------------------- Check FT Series State -----------------------/

   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)  return;

//-------------------- Sell (SBS_FT_SERIES_POST_OL) -----------------------/

   if (
         (sbs_indi_ft_sell_data[0][start_bar] != EMPTY_VALUE) ||   // found any signal
         (sbs_indi_ft_sell_data[1][start_bar] != EMPTY_VALUE) ||
         (sbs_indi_ft_sell_data[2][start_bar] != EMPTY_VALUE)
      )
   {
      for (i = start_bar; i < (sbs_ft_series_ol_gap + start_bar); i++)
      {
         if (
               (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[2][i] != EMPTY_VALUE)
            )     break;                                          // same direction found
         
         if (
               (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[2][i] != EMPTY_VALUE)
            )
         {
            Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
            Get_SBS_FT_Series_Regular_State(i,sbs_indi_ft_series_post_state); // get post state

            if (
                  (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_012) &&
                  (sbs_indi_ft_series_post_state.signal == BUY_ORDER)
               )
            {
               sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_012;   // Post 012 signal found
            }
            else
            {
               Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
               Get_SBS_FT_Series_OneLine_Short_State(i,sbs_indi_ft_series_post_state); // check OL_0_2
               
               if (
                     (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_0_2) &&
                     (sbs_indi_ft_series_post_state.signal == BUY_ORDER)
                  )
               {
                  sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_0_2;   // Post 012 signal found
               }
               else
               {
                  Reset_SBS_FT_Series_State(sbs_indi_ft_series_post_state);         // reset post state
                  Get_SBS_FT_Series_Mixed_State(i,sbs_indi_ft_series_post_state);   // check OL_2MXD
               
                  if (
                        (sbs_indi_ft_series_post_state.state == SBS_FT_SERIES_OL_2MXD) &&
                        (sbs_indi_ft_series_post_state.signal == BUY_ORDER)
                     )
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_POST_OL_2MXD;   // Post OL_2MXD signal found
                  }
                  else
                  {
                     return;           // Post OL not found
                  }
               }
            }

            ft_series_state.signal = SELL_ORDER;
            
            if (sbs_indi_ft_sell_data[0][start_bar] != EMPTY_VALUE)
            {
               ft_series_state.signal_01_bar   = start_bar;
               ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][start_bar];
            }
            
            if (sbs_indi_ft_sell_data[1][start_bar] != EMPTY_VALUE)
            {
               ft_series_state.signal_02_bar   = start_bar;
               ft_series_state.signal_02_value = sbs_indi_ft_buy_data[0][start_bar];
            }
            
            if (sbs_indi_ft_sell_data[2][start_bar] != EMPTY_VALUE)
            {
               ft_series_state.signal_03_bar   = start_bar;
               ft_series_state.signal_03_value = sbs_indi_ft_buy_data[0][start_bar];
            }
            
            break;
         }
         
      }
   }

//-------------------------------------------------------------------------/

   return;
}

//=========================== Check "Regular" FT Series State =============/

void     Get_SBS_FT_Series_Regular_State(int start_bar, 
                                         sbs_indi_ft_series_state_struct &ft_series_state)
{
int      i;
int      j;

//-------------------- Buy (SBS_FT_SERIES_RGLR_012, SBS_FT_SERIES_OL_012) -/

   if (sbs_indi_ft_buy_data[2][start_bar] != EMPTY_VALUE)           // found third signal
   {
      for (i = start_bar; i < (sbs_ft_series_regular_range + start_bar); i++)
      {
         if (
               (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_sell_data[0][i] != EMPTY_VALUE)
            )  break;
            
         if (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE)     // found second signal
         {
            for (j = i; j < (sbs_ft_series_regular_range + start_bar); j++)
            {
//               if (
//                     (sbs_indi_ft_sell_data[0][j] != EMPTY_VALUE)
//                  )  break;
               
               if (sbs_indi_ft_buy_data[0][j] != EMPTY_VALUE)     // found first signal
               {
                  if (j >= (start_bar + sbs_ft_series_ol_range))
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_RGLR_012;
                  }
                  else
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_012;
                  }
                  
                  ft_series_state.signal          = BUY_ORDER;
                  ft_series_state.signal_01_bar   = j;
                  ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][j];
                  ft_series_state.signal_02_bar   = i;
                  ft_series_state.signal_02_value = sbs_indi_ft_buy_data[1][i];
                  ft_series_state.signal_03_bar   = start_bar;
                  ft_series_state.signal_03_value = sbs_indi_ft_buy_data[2][start_bar];
                  
                  break;
               }
            }
            
            break;
         }
      }
   }
   
//--------------------------- Check FT Series State -----------------------/

   if (sbs_indi_ft_series_state.state != SBS_FT_SERIES_NO_STATE)  return;

//-------------------- Sell (SBS_FT_SERIES_RGLR_012, SBS_FT_SERIES_OL_012) /

   if (sbs_indi_ft_sell_data[2][start_bar] != EMPTY_VALUE)           // found third signal
   {
      for (i = start_bar; i < SBS_INDI_BARS_NO; i++)
      {
         if (
               (sbs_indi_ft_buy_data[1][i] != EMPTY_VALUE) ||
               (sbs_indi_ft_buy_data[0][i] != EMPTY_VALUE)
            )  break;
            
         if (sbs_indi_ft_sell_data[1][i] != EMPTY_VALUE)     // found second signal
         {
            for (j = i; j < SBS_INDI_BARS_NO; j++)
            {
//               if (
//                     (sbs_indi_ft_buy_data[0][j] != EMPTY_VALUE)
//                  )  break;
               
               if (sbs_indi_ft_sell_data[0][j] != EMPTY_VALUE)     // found first signal
               {
                  if (j >= (start_bar + sbs_ft_series_ol_range))
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_RGLR_012;
                  }
                  else
                  {
                     sbs_indi_ft_series_state.state = SBS_FT_SERIES_OL_012;
                  }
                  
                  ft_series_state.signal          = SELL_ORDER;
                  ft_series_state.signal_01_bar   = j;
                  ft_series_state.signal_01_value = sbs_indi_ft_buy_data[0][j];
                  ft_series_state.signal_02_bar   = i;
                  ft_series_state.signal_02_value = sbs_indi_ft_buy_data[1][i];
                  ft_series_state.signal_03_bar   = start_bar;
                  ft_series_state.signal_03_value = sbs_indi_ft_buy_data[2][start_bar];
                  
                  break;
               }
            }
            
            break;
         }
      }
   }

//-------------------------------------------------------------------------/

   return;
}

//=========================== Get RMI RSX State ===========================/

void     Get_SBS_RMI_RSX_State()
{
//--------------------------- Reset SBS RMI Condition ---------------------/

   sbs_indi_rmi_condition.extreme_state = SBS_NO_EXTREME_STATE;
   sbs_indi_rmi_condition.trend         = SBS_NO_TREND;
   sbs_indi_rmi_condition.bounce_type   = SBS_NO_BOUNCE;
   sbs_indi_rmi_condition.bounce_bar    = 0;
   sbs_indi_rmi_condition.bounce_val    = EMPTY_VALUE;

//--------------------------- Get RMI Condition Parameters ----------------/
   
   Get_Indi_Extreme_Level_State(sbs_indi_rmi_condition,
                                sbs_indi_rmi_extreme_level,
                                sbs_indi_rmi_rsx_01_data);
   
   Get_Indi_Bounce_Type        (sbs_indi_rmi_condition,
                                sbs_indi_rmi_extreme_level,
                                sbs_indi_rmi_threshold_level,
                                sbs_indi_rmi_weakness_level,
                                sbs_indi_rmi_rsx_01_data);

//-------------------------------------------------------------------------/

   return;
}

//=========================== Get_SBS_DSS_of_MACD_State ===================/

void     Get_SBS_DSS_of_MACD_State()
{
//--------------------------- Reset SBS DSS MACD Condition ----------------/

   sbs_indi_dss_of_macd_condition.extreme_state = SBS_NO_EXTREME_STATE;
   sbs_indi_dss_of_macd_condition.trend         = SBS_NO_TREND;
   sbs_indi_dss_of_macd_condition.bounce_type   = SBS_NO_BOUNCE;
   sbs_indi_dss_of_macd_condition.bounce_bar    = 0;
   sbs_indi_dss_of_macd_condition.bounce_val    = EMPTY_VALUE;

//--------------------------- Get DSS MACD Condition Parameters -----------/
   
   Get_Indi_Extreme_Level_State(sbs_indi_dss_of_macd_condition,
                                sbs_indi_dss_of_macd_extreme_level,
                                sbs_indi_dss_of_macd_01_data);
   
   Get_Indi_Bounce_Type        (sbs_indi_dss_of_macd_condition,
                                sbs_indi_dss_of_macd_extreme_level,
                                sbs_indi_dss_of_macd_threshold_level,
                                sbs_indi_dss_of_macd_weakness_level,
                                sbs_indi_dss_of_macd_01_data);

//-------------------------------------------------------------------------/

   return;
}

//=========================== Get_Indi_Extreme_Level_State ================/

void     Get_Indi_Extreme_Level_State(
                                       sbs_indi_condition_struct  &sbs_indi_condition,
                                       sbs_indi_level_struct      &sbs_indi_extreme_level,
                                       double                     &sbs_indi_data[]
                                     )
{
//--------------------------- Check HI Extreme Level States ---------------/

   if (
         (sbs_indi_data[0] >= sbs_indi_extreme_level.up_level)
      )
   {
      sbs_indi_condition.extreme_state = SBS_HI_EXTREME;
   }
   
   if (
         (sbs_indi_condition.extreme_state == SBS_HI_EXTREME) &&
         (sbs_indi_data[1] < sbs_indi_extreme_level.up_level)
      )
   {
      sbs_indi_condition.extreme_state = SBS_CROSS_UP_HI_EXTREME;
   }
   
   if (
         (sbs_indi_condition.extreme_state != SBS_HI_EXTREME) &&
         (sbs_indi_data[1] >= sbs_indi_extreme_level.up_level)
      )
   {
      sbs_indi_condition.extreme_state = SBS_CROSS_DOWN_HI_EXTREME;
   }
   
//--------------------------- Check LO Extreme Level States ---------------/

   if (sbs_indi_condition.extreme_state != SBS_NO_EXTREME_STATE)
   {
      return;
   }
   
//-------------------------------------------------------------------------/

   if (
         (sbs_indi_data[0] <= sbs_indi_extreme_level.low_level)
      )
   {
      sbs_indi_condition.extreme_state = SBS_LO_EXTREME;
   }
   
   if (
         (sbs_indi_condition.extreme_state == SBS_LO_EXTREME) &&
         (sbs_indi_data[1] > sbs_indi_extreme_level.low_level)
      )
   {
      sbs_indi_condition.extreme_state = SBS_CROSS_DOWN_LO_EXTREME;
   }
   
   if (
         (sbs_indi_condition.extreme_state != SBS_LO_EXTREME) &&
         (sbs_indi_data[1] <= sbs_indi_extreme_level.low_level)
      )
   {
      sbs_indi_condition.extreme_state = SBS_CROSS_UP_LO_EXTREME;
   }

//-------------------------------------------------------------------------/

   return;
}

//============================= Get_Indi_Bounce_Type =======================/

void     Get_Indi_Bounce_Type(
                                 sbs_indi_condition_struct  &sbs_indi_condition,
                                 sbs_indi_level_struct      &sbs_indi_extreme_level,
                                 sbs_indi_level_struct      &sbs_indi_threshold_level,
                                 sbs_indi_level_struct      &sbs_indi_weakness_level,
                                 double                     &sbs_indi_data[]
                             )
{
int      i,j,k;

int      min_bar;
double   min_val;

int      max_bar;
double   max_val;

//----------------------------- Indi between hi extreme & up threshold ----/

   if (
         (sbs_indi_data[0] <  sbs_indi_extreme_level.up_level) &&
         (sbs_indi_data[0] >= sbs_indi_threshold_level.up_level)
      )
   {
//----------------------------- Check for hi extreme bounce ---------------/   
   
      for (i = 0; i < SBS_INDI_BARS_NO; i++)    // search next cross threshold up level
      {
         if (sbs_indi_data[i] < sbs_indi_threshold_level.up_level) break;
      }
      
      if (i < SBS_INDI_BARS_NO)                 // next threshold cross found
      {
         for (j = 0; j < i; j++)                // search for hi extreme cross
         {
            if (sbs_indi_data[j] >= sbs_indi_extreme_level.up_level)
            {
               sbs_indi_condition.bounce_bar  = j;
               sbs_indi_condition.bounce_val  = sbs_indi_data[j];
               sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_HI_EXTREME;
               return;
            }
         }
      }
   
//----------------------------- Search min value (no extreme bounce) ------/

      for (i = 0; i < SBS_INDI_BARS_NO; i++)       // search next up threshold cross
      {
         if (sbs_indi_data[i] < sbs_indi_threshold_level.up_level) break;
      }
      
      if (i >= SBS_INDI_BARS_NO)    return;        // no bounce (up threshold cross not found)
      
      for (j = i; j < SBS_INDI_BARS_NO; j++)       // search next up threshold cross (again)
      {
         if (sbs_indi_data[j] >= sbs_indi_threshold_level.up_level) break;
      }
      
      min_bar = i;
      min_val = sbs_indi_data[i];
      
      for (k = i; k <= j; k++)                     // search min indi between two hi thresholds
      {
         if (sbs_indi_data[k] < min_val)
         {
            min_bar = k;
            min_val = sbs_indi_data[k];
         }
      }

//----------------------------- Set bounce parameters -----------------------/
      
      sbs_indi_condition.bounce_bar = min_bar;
      sbs_indi_condition.bounce_val = min_val;

//----------------------------- Check for low extreme bounce ----------------/

      if (min_val <= sbs_indi_extreme_level.low_level)
      {
         sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_LO_EXTREME;
         
         for (k = min_bar; k >= 0; k--)            // search low extreme cross
         {
            if (sbs_indi_data[k] > sbs_indi_extreme_level.low_level) break;
         }
         
         sbs_indi_condition.bounce_bar = k+1;
         sbs_indi_condition.bounce_val = sbs_indi_data[k+1];
         
         return;
      }
      
//----------------------------- Check for low threshold bounce --------------/
      
      if (
            (min_val >  sbs_indi_extreme_level.low_level) &&
            (min_val <= sbs_indi_threshold_level.low_level)
         )
      {
         sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_LO_THRESHOLD;
         return;
      }
      
//----------------------------- Check for low weakness bounce ---------------/
      
      if (
            (min_val > sbs_indi_threshold_level.low_level) &&
            (min_val < sbs_indi_weakness_level.low_level)
         )
      {
         sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_WEAKNESS;
         return;
      }
      
//----------------------------- Check for up threshold bounce ---------------/
      
      if (
            (min_val >= sbs_indi_weakness_level.low_level) &&
            (min_val <  sbs_indi_threshold_level.up_level)
         )
      {
         sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_HI_THRESHOLD;
         return;
      }
      
      return;
      
   }

//----------------------------- Indi between lo extreme & lo threshold ----/

   if (
         (sbs_indi_data[0] >  sbs_indi_extreme_level.low_level) &&
         (sbs_indi_data[0] <= sbs_indi_threshold_level.low_level)
      )
   {
   
//----------------------------- Check for lo extreme bounce ---------------/   
   
      for (i = 0; i < SBS_INDI_BARS_NO; i++)    // search next cross threshold low level
      {
         if (sbs_indi_data[i] > sbs_indi_threshold_level.low_level) break;
      }
      
      if (i < SBS_INDI_BARS_NO)                 // next threshold cross found
      {
         for (j = 0; j < i; j++)                // search for low extreme cross
         {
            if (sbs_indi_data[j] <= sbs_indi_extreme_level.low_level)
            {
               sbs_indi_condition.bounce_bar  = j;
               sbs_indi_condition.bounce_val  = sbs_indi_data[j];
               sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_LO_EXTREME;
               return;
            }
         }
      }
   
//----------------------------- Search max value (no low extreme bounce) ---/

      for (i = 0; i < SBS_INDI_BARS_NO; i++)       // search next up threshold cross
      {
         if (sbs_indi_data[i] > sbs_indi_threshold_level.low_level) break;
      }
      
      if (i >= SBS_INDI_BARS_NO)    return;        // no bounce (low threshold cross not found)
      
      for (j = i; j < SBS_INDI_BARS_NO; j++)       // search next low threshold cross (again)
      {
         if (sbs_indi_data[j] <= sbs_indi_threshold_level.low_level) break;
      }
      
      max_bar = i;
      max_val = sbs_indi_data[i];
      
      for (k = i; k <= j; k++)                     // search max indi between two low thresholds
      {
         if (sbs_indi_data[k] > max_val)
         {
            max_bar = k;
            max_val = sbs_indi_data[k];
         }
      }

//----------------------------- Set bounce parameters -----------------------/
      
      sbs_indi_condition.bounce_bar = max_bar;
      sbs_indi_condition.bounce_val = max_val;

//----------------------------- Check for high extreme bounce ---------------/

      if (max_val >= sbs_indi_extreme_level.up_level)
      {
         sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_HI_EXTREME;
         
         for (k = max_bar; k >= 0; k--)            // search low extreme cross
         {
            if (sbs_indi_data[k] < sbs_indi_extreme_level.up_level) break;
         }
         
         sbs_indi_condition.bounce_bar = k+1;
         sbs_indi_condition.bounce_val = sbs_indi_data[k+1];
         
         return;
      }
      
//----------------------------- Check for up threshold bounce ---------------/
      
      if (
            (max_val <  sbs_indi_extreme_level.up_level) &&
            (max_val >= sbs_indi_threshold_level.up_level)
         )
      {
         sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_HI_THRESHOLD;
         return;
      }
      
//----------------------------- Check for hi weakness bounce ----------------/
      
      if (
            (max_val < sbs_indi_threshold_level.up_level) &&
            (max_val > sbs_indi_weakness_level.up_level)
         )
      {
         sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_WEAKNESS;
         return;
      }
      
//----------------------------- Check for lo threshold bounce ---------------/
      
      if (
            (max_val <= sbs_indi_weakness_level.up_level) &&
            (max_val >  sbs_indi_threshold_level.low_level)
         )
      {
         sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_LO_THRESHOLD;
         return;
      }
      
      return;
      
   }

//----------------------------- Indi Between HI & LO threshold levels -----/

   if (
         (sbs_indi_data[0] < sbs_indi_threshold_level.up_level) &&
         (sbs_indi_data[0] > sbs_indi_threshold_level.low_level)
      )
   {
      for (i = 0; i < SBS_INDI_BARS_NO; i++)
      {
//----------------------------- Check for hi threshold bounce -------------/ 

         if (sbs_indi_data[i] >= sbs_indi_threshold_level.up_level)
         {
            sbs_indi_condition.bounce_bar  = i;
            sbs_indi_condition.bounce_val  = sbs_indi_data[i];
            sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_HI_THRESHOLD;

//----------------------------- Check for hi extreme bounce ---------------/   
   
            for (j = 0; j < SBS_INDI_BARS_NO; j++)    // search next cross threshold up level
            {
               if (sbs_indi_data[j] > sbs_indi_threshold_level.up_level) break;
            }
      
            if (j < SBS_INDI_BARS_NO)                 // next threshold cross found
            {
               for (k = i; k < j; k++)                // search for low extreme cross
               {
                  if (sbs_indi_data[k] >= sbs_indi_extreme_level.up_level)
                  {
                     sbs_indi_condition.bounce_bar  = k;
                     sbs_indi_condition.bounce_val  = sbs_indi_data[k];
                     sbs_indi_condition.bounce_type = SBS_DOWN_BOUNCE_HI_EXTREME;
                     return;
                  }
               }
            }
      
            return;
         }

//----------------------------- Check for lo threshold bounce -------------/ 
         
         if (sbs_indi_data[i] <= sbs_indi_threshold_level.low_level)
         {
            sbs_indi_condition.bounce_bar  = i;
            sbs_indi_condition.bounce_val  = sbs_indi_data[i];
            sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_LO_THRESHOLD;

//----------------------------- Check for lo extreme bounce ---------------/   
   
            for (j = 0; j < SBS_INDI_BARS_NO; j++)    // search next cross threshold low level
            {
               if (sbs_indi_data[j] > sbs_indi_threshold_level.low_level) break;
            }
      
            if (j < SBS_INDI_BARS_NO)                 // next threshold cross found
            {
               for (k = i; k < j; k++)                // search for low extreme cross
               {
                  if (sbs_indi_data[k] <= sbs_indi_extreme_level.low_level)
                  {
                     sbs_indi_condition.bounce_bar  = k;
                     sbs_indi_condition.bounce_val  = sbs_indi_data[k];
                     sbs_indi_condition.bounce_type = SBS_UP_BOUNCE_LO_EXTREME;
                     return;
                  }
               }
            }
      
            return;
         }
      }
      
      return;
   }

//-------------------------------------------------------------------------/

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

//======================= Get iR1iR2 Position =============================/

void  Get_iR1iR2_Position()
{
string   b_pos, m_pos, t_pos;

   ir1ir2_position = "000";
   
   b_pos = "0";
   m_pos = "0";
   b_pos = "0";
   
//--- Bottom Position ---/
   
   if (
         (i_Reg1[IR_BOTTOM][0] < i_Reg2[IR_BOTTOM][0])
      )
   {
      b_pos = "1";
   }
   
   if (
         (i_Reg1[IR_BOTTOM][0] >= i_Reg2[IR_BOTTOM][0]) &&
         (i_Reg1[IR_BOTTOM][0] < i_Reg2[IR_MIDDLE][0])
      )
   {
      b_pos = "2";
   }
   
   if (
         (i_Reg1[IR_BOTTOM][0] >= i_Reg2[IR_MIDDLE][0]) &&
         (i_Reg1[IR_BOTTOM][0] < i_Reg2[IR_TOP][0])
      )
   {
      b_pos = "3";
   }
   
   if (
         (i_Reg1[IR_BOTTOM][0] >= i_Reg2[IR_TOP][0])
      )
   {
      b_pos = "4";
   }
   
//--- Middle Position ---/
   
   if (
         (i_Reg1[IR_MIDDLE][0] < i_Reg2[IR_BOTTOM][0])
      )
   {
      m_pos = "1";
   }
   
   if (
         (i_Reg1[IR_MIDDLE][0] >= i_Reg2[IR_BOTTOM][0]) &&
         (i_Reg1[IR_MIDDLE][0] < i_Reg2[IR_MIDDLE][0])
      )
   {
      m_pos = "2";
   }
   
   if (
         (i_Reg1[IR_MIDDLE][0] >= i_Reg2[IR_MIDDLE][0]) &&
         (i_Reg1[IR_MIDDLE][0] < i_Reg2[IR_TOP][0])
      )
   {
      m_pos = "3";
   }
   
   if (
         (i_Reg1[IR_MIDDLE][0] >= i_Reg2[IR_TOP][0])
      )
   {
      m_pos = "4";
   }
   
//--- Top Position ---/
   
   if (
         (i_Reg1[IR_TOP][0] < i_Reg2[IR_BOTTOM][0])
      )
   {
      t_pos = "1";
   }
   
   if (
         (i_Reg1[IR_TOP][0] >= i_Reg2[IR_BOTTOM][0]) &&
         (i_Reg1[IR_TOP][0] < i_Reg2[IR_MIDDLE][0])
      )
   {
      t_pos = "2";
   }
   
   if (
         (i_Reg1[IR_TOP][0] >= i_Reg2[IR_MIDDLE][0]) &&
         (i_Reg1[IR_TOP][0] < i_Reg2[IR_TOP][0])
      )
   {
      t_pos = "3";
   }
   
   if (
         (i_Reg1[IR_TOP][0] >= i_Reg2[IR_TOP][0])
      )
   {
      t_pos = "4";
   }
   
   ir1ir2_position = b_pos + m_pos + t_pos;

//-------------------------------------------------------------------------/

   return;
}

//======================= Get ha4iR2 Position =============================/

void  Get_ha4iR2_Position()
{
   ha4ir2_position = "0";

   if (
         (ha4_min < i_Reg2[IR_BOTTOM][0])
      )
   {
      ha4ir2_position = "1";
   }
   
   if (
         (ha4_min >= i_Reg2[IR_BOTTOM][0]) &&
         (ha4_min < i_Reg2[IR_MIDDLE][0])
      )
   {
      ha4ir2_position = "2";
   }
   
   if (
         (ha4_min >= i_Reg2[IR_MIDDLE][0]) &&
         (ha4_min < i_Reg2[IR_TOP][0])
      )
   {
      ha4ir2_position = "3";
   }
   
   if (
         (ha4_min >= i_Reg2[IR_TOP][0])
      )
   {
      ha4ir2_position = "4";
   }

//-------------------------------------------------------------------------/

   return;
}

//======================= Get_ha2ha3_Position =============================/

void     Get_ha2ha3_Position()
{
   if (ha2_max >= ha3_min)
   {
      ha2ha3_position = "23";
      return;
   }
   
   if (ha2_min <= ha3_max)
   {
      ha2ha3_position = "32";
      return;
   }

//-------------------------------------------------------------------------/

   return;
}

//======================= Get_HA_Position =================================/

void     Get_HA_Position()
{
double   ha2_level;
double   ha3_level;
double   ha4_level;

int      position_1;
int      position_2;
int      position_3;

int      rest_no_1;
int      rest_no_2;

double   rest_val_1;
double   rest_val_2;

//----------------------- Reset HA positions -------------------------------/

   position_1 = 0;
   position_2 = 0;
   position_3 = 0;
   
//----------------------- Get HA levels -----------------------------------/

   ha2_level = ha2_min + ((ha2_max - ha2_min) / 2);
   ha3_level = ha3_min + ((ha3_max - ha3_min) / 2);
   ha4_level = ha4_min + ((ha4_max - ha4_min) / 2);

//----------------------- Calculate position 1 (lower) --------------------/

   if ((position_1 == 0) && (ha2_level <= ha3_level) && (ha2_level <= ha4_level))
   {
      position_1                   = 2;
      sbs_indi_position.ha_level_1 = ha2_level;
      
      rest_no_1  = 3;
      rest_no_2  = 4;
      rest_val_1 = ha3_level;
      rest_val_2 = ha4_level;
   }
   
   if ((position_1 == 0) && (ha3_level <= ha2_level) && (ha3_level <= ha4_level))
   {
      position_1                   = 3;
      sbs_indi_position.ha_level_1 = ha3_level;
      
      rest_no_1  = 2;
      rest_no_2  = 4;
      rest_val_1 = ha2_level;
      rest_val_2 = ha4_level;
   }
   
   if ((position_1 == 0) && (ha4_level <= ha2_level) && (ha4_level <= ha3_level))
   {
      position_1                   = 4;
      sbs_indi_position.ha_level_1 = ha4_level;
      
      rest_no_1  = 2;
      rest_no_2  = 3;
      rest_val_1 = ha2_level;
      rest_val_2 = ha3_level;
   }

//----------------------- Calculate position 2 (middle) & 3 (higher) ------/

   if (rest_val_1 <= rest_val_2)
   {
      position_2                   = rest_no_1;
      sbs_indi_position.ha_level_2 = rest_val_1;

      position_3                   = rest_no_2;
      sbs_indi_position.ha_level_3 = rest_val_2;
   }
   else
   {
      position_2                   = rest_no_2;
      sbs_indi_position.ha_level_2 = rest_val_2;

      position_3                   = rest_no_1;
      sbs_indi_position.ha_level_3 = rest_val_1;
   }

//----------------------- Set HA order ------------------------------------/

   sbs_indi_position.ha_order = IntegerToString(position_1,1,'0') +
                                IntegerToString(position_2,1,'0') +
                                IntegerToString(position_3,1,'0');

//-------------------------------------------------------------------------/

   return;
}

//======================= Get_FT3_Levels_HA_Position ======================/

void     Get_FT3_Levels_HA_Position()
{
int      position_lo;
int      position_md;
int      position_hi;

//----------------------- Reset FT3 Level positions -----------------------/

   position_lo = 0;
   position_hi = 0;
   position_md = 0;

//----------------------- Get lo_level position ---------------------------/

   if (sbs_ft_zzl_case.lo_level <= sbs_indi_position.ha_level_1)
   {
      position_lo = 1;
   }
   
   if ((sbs_ft_zzl_case.lo_level >  sbs_indi_position.ha_level_1) &&
       (sbs_ft_zzl_case.lo_level <= sbs_indi_position.ha_level_2))
   {
      position_lo = 2;
   }
   
   if ((sbs_ft_zzl_case.lo_level >  sbs_indi_position.ha_level_2) &&
       (sbs_ft_zzl_case.lo_level <= sbs_indi_position.ha_level_3))
   {
      position_lo = 3;
   }
   
   if (sbs_ft_zzl_case.lo_level > sbs_indi_position.ha_level_3)
   {
      position_lo = 4;
   }

//----------------------- Get md_level position ---------------------------/

   if (sbs_ft_zzl_case.md_level <= sbs_indi_position.ha_level_1)
   {
      position_md = 1;
   }
   
   if ((sbs_ft_zzl_case.md_level >  sbs_indi_position.ha_level_1) &&
       (sbs_ft_zzl_case.md_level <= sbs_indi_position.ha_level_2))
   {
      position_md = 2;
   }
   
   if ((sbs_ft_zzl_case.md_level >  sbs_indi_position.ha_level_2) &&
       (sbs_ft_zzl_case.md_level <= sbs_indi_position.ha_level_3))
   {
      position_md = 3;
   }
   
   if (sbs_ft_zzl_case.md_level > sbs_indi_position.ha_level_3)
   {
      position_md = 4;
   }

//----------------------- Get hi_level position ---------------------------/

   if (sbs_ft_zzl_case.hi_level <= sbs_indi_position.ha_level_1)
   {
      position_hi = 1;
   }
   
   if ((sbs_ft_zzl_case.hi_level >  sbs_indi_position.ha_level_1) &&
       (sbs_ft_zzl_case.hi_level <= sbs_indi_position.ha_level_2))
   {
      position_hi = 2;
   }
   
   if ((sbs_ft_zzl_case.hi_level >  sbs_indi_position.ha_level_2) &&
       (sbs_ft_zzl_case.hi_level <= sbs_indi_position.ha_level_3))
   {
      position_hi = 3;
   }
   
   if (sbs_ft_zzl_case.hi_level > sbs_indi_position.ha_level_3)
   {
      position_hi = 4;
   }
   
//----------------------- Set FT3 Level position --------------------------/

   sbs_indi_position.ft3_levels_ha = IntegerToString(position_lo,1,'0') +
                                     IntegerToString(position_md,1,'0') +
                                     IntegerToString(position_hi,1,'0');

//-------------------------------------------------------------------------/

   return;
}

//================== eof sbs_exp_indi_data_proc_lbr.mqh ===================/