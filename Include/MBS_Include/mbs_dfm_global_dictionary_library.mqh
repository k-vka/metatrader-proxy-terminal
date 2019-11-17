//======================= mbs_dfm_global_dictionary_library.mqh ============/

//================================== Init_DFM_Global_Dictionary ============/

void     Init_DFM_Global_Dictionary()
{
int      i;

//----------------------- Reset Dictionary ---------------------------------/

   for (i = 0; i < DFM_GLOBAL_DICTIONARY_SIZE; i++)
   {
      dfm_global_dictionary[i].terminal_company       = "";
      dfm_global_dictionary[i].short_terminal_company = "";
      dfm_global_dictionary[i].account_login          = 0;
      dfm_global_dictionary[i].terminal_symbol        = "";
      dfm_global_dictionary[i].period                 = 0;         
      dfm_global_dictionary[i].server_endpoint        = "";
      
      dfm_global_dictionary[i].server_name            = "";
      dfm_global_dictionary[i].template_name          = "";       // no template means DO NOT PROCESS ON SERVER
   }

//----------------------- Fill Dictionary ---------------------------------/

//--- Dictionary Entry 0 (DF on Client, SG on Server) ---/

   i = 0;

   dfm_global_dictionary[i].terminal_company       = "Alpari Limited";
   dfm_global_dictionary[i].short_terminal_company = "A1";
   dfm_global_dictionary[i].account_login          = -1;
   dfm_global_dictionary[i].terminal_symbol        = DFM_TERMINAL_SYMBOL;
   dfm_global_dictionary[i].period                 = PERIOD_M1;         
   dfm_global_dictionary[i].server_endpoint        = DFM_SERVER_01_ADDRESS;
   
   dfm_global_dictionary[i].server_name            = DFM_SERVER_01_NAME;
   dfm_global_dictionary[i].template_name          = "";          // no process

//--- Dictionary Entry 1 (SG on Server) ---/

   i = i + 1;

   dfm_global_dictionary[i].terminal_company       = "Alpari Limited";
   dfm_global_dictionary[i].short_terminal_company = "A1";
   dfm_global_dictionary[i].account_login          = -1;
   dfm_global_dictionary[i].terminal_symbol        = DFM_TERMINAL_SYMBOL;
   dfm_global_dictionary[i].period                 = PERIOD_M5;
   dfm_global_dictionary[i].server_endpoint        = DFM_SERVER_01_ADDRESS;
   
   dfm_global_dictionary[i].server_name            = DFM_SERVER_01_NAME;
   dfm_global_dictionary[i].template_name          = "tma_m5_standard";

//--- Dictionary Entry 2 (SG on Server) ---/
/*
   i = i + 1;

   dfm_global_dictionary[i].terminal_company       = "Alpari Limited";
   dfm_global_dictionary[i].short_terminal_company = "A1";
   dfm_global_dictionary[i].account_login          = -1;
   dfm_global_dictionary[i].terminal_symbol        = DFM_TERMINAL_SYMBOL;
   dfm_global_dictionary[i].period                 = PERIOD_M15;
   dfm_global_dictionary[i].server_endpoint        = DFM_SERVER_01_ADDRESS;
   
   dfm_global_dictionary[i].server_name            = DFM_SERVER_01_NAME;
   dfm_global_dictionary[i].template_name          = DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE;
*/
//--- Dictionary Entry 3 (SG on Server) ---/
/*
   i = i + 1;

   dfm_global_dictionary[i].terminal_company       = "Alpari Limited";
   dfm_global_dictionary[i].short_terminal_company = "A1";
   dfm_global_dictionary[i].account_login          = -1;
   dfm_global_dictionary[i].terminal_symbol        = DFM_TERMINAL_SYMBOL;
   dfm_global_dictionary[i].period                 = PERIOD_M30;
   dfm_global_dictionary[i].server_endpoint        = DFM_SERVER_01_ADDRESS;
   
   dfm_global_dictionary[i].server_name            = DFM_SERVER_01_NAME;
   dfm_global_dictionary[i].template_name          = DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE;
*/
//--- Dictionary Entry 4 (SG on Server) ---/
/*
   i = i + 1;

   dfm_global_dictionary[i].terminal_company       = "Alpari Limited";
   dfm_global_dictionary[i].short_terminal_company = "A1";
   dfm_global_dictionary[i].account_login          = -1;
   dfm_global_dictionary[i].terminal_symbol        = DFM_TERMINAL_SYMBOL;
   dfm_global_dictionary[i].period                 = PERIOD_H1;
   dfm_global_dictionary[i].server_endpoint        = DFM_SERVER_01_ADDRESS;
   
   dfm_global_dictionary[i].server_name            = DFM_SERVER_01_NAME;
   dfm_global_dictionary[i].template_name          = DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE;
*/
//--- Dictionary Entry 5 (SG on Server) ---/
/*
   i = i + 1;

   dfm_global_dictionary[i].terminal_company       = "Alpari Limited";
   dfm_global_dictionary[i].short_terminal_company = "A1";
   dfm_global_dictionary[i].account_login          = -1;
   dfm_global_dictionary[i].terminal_symbol        = DFM_TERMINAL_SYMBOL;
   dfm_global_dictionary[i].period                 = PERIOD_M1;
   dfm_global_dictionary[i].server_endpoint        = DFM_SERVER_01_ADDRESS;
   
   dfm_global_dictionary[i].server_name            = DFM_SERVER_01_NAME;
   dfm_global_dictionary[i].template_name          = "tma_m1_standard";
*/
//------------------------------------------------------------------------/

   return;
}

//======================== Get_DFM_Client_Company_Dictionary_ID ==========/

int     Get_DFM_Client_Company_Dictionary_ID()
{
int      i;
int      dictionary_id;

   dictionary_id = -1;

   for (i = 0; i < DFM_GLOBAL_DICTIONARY_SIZE; i++)
   {
      if (
            (dfm_global_dictionary[i].terminal_company == TerminalInfoString(TERMINAL_COMPANY)) &&
            (dfm_global_dictionary[i].terminal_symbol  == Symbol()) &&
            (dfm_global_dictionary[i].period           == PERIOD_M1)
         )
      {
//--- Check for exact account ---/

         if (
               (dfm_global_dictionary[i].account_login > 0) &&
               (dfm_global_dictionary[i].account_login == AccountInfoInteger(ACCOUNT_LOGIN))
            )
         {
            dictionary_id = i;
            break;
         }

//--- Check for any account ---/
         
         if (
               (dfm_global_dictionary[i].account_login == -1)
            )
         {
            dictionary_id = i;
            break;
         }
      }
   }

//------------------------------------------------------------------------/

   return(dictionary_id);
}


//======================= EOF mbs_dfm_global_dictionary_library.mqh ========/