//=== mbs_dfm_client_library.mqh ==========================================/

//================================== Init_DFM_Client_Configuration ========/

int     Init_DFM_Client_Configuration()
{
int   r_code;

int   i;

   r_code = 0;

//-------------------------- Get DFM Client gd_id -------------------------/

   i = Get_DFM_Client_Company_Dictionary_ID();
   
   if (i == -1)
   {
      r_code = 1;

      Print("Get_DFM_Company_Dictionary_ID() ERROR: " + IntegerToString(r_code,1,' '));
      return(r_code);
   }

   dfm_client_config.gd_id = i;
   dfm_server_endpoint     = dfm_global_dictionary[dfm_client_config.gd_id].server_endpoint;

//-------------------------- Get test_context -----------------------------/

   if (IsTesting())
   {
      dfm_client_config.test_context = "Y";
   }
   else
   {
      dfm_client_config.test_context = "N";
   }

//-------------------------------------------------------------------------/

   return(r_code);
}

//========================= DFM_Client_Reset_Statistics ==================/

void     DFM_Client_Reset_Statistics()
{
//-------------------------- Reset Communication Statistics --------------/


//-------------------------- Reset Message Process Statistics ------------/

   dfm_client_message_stat.lbt_attemts      = 0;
   dfm_client_message_stat.lbt_errors       = 0;
   
   dfm_client_message_stat.synch_bt_attemts = 0;
   dfm_client_message_stat.synch_bt_errors  = 0;
   
//------------------------------------------------------------------------/

   return;
}

//================================== Init_DFM_Context =====================/

void     Init_DFM_Context()
{

   ArraySetAsSeries(dfm_client_rates,true);

   dfm_client_context = DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT;

//------------------------------------------------------------------------/

   return;
}

//================================== Data_Feeding_Client_Process =========/

int     Data_Feeding_Client_Process()
{
int   r_code;

//-------------------------- Reset r_code --------------------------------/

   r_code = 0;

//------------------------ Process DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT --/
   
   if (dfm_client_context == DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT)
   {
      dfm_client_message_stat.lbt_attemts = dfm_client_message_stat.lbt_attemts + 1;
      
      r_code = DFM_Client_Last_Bar_Trn_Process();
      
      if (r_code != 0)
      {
         dfm_client_message_stat.lbt_errors = dfm_client_message_stat.lbt_errors + 1;
      
         Print("DFM_Client_Last_Bar_Trn_Process() ERROR: " + IntegerToString(r_code,1,' '));
         return(r_code);
      }
   }

//------------------------ Process DFM_CLIENT_SYNCH_BAR_TRANSFER_CONTEXT -/
   
   if (dfm_client_context == DFM_CLIENT_SYNCH_BAR_TRANSFER_CONTEXT)
   {
      dfm_client_message_stat.synch_bt_attemts = dfm_client_message_stat.synch_bt_attemts + 1;
      
      Print("DFM_Client_Synch_Bar_Trn_Process() Start: " + TimeToStr(TimeLocal(),TIME_DATE|TIME_SECONDS));
      
      r_code = DFM_Client_Synch_Bar_Trn_Process();
      
      Print("DFM_Client_Synch_Bar_Trn_Process() End: " + TimeToStr(TimeLocal(),TIME_DATE|TIME_SECONDS));

//--- Return DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT ---/
      
      dfm_client_context = DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT;

      if (r_code != 0)
      {
         dfm_client_message_stat.synch_bt_errors = dfm_client_message_stat.synch_bt_errors + 1;
         
         Print("DFM_Client_Synch_Bar_Trn_Process() ERROR: " + IntegerToString(r_code,1,' '));
         return(r_code);
      }
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//================================== DFM_Client_Last_Bar_Trn_Process =====/

int     DFM_Client_Last_Bar_Trn_Process()
{
int   r_code;
int   i;

int   bars_copied;

//-------------------------- Reset r_code --------------------------------/

   r_code = 0;

//-------------------------- Get Two last M1 bars ------------------------/

   if (dfm_client_config.test_context == "Y")
   {
      for (i = 0; i < 2; i++)
      {
         DFM_Client_Fill_Rate(dfm_client_rates,i);
      }

      bars_copied = 2;

   }
   else
   {
      bars_copied = CopyRates(Symbol(),PERIOD_M1,0,2,dfm_client_rates);
   }

   if (bars_copied != 2)
   {
      r_code = 1;
      
      Print("DFM_Client_Last_Bar_Trn_Process() ERROR: " + IntegerToString(r_code,0) + " , bars_copied=" + IntegerToString(bars_copied,0));
      return(r_code);
   }

//-------------------------- Transfer Two last M1 bars to Server ---------/

   r_code = DFM_Client_Transfer_Last_Bar();
   
   if (r_code != 0)
   {
      Print("DFM_Client_Last_Bar_Trn_Process() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//================================== DFM_Client_Synch_Bar_Trn_Process ====/

int     DFM_Client_Synch_Bar_Trn_Process()
{
int   i;

int   r_code;

int   rates_start_position;
int   rates_count;
int   server_last_bar_no;

int   bars_available;
int   bars_copied;

hf_synch_rates_descriptor_structure    hf_synch_rates_descriptor;

//-------------------------- Reset r_code --------------------------------/

   r_code = 0;

//-------------------------- Calculate CopyRates parameters --------------/

   RefreshRates();

   bars_copied = CopyRates(Symbol(),PERIOD_M1,0,1,dfm_client_rates);

   if (bars_copied != 1)
   {
      r_code = 1;
      
      Print("DFM_Client_Synch_Bar_Trn_Process() ERROR: get last rate - " + IntegerToString(r_code,0,'0'));
      return(r_code);
   }

//--- full desynch (empty server history) ---/

   Print("DFM_Client_Synch_Bar_Trn_Process() rsp_history_recno=" + IntegerToString(dfm_client_config.rsp_history_recno,0,'0') +
                                                  ", time=" + TimeToString(dfm_client_config.rsp_mql_rate.time,TIME_DATE|TIME_SECONDS));

   if (dfm_client_config.rsp_history_recno == 0)
   {
      rates_start_position = 0;
      rates_count          = DFM_CLIENT_MIN_HISTORY;
   }
   else
   {
//--- full desynch (usual for retest) ---/

      if (dfm_client_rates[0].time < dfm_client_config.rsp_mql_rate.time)
      {
         rates_start_position = 0;
         rates_count          = DFM_CLIENT_MIN_HISTORY;
      }

//--- incremental desynch (usual for missed bars) ---/

      if (dfm_client_rates[0].time >= dfm_client_config.rsp_mql_rate.time)
      {
//         Print("DFM_Client_Synch_Bar_Trn_Process() dfm_client_rates[0].time=" + TimeToString(dfm_client_rates[0].time,TIME_DATE|TIME_SECONDS) +
//                                                  ", dfm_client_config.rsp_mql_rate.time=" + TimeToString(dfm_client_config.rsp_mql_rate.time,TIME_DATE|TIME_SECONDS));
      
         server_last_bar_no = iBarShift(Symbol(),PERIOD_M1,dfm_client_config.rsp_mql_rate.time,true);
      
         if (server_last_bar_no == -1)
         {
            r_code = 2;
      
            Print("DFM_Client_Synch_Bar_Trn_Process() ERROR: iBarShift get server last bar no - dfm_client_config.rsp_mql_rate.time=" + 
                                                                                       TimeToString(dfm_client_config.rsp_mql_rate.time,TIME_DATE|TIME_SECONDS));
            return(r_code);
         }
      
         if ((dfm_client_config.rsp_history_recno + server_last_bar_no) >= DFM_CLIENT_MIN_HISTORY)
         {
            rates_start_position = 0;
            rates_count          = server_last_bar_no + 1;
         }
         else
         {
            rates_start_position = 0;
            rates_count          = DFM_CLIENT_MIN_HISTORY;
         }
      }
   
   }
   
//-------------------------- PreProcess synch last M1 bars ----------------/

   if (dfm_client_config.test_context == "Y")
   {
//--- Client in Test Context ---/

      bars_available = DFM_Client_Get_HF_Synch_Rates_Available(Symbol(),PERIOD_M1,iTime(Symbol(),PERIOD_M1,0),rates_count,hf_synch_rates_descriptor);
      
      if (bars_available != rates_count)
      {
         r_code = 3;
      
         Print("DFM_Client_Get_HF_Synch_Rates_Available() ERROR: bars_available=" + IntegerToString(bars_available,0,'0') + " from " + IntegerToString(rates_count,0,'0') + ") - " + IntegerToString(r_code,0,'0'));
         return(r_code);
      }
   }
   else
   {
//--- Client in Live Context ---/

      bars_available = CopyRates(Symbol(),PERIOD_M1,(rates_start_position + rates_count - 1),1,dfm_client_rates);
   
      if (bars_available != 1)
      {
         r_code = 3;
      
         Print("DFM_Client_Synch_Bar_Trn_Process() ERROR: check CopyRates (bars_available=" + IntegerToString(bars_available,0,'0'));
         return(r_code);
      }
   }

//-------------------------- Transfer synch M1 bars to Server ------------/

   for (i = 0; i < rates_count; i++)
   {
      if (dfm_client_config.test_context == "Y")
      {
//--- Client in Test Context ---/
      
         bars_copied = DFM_Get_Next_HFile_Record(hf_synch_rates_descriptor,dfm_client_rates);
      
         if (bars_copied != 1)
         {
            r_code = 4;
            
            FileClose(hf_synch_rates_descriptor.hf_handle);
      
            Print("DFM_Client_Synch_Bar_Trn_Process() ERROR: get DFM_Get_Next_HFile_Record (" + IntegerToString(bars_copied,0,'0'));
            return(r_code);
         }
      }
      else
      {
//--- Client in Live Context ---/

         bars_copied = CopyRates(Symbol(),PERIOD_M1,(rates_start_position + rates_count - 1 - i),1,dfm_client_rates);
   
         if (bars_copied != 1)
         {
            r_code = 4;
      
            Print("DFM_Client_Synch_Bar_Trn_Process() ERROR: get CopyRates (" + IntegerToString(bars_copied,0,'0'));
            return(r_code);
         }
      }

//--- Transfer synch M1 bar to Server ---/

      r_code = DFM_Client_Transfer_Synch_Bar(i,rates_count);
   
      if (r_code != 0)
      {
         if (dfm_client_config.test_context == "Y")
         {
            FileClose(hf_synch_rates_descriptor.hf_handle);
         }
      
         Print("DFM_Client_Transfer_Synch_Bar() ERROR: (" + IntegerToString(i,0,'0') + ") - " + IntegerToString(r_code,0,'0'));
         return(r_code);
      }
   
   }
   
   if (dfm_client_config.test_context == "Y")
   {
      FileClose(hf_synch_rates_descriptor.hf_handle);
   }
   
   Print("DFM_Client_Transfer_Synch_Bar() transferred bars: " + IntegerToString(rates_count,0,'0'));

//------------------------------------------------------------------------/

   return(r_code);
}

//========================== DFM_Client_Transfer_Synch_Bar ===============/

int     DFM_Client_Transfer_Synch_Bar(int rate_recno, int rates_total)
{
int      r_code;

string   message_body;
string   message_header;

string   response_message;

//-------------------------- Reset r_code --------------------------------/

   r_code = 0;

//-------------------------- Get Message Body ----------------------------/

   message_body = DFM_Get_Rate_String(dfm_client_rates[0]) + DFM_MSG_DELIMETER;

//-------------------------- Get Message Header --------------------------/

   message_header =  IntegerToString(DFM_C_REQUEST_SYNCH_BT_TYPE,0,'0')                    + DFM_FLD_DELIMETER +
                     dfm_global_dictionary[dfm_client_config.gd_id].short_terminal_company + DFM_FLD_DELIMETER +
                     dfm_global_dictionary[dfm_client_config.gd_id].terminal_symbol        + DFM_FLD_DELIMETER +
                     IntegerToString(Digits(),0,'0')                                       + DFM_FLD_DELIMETER +
     IntegerToString(dfm_global_dictionary[dfm_client_config.gd_id].account_login,0,'0')   + DFM_FLD_DELIMETER +
                     dfm_client_config.test_context                                        + DFM_FLD_DELIMETER +
                     
                     IntegerToString(rate_recno,0,'0')                                     + DFM_FLD_DELIMETER +
                     IntegerToString(rates_total,0,'0') + DFM_MSG_DELIMETER
                     ;

//-------------------------- Get Full Message (Header;Rate0;Rate1) -------/

   message_body = message_header + message_body;

//-------------------------- Transfer_DFM_Client_Request -----------------/

   r_code = Transfer_DFM_Client_Request(message_body);
   
   if (r_code != 0)
   {
      Print("(Synch) Transfer_DFM_Client_Request() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }

//-------------------------- PostProcess_DFM_Client_Request --------------/

   r_code = PostProcess_DFM_Client_Synch_Request(dfm_rcv_data,rate_recno,rates_total);
   
   if (r_code != 0)
   {
      Print("(Synch) PostProcess_DFM_Client_Synch_Request() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//========================== DFM_Client_Transfer_Last_Bar ================/

int     DFM_Client_Transfer_Last_Bar()
{
int      r_code;

string   message_body;
string   message_header;

string   response_message;

//-------------------------- Reset r_code --------------------------------/

   r_code = 0;

//-------------------------- Get Message Body ----------------------------/

   message_body = DFM_Get_Rate_String(dfm_client_rates[0]) + DFM_MSG_DELIMETER +
                  DFM_Get_Rate_String(dfm_client_rates[1]) + DFM_MSG_DELIMETER
                  ;
                  
//   Print("Req message_body=" + message_body);

//-------------------------- Get Message Header --------------------------/

   message_header =  IntegerToString(DFM_C_REQUEST_LBT_TYPE,0,'0')                         + DFM_FLD_DELIMETER +
                     dfm_global_dictionary[dfm_client_config.gd_id].short_terminal_company + DFM_FLD_DELIMETER +
                     dfm_global_dictionary[dfm_client_config.gd_id].terminal_symbol        + DFM_FLD_DELIMETER +
                     IntegerToString(Digits(),0,'0')                                       + DFM_FLD_DELIMETER +
     IntegerToString(dfm_global_dictionary[dfm_client_config.gd_id].account_login,0,'0')   + DFM_FLD_DELIMETER +
                     dfm_client_config.test_context + DFM_MSG_DELIMETER
                     ;

//-------------------------- Get Full Message (Header;Rate0;Rate1) -------/

   message_body = message_header + message_body;

//-------------------------- Transfer_DFM_Client_Request -----------------/

   r_code = Transfer_DFM_Client_Request(message_body);
   
   if (r_code != 0)
   {
      Print("(DFM_Client_Transfer_Last_Bar) Transfer_DFM_Client_Request() ERROR: " + IntegerToString(r_code,0));
      return(r_code);
   }

//-------------------------- PostProcess_DFM_Client_Request --------------/

   r_code = PostProcess_DFM_Client_Request(dfm_rcv_data);
   
   if (r_code != 0)
   {
      Print("(DFM_Client_Transfer_Last_Bar) PostProcess_DFM_Client_Request() ERROR: " + IntegerToString(r_code,0));
      return(r_code);
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//========================== Transfer_DFM_Client_Request =================/

int     Transfer_DFM_Client_Request(string src_message)
{
int      r_code;

uchar    resp_msg_counter;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Load Send Buffer -----------------------------/

   r_code = Load_MSB_Buffer(src_message, dfm_send_buffer, MSB_MAX_MESSAGE_SIZE, dfm_msg_counter);
   
//   Print("TRN_COUNTER: " + IntegerToString(dfm_msg_counter,0,'0'));
   
   if (r_code != 0)
   {
      Print("DFM Load_MSB_Buffer() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }
   
   dfm_send_buffer_len = StringLen(src_message) + 2;

//------------------------- Send Request to Server -----------------------/

   r_code = Send_DFM_Request();
   
   if (r_code != 0)
   {
      Print("Send_DFM_Request() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }
   
//------------------------- Increment dfm_msg_counter --------------------/
 
   dfm_msg_counter = dfm_msg_counter + 1;

//------------------------- Get Respopnse from Server --------------------/
   
   r_code = Rcv_DFM_Response();
   
   if (r_code != 0)
   {
      Print("Rcv_DFM_Response() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }

//------------------------- Unload Rcv Buffer ----------------------------/

   r_code = Unload_MSB_Buffer(dfm_rcv_data, dfm_rcv_buffer, dfm_rcv_buffer_len, MSB_MAX_MESSAGE_SIZE, resp_msg_counter);
   
//   Print("RSP_COUNTER: " + IntegerToString(resp_msg_counter,0,'0'));
   
   if (r_code != 0)
   {
      Print("DFM Unload_MSB_Buffer() ERROR: " + IntegerToString(r_code,0,' '));
   }

//------------------------- Check Resp Data Counter ----------------------/
   
   if (dfm_msg_counter != (uchar) (resp_msg_counter + 1))
   {
      r_code = 1;
      
      Print("(Transfer) DFM Unload_MSB_Buffer() Counter ERROR: dfm_msg_counter=" + IntegerToString(dfm_msg_counter,0,' ') + "resp_msg_counter+1=" + IntegerToString((resp_msg_counter+1),0,' '));
      return(r_code);
   }
//------------------------------------------------------------------------/

   return(r_code);
}



//========================== PostProcess_DFM_Client_Request ==============/

int     PostProcess_DFM_Client_Request(string rsp_message)
{
int      r_code;

ushort   submessage_sep;
string   submessage[];
int      submessage_number;

ushort   field_sep;
string   message_field[];
int      field_number;

int      server_resp_type;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Get SubMessages ------------------------------/

   submessage_sep = StringGetCharacter(DFM_MSG_DELIMETER,0);

   submessage_number = StringSplit(rsp_message,submessage_sep,submessage);

//------------------------- Process Resp Header --------------------------/

   field_sep = StringGetCharacter(DFM_FLD_DELIMETER,0);

   field_number = StringSplit(submessage[0],field_sep,message_field);
   
   if (field_number == 0)
   {
      r_code = 1;
      
      Print("PostProcess_DFM_Client_Request() ERROR: r_code=" + IntegerToString(r_code,0) + "field_number=" + IntegerToString(field_number,0));
      return(r_code);
   }
   
   server_resp_type = StringToInteger(message_field[0]);

//------------------------- Analyze Server Resp Type ---------------------/

//------------------------- DFM_C_RESPONSE_LBT_TYPE ----------------------/

   if (
         (dfm_client_context == DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT) &&
         (server_resp_type   == DFM_C_RESPONSE_LBT_TYPE)
      )
   {
      r_code = DFM_Client_Process_LBT_Resp(message_field, field_number, submessage, submessage_number);
      
      if (r_code != 0)
      {
         r_code = r_code + 200;
      }
      
      return(r_code);
   }

//------------------------- DFM_C_RESPONSE_LBT_TO_SYNCH_TYPE ------------/
   
   if (
         (dfm_client_context == DFM_CLIENT_LAST_BAR_TRANSFER_CONTEXT) &&
         (server_resp_type   == DFM_C_RESPONSE_LBT_TO_SYNCH_TYPE)
      )
   {
      r_code = DFM_Client_Process_LBT_To_Synch_Resp(message_field, field_number, submessage, submessage_number);
      
      if (r_code != 0)
      {
         r_code = r_code + 300;
      }
      
      return(r_code);
   }

//------------------------- Process Unknown Client Req Type --------------/

   r_code = server_resp_type;             // see Response Error Types
   
//------------------------------------------------------------------------/

   return(r_code);
}

//========================== PostProcess_DFM_Client_Synch_Request ========/

int     PostProcess_DFM_Client_Synch_Request(string rsp_message, int rate_recno, int rates_total)
{
int      r_code;

ushort   submessage_sep;
string   submessage[];
int      submessage_number;

ushort   field_sep;
string   message_field[];
int      field_number;

int      server_resp_type;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Get SubMessages ------------------------------/

   submessage_sep = StringGetCharacter(DFM_MSG_DELIMETER,0);

   submessage_number = StringSplit(rsp_message,submessage_sep,submessage);

//------------------------- Process Resp Header --------------------------/

   field_sep = StringGetCharacter(DFM_FLD_DELIMETER,0);

   field_number = StringSplit(submessage[0],field_sep,message_field);
   
   if (field_number == 0)
   {
      r_code = 1;
      
      Print("PostProcess_DFM_Client_Request() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }
   
   server_resp_type = StringToInteger(message_field[0]);

//------------------------- Analyze Server Resp Type ---------------------/

//------------------------- DFM_C_RESPONSE_LBT_TO_SYNCH_TYPE -------------/
   
   if (
         (dfm_client_context == DFM_CLIENT_SYNCH_BAR_TRANSFER_CONTEXT) &&
         (server_resp_type   == DFM_C_RESPONSE_SYNCH_BT_TYPE)
      )
   {
      r_code = DFM_Client_Process_Synch_Resp(message_field, field_number, submessage, submessage_number, rate_recno, rates_total);
      
      if (r_code != 0)
      {
         r_code = r_code + 400;
      }
      
      return(r_code);
   }

//------------------------- Process Unknown Client Req Type --------------/

   r_code = server_resp_type;             // see Response Error Types
   
//------------------------------------------------------------------------/

   return(r_code);
}

//========================== DFM_Client_Fill_Rate ========================/

void     DFM_Client_Fill_Rate(MqlRates &dfm_rates[], int i_shift)
{
   dfm_rates[i_shift].time        = iTime(Symbol(),  PERIOD_M1,i_shift);
   dfm_rates[i_shift].open        = iOpen(Symbol(),  PERIOD_M1,i_shift);
   dfm_rates[i_shift].high        = iHigh(Symbol(),  PERIOD_M1,i_shift);
   dfm_rates[i_shift].low         = iLow (Symbol(),  PERIOD_M1,i_shift);
   dfm_rates[i_shift].close       = iClose(Symbol(), PERIOD_M1,i_shift);
   dfm_rates[i_shift].tick_volume = iVolume(Symbol(),PERIOD_M1,i_shift);
         
   dfm_rates[i_shift].spread      = (int) (MarketInfo(Symbol(),MODE_SPREAD));
   dfm_rates[i_shift].real_volume = (long) 0;

//------------------------------------------------------------------------/

   return;
}
         
//======== eof mbs_dfm_client_library.mqh ================================/

