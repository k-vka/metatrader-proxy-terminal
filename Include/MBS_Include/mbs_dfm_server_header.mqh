//======================= mbs_dfm_server_header.mql =======================/

//======================= DFM Server Data =================================/

#define     DFM_SERVER_MAX_PROC_ITEMS           4
#define     DFM_SERVER_MAX_PROC_DESCRIPTORS     (DFM_SERVER_MAX_PROC_ITEMS * 2)

#define     DFM_SERVER_PROC_ITEM_NOT_ACTIVE     0
#define     DFM_SERVER_PROC_ITEM_ACTIVE         1

//----------------------- DFM Server Configuration Data -------------------/

#define     DFM_SERVER_CLIENT_RATES_BUFFER_NOT_LOCKED    0
#define     DFM_SERVER_CLIENT_RATES_BUFFER_LOCKED        1

struct dfm_server_req_proc_context_struct
{
   string   test_context;
   string   short_terminal_company;
   string   terminal_symbol;
};

struct DFM_Server_Config_struct
{
   int      processing_items_no;          // number of active processing items
   int      testing_items_no;             // number of active testing items
   
   int      dfm_client_rates_lock_flag;   // dfm_client_rates buffer lock flag ()
   
   dfm_server_req_proc_context_struct   dfm_server_req_proc_context;   // needed for phf_resp_signal generation
};

DFM_Server_Config_struct            DFM_Server_Config;

//----------------------- DFM Server Processing/Testing Items -------------/

struct DFM_Server_Processing_Item_struct
{
   int      activity_flag;          // DFM_SERVER_PROC_ITEM_NOT_ACTIVE, DFM_SERVER_PROC_ITEM_ACTIVE
   int      gd_id;                  // global dictionary id reference
   
   int      feeding_history_descriptor_id;      // for M1 history file
   int      processing_history_descriptor_id;   // for Processing Period history file
};

DFM_Server_Processing_Item_struct   DFM_Server_Processing_Item[DFM_SERVER_MAX_PROC_ITEMS];
DFM_Server_Processing_Item_struct   DFM_Server_Testing_Item[DFM_SERVER_MAX_PROC_ITEMS];

//----------------------- DFM Server Processing/Testing Descriptors -------/

//--- history descriptor processing states ---/

#define     DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE        0

//--- for feeding descriptors ---/

#define     DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE         1
#define     DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH       2

//--- for processing descriptors ---/

#define     DFM_SERVER_H_DESCRIPTOR_PROC_IS_ACTIVE    11

//--- for processing descriptors chart ---/

#define     DFM_SERVER_PH_DESCRIPTOR_CHART_IS_ACTIVE  21

//--- PHF_RESP_LABEL Definitions ---/

#define     SBS_PHF_RESP_LABEL_EMPTY_VAL              "NOP"
#define     SBS_PHF_RESP_LABEL_EMPTY_SIGNAL           "NOSIG"

#define     PHF_RESP_LABEL_COUNT                      300     // by 10 milliseconds

//--- DFM_Server_History_Descriptor_struct ---/

struct DFM_Server_History_Descriptor_struct
{
//--- constant part ---/

   int      activity_flag;          // DFM_SERVER_PROC_ITEM_NOT_ACTIVE, DFM_SERVER_PROC_ITEM_ACTIVE
   
   bool     feeding;                // True if used for feeding
   string   short_terminal_company; // DFM abbreviation (id) for TERMINAL_COMPANY
   string   terminal_symbol;        // symbol
   int      period;                 // period

//--- feeding variable part ---/

   int      handle;                 // feeding history file handle (INVALID_HANDLE if activity_flag is DFM_SERVER_PROC_ITEM_NOT_ACTIVE)
   
   int      proc_state;             // history descriptor processing state
   
   int      headers_no;             // number of headers in history file (0 or 1)
   ulong    records_no;             // number of records (bars) in history file (0 or more)
   
   MqlRates h_record[2];            // two last history records (in reverse order like bar series)
   
   int      synch_recno;            // expected number of next synch record number (start value is 0)
   
   string   h_file_name;            // name of file associated with descriptor
   int      reactivation_flag;      // request to restore activity_flag to DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE and truncate history file

//--- processing variable part ---/

   int      proc_fhandle;           // processing history file handle (INVALID_HANDLE if activity_flag is DFM_SERVER_PROC_ITEM_NOT_ACTIVE)
   ulong    last_feeding_record_no; // number of last feeding record used for processing history file generation (starts from 0)
   MqlRates last_feeding_rate_record;  // last read feeding record (needed for REGULAR Proc PROCESS)

//--- chart variable part ---/
   
   string   phf_symbol;             // name of generated symbol associated with descriptor
   
   string   phf_resp_label_name;    // name of label used by CALLING EXPERT as response container
   string   phf_resp_signal;        // CALLING EXPERT response SIGNAL
   
   string   chart_template;         // chart template name (from GD)
   int      chart_state;            // history descriptor Chart processing state
   long     chart_id;               // terminal chart id
   int      chart_win_handle;       // chart window handle

//--- chart errors and counters part ---/
   
   int      chart_open_err_no;            // number of open chart operations error number
   int      chart_w_handle_err_no;        // number of getting window handle operations error number
   int      chart_refresh_err_no;         // number of refresh window handle operations error number
   
   int      chart_phf_resp_label_counter; // number of wait cycles for PHF Response Label

};

DFM_Server_History_Descriptor_struct    DFM_Server_Processing_History_Descriptor[DFM_SERVER_MAX_PROC_DESCRIPTORS];
DFM_Server_History_Descriptor_struct    DFM_Server_Testing_History_Descriptor[DFM_SERVER_MAX_PROC_DESCRIPTORS];

//--- phf_resp_label_counter ---/

int         phf_resp_label_counter;       // Part of indicating Label Names

//----------------------- DFM Server Client's received rates pair ---------/

MqlRates    dfm_client_rcvd_rates[2];

//----------------------- DFM Server History File Header Struct -----------/

struct h_file_header_struct
{
   int      file_version;
   string   c_copyright;
   string   c_symbol;
   int      i_period;
   int      i_digits;
   int      i_unused[13];
};

//----------------------- DFM Server Communication Statistics -------------/

struct DFM_Server_Comm_Stat_struct
{
   int      rcv_message_no;         // Total successful received messages
   int      rcv_error_no;           // Total received error messages
   int      reactivation_no;        // Total MSB reactivation number
   int      last_message_datetime;  // Date & Time of the last Client Request
};

DFM_Server_Comm_Stat_struct      DFM_Server_Comm_Stat;

//======================= EOF mbs_dfm_server_header.mql ====================/