//================== sbs_exp_indi_data_proc_hdr.mqh =======================/

#define  SBS_INDI_01_NAME              "SBS_INDI_01"
#define  SBS_INDI_02_NAME              "SBS_INDI_02"
#define  SBS_INDI_TTC_01_NAME          "SBS_INDI_TTC_01"
#define  SBS_INDI_FT_01_NAME           "SBS_INDI_FT_01"        // Fiji
#define  SBS_INDI_SHV_01_NAME          "SBS_INDI_SHV_01"       // level shved
#define  SBS_INDI_MA_01_NAME           "SBS_INDI_MA_01"        // Moving Average
#define  SBS_INDI_DSS_OF_MACD_01_NAME  "SBS_INDI_DSS_of_MACD"  // DSS of MACD
#define  SBS_INDI_RMI_RSX_01_NAME      "SBS_INDI_RMI_RSX_01"   // RMI RSX

//#define  SBS_INDI_FT_SERIES_01_NAME    "SBS_INDI_FT_SERIES_01_5_30" // Fiji Series
//#define  SBS_INDI_FT_SERIES_02_NAME    "SBS_INDI_FT_SERIES_02_5_30"
//#define  SBS_INDI_FT_SERIES_03_NAME    "SBS_INDI_FT_SERIES_03_5_30"
//#define  SBS_INDI_FT_SERIES_04_NAME    "SBS_INDI_FT_SERIES_04_5_30"

#define  SBS_INDI_FT_SERIES_01_NAME    "SBS_INDI_FT_SERIES_01" // Fiji Series
#define  SBS_INDI_FT_SERIES_02_NAME    "SBS_INDI_FT_SERIES_02"
#define  SBS_INDI_FT_SERIES_03_NAME    "SBS_INDI_FT_SERIES_03_15_30"
#define  SBS_INDI_FT_SERIES_04_NAME    "SBS_INDI_FT_SERIES_04"

#define  SBS_FT_SERIES_INDI_TOTAL      4                       // number of ft series indis

#define  SBS_INDI_01_NUMBER   1
#define  SBS_INDI_02_NUMBER   2

//#define  SBS_INDI_IREG_01_NAME         "SBS_INDI_IREG_01_5_30"
//#define  SBS_INDI_IREG_02_NAME         "SBS_INDI_IREG_02_5_30"

#define  SBS_INDI_IREG_01_NAME         "SBS_INDI_IREG_01"
#define  SBS_INDI_IREG_02_NAME         "SBS_INDI_IREG_02"

#define  MAX_IREG_NO_04       250                              // i_Reg data element max number 04

//#define  SBS_INDI_HKN_02_NAME          "SBS_INDI_HKN_02_5_30"
//#define  SBS_INDI_HKN_03_NAME          "SBS_INDI_HKN_03_5_30"
//#define  SBS_INDI_HKN_04_NAME          "SBS_INDI_HKN_04_5_30"

#define  SBS_INDI_HKN_02_NAME          "SBS_INDI_HKN_02"
#define  SBS_INDI_HKN_03_NAME          "SBS_INDI_HKN_03"
#define  SBS_INDI_HKN_04_NAME          "SBS_INDI_HKN_04"

#define  MAX_HEIKEN_NO        300

#define  SBS_INDI_ZZL_NAME          "SBS_INDI_ZZL"             // ZZ Larsen



//------------------------- SBS INDI 01 & 02 definitions ------------------/

#define  SBS_INDI_NO_STATE         0            // between up & low level, no any level cross
#define  SBS_INDI_UPPER_STATE      11           // higher up level
#define  SBS_INDI_UP_STATE         12           // lower up level, higher low level, cross low level
#define  SBS_INDI_LOWER_STATE      21           // lower low level
#define  SBS_INDI_DOWN_STATE       22           // higher low level, lower up level, cross up level

#define  SBS_INDI_FT_SIGNAL_NO      20          // FT signals collection

#define  SBS_INDI_FT_BUY_BUFFER     2
#define  SBS_INDI_FT_SELL_BUFFER    3

//------------------------- SBS INDI SHV Zones definitions -----------------/

#define  SBS_INDI_SHV_ZONE_WEAK      0
#define  SBS_INDI_SHV_ZONE_TURNCOAT  1
#define  SBS_INDI_SHV_ZONE_UNTESTED  2
#define  SBS_INDI_SHV_ZONE_VERIFIED  3
#define  SBS_INDI_SHV_ZONE_PROVEN    4

//------------------------- SBS INDI collected data ------------------------/

double   sbs_indi_01_data[SBS_INDI_BARS_NO];
double   sbs_indi_02_data[SBS_INDI_BARS_NO];

double   sbs_indi_ttc_01_data[SBS_INDI_BARS_NO];

double   sbs_indi_ma_01_data[SBS_INDI_BARS_NO];

double   sbs_indi_dss_of_macd_01_data[SBS_INDI_BARS_NO];    // Main Value
double   sbs_indi_dss_of_macd_02_data[SBS_INDI_BARS_NO];    // Main (DOWN) Value (EMPTY if Main UP)
//double   sbs_indi_dss_of_macd_03_data[SBS_INDI_BARS_NO];    // Extra Value

double   sbs_indi_rmi_rsx_01_data[SBS_INDI_BARS_NO];        // Main Value
double   sbs_indi_rmi_rsx_02_data[SBS_INDI_BARS_NO];        // Main (DOWN) Value (EMPTY if Main UP)

string   sbs_indi_ft_series_name[SBS_FT_SERIES_INDI_TOTAL] = {
                                                               SBS_INDI_FT_SERIES_01_NAME,
                                                               SBS_INDI_FT_SERIES_02_NAME,
                                                               SBS_INDI_FT_SERIES_03_NAME,
                                                               SBS_INDI_FT_SERIES_04_NAME
                                                             }; 

double   sbs_indi_ft_buy_data [SBS_FT_SERIES_INDI_TOTAL][SBS_INDI_BARS_NO];   // FT Series Buy Signals (not EMPTY)
double   sbs_indi_ft_sell_data[SBS_FT_SERIES_INDI_TOTAL][SBS_INDI_BARS_NO];   // FT Series Sell Signals (not EMPTY)

#define  IR_MIDDLE      0                    // i_Reg array indexes
#define  IR_TOP         1
#define  IR_BOTTOM      2

double   i_Reg1[3][MAX_IREG_NO_04];          // i_Reg1 data array (0 - middle, 1 - top, 2 - bottom)
double   i_Reg2[3][MAX_IREG_NO_04];          // i_Reg2 data array (0 - middle, 1 - top, 2 - bottom)

string   ir1ir2_position = "000";            // Position of ir1 vs ir2

double   sbs_indi_zzl_down_data[SBS_INDI_BARS_NO];    // ZZL down signals ( != 0)
double   sbs_indi_zzl_up_data[SBS_INDI_BARS_NO];      // ZZL up signals ( != 0)

//------------------ Heiken Analysis Data ---------------------------/

double   HA2[4];
double   HA3[4];
double   HA4[4];

double   ha2_min_val[MAX_HEIKEN_NO];
double   ha2_max_val[MAX_HEIKEN_NO];

double   ha3_min_val[MAX_HEIKEN_NO];
double   ha3_max_val[MAX_HEIKEN_NO];

double   ha4_min_val[MAX_HEIKEN_NO];
double   ha4_max_val[MAX_HEIKEN_NO];

double   ha2_max;
double   ha2_min;

double   ha3_max;
double   ha3_min;

double   ha4_max;
double   ha4_min;

string   ha4ir2_position = "0";              // Position of ha4 vs ir2
string   ha2ha3_position = "00";             // Position of ha2 vs ha3 ("23" or "32")

//------------------------- SBS INDI 01 & 02 processing data ---------------/

struct sbs_indi_trend_struct
{
   int      state;                              // sbs state value
   int      cross_bar;                          // cross bar OR no cross if cross_bar == SBS_INDI_BARS_NO
};

sbs_indi_trend_struct      sbs_indi_01_trend;
sbs_indi_trend_struct      sbs_indi_02_trend;

struct sbs_indi_level_struct
{
   double   up_level;                           // up level cross value
   double   low_level;                          // down level cross value
};

sbs_indi_level_struct      sbs_indi_01_level = {0.8, -0.8};
sbs_indi_level_struct      sbs_indi_02_level = {0.8, -0.8};

//-------------------------- SBS INDI TTC processing data ------------------/

sbs_indi_level_struct      sbs_indi_ttc_01_level = {80, 20};

//-------------------------- SBS INDI FT processing data -------------------/

struct sbs_indi_ft_struct
{
   int      signal;                              // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      bar_number;                          // cross bar OR no cross if cross_bar == SBS_INDI_BARS_NO
   double   value;
};

double                     sbs_indi_ft_value;
int                        sbs_indi_ft_signal_no;     // number of collected ft signals
sbs_indi_ft_struct         sbs_indi_ft_01[SBS_INDI_FT_SIGNAL_NO];    // ft signals collection

//-------------------------- SBS INDI FT Series processing data ------------/

#define     SBS_FT_SERIES_NO_STATE           0     // ft series no state

#define     SBS_FT_SERIES_RGLR_012           1     // + Regular
#define     SBS_FT_SERIES_RGLR_2MXD          2     // + Regular Mixed

#define     SBS_FT_SERIES_OL_012             3     // + OneLine Regular
#define     SBS_FT_SERIES_OL_2MXD            4     // + OneLine Mixed
#define     SBS_FT_SERIES_OL_0_2             5     // + OneLine Short

#define     SBS_FT_SERIES_POST_OL_012        6     // + Post OneLine
#define     SBS_FT_SERIES_POST_OL_2MXD       7     // + Post OneLine Mixed
#define     SBS_FT_SERIES_POST_OL_0_2        8     // + Post OneLine Short

#define     SBS_FT_SERIES_POST_FAKE_OL_2     9     // + Post Fake OneLine

//-------------------------- Fourth signal states --------------------------/

#define     SBS_FT_SERIES_RGLR_013           51     // Regular
#define     SBS_FT_SERIES_RGLR_3MXD          52     // Regular Mixed

#define     SBS_FT_SERIES_OL_013             53     // OneLine Regular
#define     SBS_FT_SERIES_OL_3MXD            54     // OneLine Mixed
#define     SBS_FT_SERIES_OL_0_3             55     // OneLine Short

#define     SBS_FT_SERIES_POST_OL_013        56     // Post OneLine
#define     SBS_FT_SERIES_POST_OL_3MXD       57     // Post OneLine Mixed
#define     SBS_FT_SERIES_POST_OL_0_3        58     // Post OneLine Short

#define     SBS_FT_SERIES_POST_FAKE_OL_3     59     // Post Fake OneLine

//--------------------------------------------------------------------------/

#define     SBS_FT_SERIES_BAR_NO_VALUE    -1

struct sbs_indi_ft_series_state_struct
{
   int      signal;                             // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      state;                              // FT Series state
   int      signal_01_bar;                      // FT Series Indi 01 bar number
   double   signal_01_value;                    // FT Series Indi 01 value
   int      signal_02_bar;                      // FT Series Indi 02 bar number
   double   signal_02_value;                    // FT Series Indi 02 value
   int      signal_03_bar;                      // FT Series Indi 03 bar number
   double   signal_03_value;                    // FT Series Indi 03 value
   int      signal_04_bar;                      // FT Series Indi 04 bar number
   double   signal_04_value;                    // FT Series Indi 04 value
};

struct sbs_indi_ft_series_order_struct
{
   int      signal;                              // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      case_number;
   int      case_subnumber;
};

sbs_indi_ft_series_state_struct  sbs_indi_ft_series_state;        // ft series state data
sbs_indi_ft_series_state_struct  sbs_indi_ft_series_post_state;   // ft series post state data

int   sbs_ft_series_regular_range  = 56;   // bar range for Regular identification
int   sbs_ft_series_ol_range       = 4;    // bar range for OneLine identification
int   sbs_ft_series_ol_short_range = 2;    // bar range for OneLine Short (0_2) identification

int   sbs_ft_series_ol_gap           = 36;   // max bar number till Post-OL
int   sbs_ft_series_ol_post_fake_gap = 24;   // max bar number till Post-Fake-OL

sbs_indi_ft_series_order_struct  sbs_indi_ft_series_order_signal;

//-------------------------- SBS INDI SHV Zone processing data -------------/

int      shv_zones_total;     // number of found chart zones
int      shv_zones_rejected;  // number of rejected chart zones
int      shv_zones_accepted;  // number of accepted chart zones (Proven or Verified)

struct shv_zone_data_struct
{
   bool     zone_found;    // false - no zone, true - zone was found
   string   type;          // type of zone ("S" support, "R" - resistance)
   int      id;            // indi zone number
   double   hi;            // high level
   double   lo;            // low level
   int      strength;      // strength code
   int      hits;          // strength hits
   int      age;           // zone start bar number
};

shv_zone_data_struct    sbs_indi_shv_high_zone;
shv_zone_data_struct    sbs_indi_shv_low_zone;

//-------------------------- SBS INDI MA processing data -------------------/


//-------------------------- SBS INDI RMI RSX processing data --------------/

//-------------------------- INDI Extreme Level States ---------------------/

#define     SBS_NO_EXTREME_STATE         0

#define     SBS_HI_EXTREME               1
#define     SBS_LO_EXTREME               2

#define     SBS_CROSS_UP_HI_EXTREME      3
#define     SBS_CROSS_DOWN_HI_EXTREME    4
#define     SBS_CROSS_UP_LO_EXTREME      5
#define     SBS_CROSS_DOWN_LO_EXTREME    6

//-------------------------- INDI Trend States ------------------------------/

#define     SBS_NO_TREND                 0

//#define     SBS_GO_DOWN_HI_EXTREME       11
//#define     SBS_GO_DOWN_HI_THRESHOLD     12
//#define     SBS_GO_DOWN_WEAKNESS         13
//#define     SBS_GO_DOWN_LO_THRESHOLD     14

//#define     SBS_GO_UP_LO_EXTREME         21
//#define     SBS_GO_UP_LO_THRESHOLD       22
//#define     SBS_GO_UP_WEAKNESS           23
//#define     SBS_GO_UP_HI_THRESHOLD       24

//-------------------------- INDI Bounce Types -----------------------------/

#define     SBS_NO_BOUNCE                    0

#define     SBS_DOWN_BOUNCE_HI_EXTREME       31
#define     SBS_DOWN_BOUNCE_HI_THRESHOLD     32
#define     SBS_DOWN_BOUNCE_WEAKNESS         33
#define     SBS_DOWN_BOUNCE_LO_THRESHOLD     35
//#define     SBS_DOWN_BOUNCE_LO_EXTREME       36

#define     SBS_UP_BOUNCE_LO_EXTREME         41
#define     SBS_UP_BOUNCE_LO_THRESHOLD       42
#define     SBS_UP_BOUNCE_WEAKNESS           43
#define     SBS_UP_BOUNCE_HI_THRESHOLD       45
//#define     SBS_UP_BOUNCE_HI_EXTREME         46

sbs_indi_level_struct      sbs_indi_rmi_extreme_level   = {0.99, -0.99};
sbs_indi_level_struct      sbs_indi_rmi_threshold_level = {0.8 , -0.8 };
sbs_indi_level_struct      sbs_indi_rmi_weakness_level  = {0   ,  0   };

struct sbs_indi_condition_struct
{
   int      extreme_state;       // type of rmi extreme state
   int      trend;               // type of rmi trend
   int      bounce_type;         // type of rmi bounse level
   int      bounce_bar;          // bounce bar number (min or max)
   double   bounce_val;          // bounce value
};

sbs_indi_condition_struct     sbs_indi_rmi_condition;

//-------------------------- SBS INDI DSS of MACD processing data ----------/

struct sbs_indi_dss_of_macd_struct
{
   int      signal;                              // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      bar_number;                          // cross bar OR no cross if cross_bar == SBS_INDI_BARS_NO
   int      case_number;
   int      case_subnumber;
};

sbs_indi_dss_of_macd_struct   sbs_indi_dss_of_macd_01;    // ft signals collection

sbs_indi_level_struct         sbs_indi_dss_of_macd_01_level = {99, 01};

sbs_indi_level_struct         sbs_indi_dss_of_macd_extreme_level   = {99, 01};
sbs_indi_level_struct         sbs_indi_dss_of_macd_threshold_level = {90, 10};
sbs_indi_level_struct         sbs_indi_dss_of_macd_weakness_level  = {50, 50};

sbs_indi_condition_struct     sbs_indi_dss_of_macd_condition;

//================== eof sbs_exp_indi_data_proc_hdr.mqh ====================/