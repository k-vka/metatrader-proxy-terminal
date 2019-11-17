//================== sbs_order_extra_data_hdr.mqh =======================/

#define     ORDER_NORMAL_DIRECTION        0
#define     ORDER_REVERSE_DIRECTION       1

#define     ORDER_STEP_INITIAL            0

double      sbs_profile_default_sl = 8;    // profile default stoploss

struct   sbs_trail_order_struct
{
   int      state;
   int      case_number;
   int      subcase_number;
   int      direction;           // order open direction (ORDER_NORMAL_DIRECTION or ORDER_REVERSE_DIRECTION)
   
   double   close_val;           // order bar value
   
   int      bounce_bar;          // related bounce bar
   double   bounce_val;          // bounce value
   
   double   profile_sl;          // initial profile stoploss (pips)
   
   int      step;                // order consequense step
};

sbs_trail_order_struct     sbs_trail_order;     // Order data to trail

//================== FT ZZL data ========================================/

#define        NO_BAR_NUMBER     -1                // bar number not found

//------------------ Default Definitions --------------------------------/

#define        FIRST_O_ZZL_SIGNAL_THRESHOLD  0.2 // for (hi_level - lo_level)
#define        H2_EFFECTIVE_JUMP_LEVEL       0.5   // min ha2 jump after ft3 bounce level
#define        LEVEL_DEVIATION_POINTS        (3 * n_Point)  // level bouncing deviation points
#define        SBS_MAX_ZZL_SIGNALS           50
#define        SBS_MAX_JUST_ZZL_SIGNALS      10

//------------------ Data Declarations ----------------------------------/

struct   sbs_ft_zzl_profile_struct
{
//------------------ ft3 profile ----------------------------------------/
   int      ft3_signal;                      // type of ft3 signal (..._ORDER)
   int      ft3_bar;                         // ft3 signal bar number
   int      ft3_second_bar;                  // opposite ft3_signal bar number
   int      ft3_bounce_bar;                  // bounce (max or min) bar number
   double   ft3_bounce_val;                  // bounce bar value
   int      ft3_extremum_bar;                // extremum (min or max) bar number
   double   ft3_extremum_val;                // extremum bar value
//------------------ ft1 profile ----------------------------------------/
   int      ft1_signal;                      // type of ft1 signal (..._ORDER) in ft3 scope
   int      ft1_bar;                         // ft1 signal bar number
   int      ft1_second_bar;                  // opposite (ft1 or ft3 signal) bar number
   int      ft1_bounce_bar;                  // bounce (max or min) bar number
   double   ft1_bounce_val;                  // bounce bar value
   int      ft1_extremum_bar;                // extremum (min or max) bar number
   double   ft1_extremum_val;                // extremum bar value
//------------------ zzl profile ----------------------------------------/
   int      zzl_signal;                      // type of zzl 1-st signal (till ft3 bounce bar)
   int      zzl_signal_number;               // number of zzl signal starting from ft3 signal bar
   int      zzl_sell_signals;                // number of zzl sell signals
   int      zzl_buy_signals;                 // number of zzl buy signals
//-----------------------------------------------------------------------/
};

struct   sbs_zzl_signal_struct
{
   int      bar;                             // zzl signal bar number
   double   val;                             // zzl signal value
   int      extremum_bar;                    // zzl signal extremum bar number
   double   extremum_val;                    // zzl signal extremum value
};

struct   sbs_ft_zzl_case_struct
{
   double   hi_level;                        // case high level
   double   lo_level;                        // case low level
   double   md_level;                        // case middle level
   double   first_o_signal_threshold;        // bounce threshold for very first opposite zzl signal
   double   ha2_effective_jump_level;        // ft3 bounce ha2 jump level
   double   level_deviation_points;          // deviation points for level bouncing
};

struct   sbs_ft_zzl_signal_struct
{
   int      signal;                              // NO_ORDER, BUY_ORDER, SELL_ORDER
   int      case_number;
   int      case_subnumber;
};

struct   temp_extremum
{
   int      bar;
   double   val;
};

//------------------ Profiles/Descriptions ------------------------------/

sbs_ft_zzl_profile_struct        sbs_ft_zzl_profile;     // ft zzl chart profile
sbs_ft_zzl_case_struct           sbs_ft_zzl_case;        // ft zzl case profile
sbs_ft_zzl_signal_struct         sbs_ft_zzl_signal;      // ft zzl signal description

//------------------ Signals --------------------------------------------/

sbs_zzl_signal_struct            sbs_zzl_sell_signal[SBS_MAX_ZZL_SIGNALS];  // zzl sell (down) signals
sbs_zzl_signal_struct            sbs_zzl_buy_signal[SBS_MAX_ZZL_SIGNALS];   // zzl buy (up) signals

sbs_zzl_signal_struct            sbs_just_zzl_sell_signal[SBS_MAX_JUST_ZZL_SIGNALS];  // zzl sell (down) signals (no ft signal limitation)
sbs_zzl_signal_struct            sbs_just_zzl_buy_signal[SBS_MAX_JUST_ZZL_SIGNALS];   // zzl buy (up) signals (no ft signal limitation)

//------------------ SBS INDI Positions data ----------------------------/

struct sbs_indi_position_struct
{
   string      ha_order;      // HAs order beginning from lower to higher
   double      ha_level_1;    // HA level for order 1 middle indi value (lower)
   double      ha_level_2;    // HA level for order 2 middle indi value (middle)
   double      ha_level_3;    // HA level for order 3 middle indi value (higher)
   string      ft3_levels_ha; // ft3 levels positions against HAs from lower (1) to higher (4)
};

sbs_indi_position_struct      sbs_indi_position;   // positions collection

//================== eof sbs_order_extra_data_hdr.mqh ===================/