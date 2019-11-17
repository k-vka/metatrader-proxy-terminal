//======================= vka_dfm_header ==================================/

//--- DFM Client Context Parameters ---/

#define     DFM_CLIENT_NO_CONTEXT                     0
#define     DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT      1
#define     DFM_CLIENT_SYNCH_BAR_TRANSFER_CONTEXT     2

//--- DFM Client Request Types ---/

#define     DFM_C_REQUEST_LBT_TYPE                    1        // LAST_BAR_TRANSFER request
#define     DFM_C_REQUEST_SYNCH_BT_TYPE               2        // SYNCH_BAR_TRANSFER request

#define     DFM_C_RESPONSE_LBT_TYPE                   11       // LAST_BAR_TRANSFER response
#define     DFM_C_RESPONSE_LBT_TO_SYNCH_TYPE          12       // LAST_BAR_TRANSFER response with request to synchronize the feeding
#define     DFM_C_RESPONSE_SYNCH_BT_TYPE              13       // SYNCH_BAR_TRANSFER response

//--- DFM Server Response Types ---/

#define     DFM_S_RESPONSE_EMPTY_REQ_TYPE             101      // Incoming client request is Empty (no submessage)
#define     DFM_S_RESPONSE_EMPTY_REQ_HEADER_TYPE      102      // Incoming client request has Empty Header
#define     DFM_S_RESPONSE_UNKNOWN_REQ_TYPE           103      // Incoming client request has Unknown Request Type
#define     DFM_S_RESPONSE_WRONG_REQ_HDR_TYPE         104      // Incoming client request has Incorrect Header fields number
#define     DFM_S_RESPONSE_REQ_ITM_PROC_NF_TYPE       105      // Incoming client request relevant processing item not found
#define     DFM_S_RESPONSE_REQ_NO_RATES_TYPE          106      // Incoming client request rates not found
#define     DFM_S_RESPONSE_REQ_WRONG_RATES_TYPE       107      // Incoming client request contains wrong rates
#define     DFM_S_RESPONSE_REQ_NO_HST_UPD_TYPE        108      // Incoming client request not completed due to history update error

//--- DFM Message Delimeters ---/

#define     DFM_MSG_DELIMETER    ";"
#define     DFM_FLD_DELIMETER    ","

#define     DFM_MSG_TEMP_ARRAY_SIZE    256

//--- DFM History File Parameters ---/

#define     DFM_SERVER_HISTORY_FILE_HEADER_SIZE 148
#define     DFM_SERVER_HISTORY_FILE_RECORD_SIZE sizeof(MqlRates)

//======================== DFM - MSB processing data ======================/

#define     DFM_CLIENT_MAX_RATES    2

int         dfm_msg_state;          // 0 - message received
uchar       dfm_msg_counter;        // cyclic dfm message counter (0 - very first message, then from 1 to 255)

string      dfm_server_endpoint;    // DFM Server TCP Endpoint

uchar       dfm_msg_temp_array[DFM_MSG_TEMP_ARRAY_SIZE];

string      dfm_rcv_data;           // Destination string for rcv messages
string      dfm_snd_data;           // Source string for snd messages

MqlRates    dfm_client_rates[DFM_CLIENT_MAX_RATES]; // Min bar number to transfer to Server (M1)

//----------------------- DFM History File Statistics Struct -------------/

struct h_file_statistics_struct     // used to get corresponding data of history descriptor
{
   int      headers_no;             // number of headers in history file (0 or 1)
   ulong    records_no;             // number of records (bars) in history file (0 or more)
};

//======================= DFM Client Data =================================/

//--- DFM Client Configuration ---/

struct dfm_client_config_structure
{
   int      gd_id;                  // global dictionary id folllowing dfm_terminal_company
   string   test_context;           // "Y" - tester is running, "N" - tester is not running
   
   long     rsp_history_recno;      // synch server context - number of server history records
   MqlRates rsp_mql_rate;           // synch server context - last synchronized server rate
};

dfm_client_config_structure    dfm_client_config;

//--- DFM Client Context ---/

int         dfm_client_context;     // DFM Client Context (State Machine Node)

//--- DFM Client Communication Statistics ---/
/*
struct dfm_client_comm_stat_structure
{
   
};

dfm_client_comm_stat_structure      dfm_client_comm_stat;
*/
//--- DFM Client Message Process Statistics ---/

struct dfm_client_message_stat_structure
{
   ulong    lbt_attemts;            // attepmts number to transfer LBT message
   ulong    lbt_errors;             // attepmts error number to transfer LBT message
   
   ulong    synch_bt_attemts;       // attepmts number to transfer Synch message
   ulong    synch_bt_errors;        // attepmts error number to transfer Synch message
};

dfm_client_message_stat_structure   dfm_client_message_stat;

//--- DFM Client History File Synch Rates Descriptor ---/

struct hf_synch_rates_descriptor_structure
{
   int      hf_handle;              // history file handle
   int      hf_start_read_rec;      // history file start synch record to read
   ulong    hf_start_record;        // history file last synch record to read
};

//======================= EOF vka_dfm_header ==============================/