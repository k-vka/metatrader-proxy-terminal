//================= sbs_dfm_proc_header.mqh ==============================/

//----------------------- SBS_DFM_Processing_Profile Data ----------------/

#define     SBS_NO_PROCESSING_CONTEXT           0
#define     SBS_ONLINE_PROCESSING_CONTEXT       1
#define     SBS_OFFLINE_PROCESSING_CONTEXT      2

#define     SBS_INDICATION_NOT_INIT_STATE       0
#define     SBS_INDICATION_INITIALIZED_STATE    1

#define     SBS_ORDER_NOT_ACTVE                 0
#define     SBS_ORDER_ACTVE                     1

#define     SBS_PHF_RESP_LABEL_EMPTY_SIGNAL     "NOSIG"

struct SBS_DFM_Processing_Profile_struct
{
//--- general profile ---/

   int      processing_context;        // SBS processing context (SBS_NO_PROCESSING_CONTEXT,SBS_ONLINE_PROCESSING_CONTEXT,SBS_OFFLINE_PROCESSING_CONTEXT)
   int      indication_state;          // SBS indication state (SBS_INDICATION_NOT_INIT_STATE,SBS_INDICATION_INITIALIZED_STATE)
   string   tester_context;            // SBS tester context ("Y" if tester context is ON)
   int      dfms_spread;               // SBS spread value
   
   string   dfms_resp_label_name;      // DFM Server Response Label Name
   long     dfms_resp_chart_id;        // DFM Server Response Chart ID
   
   int      sequence_object_no;        // SBS indication object names postfix sequence number

//--- current order state profile ---/

   int      order_state;               // SBS current order state (SBS_ORDER_NOT_ACTVE,SBS_ORDER_ACTVE)
   int      order_state_fhandle;       // File Handle of order state storage file name
   string   order_state_fname;         // Name of order state storage file name
};

SBS_DFM_Processing_Profile_struct            sbs_dfm_proc_profile;

//----------------------- SBS_DFM_Order_State Data -----------------------/

struct SBS_DFM_Order_State_struct
{
   int      status;                    // SBS current order status (NO_ORDER,SELL_ORDER,BUY_ORDER,CLOSE_SELL_ORDER,CLOSE_BUY_ORDER,CLOSE_ANY_ORDER)
   datetime time_stamp;                // SBS current order time stamp
   double   price;                     // SBS current order price
   double   stoploss;                  // SBS current order recommended stoploss (points)
   int      case_number;               // SBS current order case number
   int      subcase_number;            // SBS current order subcase number
   double   last_points;               // SBS total amount of all closed orders
};

SBS_DFM_Order_State_struct                   sbs_dfm_order_state;

//================= eof sbs_dfm_proc_header.mqh ==========================/