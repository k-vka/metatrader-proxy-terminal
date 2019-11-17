//=== mbs_dfm_server_library.mqh =========================================/

//================================== Init_DFM_Server_Configuration ========/

int     Init_DFM_Server_Configuration()
{
int   r_code;

//-------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//--- phf_resp_label_counter ---/
   
   phf_resp_label_counter = 1;      // Part of indicating Label Names

//--- dfm_server_req_proc_context ---/
   
   DFM_Server_Config.dfm_server_req_proc_context.test_context           = "";
   DFM_Server_Config.dfm_server_req_proc_context.short_terminal_company = "";
   DFM_Server_Config.dfm_server_req_proc_context.terminal_symbol        = "";

//-------------------------- Reset History Descriptors --------------------/

   DFM_Server_Reset_History_Descriptors(DFM_Server_Processing_History_Descriptor);
   DFM_Server_Reset_History_Descriptors(DFM_Server_Testing_History_Descriptor);

//-------------------------- Init_DFM_Server_Processing_Items (Processing) /

   DFM_Server_Config.processing_items_no = Init_DFM_Server_Processing_Items(DFM_Server_Processing_Item, DFM_Server_Processing_History_Descriptor);

   if (DFM_Server_Config.processing_items_no <= 0)
   {
      r_code = 1;

      Print("Init_DFM_Server_Processing_Items() ERROR: " + IntegerToString(DFM_Server_Config.processing_items_no,0,'0'));
      return(r_code);
   }

//-------------------------- Init_DFM_Server_Processing_Items (Testing) ---/

   DFM_Server_Config.testing_items_no = Init_DFM_Server_Processing_Items(DFM_Server_Testing_Item, DFM_Server_Testing_History_Descriptor);

   if (DFM_Server_Config.testing_items_no <= 0)
   {
      r_code = 2;

      Print("Init_DFM_Server_Processing_Items() ERROR: " + IntegerToString(DFM_Server_Config.testing_items_no,0,'0'));
      return(r_code);
   }

//-------------------------- Set DFM Server Endpoint ----------------------/

   dfm_server_endpoint = DFM_SERVER_ENDPOINT;

//-------------------------- Set dfm_client_rates_lock_flag ---------------/
   
   DFM_Server_Config.dfm_client_rates_lock_flag = DFM_SERVER_CLIENT_RATES_BUFFER_NOT_LOCKED;

//-------------------------------------------------------------------------/

   return(r_code);
}

//================================ DFM_Server_Reset_History_Descriptors ===/

void     DFM_Server_Reset_History_Descriptors(DFM_Server_History_Descriptor_struct &History_Descriptor[])
{
int      i;

//----------------------- Reset History Descriptors -----------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      History_Descriptor[i].activity_flag          = DFM_SERVER_PROC_ITEM_NOT_ACTIVE;
      History_Descriptor[i].handle                 = INVALID_HANDLE;
      History_Descriptor[i].feeding                = False;
      History_Descriptor[i].short_terminal_company = "";
      History_Descriptor[i].terminal_symbol        = "";
      History_Descriptor[i].period                 = 0;
      
      History_Descriptor[i].proc_state             = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
      
      History_Descriptor[i].headers_no             = 0;
      History_Descriptor[i].records_no             = 0;
      
      History_Descriptor[i].h_file_name            = "";
      History_Descriptor[i].reactivation_flag      = 0;
      
      History_Descriptor[i].proc_fhandle           = INVALID_HANDLE;
      History_Descriptor[i].last_feeding_record_no = -1;
      
      History_Descriptor[i].phf_symbol             = "";
      History_Descriptor[i].phf_resp_label_name    = "";
      History_Descriptor[i].phf_resp_signal        = "";
      
      History_Descriptor[i].chart_template         = "";
      History_Descriptor[i].chart_state            = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
      History_Descriptor[i].chart_id               = 0;
      History_Descriptor[i].chart_win_handle       = 0;
      
      History_Descriptor[i].chart_open_err_no      = 0;
      History_Descriptor[i].chart_w_handle_err_no  = 0;
      History_Descriptor[i].chart_refresh_err_no   = 0;
      
      History_Descriptor[i].chart_phf_resp_label_counter = 0;
   }

//-------------------------------------------------------------------------/

   return;
}

//================================== Init_DFM_Server_Processing_Items =====/

int     Init_DFM_Server_Processing_Items(DFM_Server_Processing_Item_struct &Processing_Item[], DFM_Server_History_Descriptor_struct &History_Descriptor[])
{
int   i;
int   active_items;     // number of active items

//----------------------- Reset Processing Items List ---------------------/

   active_items = 0;

   for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
   {
      Processing_Item[i].activity_flag = DFM_SERVER_PROC_ITEM_NOT_ACTIVE;
   }

//----------------------- Initiate Processing Items List ------------------/

   for (i = 0; i < DFM_GLOBAL_DICTIONARY_SIZE; i++)
   {
      if (
            (dfm_global_dictionary[i].server_name     == DFM_SERVER_NAME) &&
            (dfm_global_dictionary[i].server_endpoint == DFM_SERVER_ENDPOINT) &&
            (StringLen(dfm_global_dictionary[i].template_name) > 0)
         )
      {
         Processing_Item[active_items].gd_id = i;
         
         Processing_Item[active_items].feeding_history_descriptor_id    = DFM_Server_Get_Feeding_H_Descriptor(i, History_Descriptor);
         Processing_Item[active_items].processing_history_descriptor_id = DFM_Server_Get_Processing_H_Descriptor(i, History_Descriptor);
         
         if (
               (Processing_Item[active_items].feeding_history_descriptor_id    == -1) ||
               (Processing_Item[active_items].processing_history_descriptor_id == -1)
            )
         {
            Print("DFM_Server_Get____H_Descriptor() ERROR: " + IntegerToString(Processing_Item[active_items].feeding_history_descriptor_id,0,'0') + "/" +
                                                               IntegerToString(Processing_Item[active_items].processing_history_descriptor_id,0,'0'));
            continue;
         }

         Processing_Item[active_items].activity_flag = DFM_SERVER_PROC_ITEM_ACTIVE;
         
         if (active_items >= DFM_SERVER_MAX_PROC_ITEMS)
         {
            break;
         }
         
         active_items = active_items + 1;
      }
   }

//-------------------------------------------------------------------------/

   return(active_items);
}

//================================== DFM_Server_Get_Feeding_H_Descriptor ==/

int     DFM_Server_Get_Feeding_H_Descriptor(int gd_id, DFM_Server_History_Descriptor_struct &H_Descriptor[])
{
int   descriptor_id;
int   i;

//----------------------- Reset descriptor_id -----------------------------/

   descriptor_id = -1;

//----------------------- Search Existing Descriptor ----------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (
            (H_Descriptor[i].activity_flag          == DFM_SERVER_PROC_ITEM_ACTIVE) &&
            (H_Descriptor[i].feeding                == True) &&
            (H_Descriptor[i].short_terminal_company == dfm_global_dictionary[gd_id].short_terminal_company) &&
            (H_Descriptor[i].terminal_symbol        == dfm_global_dictionary[gd_id].terminal_symbol) &&
            (H_Descriptor[i].period                 == PERIOD_M1)
         )
      {
         descriptor_id = i;
         return(descriptor_id);
      }
   }

//----------------------- Search First Empty Descriptor -------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (
            (H_Descriptor[i].activity_flag == DFM_SERVER_PROC_ITEM_NOT_ACTIVE)
         )
      {
         H_Descriptor[i].activity_flag          = DFM_SERVER_PROC_ITEM_ACTIVE;
         H_Descriptor[i].feeding                = True;
         H_Descriptor[i].short_terminal_company = dfm_global_dictionary[gd_id].short_terminal_company;
         H_Descriptor[i].terminal_symbol        = dfm_global_dictionary[gd_id].terminal_symbol;
         H_Descriptor[i].period                 = PERIOD_M1;

         H_Descriptor[i].chart_template         = dfm_global_dictionary[gd_id].template_name;

         descriptor_id = i;
         return(descriptor_id);
      }
   }

//-------------------------------------------------------------------------/

   return(descriptor_id);
}

//=============================== DFM_Server_Get_Processing_H_Descriptor ==/

int     DFM_Server_Get_Processing_H_Descriptor(int gd_id, DFM_Server_History_Descriptor_struct &H_Descriptor[])
{
int   descriptor_id;
int   i;

//----------------------- Reset descriptor_id -----------------------------/

   descriptor_id = -1;

//----------------------- Search Existing Descriptor ----------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (
            (H_Descriptor[i].activity_flag          == DFM_SERVER_PROC_ITEM_ACTIVE) &&
            (H_Descriptor[i].feeding                == False) &&
            (H_Descriptor[i].short_terminal_company == dfm_global_dictionary[gd_id].short_terminal_company) &&
            (H_Descriptor[i].terminal_symbol        == dfm_global_dictionary[gd_id].terminal_symbol) &&
            (H_Descriptor[i].period                 == dfm_global_dictionary[gd_id].period)
         )
      {
         descriptor_id = i;
         return(descriptor_id);
      }
   }

//----------------------- Search First Empty Descriptor -------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (
            (H_Descriptor[i].activity_flag == DFM_SERVER_PROC_ITEM_NOT_ACTIVE)
         )
      {
         H_Descriptor[i].activity_flag          = DFM_SERVER_PROC_ITEM_ACTIVE;
         H_Descriptor[i].feeding                = False;
         H_Descriptor[i].short_terminal_company = dfm_global_dictionary[gd_id].short_terminal_company;
         H_Descriptor[i].terminal_symbol        = dfm_global_dictionary[gd_id].terminal_symbol;
         H_Descriptor[i].period                 = dfm_global_dictionary[gd_id].period;

         H_Descriptor[i].chart_template         = dfm_global_dictionary[gd_id].template_name;
         
         H_Descriptor[i].phf_resp_label_name    = "DFMS_EXPERT_RESP_LNAME_" + IntegerToString(phf_resp_label_counter,0);
         phf_resp_label_counter = phf_resp_label_counter + 1;

         descriptor_id = i;
         return(descriptor_id);
      }
   }

//-------------------------------------------------------------------------/

   return(descriptor_id);
}

//================================== Process_DFM_Client_Request() ========/

int     Process_DFM_Client_Request()
{
int      r_code;
int      deinit_code;

uchar    req_msg_counter;

string   phf_r_signal;

   phf_r_signal = "";

//------------------- Receive dfm_rcv_buffer, dfm_rcv_buffer_len ---------/

   r_code = Rcv_DFM_Request();
   
   if (r_code != 0)
   {
      if (r_code != 21)          // EAGAIN
      {
         Print("Rcv_DFM_Request() ERROR: " + IntegerToString(r_code,0,' '));
      }
      
      return(r_code);
   }

//------------------------- Unload Rcv Buffer ----------------------------/

   r_code = Unload_MSB_Buffer(dfm_rcv_data, dfm_rcv_buffer, dfm_rcv_buffer_len, MSB_MAX_MESSAGE_SIZE, req_msg_counter);
   
//   Print("RCVD_COUNTER: " + IntegerToString(req_msg_counter,0,'0'));
   
   if (r_code != 0)
   {
      Print("(Process) DFM Unload_MSB_Buffer() ERROR: " + IntegerToString(r_code,0,' '));
   }

//-------------------------- DFM_Server_Process_Client_Request -----------/

//   Print("BFLN: " + IntegerToString(dfm_rcv_buffer_len,0,'0'));
//   Print("RCVD: " + dfm_rcv_data);

   r_code = DFM_Server_Process_Client_Request(dfm_rcv_data, dfm_snd_data);
   
//   Print("SND: " + dfm_snd_data);
   
   if (r_code != 0)
   {
      Print("DFM_Server_Process_Client_Request() ERROR: " + IntegerToString(r_code,0,' '));
//      return(r_code);
   }

//------------------------- Concatenate phf_resp_signal ------------------/

   phf_r_signal = DFM_Server_Get_PHF_r_signal();
   
   if (
         (StringLen(phf_r_signal) > 0)
      )
   {

      if ((StringLen(dfm_snd_data) + StringLen(phf_r_signal)) > 254)
      {
         Print("PHF_RESP_SIGNAL Length Error: l(dfm_snd_data)=" + IntegerToString(StringLen(dfm_snd_data),0) + 
                                           " ,l(phf_r_signal)=" + IntegerToString(StringLen(phf_r_signal),0));
      }
      else
      {
         dfm_snd_data = dfm_snd_data + phf_r_signal + DFM_MSG_DELIMETER;
      }
   }

//------------------------- Load Send Buffer -----------------------------/

   r_code = Load_MSB_Buffer(dfm_snd_data, dfm_send_buffer, MSB_MAX_MESSAGE_SIZE, req_msg_counter);
   
   if (r_code != 0)
   {
      Print("DFM Load_MSB_Buffer() ERROR: " + IntegerToString(r_code,0,' '));
      return(r_code);
   }
   
   dfm_send_buffer_len = StringLen(dfm_snd_data) + 2;

//------------------------- Send Response to Client ----------------------/

   r_code = Send_DFM_Response();
   
   if (r_code != 0)
   {
      Print("Send_DFM_Response() ERROR: " + IntegerToString(r_code,0,' '));
      
      deinit_code = Deinit_DFM_Message_Server();

      if (deinit_code != 0)
      {
         Print("(Proc) Deinit_DFM_Message_Server() ERROR: " + IntegerToString(deinit_code,0,' ')); 
      }
      
      return(r_code);
   }
   
//------------------------------------------------------------------------/

   return(r_code);
}

//========================== DFM_Server_Process_Client_Request ===========/

int     DFM_Server_Process_Client_Request(string rcv_message, string &rsp_message)
{
int      r_code;

ushort   submessage_sep;
string   submessage[];
int      submessage_number;

ushort   field_sep;
string   message_field[];
int      field_number;

int      client_req_type;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Get SubMessages ------------------------------/

   submessage_sep = StringGetCharacter(DFM_MSG_DELIMETER,0);

   submessage_number = StringSplit(rcv_message,submessage_sep,submessage);
   
//------------------------- Check if Rcv Message is Empty (no header) ----/

   if (submessage_number == 0)
   {
      rsp_message = IntegerToString(DFM_S_RESPONSE_EMPTY_REQ_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return(r_code);
   }

//------------------------- Process Req Header ---------------------------/

   field_sep = StringGetCharacter(DFM_FLD_DELIMETER,0);

   field_number = StringSplit(submessage[0],field_sep,message_field);
   
   if (field_number == 0)
   {
      rsp_message = IntegerToString(DFM_S_RESPONSE_EMPTY_REQ_HEADER_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return(r_code);
   }
   
   client_req_type = StringToInteger(message_field[0]);
   
//------------------------- Analyze Client Req Type ----------------------/

   if (client_req_type == DFM_C_REQUEST_LBT_TYPE)
   {
      DFM_Server_Process_LBT_Req(message_field, field_number, submessage, submessage_number, rsp_message);
      
//      Print("SND: " + rsp_message);
      
      return(r_code);
   }
   
   if (client_req_type == DFM_C_REQUEST_SYNCH_BT_TYPE)
   {
      DFM_Server_Process_Synch_Req(message_field, field_number, submessage, submessage_number, rsp_message);
      return(r_code);
   }

//------------------------- Process Unknown Client Req Type --------------/

   rsp_message = IntegerToString(DFM_S_RESPONSE_UNKNOWN_REQ_TYPE,0,'0') + DFM_MSG_DELIMETER;
   return(r_code);

//------------------------------------------------------------------------/

   return(r_code);
}

//=== eof mbs_dfm_server_library.mqh =====================================/

