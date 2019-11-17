//======================= mbs_dfm_global_dictionary_header.mqh =============/

#define     DFM_GLOBAL_DICTIONARY_SIZE          8

#define     DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE  "NOP_TEMPLATE"

struct dfm_global_dictionary_structure
{
   string      terminal_company;                // TERMINAL_COMPANY
   string      short_terminal_company;          // DFM abbreviation (id) for TERMINAL_COMPANY
   long        account_login;                   // terminal account number (-1 - used any account, 0 - no account for tester, not valid for real)
   string      terminal_symbol;                 // symbol
   int         period;                          // period (for server)
   string      server_endpoint;                 // server mbs tcp endpoint

   string      server_name;                     // name of dfm server name (DFM System)
   string      template_name;                   // name of terminal template name to use on server ("" means do not process on server)
};

dfm_global_dictionary_structure     dfm_global_dictionary[DFM_GLOBAL_DICTIONARY_SIZE];

//======================= EOF mbs_dfm_global_dictionary_header.mqh =========/