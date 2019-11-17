//======================= SBS_EXP_04.mq4 ============================/
//+------------------------------------------------------------------+
//|                                                   SBS_EXP_04.mq4 |
//|                                  Copyright 2019 github.com/k-vka |
//+------------------------------------------------------------------+
#property copyright "github.com/k-vka"
#property link      "https://github.com/k-vka"

//----------------------- MBS Global Configuration ------------------/

#include <MBS_Include\mbs_global_config_header.mqh>

//----------------------- Module Headers ----------------------------/

#include <SBS_Include\sbs_exp_general_hdr.mqh>
#include <SBS_Include\sbs_exp_labels_hdr.mqh>
#include <SBS_Include\sbs_exp_history_log_hdr.mqh>
#include <SBS_Include\sbs_exp_order_management_hdr.mqh>
#include <SBS_Include\sbs_exp_indi_data_proc_hdr.mqh>
#include <SBS_Include\sbs_shv_zone_cases_hdr.mqh>
#include <SBS_Include\sbs_cases_service_hdr.mqh>
#include <SBS_Include\sbs_order_extra_data_hdr.mqh>

#include <SBS_Include\sbs_alx_indi_data_proc_hdr.mqh>

//----------------------- SBS DFM MBS Module Headers ----------------/

#include <SBS_Include\sbs_dfm_proc_header.mqh>
#include <SBS_Include\sbs_dfm_indication_header.mqh>

//----------------------- SBS Patterns Module Headers ---------------/

#include <SBS_Include\Patterns\sbs_patterns_hdr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_55_hdr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_order_mng_hdr.mqh>

#include <SBS_Include\Patterns\P_Market\sbs_market_data_hdr.mqh>

//----------------------- SBS Triangle Module Headers ---------------/

#include <SBS_Include\Triangle\sbs_trngl_data_hdr.mqh>

//======================= Init ======================================/

int init()
{
//---------------------- Reset_SBS_DFM_Processing_Profile -----------/

   Reset_SBS_DFM_Processing_Profile();

//---------------------- Redraw Labels ------------------------------/

   Delete_Labels();
   Create_Labels();
//   Delete_FT_ZZL_Lines();

//---------------------- Create Orders History Log ------------------/
   
//   Create_History_Log();

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
      SBS_Patterns_Create_Transaction_Log();
   }

//---------------------- Reset Open Order Profile -------------------/
   
//   Reset_SBS_Open_Order_Profile();

//---------------------- SBS_Get_Patterns_Data ----------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
      sbs_pattern_profile.processing_state = SBS_PATTERNS_PROFILE_PROCESS_NOT_ACTIVE;
      
      SBS_Get_Patterns_Data();
      SBS_Get_Patterns_Condition_Data();
      
      SBS_Triangle_Init_Order_Processing();
   }

//-------------------------------------------------------------------/

   return(0);
}

//======================= Deinit ====================================/

int deinit()
{
//--- DeInitiate SBS Indication ---/

   if (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT)
   {
      DeInit_Common_Indication();
      DeInit_Patterns_Indication();
   }
   else
   {
      Delete_Labels();
//    Delete_SHV_Lines();
//    Delete_FT_ZZL_Lines();
   }

//--- Close History Log ---/
   
//   Close_History_Log();

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
      SBS_Patterns_Close_Transaction_Log();
   }

//-------------------------------------------------------------------/

   return(0);
}

//======================= OnChartEvent ===================================/

void  OnChartEvent(const int event_id,const long &l_param,const double &d_param,const string &sparam)
{
//   Print("SBS_EXP event_id=" + IntegerToString(event_id,0,'0') + "CHARTEVENT_CUSTOM=" + IntegerToString(CHARTEVENT_CUSTOM,0,'0'));

//---------------------- Check & Process Custom Chart Event --------------/

   if (event_id == (CHARTEVENT_CUSTOM + 1))
   {
//--- Refresh offline rates ---/

      RefreshRates();

//--- Set OFFLINE processing_context ATCIVE ---/
      
      if (sbs_dfm_proc_profile.processing_context == SBS_NO_PROCESSING_CONTEXT)
      {
         sbs_dfm_proc_profile.processing_context = SBS_OFFLINE_PROCESSING_CONTEXT;
      }

//--- Get OFFLINE processing parameters ---/

      SBS_DFM_Get_Processing_Parameters(l_param,d_param,sparam);

//--- Initiate Current SBS Order State ---/

      SBS_DFM_Initiate_Order_State();

//--- Initiate SBS OFFLINE Indication ---/

      SBS_DFM_Initiate_Indication();

//--- Call start() Function (Process Expert) ---/
      
      start();
   }

//------------------------------------------------------------------------/

   return;
}

//======================= Start =====================================/

int start()
{
int      i_cnt;
//int      j_cnt;

//---------------------- Check / Set ONLINE processing_context ------/
      
   if (sbs_dfm_proc_profile.processing_context == SBS_NO_PROCESSING_CONTEXT)
   {
      sbs_dfm_proc_profile.processing_context = SBS_ONLINE_PROCESSING_CONTEXT;
   }

//---------------------- Check Trading Environment ------------------/

//   Print("SBS_EXP iBars=" + IntegerToString(iBars(NULL,0),0,'0'));

   if (iBars(NULL,0) < (SBS_INDI_BARS_NO + 1))                       // Check bars number
   {
      if (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT)
      {
         Indicate_SBS_DFM_Processing_State();
      }
      else
      {
         Update_Labels();
      }

//--- Set DFM Empty Resopnse Signal ---/
      
      SBS_DFM_Set_PHF_Response_Signal(SBS_PHF_RESP_LABEL_EMPTY_SIGNAL);

//------------------------------------------------------------------/
      
      return(0);
   } 

//---------------- Check if PATTERNS ENV is ACTIVE (conditional) ---/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE) &&
         (sbs_pattern_profile.processing_state != SBS_PATTERNS_PROFILE_PROCESS_ACTIVE)
      )
   {
      Print("PATTERNS Processing ENV is NOT ACTIVE");

//--- Set DFM Empty Resopnse Signal ---/
      
      SBS_DFM_Set_PHF_Response_Signal(SBS_PHF_RESP_LABEL_EMPTY_SIGNAL);

//------------------------------------------------------------------/
      
      return(0);
   }

//---------------------- Set processing parameters -----------------/

   Set_Processing_Parameters();

   if (Test_ZD_Code() != 0)
   {
      Print("SBS Test_ZD_Code() ERROR");

//--- Set DFM Empty Resopnse Signal ---/
      
      SBS_DFM_Set_PHF_Response_Signal(SBS_PHF_RESP_LABEL_EMPTY_SIGNAL);

//------------------------------------------------------------------/
      
      return(0);
   }

//---------------------- Collect SBS_INDI Data ----------------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
//      sbs_indi_01_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_01_NAME, 0, i_cnt);
//      sbs_indi_02_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_02_NAME, 0, i_cnt);

//      sbs_indi_ttc_01_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_TTC_01_NAME, 0, i_cnt);

//      sbs_indi_ma_01_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_MA_01_NAME, 0, i_cnt);
      
//      sbs_indi_dss_of_macd_01_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_DSS_OF_MACD_01_NAME, 0, i_cnt);
//      sbs_indi_dss_of_macd_02_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_DSS_OF_MACD_01_NAME, 1, i_cnt);
//      sbs_indi_dss_of_macd_03_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_DSS_OF_MACD_01_NAME, 3, i_cnt);

//      sbs_indi_rmi_rsx_01_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_RMI_RSX_01_NAME, 0, i_cnt);
//      sbs_indi_rmi_rsx_02_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_RMI_RSX_01_NAME, 1, i_cnt);
      
//      for (j_cnt = 0; j_cnt < SBS_FT_SERIES_INDI_TOTAL; j_cnt++)
//      {
//         sbs_indi_ft_buy_data [j_cnt][i_cnt] = iCustom(NULL, 0, sbs_indi_ft_series_name[j_cnt], SBS_INDI_FT_BUY_BUFFER,  i_cnt);
//         sbs_indi_ft_sell_data[j_cnt][i_cnt] = iCustom(NULL, 0, sbs_indi_ft_series_name[j_cnt], SBS_INDI_FT_SELL_BUFFER, i_cnt);
//      }
   
      j_cnt = 2;
      sbs_indi_ft_buy_data [j_cnt][i_cnt] = iCustom(NULL, 0, sbs_indi_ft_series_name[j_cnt], SBS_INDI_FT_BUY_BUFFER,  i_cnt);
      sbs_indi_ft_sell_data[j_cnt][i_cnt] = iCustom(NULL, 0, sbs_indi_ft_series_name[j_cnt], SBS_INDI_FT_SELL_BUFFER, i_cnt);
      
      sbs_indi_zzl_down_data[i_cnt] = iCustom(NULL, 0, SBS_INDI_ZZL_NAME, 1,  i_cnt);
      sbs_indi_zzl_up_data[i_cnt]   = iCustom(NULL, 0, SBS_INDI_ZZL_NAME, 2,  i_cnt);
      
      if (sbs_indi_zzl_down_data[i_cnt] == EMPTY_VALUE)
      {
         sbs_indi_zzl_down_data[i_cnt] = 0.0;
      }
      if (sbs_indi_zzl_up_data[i_cnt] == EMPTY_VALUE)
      {
         sbs_indi_zzl_up_data[i_cnt] = 0.0;
      }

   }
*/
//---------------------- Collect SBS_INDI FT Data -------------------/
/*   
   sbs_indi_ft_signal_no = 0;                 // count of collected ft signals
   
   sbs_indi_ft_01[0].signal     = NO_ORDER;
   sbs_indi_ft_01[0].bar_number = 0;
   sbs_indi_ft_01[0].value      = 0;
   
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_indi_ft_value = iCustom(NULL, 0, SBS_INDI_FT_01_NAME, SBS_INDI_FT_BUY_BUFFER, i_cnt);
      
      if (sbs_indi_ft_value != EMPTY_VALUE)
      {
         sbs_indi_ft_01[sbs_indi_ft_signal_no].signal = BUY_ORDER;
         sbs_indi_ft_01[sbs_indi_ft_signal_no].bar_number = i_cnt;
         sbs_indi_ft_01[sbs_indi_ft_signal_no].value = sbs_indi_ft_value;
         
         sbs_indi_ft_signal_no = sbs_indi_ft_signal_no + 1;
         if (sbs_indi_ft_signal_no >= SBS_INDI_FT_SIGNAL_NO)   break;
         
         continue;
      }
      
      sbs_indi_ft_value = iCustom(NULL, 0, SBS_INDI_FT_01_NAME, SBS_INDI_FT_SELL_BUFFER, i_cnt);
      
      if (sbs_indi_ft_value != EMPTY_VALUE)
      {
         sbs_indi_ft_01[sbs_indi_ft_signal_no].signal = SELL_ORDER;
         sbs_indi_ft_01[sbs_indi_ft_signal_no].bar_number = i_cnt;
         sbs_indi_ft_01[sbs_indi_ft_signal_no].value = sbs_indi_ft_value;
         
         sbs_indi_ft_signal_no = sbs_indi_ft_signal_no + 1;
         if (sbs_indi_ft_signal_no >= SBS_INDI_FT_SIGNAL_NO)   break;
         
         continue;
      }

   }
*/
//------------------------ Collect i_Reg1 & i_Reg2 data -------------/
/*
   for (j_cnt = 0; j_cnt <= (MAX_IREG_NO_04 - 1); j_cnt++)
   {
      i_Reg1[0][j_cnt] = iCustom(NULL, 0, SBS_INDI_IREG_01_NAME, 0, j_cnt);
      i_Reg1[1][j_cnt] = iCustom(NULL, 0, SBS_INDI_IREG_01_NAME, 1, j_cnt);
      i_Reg1[2][j_cnt] = iCustom(NULL, 0, SBS_INDI_IREG_01_NAME, 2, j_cnt);
         
      i_Reg2[0][j_cnt] = iCustom(NULL, 0, SBS_INDI_IREG_02_NAME, 0, j_cnt);
      i_Reg2[1][j_cnt] = iCustom(NULL, 0, SBS_INDI_IREG_02_NAME, 1, j_cnt);
      i_Reg2[2][j_cnt] = iCustom(NULL, 0, SBS_INDI_IREG_02_NAME, 2, j_cnt);
   }
*/  
//---------------------- Get HEIKEN data ---------------------------------------/
/*
   for (i_cnt = 0; i_cnt < MAX_HEIKEN_NO; i_cnt++)
   {
      for (j_cnt = 0; j_cnt <= 3; j_cnt++)
      {
         HA2[j_cnt] = iCustom(NULL, 0, SBS_INDI_HKN_02_NAME, j_cnt, i_cnt);
         HA3[j_cnt] = iCustom(NULL, 0, SBS_INDI_HKN_03_NAME, j_cnt, i_cnt);
         HA4[j_cnt] = iCustom(NULL, 0, SBS_INDI_HKN_04_NAME, j_cnt, i_cnt);
      }

      ha2_min_val[i_cnt] = MathMin(MathMin(HA2[0],HA2[1]),MathMin(HA2[2],HA2[3]));
      ha3_min_val[i_cnt] = MathMin(MathMin(HA3[0],HA3[1]),MathMin(HA3[2],HA3[3]));
      ha4_min_val[i_cnt] = MathMin(MathMin(HA4[0],HA4[1]),MathMin(HA4[2],HA4[3]));
      
      ha2_max_val[i_cnt] = MathMax(MathMax(HA2[0],HA2[1]),MathMax(HA2[2],HA2[3]));
      ha3_max_val[i_cnt] = MathMax(MathMax(HA3[0],HA3[1]),MathMax(HA3[2],HA3[3]));
      ha4_max_val[i_cnt] = MathMax(MathMax(HA4[0],HA4[1]),MathMax(HA4[2],HA4[3]));
   }

//---------------------- Get HA2 data ------------------------------------------/

   for (j_cnt = 0; j_cnt <= 3; j_cnt++)
   {
      HA2[j_cnt] = iCustom(NULL, 0, SBS_INDI_HKN_02_NAME, j_cnt, 0);
   }
   
   ha2_max = MathMax(MathMax(HA2[0],HA2[1]),MathMax(HA2[2],HA2[3]));    // get HA2 maximum
   ha2_min = MathMin(MathMin(HA2[0],HA2[1]),MathMin(HA2[2],HA2[3]));    // get HA2 minimum
   
//---------------------- Get HA3 data ------------------------------------------/

   for (j_cnt = 0; j_cnt <= 3; j_cnt++)
   {
      HA3[j_cnt] = iCustom(NULL, 0, SBS_INDI_HKN_03_NAME, j_cnt, 0);
   }
   
   ha3_max = MathMax(MathMax(HA3[0],HA3[1]),MathMax(HA3[2],HA3[3]));    // get HA3 maximum
   ha3_min = MathMin(MathMin(HA3[0],HA3[1]),MathMin(HA3[2],HA3[3]));    // get HA3 minimum

//---------------------- Get HA4 data ------------------------------------------/

   for (j_cnt = 0; j_cnt <= 3; j_cnt++)
   {
      HA4[j_cnt] = iCustom(NULL, 0, SBS_INDI_HKN_04_NAME, j_cnt, 0);
   }
   
   ha4_max = MathMax(MathMax(HA4[0],HA4[1]),MathMax(HA4[2],HA4[3]));    // get HA4 maximum
   ha4_min = MathMin(MathMin(HA4[0],HA4[1]),MathMin(HA4[2],HA4[3]));    // get HA4 minimum
*/

//---------------------- Collect SBS_ALX FT Data --------------------/
/*
//--- Reset Data ---/

   alx_ft_signal.trend = NO_ORDER;
   alx_ft_signal.bar   = 0;
   alx_ft_signal.value = 0;
   
   alx_ft_signal.trend_02 = NO_ORDER;
   alx_ft_signal.bar_02   = 0;
   alx_ft_signal.value_02 = 0;
   
//--- Collect Data ---/

//--- FT signal #1 ---/
   
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_indi_ft_value = iCustom(NULL, 0, SBS_ALX_FT, SBS_INDI_FT_BUY_BUFFER, i_cnt);
      
      if (sbs_indi_ft_value != EMPTY_VALUE)
      {
         alx_ft_signal.trend = BUY_ORDER;
         alx_ft_signal.bar   = i_cnt;
         alx_ft_signal.value = sbs_indi_ft_value;

         break;
      }
      
      sbs_indi_ft_value = iCustom(NULL, 0, SBS_ALX_FT, SBS_INDI_FT_SELL_BUFFER, i_cnt);
      
      if (sbs_indi_ft_value != EMPTY_VALUE)
      {
         alx_ft_signal.trend = SELL_ORDER;
         alx_ft_signal.bar   = i_cnt;
         alx_ft_signal.value = sbs_indi_ft_value;

         break;
      }
   }

//--- FT signal #2 ---/
   
   for (i_cnt = (alx_ft_signal.bar + 1); i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_indi_ft_value = iCustom(NULL, 0, SBS_ALX_FT, SBS_INDI_FT_BUY_BUFFER, i_cnt);
      
      if (sbs_indi_ft_value != EMPTY_VALUE)
      {
         alx_ft_signal.trend_02 = BUY_ORDER;
         alx_ft_signal.bar_02   = i_cnt;
         alx_ft_signal.value_02 = sbs_indi_ft_value;

         break;
      }
      
      sbs_indi_ft_value = iCustom(NULL, 0, SBS_ALX_FT, SBS_INDI_FT_SELL_BUFFER, i_cnt);
      
      if (sbs_indi_ft_value != EMPTY_VALUE)
      {
         alx_ft_signal.trend_02 = SELL_ORDER;
         alx_ft_signal.bar_02   = i_cnt;
         alx_ft_signal.value_02 = sbs_indi_ft_value;

         break;
      }
   }
*/
//---------------------- Collect SBS_ALX_MCDP Data ------------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_mcdp_Diff_UpAbove_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_MCDP, 0, i_cnt);
      sbs_alx_mcdp_Diff_DnAbove_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_MCDP, 1, i_cnt);
      sbs_alx_mcdp_Diff_UpBelow_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_MCDP, 2, i_cnt);
      sbs_alx_mcdp_Diff_DnBelow_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_MCDP, 3, i_cnt);
      sbs_alx_mcdp_Macd_data[i_cnt]         = iCustom(NULL, 0, SBS_ALX_MCDP, 4, i_cnt);
      sbs_alx_mcdp_Avg_data[i_cnt]          = iCustom(NULL, 0, SBS_ALX_MCDP, 5, i_cnt);
      
      if ((sbs_alx_mcdp_Diff_UpAbove_data[i_cnt] == EMPTY) || (sbs_alx_mcdp_Diff_UpAbove_data[i_cnt] == EMPTY_VALUE))
      {
         sbs_alx_mcdp_Diff_UpAbove_data[i_cnt] = 0;
      }
      
      if ((sbs_alx_mcdp_Diff_DnAbove_data[i_cnt] == EMPTY) || (sbs_alx_mcdp_Diff_DnAbove_data[i_cnt] == EMPTY_VALUE))
      {
         sbs_alx_mcdp_Diff_DnAbove_data[i_cnt] = 0;
      }
      
      if ((sbs_alx_mcdp_Diff_UpBelow_data[i_cnt] == EMPTY) || (sbs_alx_mcdp_Diff_UpBelow_data[i_cnt] == EMPTY_VALUE))
      {
         sbs_alx_mcdp_Diff_UpBelow_data[i_cnt] = 0;
      }
      
      if ((sbs_alx_mcdp_Diff_DnBelow_data[i_cnt] == EMPTY) || (sbs_alx_mcdp_Diff_DnBelow_data[i_cnt] == EMPTY_VALUE))
      {
         sbs_alx_mcdp_Diff_DnBelow_data[i_cnt] = 0;
      }
      
      if ((sbs_alx_mcdp_Macd_data[i_cnt] == EMPTY) || (sbs_alx_mcdp_Macd_data[i_cnt] == EMPTY_VALUE))
      {
         sbs_alx_mcdp_Macd_data[i_cnt] = 0;
      }
      
      if ((sbs_alx_mcdp_Avg_data[i_cnt] == EMPTY) || (sbs_alx_mcdp_Avg_data[i_cnt] == EMPTY_VALUE))
      {
         sbs_alx_mcdp_Avg_data[i_cnt] = 0;
      }
   }
*/

//---------------------- Collect SBS_ALX_TDI Data -------------------/
/*
   sbs_local_indi_name = SBS_ALX_TDI;        // H1

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_4H_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_GMTS_PROFILE)
      )
   {
      sbs_local_indi_name = SBS_ALX_TDI_M15; // M15
   }

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_tdi_bandUp_data[i_cnt]        = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_tdi_bandMiddle_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_tdi_bandDown_data[i_cnt]      = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_tdi_rsiPriceLine_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      sbs_alx_tdi_rsiSignalLine_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }

//---------------------- Collect SBS_ALX_TDI_04 Data ----------------/

   sbs_local_indi_name = SBS_ALX_TDI_04;     // H4

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_GMTS_PROFILE)
      )
   {
      sbs_local_indi_name = SBS_ALX_TDI;     // H1
   }

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_tdi_04_bandUp_data[i_cnt]        = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_tdi_04_bandMiddle_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_tdi_04_bandDown_data[i_cnt]      = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_tdi_04_rsiPriceLine_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      sbs_alx_tdi_04_rsiSignalLine_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }

//---------------------- Collect SBS_ALX_TDI_MDL Data ---------------/

   sbs_local_indi_name = SBS_ALX_TDI;        // H1
   
   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_GMTS_PROFILE)
      )
   {
      sbs_local_indi_name = SBS_ALX_TDI_M30;     // M30
   }

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_tdi_MDL_bandUp_data[i_cnt]        = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_tdi_MDL_bandMiddle_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_tdi_MDL_bandDown_data[i_cnt]      = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_tdi_MDL_rsiPriceLine_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      sbs_alx_tdi_MDL_rsiSignalLine_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }
*/
//======================= Collect SBS_ALX_APB Data -------------------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
      )
   {

      i_cnt = 0;     // current values only

      alx_apb_signal.HA_0     = iCustom(NULL, 0, SBS_ALX_APB, 0, i_cnt);
      alx_apb_signal.HA_1     = iCustom(NULL, 0, SBS_ALX_APB, 1, i_cnt);
      alx_apb_signal.HA_Open  = iCustom(NULL, 0, SBS_ALX_APB, 2, i_cnt);
      alx_apb_signal.HA_Close = iCustom(NULL, 0, SBS_ALX_APB, 3, i_cnt);

//--- Read Last 3 bars ---/

      for (i_cnt = 0; i_cnt < SBS_ALX_APB_BARS_NO; i_cnt++)
      {
         sbs_alx_apb_HA_0_data[i_cnt]     = iCustom(NULL, 0, SBS_ALX_APB, 0, i_cnt);
         sbs_alx_apb_HA_1_data[i_cnt]     = iCustom(NULL, 0, SBS_ALX_APB, 1, i_cnt);
         sbs_alx_apb_HA_Open_data[i_cnt]  = iCustom(NULL, 0, SBS_ALX_APB, 2, i_cnt);
         sbs_alx_apb_HA_Close_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_APB, 3, i_cnt);
      }
   }

//---------------------- Collect SBS_ALX_PAC (Moving Average) Data --/
/*
   i_cnt = 0;     // current values only

   alx_pac_signal.HMA   = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_HIGH,   0);
   alx_pac_signal.LMA   = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_LOW,    0);
   alx_pac_signal.MMA   = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_MEDIAN, 0);

   alx_pac_signal.HMA_1 = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_HIGH,   1);
   alx_pac_signal.LMA_1 = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_LOW,    1);
   alx_pac_signal.MMA_1 = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_MEDIAN, 1);
   
   alx_pac_signal.HMA_2 = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_HIGH,   2);
   alx_pac_signal.LMA_2 = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_LOW,    2);
   alx_pac_signal.MMA_2 = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_MEDIAN, 2);
   
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_pac_HMA_data[i_cnt] = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_HIGH, i_cnt);
      sbs_alx_pac_LMA_data[i_cnt] = iMA(NULL, 0, 5, 0, MODE_SMMA, PRICE_LOW,  i_cnt);
   }
*/
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE)
   {
      sbs_alx_pac_MA150_data[i_cnt] = iMA(NULL, 0, 150, 0, MODE_SMA, PRICE_CLOSE, i_cnt);
      sbs_alx_pac_MA450_data[i_cnt] = iMA(NULL, 0, 450, 0, MODE_SMA, PRICE_CLOSE, i_cnt);
   }
   
//---------------------- Collect SBS_ALX_VLT Data -------------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_vlt_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_VLT, 0, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_RF Data --------------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_rf_Linear_Value_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_RF, 0, i_cnt);
      sbs_alx_rf_Upper_Limit_data[i_cnt]  = iCustom(NULL, 0, SBS_ALX_RF, 1, i_cnt);
      sbs_alx_rf_Lower_Limit_data[i_cnt]  = iCustom(NULL, 0, SBS_ALX_RF, 2, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_DSR Data --------------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_dsr_Resistance_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_DSR, 0, i_cnt);
      sbs_alx_dsr_Support_data[i_cnt]    = iCustom(NULL, 0, SBS_ALX_DSR, 1, i_cnt);
      sbs_alx_dsr_SR_Mean_data[i_cnt]    = iCustom(NULL, 0, SBS_ALX_DSR, 2, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_GMTS Data ------------------/
/*
   sbs_local_indi_name = SBS_ALX_GMTS_M15;            // M15

   for (i_cnt = 0; i_cnt < SBS_INDI_LAST_STATE_BARS_NO; i_cnt++)
   {
      sbs_alx_gmts_M15_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_gmts_M15_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_gmts_M15_UpR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_gmts_M15_DnR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
   }
 
   sbs_local_indi_name = SBS_ALX_GMTS_M30;            // M30

   for (i_cnt = 0; i_cnt < SBS_INDI_LAST_STATE_BARS_NO; i_cnt++)
   {
      sbs_alx_gmts_M30_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_gmts_M30_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_gmts_M30_UpR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_gmts_M30_DnR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
   }
 
   sbs_local_indi_name = SBS_ALX_GMTS_H1;             // H1

   for (i_cnt = 0; i_cnt < SBS_INDI_LAST_STATE_BARS_NO; i_cnt++)
   {
      sbs_alx_gmts_H1_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_gmts_H1_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_gmts_H1_UpR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_gmts_H1_DnR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
   }
   
   sbs_local_indi_name = SBS_ALX_GMTS_H4;             // H4

   for (i_cnt = 0; i_cnt < SBS_INDI_LAST_STATE_BARS_NO; i_cnt++)
   {
      sbs_alx_gmts_H4_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_gmts_H4_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_gmts_H4_UpR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_gmts_H4_DnR_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_ASCTREND_4TF Data ----------/
/*
   sbs_local_indi_name = SBS_ALX_ASCTREND_4TF;            // 4TF (M15, M30, H1, H4)

   for (i_cnt = 0; i_cnt < SBS_INDI_LAST_STATE_BARS_NO; i_cnt++)
   {
      sbs_alx_asctrend_4tf_R1Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_asctrend_4tf_R1Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_asctrend_4tf_R2Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_asctrend_4tf_R2Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      sbs_alx_asctrend_4tf_R3Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
      sbs_alx_asctrend_4tf_R3Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
      sbs_alx_asctrend_4tf_R4Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
      sbs_alx_asctrend_4tf_R4Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 7, i_cnt);
      
      if (sbs_alx_asctrend_4tf_R1Up_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R1Up_data[i_cnt] = 0;}
      if (sbs_alx_asctrend_4tf_R1Dn_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R1Dn_data[i_cnt] = 0;}
      
      if (sbs_alx_asctrend_4tf_R2Up_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R2Up_data[i_cnt] = 0;}
      if (sbs_alx_asctrend_4tf_R2Dn_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R2Dn_data[i_cnt] = 0;}
      
      if (sbs_alx_asctrend_4tf_R3Up_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R3Up_data[i_cnt] = 0;}
      if (sbs_alx_asctrend_4tf_R3Dn_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R3Dn_data[i_cnt] = 0;}
      
      if (sbs_alx_asctrend_4tf_R4Up_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R4Up_data[i_cnt] = 0;}
      if (sbs_alx_asctrend_4tf_R4Dn_data[i_cnt] == EMPTY_VALUE)   {sbs_alx_asctrend_4tf_R4Dn_data[i_cnt] = 0;}

   }
*/
//---------------------- Collect SBS_ALX_CHKN_VLT Data --------------/
/*
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_GMTS_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_CHKN_VLT;

      for (i_cnt = 0; i_cnt < SBS_INDI_LAST_STATE_BARS_NO; i_cnt++)
      {
         sbs_alx_chkn_vlt_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      }
   }
*/
//---------------------- Collect SBS_ALX_STOCH_MTF Data -------------/
/*
   sbs_local_indi_name = SBS_ALX_STOCH_MTF_M15;        // M15

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_stoch_mtf_M15_Kline_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_stoch_mtf_M15_KDn_data[i_cnt]   = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_stoch_mtf_M15_Kopen_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_stoch_mtf_M15_Dline_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }
   
   sbs_local_indi_name = SBS_ALX_STOCH_MTF_H1;        // H1

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_stoch_mtf_H1_Kline_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_stoch_mtf_H1_KDn_data[i_cnt]   = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_stoch_mtf_H1_Kopen_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_stoch_mtf_H1_Dline_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }
   
   sbs_local_indi_name = SBS_ALX_STOCH_MTF_H4;        // H4

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_stoch_mtf_H4_Kline_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_stoch_mtf_H4_KDn_data[i_cnt]   = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_stoch_mtf_H4_Kopen_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_stoch_mtf_H4_Dline_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_WCCI Data ------------------/
/*
   sbs_local_indi_name = SBS_ALX_WCCI_H1;        // H1

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_wcci_H1_azHistCCI_data[i_cnt]         = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_wcci_H1_bzHistCCI_data[i_cnt]         = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_wcci_H1_azHistNonTrendCCI_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_wcci_H1_bzHistNonTrendCCI_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      sbs_alx_wcci_H1_mainCCI_data[i_cnt]           = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
      sbs_alx_wcci_H1_turboCCI_data[i_cnt]          = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
      
      if (sbs_alx_wcci_H1_azHistCCI_data[i_cnt] == 0)          {sbs_alx_wcci_H1_azHistCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H1_bzHistCCI_data[i_cnt] == 0)          {sbs_alx_wcci_H1_bzHistCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H1_azHistNonTrendCCI_data[i_cnt] == 0)  {sbs_alx_wcci_H1_azHistNonTrendCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H1_bzHistNonTrendCCI_data[i_cnt] == 0)  {sbs_alx_wcci_H1_bzHistNonTrendCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H1_mainCCI_data[i_cnt] == 0)            {sbs_alx_wcci_H1_mainCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H1_turboCCI_data[i_cnt] == 0)           {sbs_alx_wcci_H1_turboCCI_data[i_cnt] = EMPTY_VALUE;}
   }
   
   sbs_local_indi_name = SBS_ALX_WCCI_H4;        // H4

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_wcci_H4_azHistCCI_data[i_cnt]         = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_wcci_H4_bzHistCCI_data[i_cnt]         = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_wcci_H4_azHistNonTrendCCI_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      sbs_alx_wcci_H4_bzHistNonTrendCCI_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      sbs_alx_wcci_H4_mainCCI_data[i_cnt]           = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
      sbs_alx_wcci_H4_turboCCI_data[i_cnt]          = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
      
      if (sbs_alx_wcci_H4_azHistCCI_data[i_cnt] == 0)          {sbs_alx_wcci_H4_azHistCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H4_bzHistCCI_data[i_cnt] == 0)          {sbs_alx_wcci_H4_bzHistCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H4_azHistNonTrendCCI_data[i_cnt] == 0)  {sbs_alx_wcci_H4_azHistNonTrendCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H4_bzHistNonTrendCCI_data[i_cnt] == 0)  {sbs_alx_wcci_H4_bzHistNonTrendCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H4_mainCCI_data[i_cnt] == 0)            {sbs_alx_wcci_H4_mainCCI_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_wcci_H4_turboCCI_data[i_cnt] == 0)           {sbs_alx_wcci_H4_turboCCI_data[i_cnt] = EMPTY_VALUE;}
   }
*/
//---------------------- Collect SBS_ALX_PIVOT Data -----------------/
/*
   sbs_local_indi_name = SBS_ALX_PIVOT;         // Pivot

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_pivot_Res3_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_pivot_Res2_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_pivot_Res1_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      
      sbs_alx_pivot_Pivot_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      
      sbs_alx_pivot_Supp1_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
      sbs_alx_pivot_Supp2_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
      sbs_alx_pivot_Supp3_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_XST_MTF Data -----------------/
/*
   sbs_local_indi_name = SBS_ALX_XST_MTF;                // Basic xST H1

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_xst_mtf_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_xst_mtf_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
   }

   sbs_local_indi_name = SBS_ALX_XST_MTF_40;             // Smooth xST (M15, 40)

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_xst_mtf_40_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_xst_mtf_40_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      
      if (sbs_alx_xst_mtf_40_Dn_data[i_cnt] == 0)  {sbs_alx_xst_mtf_40_Dn_data[i_cnt] = EMPTY_VALUE;}
      if (sbs_alx_xst_mtf_40_Up_data[i_cnt] == 0)  {sbs_alx_xst_mtf_40_Up_data[i_cnt] = EMPTY_VALUE;}
   }

   sbs_local_indi_name = SBS_ALX_XST_MTF_H4;             // xST H4

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_xst_mtf_H4_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_xst_mtf_H4_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
   }
   
   sbs_local_indi_name = SBS_ALX_XST_MTF_60_34;          // Smooth xST (M15, 60, 3.4)

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_xst_mtf_60_34_Dn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      sbs_alx_xst_mtf_60_34_Up_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
   }
*/
//====================== Collect SBS_ALX_WILDER_DMI Data ------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_WILDER_DMI_M1;             // Wilder's DMI + histo (used bar 0 values only)

      alx_wdmi_signal.dihp = iCustom(NULL, 0, sbs_local_indi_name, 0, 0);
      alx_wdmi_signal.dihm = iCustom(NULL, 0, sbs_local_indi_name, 1, 0);

      alx_wdmi_signal.DIp  = iCustom(NULL, 0, sbs_local_indi_name, 2, 0);
      alx_wdmi_signal.DIm  = iCustom(NULL, 0, sbs_local_indi_name, 3, 0);
   
      alx_wdmi_signal.ADX  = iCustom(NULL, 0, sbs_local_indi_name, 4, 0);
      alx_wdmi_signal.ADXR = iCustom(NULL, 0, sbs_local_indi_name, 5, 0);
   }

//---------------------- Collect SBS_ALX_TMA Data --------------------/
/*
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_4H_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_TMA_BASIC_HI;           // TMA M15 2.0 2 used for basic trend

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_tma_basic_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_tma_basic_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
//         sbs_alx_tma_basic_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         sbs_alx_tma_basic_short_lo_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
   
      sbs_local_indi_name = SBS_ALX_TMA_BASIC_LO;           // TMA M15 2.0 3 used for basic trend

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_tma_basic_short_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_tma_basic_short_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
//         sbs_alx_tma_basic_short_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         sbs_alx_tma_basic_lo_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
   
      sbs_local_indi_name = SBS_ALX_TMA_UPPER1;             // TMA H1 2.0 used for upper1 trend

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_tma_upper1_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_tma_upper1_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_tma_upper1_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
   }
*/
//---------------------- Collect SBS_ALX_MULTI_TMA Data --------------/

   if (
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE) ||
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
      )
   {
//--- SBS_ALX_MULTI_TMA_M1 ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M1;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_m1_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m1_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m1_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_TMA_M5 ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M5;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_m5_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m5_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m5_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
   }
   
   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_RGLR_PROFILE)
   {
//--- SBS_ALX_MULTI_TMA_M1_WIDE ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M1_WIDE;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
//         sbs_alx_multi_tma_m1_wide_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m1_wide_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m1_wide_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_TMA_M5_WIDE ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M5_WIDE;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
//         sbs_alx_multi_tma_m5_wide_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m5_wide_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m5_wide_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_TMA_M15 ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M15;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_m15_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m15_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m15_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_TMA_M15_WIDE ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M15_WIDE;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
//         sbs_alx_multi_tma_m15_wide_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m15_wide_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m15_wide_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_TMA_H1 ---/

      sbs_local_indi_name = SBS_ALX_MULTI_TMA_H1;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_h1_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_h1_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_h1_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

   }

//---------------------- Collect WPR Data ----------------------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE)
   {
      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_wpr_21_data[i_cnt]  = iWPR(NULL,0, 21,i_cnt);
         sbs_alx_wpr_105_data[i_cnt] = iWPR(NULL,0,105,i_cnt);
      }
   }

//---------------------- Collect SBS_ALX_MULTI_KC Data ---------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_SCLP_PROFILE)
   {
//--- SBS_ALX_MULTI_KC_M1_56 ---/

      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_56;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_m1_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_m1_middle_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_kc_m1_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_KC_M1_240 ---/

      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_240;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_240_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_240_middle_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_kc_240_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//--- SBS_ALX_MULTI_KC_M1 ---/
/*
      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_WIDE;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_m1_wide_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_m1_wide_middle_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_kc_m1_wide_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
*/
   }

//---------------------- Collect SBS_ALX_SSL Data -------------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_ssl_up_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_SSL, 0, i_cnt);
      sbs_alx_ssl_dn_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_SSL, 1, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_RSIOMA Data ----------------/
/*
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_rsioma_rsi_01_data[i_cnt]   = iCustom(NULL, 0, SBS_ALX_RSIOMA_01, 0, i_cnt);
      sbs_alx_rsioma_rsida_01_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_RSIOMA_01, 1, i_cnt);
   }
   
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_rsioma_rsi_04_data[i_cnt]   = iCustom(NULL, 0, SBS_ALX_RSIOMA_04, 0, i_cnt);
      sbs_alx_rsioma_rsida_04_data[i_cnt] = iCustom(NULL, 0, SBS_ALX_RSIOMA_04, 1, i_cnt);
   }
*/
//---------------------- Collect SBS_ALX_TSI_MACD Data --------------/
/*
   sbs_local_indi_name = SBS_ALX_TSI_MACD_01;

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_TSI_MACD_M15;
   }

   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_tsi_macd_01_TSI_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_tsi_macd_01_Signal_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
   }
   
   sbs_local_indi_name = SBS_ALX_TSI_MACD_04;

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_15M_60M_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_TSI_MACD_01;
   }
   
   for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
   {
      sbs_alx_tsi_macd_04_TSI_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      sbs_alx_tsi_macd_04_Signal_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
   }
*/

//---------------------- Collect SBS_ALX_FXI3_SEMAFOR Data ----------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_FXI3_SEMAFOR;
      
      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
//--- Collect Data ---/

         sbs_alx_fxi3_semafor_FP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_fxi3_semafor_FP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         
         sbs_alx_fxi3_semafor_NP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         sbs_alx_fxi3_semafor_NP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
         
         sbs_alx_fxi3_semafor_HP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
         sbs_alx_fxi3_semafor_HP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);

//--- Normalize Data ---/

         if (sbs_alx_fxi3_semafor_FP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_FP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_FP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_FP_Dn_data[i_cnt] = 0;}
         
         if (sbs_alx_fxi3_semafor_NP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_NP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_NP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_NP_Dn_data[i_cnt] = 0;}
         
         if (sbs_alx_fxi3_semafor_HP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_HP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_HP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_HP_Dn_data[i_cnt] = 0;}
      }
   }

//---------------------- Collect SBS_ALX_TREND_ZONE MA & TMA_CEP Data ---/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
   {
//--- MA 510 & 55,27 & 3 & 34---/

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_MA_510_data[i_cnt]   = iMA(NULL, 0, 510,  0, MODE_SMA, PRICE_CLOSE, i_cnt);
         sbs_alx_MA_55_27_data[i_cnt] = iMA(NULL, 0,  55, 27, MODE_SMA, PRICE_CLOSE, i_cnt);
         
         sbs_alx_MA_3_data[i_cnt]     = iMA(NULL, 0,   3,  0, MODE_SMA, PRICE_CLOSE, i_cnt);
         sbs_alx_MA_34_data[i_cnt]    = iMA(NULL, 0,  34,  0, MODE_SMA, PRICE_CLOSE, i_cnt);
      }

//--- TMA_CEP_48 ---/

      sbs_local_indi_name = SBS_ALX_TMA_CEP_48;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_TMA_CEP_48_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      }

//--- TMA_CEP_280 ---/

      sbs_local_indi_name = SBS_ALX_TMA_CEP_280;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_TMA_CEP_280_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      }
      
   }

//---------------------- Collect SBS_ALX_TREND_CCI Data -------------/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
   {
      sbs_local_indi_name = SBS_ALX_TREND_CCI;
      
      i_cnt = 0;
      
      sbs_alx_trend_cci_signal.sma_val      = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
      sbs_alx_trend_cci_signal.fast_cci_val = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
      sbs_alx_trend_cci_signal.slow_cci_val = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
   }

//===================================================================/
//=============== Collect SBS_GLOBAL_EXPERT_PATTERNS_PROFILE Data ===/
//===================================================================/

   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
   {
//---------------------- MA510 --------------------------------------/

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_MA_510_data[i_cnt]   = iMA(NULL, 0, 510,  0, MODE_SMA, PRICE_CLOSE, i_cnt);
      }

//---------------------- MA55-27 ------------------------------------/

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_MA_55_27_data[i_cnt] = iMA(NULL, 0,  55, 27, MODE_SMA, PRICE_CLOSE, i_cnt);
      }

//---------------------- TMA_CEP_48 ---------------------------------/

      sbs_local_indi_name = SBS_ALX_TMA_CEP_48;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_TMA_CEP_48_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      }

//---------------------- TMA_CEP_280 --------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_TMA_CEP_280;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_TMA_CEP_280_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      }
*/
//---------------------- FXI3_SEMAFOR (12_34_96) --------------------/

      sbs_local_indi_name = SBS_ALX_FXI3_SEMAFOR_12_34_96;
      
      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
//--- Collect Data ---/

         sbs_alx_fxi3_semafor_FP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_fxi3_semafor_FP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         
         sbs_alx_fxi3_semafor_NP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         sbs_alx_fxi3_semafor_NP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
         
         sbs_alx_fxi3_semafor_HP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
         sbs_alx_fxi3_semafor_HP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);

//--- Normalize Data ---/

         if (sbs_alx_fxi3_semafor_FP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_FP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_FP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_FP_Dn_data[i_cnt] = 0;}
         
         if (sbs_alx_fxi3_semafor_NP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_NP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_NP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_NP_Dn_data[i_cnt] = 0;}
         
         if (sbs_alx_fxi3_semafor_HP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_HP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_HP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_HP_Dn_data[i_cnt] = 0;}
      }

//---------------------- FXI3_SEMAFOR (05) --------------------------/

      sbs_local_indi_name = SBS_ALX_FXI3_SEMAFOR_05;
      
      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
//--- Collect Data ---/

         sbs_alx_fxi3_semafor_05_FP_Up_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_fxi3_semafor_05_FP_Dn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);

//--- Normalize Data ---/

         if (sbs_alx_fxi3_semafor_05_FP_Up_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_05_FP_Up_data[i_cnt] = 0;}
         if (sbs_alx_fxi3_semafor_05_FP_Dn_data[i_cnt] == EMPTY_VALUE)  {sbs_alx_fxi3_semafor_05_FP_Dn_data[i_cnt] = 0;}
      }

//---------------------- TMA_M1 -------------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M1;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_m1_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m1_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m1_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
*/
//---------------------- TMA_M5 -------------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M5;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_m5_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m5_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m5_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
*/
//---------------------- TMA_M15 ------------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_MULTI_TMA_M15;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_tma_m15_md_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_tma_m15_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_tma_m15_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         
         sbs_alx_multi_tma_m15_hi_md_data[i_cnt] = sbs_alx_multi_tma_m15_md_data[i_cnt] + 
                                                   ((sbs_alx_multi_tma_m15_hi_data[i_cnt] - sbs_alx_multi_tma_m15_md_data[i_cnt]) / 2);
         sbs_alx_multi_tma_m15_lo_md_data[i_cnt] = sbs_alx_multi_tma_m15_md_data[i_cnt] - 
                                                   ((sbs_alx_multi_tma_m15_md_data[i_cnt] - sbs_alx_multi_tma_m15_lo_data[i_cnt]) / 2);
      }
*/
//---------------------- KC_M1_56 -----------------------------------/

      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_56;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_m1_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_m1_middle_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_kc_m1_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//---------------------- KC_M1_840_1500 -----------------------------/
/*
      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_840_1500;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_m1_840_1500_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_m1_840_1500_middle_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_multi_kc_m1_840_1500_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }
*/
//---------------------- KC_M1_280_500 ------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_280_500;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_m1_280_500_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_m1_280_500_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         
//         sbs_alx_TMA_CEP_280_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
      }
*/
//---------------------- KC_M1_28_50 --------------------------------/

      sbs_local_indi_name = SBS_ALX_MULTI_KC_M1_28_50;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_multi_kc_m1_28_50_upper_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_multi_kc_m1_28_50_lower_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
      }

//---------------------- WPR_283 ------------------------------------/
/*
      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_wpr_283_data[i_cnt] = iWPR(NULL,0,283,i_cnt);
      }
*/
//---------------------- MASS_INDEX ---------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_MASS_INDEX;
      
      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_mass_index_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
      }
*/
//---------------------- TREND_CCI_14 -------------------------------/
/*
      sbs_local_indi_name = SBS_ALX_TREND_CCI_14;
      
      i_cnt = 0;
      
      sbs_alx_trend_cci_signal.sma_val      = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
      sbs_alx_trend_cci_signal.fast_cci_val = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
      sbs_alx_trend_cci_signal.slow_cci_val = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
      
      sbs_alx_trend_cci_signal.fast_05_cci_val = iCCI(NULL, 0, 7, PRICE_TYPICAL, i_cnt);
*/
//---------------------- TREND_CCI_30_30_05 -------------------------/

      sbs_local_indi_name = SBS_ALX_TREND_CCI_30_30_05;
      
      i_cnt = 0;
      
//      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
//      {
         sbs_alx_MA_5_PS_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
         sbs_alx_cci_30_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
//      }

//---------------------- TREND_CCI_42_14_34 -------------------------/

//      if (Period() == PERIOD_M5)
//      {
         sbs_local_indi_name = SBS_ALX_TREND_CCI_42_14_34;
      
         i_cnt = 0;
      
         sbs_trend_cci_signal_42_14_34.sma_val      = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
         sbs_trend_cci_signal_42_14_34.fast_cci_val = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
         sbs_trend_cci_signal_42_14_34.slow_cci_val = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
//      }

//---------------------- STOCHASTIC OSCILATOR -----------------------/
/*
      sbs_stoch_signal.stoch_05.stoch_val  = iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_MAIN,0);
      sbs_stoch_signal.stoch_05.signal_val = iStochastic(NULL,0,5,3,3,MODE_SMA,0,MODE_SIGNAL,0);
      
      sbs_stoch_signal.stoch_25.stoch_val  = iStochastic(NULL,0,25,15,15,MODE_SMA,0,MODE_MAIN,0);
      sbs_stoch_signal.stoch_25.signal_val = iStochastic(NULL,0,25,15,15,MODE_SMA,0,MODE_SIGNAL,0);
*/
//---------------------- KM_iMA170_iMA510 ---------------------------/
/*
      sbs_local_indi_name = KM_iMA170_iMA510;

//      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      for (i_cnt = 0; i_cnt < 1; i_cnt++)
      {
         sbs_alx_km_ima_Up_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_km_ima_UpUp_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_km_ima_Dn_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         sbs_alx_km_ima_DnDn_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
         sbs_alx_km_ima_NoSig_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
      }
*/
//---------------------- TWO_CCI_Hist_170_55_27 ---------------------/
/*
      sbs_local_indi_name = TWO_CCI_Hist_170_55_27;

//      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      for (i_cnt = 0; i_cnt < 1; i_cnt++)
      {
         sbs_alx_2_cci_hist_Up_data[i_cnt]   = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_2_cci_hist_UpUp_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
         sbs_alx_2_cci_hist_Dn_data[i_cnt]   = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         sbs_alx_2_cci_hist_DnDn_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
      }
*/
//---------------------- Dserg_LRB ----------------------------------/

//--- Dserg_LRB_25 ---/
/*
      sbs_local_indi_name = Dserg_LRB_25;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_dlbr_25_ch_lo_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_dlbr_25_ch_hi_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
//         sbs_alx_dlbr_25_ch_srev_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         
         if (sbs_alx_dlbr_25_ch_lo_data[i_cnt] == 0.0)
         {
            sbs_alx_dlbr_25_ch_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
         }
         
         if (sbs_alx_dlbr_25_ch_hi_data[i_cnt] == 0.0)
         {
            sbs_alx_dlbr_25_ch_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
         }

//         sbs_alx_dlbr_25_ch_b_sig_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
//         sbs_alx_dlbr_25_ch_s_sig_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
      }

//--- Dserg_LRB_50 ---/

      sbs_local_indi_name = Dserg_LRB_50;

      for (i_cnt = 0; i_cnt < SBS_INDI_BARS_NO; i_cnt++)
      {
         sbs_alx_dlbr_50_ch_lo_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 0, i_cnt);
         sbs_alx_dlbr_50_ch_hi_data[i_cnt]    = iCustom(NULL, 0, sbs_local_indi_name, 1, i_cnt);
//         sbs_alx_dlbr_50_ch_srev_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 2, i_cnt);
         
         if (sbs_alx_dlbr_50_ch_lo_data[i_cnt] == 0.0)
         {
            sbs_alx_dlbr_50_ch_lo_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 3, i_cnt);
         }
         
         if (sbs_alx_dlbr_50_ch_hi_data[i_cnt] == 0.0)
         {
            sbs_alx_dlbr_50_ch_hi_data[i_cnt]  = iCustom(NULL, 0, sbs_local_indi_name, 4, i_cnt);
         }

//         sbs_alx_dlbr_50_ch_b_sig_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 5, i_cnt);
//         sbs_alx_dlbr_50_ch_s_sig_data[i_cnt] = iCustom(NULL, 0, sbs_local_indi_name, 6, i_cnt);
      }
*/
//------/
      
   }  // EOF if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)

//---------------------- SBS_Get_Market_Profile_Data ----------------/

   SBS_Get_Market_Profile_Data();

//---------------------- Search Open Order & Get it's Info ----------/

//   Search_SBS_Open_Order();      // or set NO_ORDER

//---------------------- Analyze SBS_INDI Data ----------------------/

   Analyze_SBS_Indi_Data();

//--------------------- Order Management Processing -----------------/

//   SBS_Order_Processing();
   
   SBS_Triangle_Order_Processing();
   
//--------------------- Order Trail Management ----------------------/

//   TrailOrder(order_status);
//   SBS_Pivot_TrailOrder(order_status);
//   SBS_XST_TrailOrder(order_status);
//   SBS_XST_3Sig_TrailOrder(order_status);

//--------------------- Check OFFLINE Stoploss ----------------------/

   if (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT)
   {
//      SBS_DFM_Check_Stoploss();
   }

//--------------------- Process OFFLINE Patterns STAGE --------------/

   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
//      SBS_DFM_Patterns_STAGE_Process();
   }

//--------------------- Process OFFLINE PHF_Response_Signal ---------/

   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
//      SBS_DFM_Process_PHF_Response_Signal();
      
      SBS_Triangle_DFM_Process_PHF_Response_Signal();
   }

//------------------ Process OFFLINE Patterns SL & TRG INDICATION ---/

   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      )
   {
//      SBS_DFM_Patterns_Indicate_SL_TRG_Levels();
      
      SBS_DFM_Triangle_Indicate_SL_TRG_Levels();
   }
   
//--------------------- Update Chart INDICATION ---------------------/

   if (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT)
   {
      Indicate_SBS_DFM_Processing_State();
   }
   else
   {
      SBS_UpdateIndication();
   }
   
//--------------------- Write Chart Screenshots ---------------------/
   
//   Write_SBS_Screen_Shot();         // Success Operation (TLS)
//   Write_TLS_Shadow_Screen_Shot();  // Success Shadow Operation (TLS)
//   Write_Screen_Shot();             // Success Operation (ireg)
//   Write_Shadow_Screen_Shot();      // Success Shadow Operation
//   Write_Weekly_Screen_Shot();      // Weekly Picture
//   Write_F4_Sell_Screen_Shot();     // Filtered Sell Operation
//   Write_F4_Buy_Screen_Shot();      // Filtered Buy Operation

//--------------------- Finalization Process ------------------------/
   
   last_bar_time = Time[0];

//----------------------- End of Start function ---------------------/

   return(0);
}

//----------------------- Module Libraries --------------------------/

#include <SBS_Include\sbs_exp_general_lbr.mqh>
#include <SBS_Include\sbs_exp_labels_lbr.mqh>
#include <SBS_Include\sbs_exp_history_log_lbr.mqh>
#include <SBS_Include\sbs_exp_order_management_lbr.mqh>
#include <SBS_Include\sbs_exp_indi_data_proc_lbr.mqh>
#include <SBS_Include\sbs_shv_zone_cases_lbr.mqh>
#include <SBS_Include\sbs_cases_service_lbr.mqh>
#include <SBS_Include\sbs_order_extra_data_lbr.mqh>
#include <SBS_Include\sbs_order_ft_zzl_cases_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_101_201_1_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_101_201_2_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_102_202_1_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_102_202_2_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_103_203_1_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_104_204_1_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_105_205_1_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_105_205_2_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_106_206_1_lbr.mqh>
#include <SBS_Include\sbs_ft_zzl_cases_confirmation_111_211_1_lbr.mqh>

#include <SBS_Include\sbs_alx_indi_data_proc_lbr.mqh>
#include <SBS_Include\sbs_alx_indi_data_pivot_proc_lbr.mqh>
#include <SBS_Include\sbs_alx_indi_m1_data_proc_lbr.mqh>

#include <SBS_Include\sbs_order_alx_cases_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_bar_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_tdi_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_tdi_M15_H1_H4_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_GMTS_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_asct_pivot_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_xst_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_xst_3sig_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_tma_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_m1_tma_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_s2_m1_tma_RGLR_lbr.mqh>

#include <SBS_Include\sbs_alx_cases_service_lbr.mqh>

#include <SBS_Include\sbs_exp_OrderReliable.mqh>

//----------------------- SBS DFM MBS Module Libraries --------------/

#include <SBS_Include\sbs_dfm_proc_library.mqh>
#include <MBS_Include\mbs_indication_library.mqh>
#include <SBS_Include\sbs_dfm_indication_library.mqh>

//----------------------- SBS ILND Module Libraries -----------------/

#include <SBS_Include\sbs_alx_ILND_M1_data_proc_lbr.mqh>
#include <SBS_Include\sbs_order_alx_cases_islands_lbr.mqh>

#include <SBS_Include\sbs_islands_case_123_322_lbr.mqh>
#include <SBS_Include\sbs_islands_case_123_333_global_lbr.mqh>

//----------------------- SBS Patterns Module Libraries -------------/

#include <SBS_Include\Patterns\sbs_patterns_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_dlrb_lbr.mqh>
#include <SBS_Include\Patterns\sbs_alx_patterns_data_proc_lbr.mqh>
#include <SBS_Include\Patterns\sbs_alx_patterns_cnd_data_proc_lbr.mqh>
#include <SBS_Include\Patterns\sbs_order_alx_cases_patterns_lbr.mqh>
#include <SBS_Include\Patterns\sbs_order_alx_cases_pattern_km_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_order_mng_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_label_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_kc_trend_lbr.mqh>

#include <SBS_Include\Patterns\sbs_patterns_55_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_55_cases_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_combo_cases_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_combo_sdot_cases_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_combo_bdot_trend_lbr.mqh>
#include <SBS_Include\Patterns\sbs_patterns_kc_trend_cases_lbr.mqh>

#include <SBS_Include\Patterns\sbs_patterns_impulse_cases_lbr.mqh>
#include <SBS_Include\Patterns\sbs_pic_regular_strong_lbr.mqh>
#include <SBS_Include\Patterns\sbs_pic_regular_ml5_cross_lbr.mqh>
#include <SBS_Include\Patterns\sbs_pic_regular_wpr_strong_lbr.mqh>
#include <SBS_Include\Patterns\sbs_pic_regular_weak_lbr.mqh>
#include <SBS_Include\Patterns\sbs_pic_aamt_tdot_lbr.mqh>
#include <SBS_Include\Patterns\sbs_pic_sb_breakthrough_lbr.mqh>

#include <SBS_Include\Patterns\sbs_patterns_p_condition_lbr.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_304_101.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_304_2.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_304_3_9.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_11.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_112.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_1101.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_12.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_121.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_13.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_305_14.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_306_22.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_306_28.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_307_31.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_307_32.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_307_33.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_307_35.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_307_38.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_308_41.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_308_42.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_308_43.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_308_44.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_309_52.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_309_53.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_309_54.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_309_55.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_309_58.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_309_551.mqh>

#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_310.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_310_1.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_310_2.mqh>
#include <SBS_Include\Patterns\P_Conditions\sbs_pp_cnd_310_3.mqh>

#include <SBS_Include\Patterns\sbs_patterns_alx_123_cases_lbr.mqh>

#include <SBS_Include\Patterns\sbs_patterns_target_set_lbr.mqh>
#include <SBS_Include\Patterns\P_Tagret\sbs_ptgt_set_310_1.mqh>
#include <SBS_Include\Patterns\P_Tagret\sbs_ptgt_set_310_2.mqh>
#include <SBS_Include\Patterns\P_Tagret\sbs_ptgt_set_310_3.mqh>

#include <SBS_Include\Patterns\sbs_patterns_close_cases_lbr.mqh>
#include <SBS_Include\Patterns\P_Close\sbs_p_close_gen_2_lbr.mqh>

#include <SBS_Include\Patterns\P_SL\sbs_p_sl_gen_2_lbr.mqh>

#include <SBS_Include\Patterns\P_Market\sbs_market_data_lbr.mqh>

//----------------------- SBS Triangle Module Libraries -------------/

#include <SBS_Include\Triangle\sbs_trngl_collect_data_lbr.mqh>
#include <SBS_Include\Triangle\sbs_trngl_cases_lbr.mqh>
#include <SBS_Include\Triangle\sbs_trngl_order_proc_lbr.mqh>
#include <SBS_Include\Triangle\sbs_trngl_dfm_proc_lbr.mqh>

//======================= eof SBS_EXP_04.mq4 ========================/