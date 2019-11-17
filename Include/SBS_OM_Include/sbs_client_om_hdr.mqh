//======================= sbs_client_om_hdr.mql =======================/

//----------------------- Common Values -------------------------------/

#define  NO_ORDER             0
#define  BUY_ORDER            1
#define  SELL_ORDER           2
#define  REJECT_ORDER         3 
#define  CLOSE_BUY_ORDER      4
#define  CLOSE_SELL_ORDER     5
#define  CLOSE_ANY_ORDER      6

#define  MODIFY_BUY_ORDER     7
#define  MODIFY_SELL_ORDER    8

//--- Order Types Number ---/

#define  SBS_CLIENT_MAX_ORDER_TYPES          2

//--- Order Magic Numbers ---/

#define  SBS_CLIENT_SELL_ORDER_MAGIC_NUMBER  10000
#define  SBS_CLIENT_BUY_ORDER_MAGIC_NUMBER   20000

//--- Order Open Parameters ---/

#define  SBS_CLIENT_SL_INCREMENT             3              // points

//--- Risk Management Parameters ---/

#define  SBS_CLIENT_DEFAULT_FREE_MRG_RISK    0.60           // means 60%
#define  SBS_CLIENT_MIN_FREE_MRG_RISK        0.30
#define  SBS_CLIENT_MAX_FREE_MRG_RISK        0.80
#define  SBS_CLIENT_FREE_MRG_RISK_STEP       0.01

#define  SBS_CLIENT_DEFAULT_ORDER_RISK       0.01           // means 1%
#define  SBS_CLIENT_MIN_ORDER_RISK           0.001
#define  SBS_CLIENT_MAX_ORDER_RISK           0.1
#define  SBS_CLIENT_ORDER_RISK_STEP          0.001

//--- Global Variable Names ---/

#define  SBS_CLIENT_FREE_MRG_RISK_GV_NAME    "SBS_CLIENT_FREE_MRG_RISK_VALUE"
#define  SBS_CLIENT_ORDER_RISK_GV_NAME       "SBS_CLIENT_ORDER_RISK_VALUE"

//--- PHF_Response_Signal Order Data ---/

struct sbs_phf_order_struct
{
   int      signal;
   double   order_price;
   double   stoploss;
   datetime order_time;
};

//--- OPEN Order Data ---/

struct sbs_open_order_struct
{
//--- order server data ---/

   int      ticket;
   int      signal;
   double   order_price;
   double   stoploss;
   datetime order_time;
   
   datetime stoploss_change_time;

//--- related order session & phf data ---/
   
   int                     order_session_id;
   sbs_phf_order_struct    sbs_phf_order_data;
};

//--- sbs_client_operational_data_struct ---/

#define  SBS_CLIENT_OPEN_ORDER_FLAG_GV_NAME     "SBS_CLIENT_OPEN_ORDER_FLAG"
#define  SBS_CLIENT_CLOSE_ORDER_FLAG_GV_NAME    "SBS_CLIENT_CLOSE_ORDER_FLAG"
#define  SBS_CLIENT_SL_TRAIL_ORDER_FLAG_GV_NAME "SBS_CLIENT_SL_TRAIL_ORDER_FLAG"
#define  SBS_CLIENT_OBS_VAL_GV_NAME             "SBS_CLIENT_OBS_VAL_GV_NAME"

#define  SBS_CLIENT_FLAG_NOT_SET_VALUE          0
#define  SBS_CLIENT_FLAG_SET_VALUE              1

struct sbs_client_operational_data_struct
{
   double   open_order_flag;
   double   close_order_flag;
   double   sl_trail_order_flag;
   double   obs_order_val;
};

struct sbs_client_order_state_struct
{
//--- Order Management Context ---/

//--- Account Data ---/

   double   free_margin;            // Account Free Margin value
   int      leverage;               // Account Leverage value

//--- Global RISK Data ---/

   double   free_margin_risk_value; // (Free Margin / Equity) MIN LEVEL (0.6 by default)
   double   order_risk_value;       // 0.01 by default

//--- Terminal Global OPERATIONAL Data ---/

   sbs_client_operational_data_struct  sbs_global_operational_data;

//--- Expert Private OPERATIONAL Data ---/

   sbs_client_operational_data_struct  sbs_private_operational_data;

//--- Symbol Data ---/

   double   spread;                 //
   double   one_lot_tick_cost;      // cost of One Tick in Account Currency
   double   min_lot;                // minimal Lot Size
   double   max_lot;                // maximal Lot Size
   double   lot_step;               // Lot Step
   
   double   n_Point;                // DFM normalized point size
   
//--- PHF_Response_Signal (Sent by DMF Server as Response Message) ---/

   int      order_session_id;
   
   sbs_phf_order_struct    sbs_phf_order[SBS_CLIENT_MAX_ORDER_TYPES];
   sbs_open_order_struct   sbs_open_order[SBS_CLIENT_MAX_ORDER_TYPES];

//--- Order Operation Indication Label Text ---/

   string   operation_label_data;
   int      sequence_object_no;
};

sbs_client_order_state_struct    sbs_client_order_state;



//======================= eof sbs_client_om_hdr.mql ===================/
