//================== sbs_alx_indi_data_proc_hdr.mqh =======================/

//-------------------------- Definitions -----------------------------------/

#define  SBS_ALX_MCDP         "SBS_ALX_MACD_PLATIMUN_01"       // MACD Platinum (standard)

#define  SBS_ALX_FT           "SBS_INDIS\\SBS_ALX_FT_01"        // Fiji Trend (standard)

#define  SBS_ALX_TDI_M15      "SBS_INDIS\\SBS_ALX_TDI_M15"      // TDI (M15 Option)
#define  SBS_ALX_TDI_M30      "SBS_INDIS\\SBS_ALX_TDI_M30"      // TDI (M30 Option)
#define  SBS_ALX_TDI          "SBS_INDIS\\SBS_ALX_TDI_01"       // TDI (H1 Option)
#define  SBS_ALX_TDI_04       "SBS_INDIS\\SBS_ALX_TDI_H4"       // TDI (H4 Option)

#define  SBS_ALX_APB          "SBS_INDIS\\SBS_ALX_APB_01"       // Synergy Heiken Ashi
#define  SBS_ALX_SSL          "SBS_INDIS\\SBS_SSL_FAST_SBAR_4H" // SSL fast sBar alert mtf nmc 4H

#define  SBS_ALX_RSIOMA_01    "SBS_INDIS\\SBS_ALX_RSIOMA_H1"    // rsioma_nrp_mtf+alerts nmc
#define  SBS_ALX_RSIOMA_04    "SBS_INDIS\\SBS_ALX_RSIOMA_H4"    // rsioma_nrp_mtf+alerts nmc

#define  SBS_ALX_TSI_MACD_M15 "SBS_INDIS\\SBS_ALX_TSI_MACD_M15"   // tsi_macd M15
#define  SBS_ALX_TSI_MACD_01  "SBS_INDIS\\SBS_ALX_TSI_MACD_H1"    // tsi_macd H1
#define  SBS_ALX_TSI_MACD_04  "SBS_INDIS\\SBS_ALX_TSI_MACD_H4"    // tsi_macd H4

#define  SBS_ALX_GMTS_M15     "SBS_INDIS\\SBS_ALX_GMTS_M15"     // gmts M15
#define  SBS_ALX_GMTS_M30     "SBS_INDIS\\SBS_ALX_GMTS_M30"     // gmts M30
#define  SBS_ALX_GMTS_H1      "SBS_INDIS\\SBS_ALX_GMTS_H1"      // gmts H1
#define  SBS_ALX_GMTS_H4      "SBS_INDIS\\SBS_ALX_GMTS_H4"      // gmts H4

#define  SBS_ALX_ASCTREND_4TF "SBS_INDIS\\SBS_ALX_ASCTREND_4TF" // ASCTrend 4TF

#define  SBS_ALX_CHKN_VLT     "SBS_INDIS\\SBS_ALX_CHKN_VLT"     // Chaikin Volatility Kalenzo

#define  SBS_ALX_STOCH_MTF_M15   "SBS_INDIS\\SBS_INDI_STOCH_MTF_M15"    // stochastic MTF M15
#define  SBS_ALX_STOCH_MTF_H1    "SBS_INDIS\\SBS_INDI_STOCH_MTF_H1"     // stochastic MTF H1
#define  SBS_ALX_STOCH_MTF_H4    "SBS_INDIS\\SBS_INDI_STOCH_MTF_H4"     // stochastic MTF H4

#define  SBS_ALX_WCCI_H1      "SBS_INDIS\\SBS_ALX_WCCI_H1"     // Woodie'sCCI_v5
#define  SBS_ALX_WCCI_H4      "SBS_INDIS\\SBS_ALX_WCCI_H4"     // Woodie'sCCI_v5

#define  SBS_ALX_PIVOT        "SBS_INDIS\\SBS_ALX_PIVOT"       // Auto-Pivot Plotter V2

#define  SBS_ALX_XST_MTF        "SBS_INDIS\\SBS_ALX_XST_MTF_H1"      // xSuperTrend_MTF (H1 MTF)
#define  SBS_ALX_XST_MTF_40     "SBS_INDIS\\SBS_ALX_XST_MTF_40"      // xSuperTrend_MTF (M15 MTF Smooth 40)
#define  SBS_ALX_XST_MTF_H4     "SBS_INDIS\\SBS_ALX_XST_MTF_H4"      // xSuperTrend_MTF (H4 MTF)
#define  SBS_ALX_XST_MTF_60_34  "SBS_INDIS\\SBS_ALX_XST_MTF_60_34"   // xSuperTrend_MTF (M15 MTF Smooth 60, Multiplier 3.4)

#define  SBS_ALX_WILDER_DMI      "SBS_INDIS\\SBS_ALX_WILDER_DMI"        // Wilder's DMI + histo (used bar 0 values only)
#define  SBS_ALX_WILDER_DMI_M1   "SBS_INDIS\\SBS_ALX_WILDER_DMI_M1"     // Wilder's DMI + histo (used bar 0 values only) M1 TF

#define  SBS_ALX_TMA_BASIC_HI    "SBS_INDIS\\SBS_ALX_TMA_M15_20_2"         // TMA M15 2.0 2 used for basic trend
#define  SBS_ALX_TMA_BASIC_LO    "SBS_INDIS\\SBS_ALX_TMA_M15_20_3"         // TMA M15 2.0 3 used for basic trend
#define  SBS_ALX_TMA_UPPER1      "SBS_INDIS\\SBS_ALX_TMA_H1_20"          // TMA H1 2.0 0 used for upper1 trend
//#define  SBS_ALX_TMA_UPPER1      "SBS_INDIS\\SBS_ALX_TMA_M15_80_0_4_400"   // TMA H1 2.0 0 used for upper1 trend

#define  SBS_ALX_VLT          "SYNERGY\\Synergy_Volatility"    // Synergy Volatility
#define  SBS_ALX_RF           "SYNERGY\\Synergy_RangeFactor"   // Synergy Range Factor
#define  SBS_ALX_DSR          "SYNERGY\\Synergy_DSR"           // Synergy Dynamic Support/Resistance

//-------------------------- SBS MULTI_TMA Indicators ----------------------/

#define  SBS_ALX_MULTI_TMA_M1          "SBS_INDIS\\SBS_ALX_MULTI_TMA_M1"         // TMA M1 20 2
#define  SBS_ALX_MULTI_TMA_M1_WIDE     "SBS_INDIS\\SBS_ALX_MULTI_TMA_M1_WIDE"    // TMA M1 20 3

#define  SBS_ALX_MULTI_TMA_M5          "SBS_INDIS\\SBS_ALX_MULTI_TMA_M5"         // TMA M5 20 2
#define  SBS_ALX_MULTI_TMA_M5_WIDE     "SBS_INDIS\\SBS_ALX_MULTI_TMA_M5_WIDE"    // TMA M5 20 3

#define  SBS_ALX_MULTI_TMA_M15         "SBS_INDIS\\SBS_ALX_MULTI_TMA_M15"        // TMA M15 20 2
#define  SBS_ALX_MULTI_TMA_M15_WIDE    "SBS_INDIS\\SBS_ALX_MULTI_TMA_M15_WIDE"   // TMA M15 20 3

#define  SBS_ALX_MULTI_TMA_H1          "SBS_INDIS\\SBS_ALX_MULTI_TMA_H1"         // TMA H1 20 2

//-------------------------- SBS MULTI_KC Indicators -----------------------/

#define  SBS_ALX_MULTI_KC_M1_56        "SBS_INDIS\\SBS_ALX_MULTI_KC_M1_56"       // KC M1  56 2.0
//#define  SBS_ALX_MULTI_KC_M1_WIDE     "SBS_INDIS\\SBS_ALX_MULTI_KC_M1_WIDE"    // KC M1 56 2.0
#define  SBS_ALX_MULTI_KC_M1_240       "SBS_INDIS\\SBS_ALX_MULTI_KC_M1_240"      // KC M1 240 2.0

#define  SBS_ALX_MULTI_KC_M1_840_1500  "SBS_INDIS\\SBS_ALX_MULTI_KC_M1_840_1500" // KC M1 840_1500 2.0
#define  SBS_ALX_MULTI_KC_M1_280_500   "SBS_INDIS\\SBS_ALX_MULTI_KC_M1_280_500"  // KC M1 280 500 5.0
#define  SBS_ALX_MULTI_KC_M1_28_50     "SBS_INDIS\\SBS_ALX_MULTI_KC_M1_28_50"    // KC M1 28 50 1.0

//-------------------------- SBS MASS_INDEX Indicators ---------------------/

#define  SBS_ALX_MASS_INDEX            "SBS_INDIS\\SBS_ALX_MASS_INDEX"           // Mass Index 9,9,25; 27,26.5;

//-------------------------- SBS MULTI_ILND Indicators ---------------------/

#define  SBS_ALX_FXI3_SEMAFOR          "ISLANDS\\SBS_ALX_FXI3_SEMAFOR"           // "FXi 3 Semafor" 5,12,34
#define  SBS_ALX_FXI3_SEMAFOR_12_34_96 "ISLANDS\\SBS_ALX_FXI3_SEMAFOR_12_34_96"  // "FXi 3 Semafor" 12,34,96
#define  SBS_ALX_FXI3_SEMAFOR_05       "ISLANDS\\SBS_ALX_FXI3_SEMAFOR_05"        // "FXi 3 Semafor" 05,00,00

#define  SBS_ALX_TMA_CEP_280           "ISLANDS\\SBS_ALX_TMA_CEP_280"            // "TMA+CEP" 280
#define  SBS_ALX_TMA_CEP_48            "ISLANDS\\SBS_ALX_TMA_CEP_48"             // "TMA+CEP" 48

#define  SBS_ALX_TREND_CCI             "ISLANDS\\SBS_ALX_TREND_CCI"              // "DoubleCCI+SMA" Trend=70, Entry=30, SMA=34
#define  SBS_ALX_TREND_CCI_14          "ISLANDS\\SBS_ALX_TREND_CCI_14"           // "DoubleCCI+SMA" Trend=70, Entry=14, SMA=34
#define  SBS_ALX_TREND_CCI_30_30_05    "ISLANDS\\SBS_ALX_TREND_CCI_30_30_05"     // "DoubleCCI+SMA" Trend=30, Entry=30, SMA=05

#define  SBS_ALX_TREND_CCI_42_14_34    "ISLANDS\\SBS_ALX_TREND_CCI_42_14_34"     // "DoubleCCI+SMA" Trend=42, Entry=14, SMA=34

#define  KM_iMA170_iMA510              "KM_iMA170_iMA510"               // "KM_iMA170_iMA510"
#define  TWO_CCI_Hist_170_55_27        "2_CCI_Histogram_170_55_27_lwma" // "2_CCI_Histogram_170_55_27_lwma"

#define  Dserg_LRB_25                  "ISLANDS\\Dserg_LRB_25"                   // "Dserg_LRB_25"
#define  Dserg_LRB_50                  "ISLANDS\\Dserg_LRB_50"                   // "Dserg_LRB_50"

//-------------------------- SBS_ALX_TREND Values --------------------------/

#define  SBS_ALX_TREND_NONE         0
#define  SBS_ALX_TREND_UP           1
#define  SBS_ALX_TREND_DOWN         2
#define  SBS_ALX_TREND_FLAT         3
#define  SBS_ALX_TREND_UP_WEAK      4
#define  SBS_ALX_TREND_DOWN_WEAK    5

#define  SBS_ALX_TREND_UP_STRONG    6
#define  SBS_ALX_TREND_DOWN_STRONG  7

//-------------------------- Data Series -----------------------------------/

#define  SBS_INDI_LAST_STATE_BARS_NO   1

//--- MCDP ---/

double   sbs_alx_mcdp_Diff_UpAbove_data[SBS_INDI_BARS_NO];
double   sbs_alx_mcdp_Diff_DnAbove_data[SBS_INDI_BARS_NO];
double   sbs_alx_mcdp_Diff_UpBelow_data[SBS_INDI_BARS_NO];
double   sbs_alx_mcdp_Diff_DnBelow_data[SBS_INDI_BARS_NO];
double   sbs_alx_mcdp_Macd_data[SBS_INDI_BARS_NO];
double   sbs_alx_mcdp_Avg_data[SBS_INDI_BARS_NO];

double   sbs_alx_mcdp_Avg_plus_Diff_data[SBS_INDI_BARS_NO];

//--- TDI ---/

double   sbs_alx_tdi_bandUp_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_bandMiddle_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_bandDown_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_rsiPriceLine_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_rsiSignalLine_data[SBS_INDI_BARS_NO];

//--- TDI_04 ---/

double   sbs_alx_tdi_04_bandUp_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_04_bandMiddle_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_04_bandDown_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_04_rsiPriceLine_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_04_rsiSignalLine_data[SBS_INDI_BARS_NO];

//--- TDI_MDL ---/

double   sbs_alx_tdi_MDL_bandUp_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_MDL_bandMiddle_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_MDL_bandDown_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_MDL_rsiPriceLine_data[SBS_INDI_BARS_NO];
double   sbs_alx_tdi_MDL_rsiSignalLine_data[SBS_INDI_BARS_NO];

//--- APB ---/

#define  SBS_ALX_APB_BARS_NO  3

double   sbs_alx_apb_HA_0_data[SBS_ALX_APB_BARS_NO];
double   sbs_alx_apb_HA_1_data[SBS_ALX_APB_BARS_NO];
double   sbs_alx_apb_HA_Open_data[SBS_ALX_APB_BARS_NO];
double   sbs_alx_apb_HA_Close_data[SBS_ALX_APB_BARS_NO];

//--- PAC (MA) ---/

double   sbs_alx_pac_HMA_data[SBS_INDI_BARS_NO];
double   sbs_alx_pac_LMA_data[SBS_INDI_BARS_NO];

double   sbs_alx_pac_MA150_data[SBS_INDI_BARS_NO];
double   sbs_alx_pac_MA450_data[SBS_INDI_BARS_NO];

//--- VLT ---/

double   sbs_alx_vlt_data[SBS_INDI_BARS_NO];

//--- RF ---/

double   sbs_alx_rf_Linear_Value_data[SBS_INDI_BARS_NO];
double   sbs_alx_rf_Upper_Limit_data[SBS_INDI_BARS_NO];
double   sbs_alx_rf_Lower_Limit_data[SBS_INDI_BARS_NO];

//--- DSR ---/

double   sbs_alx_dsr_Resistance_data[SBS_INDI_BARS_NO];
double   sbs_alx_dsr_Support_data[SBS_INDI_BARS_NO];
double   sbs_alx_dsr_SR_Mean_data[SBS_INDI_BARS_NO];

//--- SSL ---/

double   sbs_alx_ssl_up_data[SBS_INDI_BARS_NO];
double   sbs_alx_ssl_dn_data[SBS_INDI_BARS_NO];

//--- RSIOMA ---/

double   sbs_alx_rsioma_rsi_01_data[SBS_INDI_BARS_NO];
double   sbs_alx_rsioma_rsida_01_data[SBS_INDI_BARS_NO];

double   sbs_alx_rsioma_rsi_04_data[SBS_INDI_BARS_NO];
double   sbs_alx_rsioma_rsida_04_data[SBS_INDI_BARS_NO];

//--- TSI_MACD ---/

double   sbs_alx_tsi_macd_01_TSI_data[SBS_INDI_BARS_NO];
double   sbs_alx_tsi_macd_01_Signal_data[SBS_INDI_BARS_NO];

double   sbs_alx_tsi_macd_04_TSI_data[SBS_INDI_BARS_NO];
double   sbs_alx_tsi_macd_04_Signal_data[SBS_INDI_BARS_NO];

//--- GMTS ---/

double   sbs_alx_gmts_M15_Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_M15_Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_M15_UpR_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_M15_DnR_data[SBS_INDI_LAST_STATE_BARS_NO];

double   sbs_alx_gmts_M30_Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_M30_Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_M30_UpR_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_M30_DnR_data[SBS_INDI_LAST_STATE_BARS_NO];

double   sbs_alx_gmts_H1_Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_H1_Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_H1_UpR_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_H1_DnR_data[SBS_INDI_LAST_STATE_BARS_NO];

double   sbs_alx_gmts_H4_Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_H4_Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_H4_UpR_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_gmts_H4_DnR_data[SBS_INDI_LAST_STATE_BARS_NO];

//--- ASCTREND_4TF ---/

double   sbs_alx_asctrend_4tf_R1Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R1Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R2Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R2Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R3Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R3Dn_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R4Up_data[SBS_INDI_LAST_STATE_BARS_NO];
double   sbs_alx_asctrend_4tf_R4Dn_data[SBS_INDI_LAST_STATE_BARS_NO];

//--- CHKN_VLT ---/

double   sbs_alx_chkn_vlt_data[SBS_INDI_LAST_STATE_BARS_NO];

//--- STOCH_MTF ---/

double   sbs_alx_stoch_mtf_M15_Kline_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_M15_KDn_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_M15_Kopen_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_M15_Dline_data[SBS_INDI_BARS_NO];

double   sbs_alx_stoch_mtf_H1_Kline_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_H1_KDn_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_H1_Kopen_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_H1_Dline_data[SBS_INDI_BARS_NO];

double   sbs_alx_stoch_mtf_H4_Kline_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_H4_KDn_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_H4_Kopen_data[SBS_INDI_BARS_NO];
double   sbs_alx_stoch_mtf_H4_Dline_data[SBS_INDI_BARS_NO];

//--- WCCI ---/

double   sbs_alx_wcci_H1_azHistCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H1_bzHistCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H1_azHistNonTrendCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H1_bzHistNonTrendCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H1_mainCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H1_turboCCI_data[SBS_INDI_BARS_NO];

double   sbs_alx_wcci_H4_azHistCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H4_bzHistCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H4_azHistNonTrendCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H4_bzHistNonTrendCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H4_mainCCI_data[SBS_INDI_BARS_NO];
double   sbs_alx_wcci_H4_turboCCI_data[SBS_INDI_BARS_NO];

//--- PIVOT ---/

double   sbs_alx_pivot_Res3_data[SBS_INDI_BARS_NO];
double   sbs_alx_pivot_Res2_data[SBS_INDI_BARS_NO];
double   sbs_alx_pivot_Res1_data[SBS_INDI_BARS_NO];

double   sbs_alx_pivot_Pivot_data[SBS_INDI_BARS_NO];

double   sbs_alx_pivot_Supp1_data[SBS_INDI_BARS_NO];
double   sbs_alx_pivot_Supp2_data[SBS_INDI_BARS_NO];
double   sbs_alx_pivot_Supp3_data[SBS_INDI_BARS_NO];

//--- XST_MTF ---/

double   sbs_alx_xst_mtf_Dn_data[SBS_INDI_BARS_NO];
double   sbs_alx_xst_mtf_Up_data[SBS_INDI_BARS_NO];

double   sbs_alx_xst_mtf_40_Dn_data[SBS_INDI_BARS_NO];
double   sbs_alx_xst_mtf_40_Up_data[SBS_INDI_BARS_NO];

double   sbs_alx_xst_mtf_H4_Dn_data[SBS_INDI_BARS_NO];
double   sbs_alx_xst_mtf_H4_Up_data[SBS_INDI_BARS_NO];

double   sbs_alx_xst_mtf_60_34_Dn_data[SBS_INDI_BARS_NO];
double   sbs_alx_xst_mtf_60_34_Up_data[SBS_INDI_BARS_NO];

//--- XST_MTF ---/

double   sbs_alx_tma_basic_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_tma_basic_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_tma_basic_lo_data[SBS_INDI_BARS_NO];

double   sbs_alx_tma_basic_short_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_tma_basic_short_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_tma_basic_short_lo_data[SBS_INDI_BARS_NO];

double   sbs_alx_tma_upper1_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_tma_upper1_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_tma_upper1_lo_data[SBS_INDI_BARS_NO];

//--- WPR ---/

double   sbs_alx_wpr_21_data[SBS_INDI_BARS_NO];
double   sbs_alx_wpr_105_data[SBS_INDI_BARS_NO];
double   sbs_alx_wpr_283_data[SBS_INDI_BARS_NO];

//--- MULTI_TMA ---/

double   sbs_alx_multi_tma_m1_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m1_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m1_lo_data[SBS_INDI_BARS_NO];

//double   sbs_alx_multi_tma_m1_wide_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m1_wide_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m1_wide_lo_data[SBS_INDI_BARS_NO];

double   sbs_alx_multi_tma_m5_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m5_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m5_lo_data[SBS_INDI_BARS_NO];

//double   sbs_alx_multi_tma_m5_wide_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m5_wide_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m5_wide_lo_data[SBS_INDI_BARS_NO];

double   sbs_alx_multi_tma_m15_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m15_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m15_lo_data[SBS_INDI_BARS_NO];

double   sbs_alx_multi_tma_m15_hi_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m15_lo_md_data[SBS_INDI_BARS_NO];

//double   sbs_alx_multi_tma_m15_wide_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m15_wide_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_m15_wide_lo_data[SBS_INDI_BARS_NO];

double   sbs_alx_multi_tma_h1_md_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_h1_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_tma_h1_lo_data[SBS_INDI_BARS_NO];

//--- MULTI_KC ---/

double   sbs_alx_multi_kc_m1_upper_data [SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_middle_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_lower_data [SBS_INDI_BARS_NO];

double   sbs_alx_multi_kc_m1_wide_upper_data [SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_wide_middle_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_wide_lower_data [SBS_INDI_BARS_NO];

double   sbs_alx_multi_kc_240_upper_data [SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_240_middle_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_240_lower_data [SBS_INDI_BARS_NO];

double   sbs_alx_multi_kc_m1_280_500_upper_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_280_500_lower_data[SBS_INDI_BARS_NO];

double   sbs_alx_multi_kc_m1_28_50_upper_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_28_50_lower_data[SBS_INDI_BARS_NO];

double   sbs_alx_multi_kc_m1_840_1500_upper_data [SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_840_1500_middle_data[SBS_INDI_BARS_NO];
double   sbs_alx_multi_kc_m1_840_1500_lower_data [SBS_INDI_BARS_NO];

//--- FXI3_SEMAFOR ---/

double   sbs_alx_fxi3_semafor_FP_Up_data[SBS_INDI_BARS_NO];       // 12
double   sbs_alx_fxi3_semafor_FP_Dn_data[SBS_INDI_BARS_NO];

double   sbs_alx_fxi3_semafor_NP_Up_data[SBS_INDI_BARS_NO];       // 34
double   sbs_alx_fxi3_semafor_NP_Dn_data[SBS_INDI_BARS_NO];

double   sbs_alx_fxi3_semafor_HP_Up_data[SBS_INDI_BARS_NO];       // 96
double   sbs_alx_fxi3_semafor_HP_Dn_data[SBS_INDI_BARS_NO];

double   sbs_alx_fxi3_semafor_05_FP_Up_data[SBS_INDI_BARS_NO];    // 05
double   sbs_alx_fxi3_semafor_05_FP_Dn_data[SBS_INDI_BARS_NO];

//--- TREND_ZONE ---/

double   sbs_alx_MA_510_data[SBS_INDI_BARS_NO];
double   sbs_alx_MA_55_27_data[SBS_INDI_BARS_NO];

double   sbs_alx_MA_5_PS_data[SBS_INDI_BARS_NO];

double   sbs_alx_MA_3_data[SBS_INDI_BARS_NO];
double   sbs_alx_MA_34_data[SBS_INDI_BARS_NO];

double   sbs_alx_TMA_CEP_48_data[SBS_INDI_BARS_NO];
double   sbs_alx_TMA_CEP_280_data[SBS_INDI_BARS_NO];

//--- KM_iMA170_iMA510 ---/

double   sbs_alx_km_ima_Up_data[SBS_INDI_BARS_NO];
double   sbs_alx_km_ima_UpUp_data[SBS_INDI_BARS_NO];
double   sbs_alx_km_ima_Dn_data[SBS_INDI_BARS_NO];
double   sbs_alx_km_ima_DnDn_data[SBS_INDI_BARS_NO];
double   sbs_alx_km_ima_NoSig_data[SBS_INDI_BARS_NO];

//--- TWO_CCI_Hist_170_55_27 ---/

double   sbs_alx_2_cci_hist_Up_data[SBS_INDI_BARS_NO];
double   sbs_alx_2_cci_hist_UpUp_data[SBS_INDI_BARS_NO];
double   sbs_alx_2_cci_hist_Dn_data[SBS_INDI_BARS_NO];
double   sbs_alx_2_cci_hist_DnDn_data[SBS_INDI_BARS_NO];

//--- CCI ---/

double   sbs_alx_cci_30_data[SBS_INDI_BARS_NO];

//--- Dserg_LRB_25 ---/

double   sbs_alx_dlbr_25_ch_lo_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_25_ch_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_25_ch_srev_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_25_ch_b_sig_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_25_ch_s_sig_data[SBS_INDI_BARS_NO];

//--- Dserg_LRB_50 ---/

double   sbs_alx_dlbr_50_ch_lo_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_50_ch_hi_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_50_ch_srev_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_50_ch_b_sig_data[SBS_INDI_BARS_NO];
double   sbs_alx_dlbr_50_ch_s_sig_data[SBS_INDI_BARS_NO];

//--- MASS INDEX ---/

double   sbs_alx_mass_index_data[SBS_INDI_BARS_NO];

//-------------------------- FT State Data ---------------------------------/

struct sbs_alx_ft_signal_struct
{
   int      trend;                        // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      bar;                          // signal bar OR if no signal = SBS_INDI_BARS_NO
   double   value;                        // indi value (not tick value)
   
   int      trend_02;                    // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      bar_02;                      // signal bar OR if no signal = SBS_INDI_BARS_NO
   double   value_02;                    // indi value (not tick value)
};

sbs_alx_ft_signal_struct      alx_ft_signal;    // FT signal state

//-------------------------- MCDP State Data -------------------------------/

//--- MCDP Diff Types definition ---/

#define     ALX_mcdp_Diff_NO_TYPE         0
#define     ALX_mcdp_Diff_UpAbove_TYPE    1
#define     ALX_mcdp_Diff_DnAbove_TYPE    2
#define     ALX_mcdp_Diff_UpBelow_TYPE    3
#define     ALX_mcdp_Diff_DnBelow_TYPE    4

struct sbs_alx_mcdp_signal_struct
{
//--- Signal state ---/

   int      trend;                        // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      bar;                          // trend start bar

//--- Last MCDP Values (for Bar[0]) ---/

   double   Diff_UpAbove;
   double   Diff_DnAbove;
   double   Diff_UpBelow;
   double   Diff_DnBelow;
   double   Macd;
   double   Avg;
   
   double   Avg_plus_Diff;                // processed data (Avg + All Diffs)
};

sbs_alx_mcdp_signal_struct    alx_mcdp_signal;     // MCDP signal state

//-------------------------- TDI State Data --------------------------------/

#define     ALX_TDI_04_PRICE_LINE_THRESHOLD  2

struct sbs_alx_tdi_signal_struct
{
//--- Signal state ---/

   int      trend;                        // NO_ORDER, BUY_ORDER, SELL_ORDER, CLOSE_BUY_ORDER, CLOSE_SELL_ORDER
   int      bar;                          // trend start bar
   int      bandMiddle_trend;             // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP or SBS_ALX_TREND_DOWN
   int      bar_shift_04;                 // previous bar shift for TDI H4 (Frame M15 - 16, M30 - 8, H1 - 4)

//--- Entry Rules ---/

   bool     Long_Basic_Entry;                   // Basic long (buy) entry rule
   bool     Short_Basic_Entry;                  // Basic short (sell) entry rule
   
   bool     Long_Extra_Band_Entry;              // Extra_Band long (buy) entry rule (bandUp < 50)
   bool     Short_Extra_Band_Entry;             // Extra_Band short (sell) entry rule (bandDown > 50)

//--- Entry Conditions ---/

   bool     Long_Basic_Entry_Consider_01;       // Consider adding to a long position
   bool     Long_Basic_Entry_Avoid_01;          // Consider avoid entering a long position
   
   bool     Short_Basic_Entry_Consider_01;      // Consider adding to a short position
   bool     Short_Basic_Entry_Avoid_01;         // Consider avoid entering a short position

//--- S2 Entry Rules ---/

   bool     S2_G_Cross_B_BUY_Rule;              // S2 Green cross Blue long (buy) entry rule
   bool     S2_G_Cross_B_SELL_Rule;             // S2 Green cross Blue short (sell) entry rule

//--- Exit Rules ---/

   bool     Long_Basic_Exit;
   bool     Short_Basic_Exit;

//--- Last TDI Values (for Bar[0]) ---/

   double   bandUp;                 // Blue
   double   bandMiddle;             // Yellow
   double   bandDown;               // Blue
   double   rsiPriceLine;           // Green
   double   rsiSignalLine;          // Red
   
//--- RSI Frame Data ---/

   int      rsi_frame_start;        // start bar of rsi frame
   int      rsi_frame_end;          // last bar of rsi frame
   int      rsi_frame_trend;        // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP or SBS_ALX_TREND_DOWN

};

sbs_alx_tdi_signal_struct    alx_tdi_signal;    // TDI signal state

//--- TDI Level Values ---/

double   alx_tdi_LevelUp     = 68;
double   alx_tdi_LevelMiddle = 50;
double   alx_tdi_LevelDown   = 32;

//-------------------------- APB State Data --------------------------------/

#define  SBS_ALX_APB_BAR_TREND_NONE          0
#define  SBS_ALX_APB_BAR_TREND_POSITIVE      1           // UP
#define  SBS_ALX_APB_BAR_TREND_NEGATIVE      2           // DOWN

#define  SBS_ALX_APB_BAR_MUCH_SHORTER        0.6         // for consecutive bars size comparison
#define  SBS_ALX_APB_AFTER_MUCH_SHORTER      0.3         // for consecutive bars size comparison
#define  SBS_ALX_APB_SUPER_SHORTER           0.25

#define  SBS_ALX_APB_S2_CASE_NONE                        0

#define  SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER      1
#define  SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER       2
#define  SBS_ALX_APB_S2_SELL_CASE_BAR1_MUCH_SHORTER_F    3
#define  SBS_ALX_APB_S2_BUY_CASE_BAR1_MUCH_SHORTER_F     4

#define  SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER     5
#define  SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER      6
#define  SBS_ALX_APB_S2_SELL_CASE_AFTER_MUCH_SHORTER_F   7
#define  SBS_ALX_APB_S2_BUY_CASE_AFTER_MUCH_SHORTER_F    8

struct sbs_alx_apb_signal_struct
{
//--- Signal state ---/

   int      bar_00_trend;                       // trend for bar 0
   int      bar_01_trend;                       // trend for bar 1
   int      bar_02_trend;                       // trend for bar 2
   int      s2_case;                            // case for S2 process
   int      s2_case_32x;                        // case for S2 32x process

//--- Exit Rules ---/

   bool     Long_Basic_Exit;
   bool     Short_Basic_Exit;

//--- Current Values ---/

   double   HA_0;
   double   HA_1;
   double   HA_Open;
   double   HA_Close;
   
//--- APB Allow Case ---/

   int      allow_case;
};

sbs_alx_apb_signal_struct    alx_apb_signal;    // APB signal state

//-------------------------- PAC (Moving Average) State Data -------------------/

struct sbs_alx_pac_signal_struct
{
//--- Signal State ---/

   int      trend;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP or SBS_ALX_TREND_DOWN (based on MMA & MMA_1)

//--- Exit Rules ---/

   bool     Long_Basic_Exit;
   bool     Short_Basic_Exit;

//--- Current Values ---/

   double   HMA;              // High Moving Average
   double   LMA;              // Low Moving Average
   double   MMA;              // Middle Moving Average (current)

//--- Bar 1 Values ---/

   double   HMA_1;            // High Moving Average
   double   LMA_1;            // Low Moving Average
   double   MMA_1;            // Middle Moving Average

//--- Bar 2 Values ---/

   double   HMA_2;            // High Moving Average
   double   LMA_2;            // Low Moving Average
   double   MMA_2;            // Middle Moving Average
};

sbs_alx_pac_signal_struct    alx_pac_signal;    // PAC signal state

//-------------------------- VLT (Volatility) State Data ------------------------/

#define  SBS_ALX_VLT_SUBCASE_NONE               0
#define  SBS_ALX_VLT_SUBCASE_WEAK_2_5           1
#define  SBS_ALX_VLT_SUBCASE_WEAK_2_0           2
#define  SBS_ALX_VLT_SUBCASE_WEAK_1_5           3
#define  SBS_ALX_VLT_SUBCASE_WEAK_1_0           4

#define  SBS_ALX_VLT_SUBCASE_WEAK_BOUNCE_1_0    5

struct sbs_alx_vlt_signal_struct
{
//--- Signal State ---/

   int      trend;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_FLAT
   double   threshold;        // VLT "Red Line"
   int      cross_bar;        // last cross bar between VLT and threshold
   int      direction;        // signal direction SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   double   diff;             // difference between current value and local highest/lowest values (neg/pos)

//--- Bar 0 Value ---/

   double   val;              // Value of the VLT

//--- Operation parameters ---/

   double   trigger;          // trigger coefficient (0.5 for H4 for ex.)
   double   height;           // in thresholds
   double   bounce_deviation; // used for bounce calculation
   int      subcase;          // vlt signal subcase (based on vlt figure)

//--- Trend parameters ---/

   int      g_trend;          // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   double   g_trend_diff;     // vlt global trend diff value
   double   g_trend_md_diff;  // vlt global trend middle diff value (between bar 0 & g_md_extremum_bar)
   double   g_trend_step;     // vlt global trend step direction threshold
   int      g_extremum_bar;   // vlt extremum bar number
   int      g_md_extremum_bar;// middle extremum bar number (between bar 0 & g_extremum_bar)
};

sbs_alx_vlt_signal_struct    alx_vlt_signal;    // VLT signal state

//-------------------------- RF (Range Factor) State Data -----------------------/

#define  SBS_ALX_RF_SUBCASE_NONE                0

#define  SBS_ALX_RF_SUBCASE_BOUNCE_UP_UPPER     1
#define  SBS_ALX_RF_SUBCASE_BOUNCE_UP_LOWER     2
#define  SBS_ALX_RF_SUBCASE_BOUNCE_DN_UPPER     3
#define  SBS_ALX_RF_SUBCASE_BOUNCE_DN_LOWER     4

struct sbs_alx_rf_signal_struct
{
//--- Signal State ---/

   int      trend;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_FLAT
   int      cross_bar;        // last cross bar between RF and any Limit (Upper or Lower)
   int      direction;        // signal direction SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   double   diff;             // difference between current value and local highest/lowest values (neg/pos)

//--- Bar 0 Values ---/

   double   Linear_Value;     // Value of the RF
   double   Upper_Limit;      // RF Upper Limit threshold
   double   Lower_Limit;      // RF Lower Limit threshold

//--- Operation parameters ---/

   int      subcase;          // rf signal subcase (based on vlt figure)
   double   trigger;          // trigger coefficient (0.2 for H4 for ex.)
   double   bounce_deviation; // used for bounce calculation

//--- Trend parameters ---/

   int      g_trend;          // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   double   g_trend_diff;     // rf global trend diff value
   double   g_trend_md_diff;  // rf global trend middle diff value (between bar 0 & g_md_extremum_bar)
   double   g_trend_step;     // rf global trend step direction threshold
   int      g_extremum_bar;   // rf extremum bar number
   int      g_md_extremum_bar;// rf middle extremum bar number (between bar 0 & g_extremum_bar)
};

sbs_alx_rf_signal_struct    alx_rf_signal;    // RF signal state

//-------------------------- DSR (Dynamic S/R) State Data -----------------------/

#define  SBS_ALX_DSR_BOUNCE_NONE    0
#define  SBS_ALX_DSR_BOUNCE_1_00    1
#define  SBS_ALX_DSR_BOUNCE_0_50    2
#define  SBS_ALX_DSR_BOUNCE_0_25    3

struct sbs_alx_dsr_signal_struct
{
//--- Bar 0 Values ---/

   double   Resistance;          // Resistance (Upper line)
   double   Support;             // Support (Lower line)
   double   SR_Mean;             // SR_Mean (Middle line)

//--- Entry Conditions ---/

   bool     BounceUp;            // if bounced up
   bool     BounceDn;            // if bounced udown
   
   int      BounceUp_Type;
   int      BounceDn_Type;

//--- Close Conditions ---/

   bool     Close_BounceUp;      // if bounced up
   bool     Close_BounceDn;      // if bounced down
   
   int      Close_BounceUp_Type;
   int      Close_BounceDn_Type;
   
   double   Close_Bounce_Support;      // Support Value (used with BounceUp condition)
   double   Close_Bounce_Resistance;   // Resistance Value (used with BounceDn condition)

//--- Exit Rules ---/
};

sbs_alx_dsr_signal_struct    alx_dsr_signal;    // dsr signal state

//-------------------------- SSL Indi State Data ---------------------------/

#define     SBS_ALX_SSL_FILL_VAL       50.0

struct sbs_alx_ssl_signal_struct
{
//--- Signal State ---/

   int      trend;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
};

sbs_alx_ssl_signal_struct    alx_ssl_signal;    // SSL signal state

//-------------------------- RSIOMA Indi State Data ------------------------/

struct sbs_alx_rsioma_signal_struct
{
//--- Signal State ---/

   int      trend;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
};

sbs_alx_rsioma_signal_struct    alx_rsioma_01_signal;    // RSIOMA H1 signal state
sbs_alx_rsioma_signal_struct    alx_rsioma_04_signal;    // RSIOMA H4 signal state

//-------------------------- TSI_MACD Indi State Data ----------------------/

struct sbs_alx_tsi_macd_signal_struct
{
//--- Signal State ---/

   int      trend;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
};

sbs_alx_tsi_macd_signal_struct    alx_tsi_macd_01_signal;    // TSI_MACD H1 signal state
sbs_alx_tsi_macd_signal_struct    alx_tsi_macd_04_signal;    // TSI_MACD H4 signal state

//-------------------------- GMTS Indi State Data --------------------------/

#define     SBS_ALX_GMTS_TREND_MIN_TICS      2

struct sbs_alx_gmts_signal_struct
{
//--- Signal State ---/

   int      trend_M15;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN, SBS_ALX_TREND_UP_WEAK, SBS_ALX_TREND_DOWN_WEAK 
   int      trend_M30;
   int      trend_H1;
   int      trend_H4;
   
//--- Continious trend tics ---/
   
   int      trend_M15_tics; 
   int      trend_M30_tics;
   int      trend_H1_tics;
   int      trend_H4_tics;
   
   int      pre_trend_M15; 
   int      pre_trend_M30;
   int      pre_trend_H1;
   int      pre_trend_H4;
};

sbs_alx_gmts_signal_struct    alx_gmts_signal;    // GMTS signal state

//-------------------------- ASCTREND_4TF Indi State Data ------------------/

#define     SBS_ALX_ASCTREND_4TF_TREND_MIN_TICS    3

struct sbs_alx_asctrend_4tf_signal_struct
{
//--- Signal State ---/

   int      trend_M15;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      trend_M30;
   int      trend_H1;
   int      trend_H4;

//--- Continious trend tics ---/
   
   int      trend_M15_tics; 
   int      trend_M30_tics;
   int      trend_H1_tics;
   int      trend_H4_tics;
   
   int      pre_trend_M15; 
   int      pre_trend_M30;
   int      pre_trend_H1;
   int      pre_trend_H4;
   
};

sbs_alx_asctrend_4tf_signal_struct    alx_asctrend_4tf_signal;    // asctrend_4tf signal state

//-------------------------- STOCH_MTF Indi State Data ---------------------/

struct sbs_alx_stoch_mtf_signal_struct
{
//--- M15 Bar 0 Values ---/

   double   M15_Kopen;

//--- M15 Bar 1 Values ---/

   double   M15_Kline;
   double   M15_KDn;
   double   M15_Dline;

//--- H1 Bar 0 Values ---/

   double   H1_Kopen;

//--- H1 Bar 1 Values ---/

   double   H1_Kline;
   double   H1_KDn;
   double   H1_Dline;

//--- H4 Bar 0 Values ---/

   double   H4_Kopen;

//--- H4 Bar 1 Values ---/

   double   H4_Kline;
   double   H4_KDn;
   double   H4_Dline;

//--- Levels ---/

   double   LevelUp;
   double   LevelMiddle;
   double   LevelDown;

//--- Global Trends (Color) ---/

   int      global_trend_M15;    // Based on Kline/KDn color (SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN)
   int      global_trend_H1;
   int      global_trend_H4;
   
//--- Local Directions ---/

   int      local_direction_M15; // Based on difference between Kline[1] & Kline [2]
   int      local_direction_H1;
   int      local_direction_H4;

};

sbs_alx_stoch_mtf_signal_struct    alx_stoch_mtf_signal;    // stoch_mtf signal state

//-------------------------- WCCI Indi State Data -------------------------/

struct sbs_alx_wcci_signal_struct
{
//--- Signal State ---/

   int      trend_H1;         // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      trend_H4;

//--- Levels ---/

   double   LevelUp;          //  200
   double   LevelDown;        // -200
   
};

sbs_alx_wcci_signal_struct    alx_wcci_signal;    // wcci signal state

//-------------------------- PIVOT Indi State Data -----------------------/

struct sbs_alx_pivot_signal_struct
{
//--- Signal State ---/

//--- Bar 0 Values ---/

   double   Res3;
   double   Res2;
   double   Res1;
   double   Pivot;
   double   Supp1;
   double   Supp2;
   double   Supp3;

//--- Level Trends ---/

   int      Res1_trend;             // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      Pivot_trend;
   int      Supp1_trend;

//--- Arrays 0 & 1 Values ---/

   double   level_0[7];
   double   level_1[7];

//--- Placement Coordinates ---/

   int      placement_pos;          // 0..7 (0 is below Supp3, 7 is upper Res3)
   
   int      last_bar_0;             // last bar for piovot day 0
   int      last_bar_1;             // last bar for piovot day 1
   
   int      bounce_sell_pos_0;      // bounce data for day 0
   int      bounce_sell_bar_0;
   double   bounce_sell_val_0;
   
   int      bounce_sell_pos_1;      // bounce data for day 1
   int      bounce_sell_bar_1;
   double   bounce_sell_val_1;
   
   int      bounce_buy_pos_0;       // bounce data for day 0
   int      bounce_buy_bar_0;
   double   bounce_buy_val_0;
   
   int      bounce_buy_pos_1;       // bounce data for day 1
   int      bounce_buy_bar_1;
   double   bounce_buy_val_1;
   
   double   stoploss_sell;          // recommended stoploss value for sell order
   double   stoploss_buy;           // recommended stoploss value for buy order
   
   double   stoploss_trl_sell;      // recommended stoploss value for sell order trailing
   double   stoploss_trl_buy;       // recommended stoploss value for buy order trailing
};

struct pivot_placement_level_structure
{
   double   hi;
   double   lo;
};

sbs_alx_pivot_signal_struct    alx_pivot_signal;    // pivot signal state

//-------------------------- XST_MTF Indi State Data -----------------------/

struct sbs_alx_xst_signal_struct
{
//--- Signal State ---/

   int      trend_H1;            // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      trend_H1_40;
   int      trend_H4;
   int      trend_H1_60_34;
   
   int      age_H1;              // number of xst trend bars
   int      age_H1_40;
   
   double   val_H1;              // value of xst H1 for bar 0
   double   val_H1_40;           // value of xst H1_40 for bar 0
   double   val_H4;              // value of xst H4 for bar 0
   double   val_H1_60_34;        // value of xst H1_60_34 for bar 0
   
   int      extreme_bar_H1;      // xst extreme bar
   int      extreme_bar_H1_40;
   
   int      extreme_val_H1;      // xst extreme val
   int      extreme_val_H1_40; 

};

sbs_alx_xst_signal_struct    alx_xst_signal;    // xst signal state

//-------------------------- WILDER_DMI Indi State Data -------------------/

struct sbs_alx_wdmi_signal_struct
{
//--- Signal State ---/
   
   double   dihp;             // wdmi histogram positive (+) value
   double   dihm;             // wdmi histogram negative (-) value
   double   DIp;              // wdmi UP trend value
   double   DIm;              // wdmi DOWN trend value
   double   ADX;              // wdmi ADX value
   double   ADXR;             // wdmi ADXR value
   
   int      DI_trend;         // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   
   double   adx_max;          // maximum between ADX & ADXR
   double   adx_min;          // minimum between ADX & ADXR
   
   double   adx_hi_level;        // 30
   double   adx_md_level;        // 20
   double   adx_lo_level;        // 15
   
   double   adx_cross_level;     // 30
   
   double   adx_tma_open_level;  // 25
   double   adx_tma_close_level; // 25
   
};

sbs_alx_wdmi_signal_struct    alx_wdmi_signal;    // wdmi signal state

//-------------------------- TMA Indi State Data --------------------------/

#define     SBS_ALX_NO_STATE                    0

//--- basic_upper1_state ---/

#define     SBS_ALX_BASIC_GR_UPPER1_STATE                11
#define     SBS_ALX_BASIC_LE_UPPER1_STATE                12

#define     SBS_ALX_BASIC_CROSS_UPPER1_HI_STATE          13
#define     SBS_ALX_BASIC_CROSS_UPPER1_LO_STATE          14

#define     SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_HI_STATE   15
#define     SBS_ALX_BASIC_CROSS_UPPER1_MIDDLE_LO_STATE   16

//--- basic_short_upper1_state ---/

#define     SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_HI_STATE    21
#define     SBS_ALX_BASIC_SH_CROSS_UPPER1_MD_LO_STATE    22

//--- xst_upper1_state ---/

#define     SBS_ALX_XST_GR_UPPER1_STATE         31
#define     SBS_ALX_XST_LE_UPPER1_STATE         32

//--- xst_basic_state ---/

#define     SBS_ALX_XST_GR_BASIC_STATE          41
#define     SBS_ALX_XST_LE_BASIC_STATE          42

//--- candle_upper1_state ---/

#define     SBS_ALX_CANDLE_GR_UPPER1_STATE      51
#define     SBS_ALX_CANDLE_LE_UPPER1_STATE      52

struct sbs_alx_tma_signal_struct
{
//--- Signal State ---/
   
   int      basic_upper1_state;
   int      basic_short_upper1_state;
   int      xst_upper1_state;
   int      xst_basic_state;
   int      candle_upper1_state;

//--- Upper1 Trend ---/

   int      upper1_trend_approval_bars;// used for trend detection
   int      upper1_trend;              // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      upper1_trend_age;          // number of trend bars

//--- Basic cross Upper1 Trend ---/

   int      basic_upper1_trend_age;    // number of trend bars

//--- Basic_Short cross Upper1 Trend ---/

   int      basic_short_upper1_trend_age;    // number of trend bars

//--- Candle cross Upper1 Trend ---/

   int      candle_upper1_shift;        // candle shift in comparison with upper1
   int      candle_upper1_trend_age;    // number of trend bars
   
//--- XST Numbers ---/
   
   int      xst_dn_upper1_dn_number;   // number of XST down signal after UPPER1 trend changing to down
   int      xst_up_upper1_up_number;   // number of XST up signal after UPPER1 trend changing to up
   
   int      xst_dn_basic_upper1_dn_number;   // number of XST down signal after BASIC cross UPPER1 to down
   int      xst_up_basic_upper1_up_number;   // number of XST up signal after BASIC cross UPPER1 to up
   
   int      xst_dn_basic_sh_upper1_dn_number;   // number of XST down signal after BASIC_SHORT cross UPPER1 middle to down
   int      xst_up_basic_sh_upper1_up_number;   // number of XST up signal after BASIC_SHORT cross UPPER1 middle to up
   
   int      xst_dn_candle_upper1_gr_number;   // number of XST down signal after CANDLE cross UPPER1 high to down
   int      xst_up_candle_upper1_le_number;   // number of XST up signal after CANDLE cross UPPER1 low to up
   
};

sbs_alx_tma_signal_struct    alx_tma_signal;    // tma signal state

//-------------------------- WPR Indi State Data ---------------------------/

#define     SBS_ALX_WPR_21_HI_STATE          1
#define     SBS_ALX_WPR_21_LO_STATE          2
#define     SBS_ALX_WPR_21_MD_STATE          3

#define     SBS_ALX_WPR_105_HI_STATE         21
#define     SBS_ALX_WPR_105_LO_STATE         22
#define     SBS_ALX_WPR_105_MD_HI_STATE      23
#define     SBS_ALX_WPR_105_MD_LO_STATE      24

struct sbs_alx_wpr_signal_struct
{
//--- Signal States ---/

   int      state_21;                  // WPR(21) State (SBS_ALX_NO_STATE,SBS_ALX_WPR_21_HI_STATE,SBS_ALX_WPR_21_LO_STATE,SBS_ALX_WPR_21_MD_STATE)
   int      state_105;                 // WPR(105) State (SBS_ALX_NO_STATE,SBS_ALX_WPR_105_HI_STATE,SBS_ALX_WPR_105_LO_STATE,SBS_ALX_WPR_105_MD_HI_STATE,SBS_ALX_WPR_105_MD_LO_STATE)

//--- Signal Trends ---/

   int      trend_21;                  // WPR(21) Trend (SBS_ALX_TREND_NONE,SBS_ALX_TREND_UP_STRONG,SBS_ALX_TREND_DOWN_STRONG)
   int      trend_105;                 // WPR(105) Trend (SBS_ALX_TREND_NONE,SBS_ALX_TREND_UP_STRONG,SBS_ALX_TREND_DOWN_STRONG)
   int      trend_general;             // Complex WPR Trend (SBS_ALX_TREND_NONE,SBS_ALX_TREND_UP_STRONG,SBS_ALX_TREND_DOWN_STRONG)
   
   int      pre_strong_bar_21;         // WPR(21) pre-high(low)-level bar number

//--- Signal Zero Values ---/
   
   double   wpr_21_value;              // WPR(21) value
   double   wpr_105_value;             // WPR(105) value

//--- Signal Levels ---/
   
   double   wpr_21_hi_level;           // -20
   double   wpr_21_lo_level;           // -80
   
   double   wpr_105_hi_level;          // -50
   double   wpr_105_lo_level;          // -50

};

sbs_alx_wpr_signal_struct    alx_wpr_signal;    // wpr signal state

//-------------------------- Multi_TMA Indi State Data ---------------------/

struct sbs_alx_multi_tma_signal_struct
{
//--- Signal Trends ---/

   int      trend_m1;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      trend_m5;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      trend_m15;                 // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      trend_h1;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   
   int      trend_age_m1;              // number of the trend bars
   int      trend_age_m5;              // number of the trend bars
   int      trend_age_m15;             // number of the trend bars
   int      trend_age_h1;              // number of the trend bars

//--- Signal Parameters ---/

   int      trend_age_bars;            // minimum bars number (5) to recognize trend (for M1 & M5)
   
   int      trend_m15_age_bars;        // minimum bars number (15) to recognize trend (for M15)
   int      trend_h1_age_bars;         // minimum bars number (20) to recognize trend (for H1)
   
};

sbs_alx_multi_tma_signal_struct    sbs_alx_multi_tma_signal;    // multi_tma signal state

//-------------------------- Multi_KC Indi State Data ----------------------/

struct sbs_alx_multi_kc_signal_struct
{
//--- Signal Trends ---/

   int      cross_m1;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      cross_m1_wide;             // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN

};

sbs_alx_multi_kc_signal_struct    sbs_alx_multi_kc_signal;    // multi_kc signal state

//-------------------------- FXI3_SEMAFOR State Data -----------------------/

#define     FXI3_SEMAFOR_NO_TYPE       0        // undefined type
#define     FXI3_SEMAFOR_HP_TYPE       1        // "SUN" type
#define     FXI3_SEMAFOR_NP_TYPE       2        // "BIG_DOT" type
#define     FXI3_SEMAFOR_FP_TYPE       3        // "SMALL_DOT" type
#define     FXI3_SEMAFOR_TP_TYPE       4        // "TINY_DOT" type

#define     FXI3_SEMAFOR_NO_DIRECTION  0        // undefined direction
#define     FXI3_SEMAFOR_UP_DIRECTION  1        // UP direction
#define     FXI3_SEMAFOR_DN_DIRECTION  2        // DN direction

#define     SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE           0
#define     SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE      1
#define     SBS_ALX_FXI3_SEMAFOR_TREND_MIXED_TYPE        2
#define     SBS_ALX_FXI3_SEMAFOR_TREND_GLOBAL_TYPE       3

#define     FXI3_SEMAFOR_STRONG_LEVEL_NOT_DEFINED        0        // strong level is not defined
#define     FXI3_SEMAFOR_STRONG_LEVEL_DEFINED            1        // strong level is defined

struct   fxi3_smf_type
{
   int      type_3;                    // 3-rd semafor type
   int      direction_3;               // 3-rd semafor direction
   int      bar_3;                     // 3-rd semafor bar number
   double   val_3;                     // 3-rd semafor value
   
   int      type_2;                    // 2-nd semafor type
   int      direction_2;               // 2-nd semafor direction
   int      bar_2;                     // 2-nd semafor bar number
   double   val_2;                     // 2-nd semafor value
   
   int      type_1;                    // 1-st semafor type
   int      direction_1;               // 1-st semafor direction
   int      bar_1;                     // 1-st semafor bar number
   double   val_1;                     // 1-st semafor value
   
   int      strong_type;               //
   int      strong_level[5];           // 0 - NO ANY CROSS, 1 - CEP48, 2 - MA55,27, 3 - CEP280, 4 - MA510
};

struct sbs_alx_fxi3_semafor_signal_struct
{
//--- Signal Trends ---/

   int      HP_trend;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN (Tripple_Sun)
   int      HP_global_trend;           // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN (Tripple_Sun Global)
   int      NP_trend;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN (Sun/Dots combination)
   int      FP_trend;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN (Second_Sun/First_Nedo_Hi/Lo)
   int      TP_trend;                  // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN ()

//--- Trend Types ---/

   int      HP_trend_type;             // SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE, SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE
   int      HP_global_trend_type;      // SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE, SBS_ALX_FXI3_SEMAFOR_TREND_GLOBAL_TYPE
   int      NP_trend_type;             // SBS_ALX_FXI3_SEMAFOR_TREND_NO_TYPE, SBS_ALX_FXI3_SEMAFOR_TREND_REGULAR_TYPE, SBS_ALX_FXI3_SEMAFOR_TREND_MIXED_TYPE
   int      FP_trend_type;             // 
   int      TP_trend_type;             //
   
   int      NP_trend_mixture;          // SUN = 3, BIG_DOT = 2 (222 - regular, 333 - no NP_trend, ...)
   int      FP_trend_mixture;          // SUN = 3, BIG_DOT = 2, MID_DOT = 1 (111 - regular, 333 - 3xSUN, ...)
   int      TP_trend_mixture;          // SUN = 3, BIG_DOT = 2, MID_DOT = 1, TIN_DOT = 0 (000 - regular, 333 - 3xSUN, ...)

//--- Semafors ---/

   fxi3_smf_type     HP_semafor;          // SUNS ONLY
   fxi3_smf_type     HP_global_semafor;   // SUNS GLOBAL ONLY
   fxi3_smf_type     NP_semafor;          // SUNS + BIG DOTS
   fxi3_smf_type     FP_semafor;          // SUNS + BIG DOTS + MID_DOTS
   fxi3_smf_type     TP_semafor;          // SUNS + BIG DOTS + MID_DOTS + TINY_DOTS
 
};

sbs_alx_fxi3_semafor_signal_struct    sbs_alx_fxi3_semafor_signal;   // fxi3_semafor state

//-------------------------- TREND_ZONE State Data -------------------------/

#define     SBS_ALX_HEIGTH_GETS_NONE      0
#define     SBS_ALX_HEIGTH_GETS_HIGHER    1
#define     SBS_ALX_HEIGTH_GETS_LOWER     2

struct sbs_alx_trend_zone_signal_struct
{
//--- Signal Trends ---/

   int      trend;                     // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP (TMA_CEP_280 > MA_510), SBS_ALX_TREND_DOWN (TMA_CEP_280 < MA_510)
   int      cross_bar;                 // TMA_CEP_280 & MA_510 cross bar
   int      heigth_move_direction;     // SBS_ALX_HEIGTH_GETS_NONE, SBS_ALX_HEIGTH_GETS_HIGHER, SBS_ALX_HEIGTH_GETS_LOWER

};

sbs_alx_trend_zone_signal_struct    sbs_alx_trend_zone_signal;       // trend zone state

//-------------------------- TREND_CCI State Data --------------------------/


struct sbs_alx_trend_cci_signal_struct
{
//--- Signal Values (Bar 0) ---/

   double   sma_val;                   // SMA value
   double   fast_cci_val;              // Fast CCI value
   double   fast_05_cci_val;           // Fast CCI (05) value
   double   slow_cci_val;              // Slow CCI value

};

sbs_alx_trend_cci_signal_struct    sbs_alx_trend_cci_signal;       // trend_cci state

//-------------------------- ISLANDS State Data -----------------------------/


struct sbs_alx_islands_signal_struct
{
//--- Signal Trends ---/

   int      trend;                     // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP (MA_3 > MA_34), SBS_ALX_TREND_DOWN (MA_3 < MA_34)
   int      cross_bar;                 // TMA_CEP_280 & MA_510 cross bar

};

sbs_alx_islands_signal_struct        sbs_alx_islands_signal;      // islands state

//-------------------------- DLRB State Data --------------------------------/

#define     SBS_DLRB_NO_CASE_DEFINED                  0

#define     SBS_DLRB_CASE_DNDN_25_INSIDE_50           1
#define     SBS_DLRB_CASE_DNDN_25_WEAK_CROSS_50       2
#define     SBS_DLRB_CASE_DNDN_25_LOWER_50            3
#define     SBS_DLRB_CASE_DNDN_25_AFTER_50_LL         4     // LOW LOW
#define     SBS_DLRB_CASE_DNDN_25_AFTER_50_HH         5     // HIGH HIGH
#define     SBS_DLRB_CASE_DNDN_25_AFTER_50_HL         6     // HIGH LOW

#define     SBS_DLRB_CASE_DNUP_25_CROSS_FWD_50        7

#define     SBS_DLRB_CASE_UPDN_25_INSIDE_50           8
#define     SBS_DLRB_CASE_UPDN_25_SROSS_STRONG_50     9
#define     SBS_DLRB_CASE_UPDN_25_SROSS_STRONG_HI_50  10

#define     SBS_DLRB_CASE_UPUP_25_SROSS_50            11
#define     SBS_DLRB_CASE_UPUP_25_PRL_50_INSIDE       12
#define     SBS_DLRB_CASE_UPUP_25_PRL_50_LOW          13
#define     SBS_DLRB_CASE_UPUP_25_PRL_BHND_50_INSIDE  14
#define     SBS_DLRB_CASE_UPUP_25_PRL_BHND_50_OUTSIDE 15

struct sbs_alx_dlrb_data_struct
{
   int      start_bar;                 // DLRB Channel start bar
   int      end_bar;                   // DLRB Channel end bar
   
   double   hi_start;                  // DLRB Channel start bar High Value
   double   hi_end;                    // DLRB Channel end bar High Value
   double   lo_start;                  // DLRB Channel start bar Low Value
   double   lo_end;                    // DLRB Channel end bar Low Value
   
   int      trend;                     // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
};

struct sbs_alx_dlrb_proc_data_struct
{
   int      case_no;                   // 0 means SBS_DLRB_NO_CASE_DEFINED
   double   sl_calculated;             // calculated StopLoss value
   double   tgt_calculated;            // calculated Target value
};

struct sbs_alx_dlrb_struct
{
//--- dlrb_25_data ---/

sbs_alx_dlrb_data_struct         dlrb_25_data;

//--- dlrb_25_data ---/

sbs_alx_dlrb_data_struct         dlrb_50_data;

//--- dlrb_proc_data ---/

sbs_alx_dlrb_proc_data_struct    dlrb_proc_data;
};

sbs_alx_dlrb_struct        sbs_alx_dlrb_signal;      // dlrb data & state

//-------------------------- KC_TREND State Data ---------------------------/

#define  SBS_KC_TREND_TYPE_28          1
#define  SBS_KC_TREND_TYPE_56          2

struct sbs_kc_trend_struct
{
//--- KC Trend ---/

   int      trend;                     // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
   int      last_marker_bar;           
   int      first_marker_bar;
   int      last_reverse_marker_bar;
   int      reverse_bounces;           // reverse bounces between last_marker_bar and first_marker_bar (last_marker_bar <= first_marker_bar)
};


struct sbs_alx_kc_trend_signal_struct
{
//--- KC Trends ---/

   sbs_kc_trend_struct      trend_28;
   sbs_kc_trend_struct      trend_56;

};

sbs_alx_kc_trend_signal_struct        sbs_alx_kc_trend_signal;      // KC_TREND state

//-------------------------- MIW_TREND State Data --------------------------/

struct sbs_miw_trend_struct
{
//--- MIW Trend ---/

   int      trend;                     // SBS_ALX_TREND_NONE, SBS_ALX_TREND_UP, SBS_ALX_TREND_DOWN
};

sbs_miw_trend_struct        sbs_miw_trend_signal;  // MIW_TREND signal

//-------------------------- TREND_CCI_30_05 State Data --------------------/

struct sbs_trend_cci_30_05_struct
{
//--- CCI30 & MA05 difference ---/

   double   diff;                     // Difference between CCI30 & MA05
};

sbs_trend_cci_30_05_struct        sbs_trend_cci_30_05_signal;  // MIW_TREND signal

//-------------------------- STOCH State Data ------------------------------/

struct sbs_stoch_data_struct
{
   double   stoch_val;
   double   signal_val;
};

struct sbs_stoch_struct
{
   sbs_stoch_data_struct   stoch_05;
   sbs_stoch_data_struct   stoch_25;
};

sbs_stoch_struct                 sbs_stoch_signal;  // STOCH signal

//-------------------------- TREND_CCI_42_14_34 State Data -----------------/

struct sbs_trend_cci_signal_42_14_34_struct
{
//--- Signal Values (Bar 0) ---/

   double   sma_val;                   // SMA value
   double   fast_cci_val;              // Fast CCI value
   double   slow_cci_val;              // Slow CCI value

};

sbs_trend_cci_signal_42_14_34_struct    sbs_trend_cci_signal_42_14_34;       // trend_cci_42_14_34 state

//========================== SBS ALX Order Case Data =======================/

//------ post condition action ------/

//--- action ---/

#define  SBS_P_CONDITION_NOT_DEFINED         0
#define  SBS_P_CONDITION_ACCEPTED            1
#define  SBS_P_CONDITION_REJECTED            2

//--- type ---/

#define  SBS_P_CONDITION_TYPE_NOT_DEFINED    0
#define  SBS_P_CONDITION_TYPE_DEFINED        1

//--- target_type ---/

#define  SBS_P_CONDITION_NO_TGT_TYPE            0
#define  SBS_P_CONDITION_TGT_TYPE_HALF_28       1
#define  SBS_P_CONDITION_TGT_TYPE_FULL_28       2
#define  SBS_P_CONDITION_TGT_TYPE_DBL_28        3                                            // *2
#define  SBS_P_CONDITION_TGT_TYPE_TRPL_28       4                                            // *3

#define  SBS_P_CONDITION_TGT_TYPE_CUSTOM        5                                            // Custom Type - calculated for each CASE

#define  SBS_P_CONDITION_TGT_TYPE_HALF_28_P2    (100 + SBS_P_CONDITION_TGT_TYPE_HALF_28)     // half, TGT > 2 points
#define  SBS_P_CONDITION_TGT_TYPE_FULL_28_P2    (100 + SBS_P_CONDITION_TGT_TYPE_FULL_28)     // TGT > 2 points
#define  SBS_P_CONDITION_TGT_TYPE_DBL_28_P2     (100 + SBS_P_CONDITION_TGT_TYPE_DBL_28)      // *2, TGT > 2 points

//--- stoploss_type ---/

#define  SBS_P_CONDITION_NO_SL_TYPE             0
#define  SBS_P_CONDITION_SL_TYPE_KC56           1
#define  SBS_P_CONDITION_SL_TYPE_KC28           2
#define  SBS_P_CONDITION_SL_TYPE_LAST_T_HLF28   3           // for subcase #2

#define  SBS_P_CONDITION_SL_TYPE_SUBCASE_1_DFLT 4
#define  SBS_P_CONDITION_SL_TYPE_SUBCASE_2_DFLT 5
#define  SBS_P_CONDITION_SL_TYPE_SUBCASE_3_DFLT 6

#define  SBS_P_CONDITION_SL_TYPE_LAST_B_FL56    7

#define  SBS_P_CONDITION_SL_TYPE_FP1            101
#define  SBS_P_CONDITION_SL_TYPE_FP3            102
#define  SBS_P_CONDITION_SL_TYPE_NP1            103
#define  SBS_P_CONDITION_SL_TYPE_NP3            104

//--- order_close_type ---/

#define  SBS_P_CONDITION_CLOSE_NO_TYPE             0
#define  SBS_P_CONDITION_CLOSE_NORMAL_TYPE         1
#define  SBS_P_CONDITION_CLOSE_FAST_TYPE           2
#define  SBS_P_CONDITION_CLOSE_LONG_TYPE           3
#define  SBS_P_CONDITION_CLOSE_42_14_34_TYPE       4

#define  SBS_P_CONDITION_CLOSE_42_14_34_FAST_ONLY  5

#define  SBS_P_CONDITION_CLOSE_CUSTOM_TYPE         101

//--- extra_target_control ---/

#define  SBS_P_EXTRA_TGT_NO_CONTROL                0
#define  SBS_P_EXTRA_TGT_YES_CONTROL               1           // more or less target reject open order request

//--- order_close_custom ---/

#define  SBS_P_ORDER_CLOSE_TYPE_CCI_30_SMA_05      1           // super fast close
#define  SBS_P_ORDER_CLOSE_TYPE_CCI_14_SMA_34      2           // fast close
#define  SBS_P_ORDER_CLOSE_TYPE_CCI_42_SMA_34      3           // middle close (+ CCI42 cross 0)
#define  SBS_P_ORDER_CLOSE_TYPE_CCI_14_0           4           // pre-long close
#define  SBS_P_ORDER_CLOSE_TYPE_CCI_42_0           5           // long close
#define  SBS_P_ORDER_CLOSE_TYPE_SMA_34_0           6           // super long close

struct   order_close_custom_struct
{
   int      order1_type;
   int      order2_type;
};

//------ sl_trailing ------/

//--- trailing type ---/

#define  SBS_P_SL_TRAILING_TYPE_NO                 0
#define  SBS_P_SL_TRAILING_TYPE_CONSTANT           1

//--- trailing stop type ---/

#define  SBS_P_SL_TRAILING_STOP_TYPE_NO            0
#define  SBS_P_SL_TRAILING_STOP_TYPE_TGT           1           // SL reach TGT
#define  SBS_P_SL_TRAILING_STOP_TYPE_FP2           2           // SL reach FP2

struct   sl_trailing_struct
{
   int      type;                   // SBS_P_SL_TRAILING_TYPE_NO,SBS_P_SL_TRAILING_TYPE_CONSTANT
   double   size;                   // Stoploss Trailing size
   int      stop_type;              // SBS_P_SL_TRAILING_STOP_TYPE_NO,SBS_P_SL_TRAILING_STOP_TYPE_TGT,SBS_P_SL_TRAILING_STOP_TYPE_FP2
   double   stop_level;             // defined by stop_type
};

struct   sbs_post_condition_struct
{
   int      action;                 // SBS_P_CONDITION_NOT_DEFINED, SBS_P_CONDITION_ACCEPTED, SBS_P_CONDITION_REJECTED
   int      type;                   // SBS_P_CONDITION_TYPE_NOT_DEFINED, SBS_P_CONDITION_TYPE_DEFINED
   int      target_type;            // SBS_P_CONDITION_NO_TGT_TYPE, SBS_P_CONDITION_TGT_TYPE_HALF_28, SBS_P_CONDITION_TGT_TYPE_FULL_28
   int      stoploss_type;          // SBS_P_CONDITION_NO_SL_TYPE, SBS_P_CONDITION_SL_TYPE_KC56, SBS_P_CONDITION_SL_TYPE_KC28
   int      order_close_type;       // SBS_P_CONDITION_CLOSE_NO_TYPE,SBS_P_CONDITION_CLOSE_NORMAL_TYPE,SBS_P_CONDITION_CLOSE_FAST_TYPE,SBS_P_CONDITION_CLOSE_LONG_TYPE
   
   order_close_custom_struct  order_close_custom;
   int                        extra_target_control;   // SBS_P_EXTRA_TGT_NO_CONTROL,SBS_P_EXTRA_TGT_YES_CONTROL
   sl_trailing_struct         sl_trailing;
   int                        post_c_type;            // Post-Condition Type: 0 by default, GR 0 if set
   
   ushort   Last_Smf_USh_Pattern[3];// MDOT Pattern
   ushort   BDot_USh_Pattern[3];    // BDOT Pattern
   ushort   TDot_USh_Pattern[3];    // TDOT Pattern
   datetime Last_Smf_Dot3_Time;     // MDOT dot #3 time
   
   double   diff;
   double   wpr;
   
   int      signal;                 // NO_ORDER, BUY_ORDER, SELL_ORDER, CLOSE_BUY_ORDER, CLOSE_SELL_ORDER
   int      case_number;
   int      case_subnumber;
};

//--- sbs_last_pre_dots_data ---/

struct   sbs_pre_dots_structure
{
   int      pre_dots_no;            // number of found pre-dots pair (0 or 1)
   int      dot_1_bar;              // bar number of pre-dot #1
   double   dot_1_val;              // value of pre-dot #1
   int      dot_2_bar;              // bar number of pre-dot #2
   double   dot_2_val;              // value of pre-dot #2
};

struct   sbs_last_pre_dots_data_struct
{
   sbs_pre_dots_structure     bdot_pre_dots;
   sbs_pre_dots_structure     mdot_pre_dots;
   sbs_pre_dots_structure     tdot_pre_dots;
};

sbs_last_pre_dots_data_struct sbs_last_pre_dots_data;

//========================== sbs_alx_signal ================================/

struct   sbs_alx_signal_struct
{
   int      signal;                 // NO_ORDER, BUY_ORDER, SELL_ORDER, CLOSE_BUY_ORDER, CLOSE_SELL_ORDER
   int      case_number;
   int      case_subnumber;
   
   sbs_post_condition_struct  sbs_post_condition;  // Pattern post condition data
};

sbs_alx_signal_struct         sbs_alx_signal;

//================== eof sbs_alx_indi_data_proc_hdr.mqh ====================/