//======================= mbs_global_config_header.mqh =====================/

//======================= DFM Dictionary Data ==============================/

//#define     DFM_TERMINAL_SYMBOL                 "EURUSD"     //
//#define     DFM_TERMINAL_SYMBOL                 "EURJPY"     //
//#define     DFM_TERMINAL_SYMBOL                 "GBPUSD"
//#define     DFM_TERMINAL_SYMBOL                 "AUDUSD"

//#define     DFM_TERMINAL_SYMBOL                 "USDJPY"    //
//#define     DFM_TERMINAL_SYMBOL                 "USDCHF"        // Replaced by "AUDJPY"
///////////////#define     DFM_TERMINAL_SYMBOL                 "AUDJPY"
//#define     DFM_TERMINAL_SYMBOL                 "USDCAD"
#define     DFM_TERMINAL_SYMBOL                 "EURGBP"

//======================= DFM Client Data ==================================/

#define     DFM_SERVER_01_NAME                  "DFMS1"

//--- LOCAL TEST ADDRESSES ---/

//#define     DFM_SERVER_01_ADDRESS               "tcp://127.0.0.1:5555"              // LOCAL TEST DEFAULT
//#define     DFM_SERVER_01_ADDRESS               "tcp://127.0.0.1:5556"              // LOCAL TEST 2
//#define     DFM_SERVER_01_ADDRESS               "tcp://127.0.0.1:5557"              // LOCAL TEST 3
//#define     DFM_SERVER_01_ADDRESS               "tcp://127.0.0.1:5558"              // LOCAL TEST 4

//--- ONLINE ADDRESSES ---/

//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.20.11:5555"           // ONLINE EURUSD
//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5556"           // ONLINE EURJPY
//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5557"           // ONLINE GBPUSD
//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5558"           // ONLINE AUDUSD

//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5559"           // ONLINE USDJPY
//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5560"           // ONLINE AUDJPY     (USDCHF)
//#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5561"           // ONLINE USDCAD
#define     DFM_SERVER_01_ADDRESS               "tcp://192.168.19.11:5562"           // ONLINE EURGBP

//======================= DFM Server Data ==================================/

#define     DFM_SERVER_NAME                     "DFMS1"

//--- LOCAL TEST ADDRESSES ---/

//#define     DFM_SERVER_ENDPOINT                 "tcp://127.0.0.1:5555"              // LOCAL TEST DEFAULT
//#define     DFM_SERVER_ENDPOINT                 "tcp://127.0.0.1:5556"              // LOCAL TEST 2
//#define     DFM_SERVER_ENDPOINT                 "tcp://127.0.0.1:5557"              // LOCAL TEST 3
//#define     DFM_SERVER_ENDPOINT                 "tcp://127.0.0.1:5558"              // LOCAL TEST 4

//--- ONLINE ADDRESSES ---/

//#define     DFM_SERVER_ENDPOINT                 "tcp://192.168.20.11:5555"      // ONLINE EURUSD
//#define     DFM_SERVER_ENDPOINT                 "tcp://192.168.19.11:5556"      // ONLINE EURJPY
//#define     DFM_SERVER_ENDPOINT                 "tcp://192.168.19.11:5557"      // ONLINE GBPUSD
//#define     DFM_SERVER_ENDPOINT                 "tcp://192.168.19.11:5558"      // ONLINE AUDUSD

//#define     DFM_SERVER_ENDPOINT                  "tcp://192.168.19.11:5559"     // ONLINE USDJPY
//#define     DFM_SERVER_ENDPOINT                  "tcp://192.168.19.11:5560"     // ONLINE AUDJPY    (USDCHF)
//#define     DFM_SERVER_ENDPOINT                  "tcp://192.168.19.11:5561"     // ONLINE USDCAD
#define     DFM_SERVER_ENDPOINT                  "tcp://192.168.19.11:5562"     // ONLINE EURGBP

//======================= DFM Server Indicators Pool Config ================/

#define  SBS_INDI_BARS_NO     1536     //2048

//--- DFM Client Synchronization Bar History ---/

#define     DFM_CLIENT_MIN_HISTORY     (SBS_INDI_BARS_NO * 5)     // for (1M * Multiplier) Server Chart

//======================= DFM Server Timeouts Config =======================/

int      dfms_eagain_timeout             = 5;         // msec for Sleep
int      dfms_event_chart_custom_timeout = 20;        // msec for Sleep

//======================= Order StopLoss Process Config ====================/

#define     SBS_STOPLOSS_EXTRA_POINTS_NUMBER    4     // additionsl points for calculated SL level

//======================= EOF mbs_global_config_header.mqh =================/