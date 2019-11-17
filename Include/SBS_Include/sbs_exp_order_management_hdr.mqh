//======================= vka_trail_order_header ================================/

//----------------------- Common Values -----------------------------------------/

#define  NO_ORDER             0
#define  BUY_ORDER            1
#define  SELL_ORDER           2
#define  REJECT_ORDER         3
#define  CLOSE_BUY_ORDER      4
#define  CLOSE_SELL_ORDER     5
#define  CLOSE_ANY_ORDER      6

#define  MODIFY_BUY_ORDER     7
#define  MODIFY_SELL_ORDER    8

//----------------------------- Orders Info -------------------------------------/

int      MagicNumber = 2141118;

double   StopLoss = 50;

int      total_orders;
int      order_type;
int      order_status;
int      order_ticket;

double   order_profit;
double   order_openprice;
double   order_stoploss;

datetime order_open_time;                    // current order open time

double   spread;
double   stop_level;
double   lot_size;
double   min_lot;
double   max_lot;

int      NumberOfTries = 3;
double   TakeProfit = 50;
double   Lots       = 0.1;
int      Slippage1  = 10;

double   Open_Threshold1;

double   Close_Threshold1 = 10;
double   Close_Threshold2 = 2;

double   middle[2];

double   tro_trail_threshold = 100;     //Profit points to start moving the stoploss
double   tro_trail_slippage = 5;

datetime last_trail_order_time = 0;

//------------------------ SBS Data ---------------------------------------------/

struct   sbs_order_struct
{
   int   state;
   int   case_number;
   int   subcase_number;
};

sbs_order_struct     sbs_order;        // Order data to open

int      sbs_screen_shot_cnt = 0;      // Case Screenshot counter
int      screen_shot_wk_cnt  = 0;      // Weekly Screen shot attempts counter
int      ss_wk_number        = 0;      // Last Weekly Screenshot number

//------------------------ Open Order Profile (open_order_profile) --------------/

#define  SBS_ALX_ORDER_CONDITION_NONE        0
#define  SBS_ALX_ORDER_CONDITION_001         1
#define  SBS_ALX_ORDER_CONDITION_002         2

struct   sbs_open_order_profile_struct
{
//--- Action, Condition ---/

   int      action;
   int      condition;
   
//--- Last Order State ---/

   datetime order_time;                // Order open time
   
   int      signal;                    // NO_ORDER, BUY_ORDER, SELL_ORDER, CLOSE_BUY_ORDER, CLOSE_SELL_ORDER
   int      case_number;
   int      case_subnumber;
   
//--- Open order processing data ---/

   double   order_price;               // Close[0]
   
   double   sl_value;                  // recomended sl value
   
   int      sl_points;                 // stoploss ploints
   int      sl_primary_shift;          // primery shift for starting stoploss trailing
   int      sl_primary_points;         // primary stoploss value
   
};

//sbs_open_order_profile_struct    open_order_profile;

//-------------------- ISLANDS Order Session State (ilnd_order_session_state) ---/

#define  ILND_ORDER_SESSION_NO_STAGE            0
#define  ILND_ORDER_SESSION_INITIAL_STAGE       1
#define  ILND_ORDER_SESSION_CCI_CONTROL_STAGE   2

#define  ILND_ORDER_SESSION_INITIAL_SL_JUMP_POINTS    2     // Stoploss Inc/Dec after ILND_ORDER_SESSION_INITIAL_STAGE (Points)
#define  ILND_ORDER_SESSION_MIN_SL_DIFF_POINTS        5     // Min difference between SL and Current Price to allow SL Jump (Points)

struct   ilnd_order_state_struct
{
   datetime order_time;                // Order open time (Time[0])
   double   order_price;               // Close[0]
   double   stoploss;                  // Order Stoploss
   
   int      signal;                    // NO_ORDER, BUY_ORDER, SELL_ORDER, CLOSE_BUY_ORDER, CLOSE_SELL_ORDER
   int      case_number;
   int      case_subnumber;

};

struct   ilnd_order_session_state_struct
{
//   int      session_signal;            // NO_ORDER, BUY_ORDER, SELL_ORDER, CLOSE_BUY_ORDER, CLOSE_SELL_ORDER (see "sbs_dfm_order_state"))
   int      stage;                     // ILND_ORDER_SESSION_NO_STAGE, ILND_ORDER_SESSION_INITIAL_STAGE, ILND_ORDER_SESSION_CCI_CONTROL_STAGE
   
   double   initial_stage_price_target;   // target price of initial stage, then switching to CCI control stage
   
   ilnd_order_state_struct    order_type_1_state;     // session order type 1 (first position) state
   ilnd_order_state_struct    order_type_2_state;     // session order type 2 (second position) state
   
};

ilnd_order_session_state_struct     ilnd_order_session_state;

//======================= EOF vka_trail_order_header ============================/