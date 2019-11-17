//=== mbs_dfm_server_resp_proc_client_library.mqh ========================/

//========================= DFM_Client_Process_LBT_Resp ==================/

int     DFM_Client_Process_LBT_Resp(string &header_field[],int header_field_number, string &submessage[], int submessage_number)
{
int         r_code;

MqlRates    rsp_mql_rate;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check if header_field_number = 5 -------------/

   if (header_field_number != 5)
   {
      r_code = 1;
      
      Print("DFM_Client_Process_LBT_Resp() ERROR: r_code=" + IntegerToString(r_code,0) + ", header_field_number=" + IntegerToString(header_field_number,0)); 
      return(r_code);
   }

//-------------------------- Process Message Header ----------------------/

   if (
         (header_field[1] != dfm_global_dictionary[dfm_client_config.gd_id].short_terminal_company) ||
         (header_field[2] != dfm_global_dictionary[dfm_client_config.gd_id].terminal_symbol) ||
         (header_field[3] != IntegerToString(Digits(),0,'0')) ||
         (header_field[4] != dfm_client_config.test_context)
      )
   {
      r_code = 2;
      
      Print("DFM_Client_Process_LBT_Resp() ERROR: r_code=" + IntegerToString(r_code,0)); 
      return(r_code);
   }

//---------------------- Process Message Body (MqlRates) -----------------/

//--- submessage_number ---/

   if (submessage_number < 3)
   {
      r_code = 3;
      
      Print("DFM_Client_Process_LBT_Resp() ERROR: r_code=" + IntegerToString(r_code,0) + ", submessage_number=" + IntegerToString(submessage_number,0)); 
      return(r_code);
   }

//--- submessage[1] ---/

   if (
         (DFM_Set_Rate(submessage[1], rsp_mql_rate) != 0) ||
         (DFM_Compare_Rate(dfm_client_rates[0], rsp_mql_rate) != 0)
      )
   {
      r_code = 4;
      
      Print("DFM_Client_Process_LBT_Resp() ERROR: incorrect response rate [0] r_code=" + IntegerToString(r_code,0)); 
      return(r_code);
   }

//--- submessage[2] ---/
   
   if (
         (DFM_Set_Rate(submessage[2], rsp_mql_rate) != 0) ||
         (DFM_Compare_Rate(dfm_client_rates[1], rsp_mql_rate) != 0)
      )
   {
      r_code = 5;
      
      Print("DFM_Client_Process_LBT_Resp() ERROR: incorrect response rate [1] r_code=" + IntegerToString(r_code,0));
      return(r_code);
   }

//-------------------------- Process Extra Message (Signal) --------------/

   if (submessage_number >= 4)
   {
      r_code = DFM_Client_Process_PHF_Trade_Signal(submessage[3]);
      
      if (r_code != 0)
      {
         r_code = r_code + 10;
         Print("(DFM_Client_Process_LBT_Resp) DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + ", submessage[3]=(" + submessage[3] + ")"); 
         
         r_code = 0;
      }
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//========================= DFM_Client_Process_LBT_To_Synch_Resp =========/

int     DFM_Client_Process_LBT_To_Synch_Resp(string &header_field[],int header_field_number, string &submessage[], int submessage_number)
{
int         r_code;

long        rsp_h_records_no;
MqlRates    rsp_mql_rate;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check if header_field_number = 2 -------------/

   if (header_field_number != 2)
   {
      Print("DFM_Client_Process_LBT_To_Synch_Resp() ERROR: wrong header fields number - " + IntegerToString(header_field_number,0,' ')); 
      
      r_code = 1;
      return(r_code);
   }

//-------------------------- Process Message Header ----------------------/

   rsp_h_records_no = StringToInteger(header_field[1]);

//-------------------------- Process Message Body (MqlRate) --------------/

   if (
         (DFM_Set_Rate(submessage[1], rsp_mql_rate) != 0)
      )
   {
      r_code = 2;
      
      Print("DFM_Client_Process_LBT_To_Synch_Resp() ERROR: incorrect response rate"); 
      return(r_code);
   }

//-------------------------- Set DFM_CLIENT_SYNCH_BAR_TRANSFER_CONTEXT ---/

   dfm_client_config.rsp_history_recno = rsp_h_records_no;
   DFM_Copy_MqlRate(rsp_mql_rate, dfm_client_config.rsp_mql_rate);
   
   dfm_client_context = DFM_CLIENT_SYNCH_BAR_TRANSFER_CONTEXT;

//------------------------------------------------------------------------/

   return(r_code);
}

//========================= DFM_Client_Process_Synch_Resp ================/

int     DFM_Client_Process_Synch_Resp(string &header_field[],int header_field_number, string &submessage[], int submessage_number, int rate_recno, int rates_total)
{
int         r_code;

MqlRates    rsp_mql_rate;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check if header_field_number = 7 -------------/

   if (header_field_number != 7)
   {
      Print("DFM_Client_Process_Synch_Resp() ERROR: wrong header fields number - " + IntegerToString(header_field_number,0,'0')); 
      
      r_code = 1;
      return(r_code);
   }

//-------------------------- Process Message Header ----------------------/

   if (
         (header_field[1] != dfm_global_dictionary[dfm_client_config.gd_id].short_terminal_company) ||
         (header_field[2] != dfm_global_dictionary[dfm_client_config.gd_id].terminal_symbol) ||
         (header_field[3] != IntegerToString(Digits(),0,'0')) ||
         (header_field[4] != dfm_client_config.test_context) ||
         
         (header_field[5] != IntegerToString((rate_recno),0,'0')) ||
         (header_field[6] != IntegerToString(rates_total,0,'0'))
      )
   {
      r_code = 2;
      
      Print("DFM_Client_Process_Synch_Resp() ERROR: wrong response header - " + IntegerToString(r_code,0,'0')); 
      return(r_code);
   }

//-------------------------- Process Message Body (MqlRates) -------------/

   if (
         (DFM_Set_Rate(submessage[1], rsp_mql_rate) != 0) ||
         (DFM_Compare_Rate(dfm_client_rates[0], rsp_mql_rate) != 0)
      )
   {
      r_code = 3;
      
      Print("DFM_Client_Process_Synch_Resp() ERROR: incorrect response rate (0)"); 
      return(r_code);
   }

//-------------------------- Process Extra Message (Signal) --------------/

//------------------------------------------------------------------------/

   return(r_code);
}

//=== eof mbs_dfm_server_resp_proc_client_library.mqh ====================/