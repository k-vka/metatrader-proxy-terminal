//=== mbs_dfm_client_req_proc_server_library.mqh =========================/

//================================== DFM_Server_Process_LBT_Req ==========/

void     DFM_Server_Process_LBT_Req(string &header_field[],int header_field_number, string &submessage[], int submessage_number, string &rsp_message)
{
int      i;
int      dfm_server_proc_item_id;
int      r_code;

int      symbol_digits;
string   test_context;

//------------------------- Reset dfm_server_proc_item_id ----------------/

   dfm_server_proc_item_id = -1;

//------------------------- Check if header_field_number = 6 -------------/

   if (header_field_number != 6)
   {
      Print("DFM_Server_Process_LBT_Req() ERROR: wrong header fields number - " + IntegerToString(header_field_number,0,' ')); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_WRONG_REQ_HDR_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

//------------------------- Get dfm_server_proc_item_id ------------------/

   symbol_digits = StringToInteger(header_field[3]);  // set digits value (used for history file creation)
   test_context  = header_field[5];                   // set test context

//--- dfm_server_req_proc_context ---/
   
   DFM_Server_Config.dfm_server_req_proc_context.test_context           = test_context;
   DFM_Server_Config.dfm_server_req_proc_context.short_terminal_company = header_field[1];
   DFM_Server_Config.dfm_server_req_proc_context.terminal_symbol        = header_field[2];
   
   if (test_context == "Y")
   
//--- test_context == "Y" ---/

   {
      for (i = 0; i < DFM_Server_Config.testing_items_no; i++)
      {
         if (
               (DFM_Server_Testing_Item[i].activity_flag == DFM_SERVER_PROC_ITEM_ACTIVE) &&
               (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].short_terminal_company == header_field[1]) &&
               (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].terminal_symbol == header_field[2]) &&
               (
                  (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].account_login == -1) ||
                  (
                     (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].account_login != -1) &&
                     (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].account_login == header_field[4])
                  )
               )
            )
         {
            dfm_server_proc_item_id = i;
            break;
         }
      }
   
      if (dfm_server_proc_item_id == -1)
      {
         Print("DFM_Server_Process_LBT_Req() ERROR: test item not found"); 
      
         rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_ITM_PROC_NF_TYPE,0,'0') + DFM_MSG_DELIMETER;
         return;
      }
   }
   else
   
//--- test_context != "Y" ---/

   {
      for (i = 0; i < DFM_Server_Config.processing_items_no; i++)
      {
         if (
               (DFM_Server_Processing_Item[i].activity_flag == DFM_SERVER_PROC_ITEM_ACTIVE) &&
               (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].short_terminal_company == header_field[1]) &&
               (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].terminal_symbol == header_field[2]) &&
               (
                  (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].account_login == -1) ||
                  (
                     (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].account_login != -1) &&
                     (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].account_login == header_field[4])
                  )
               )
            )
         {
            dfm_server_proc_item_id = i;
            break;
         }
      }
   
      if (dfm_server_proc_item_id == -1)
      {
         Print("DFM_Server_Process_LBT_Req() ERROR: proc item not found"); 
      
         rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_ITM_PROC_NF_TYPE,0,'0') + DFM_MSG_DELIMETER;
         return;
      }
   }

//------------------------- Get dfm_client_rates -------------------------/

   if (submessage_number < 3)
   {
      Print("DFM_Server_Process_LBT_Req() ERROR: no rates"); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_NO_RATES_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

   if (
         (DFM_Set_Rate(submessage[1], dfm_client_rcvd_rates[0]) != 0) ||
         (DFM_Set_Rate(submessage[2], dfm_client_rcvd_rates[1]) != 0)
      )
   {
      Print("DFM_Server_Process_LBT_Req() ERROR: incorrect rates"); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_WRONG_RATES_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

//------------------------- DFM_Server_Update_LBT_Feeding_History --------/

   if (test_context == "Y")
   {
      r_code = DFM_Server_Update_LBT_Feeding_History(
                                             DFM_Server_Testing_Item[dfm_server_proc_item_id],
                                             DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             symbol_digits,
                                             test_context
                                                    );
   }
   else
   {
      r_code = DFM_Server_Update_LBT_Feeding_History(
                                             DFM_Server_Processing_Item[dfm_server_proc_item_id],
                                             DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             symbol_digits,
                                             test_context
                                                    );
   }

//----------------- Process return code of Update LBT Feeding History ----/
   
   if (r_code != 0)
   {
      Print("DFM_Server_Update_LBT_History() ERROR: " + IntegerToString(r_code,0,' ') + "Params: " + IntegerToString(r_code,0,' ') + " - " + test_context);
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_NO_HST_UPD_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

//---------- Generate rsp_message based on Update LBT Feeding History ----/
   
   if (test_context == "Y")
   {
      rsp_message = DFM_Server_Get_LBT_Feeding_History_Resp(
                                             DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             symbol_digits,
                                             test_context
                                                           );
   }
   else
   {
      rsp_message = DFM_Server_Get_LBT_Feeding_History_Resp(
                                             DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             symbol_digits,
                                             test_context
                                                           );
   }
   
//   Print("SND: " + rsp_message);

//------------------------- DFM_Server_Update_LBT_Processing_History -----/

   if (test_context == "Y")
   {
      r_code = DFM_Server_Update_LBT_Processing_History(
                                             DFM_Server_Testing_Item,
                                             DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id,
                                             DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             test_context
                                                       );
   }
   else
   {
      r_code = DFM_Server_Update_LBT_Processing_History(
                                             DFM_Server_Processing_Item,
                                             DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id,
                                             DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             test_context
                                                       );
   }


//------------------------------------------------------------------------/

   return;
}

//========================= DFM_Server_Process_Synch_Req =================/

void     DFM_Server_Process_Synch_Req(string &header_field[],int header_field_number, string &submessage[], int submessage_number, string &rsp_message)
{
int      i;
int      dfm_server_proc_item_id;
int      r_code;

int      symbol_digits;
string   test_context;

int      rcv_rate_recno;
int      rcv_rates_total;

//------------------------- Reset dfm_server_proc_item_id ----------------/

   dfm_server_proc_item_id = -1;

//------------------------- Check if header_field_number = 8 -------------/

   if (header_field_number != 8)
   {
      Print("DFM_Server_Process_Synch_Req() ERROR: wrong header fields number - " + IntegerToString(header_field_number,0,'0')); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_WRONG_REQ_HDR_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

//------------------------- Get dfm_server_proc_item_id ------------------/

   symbol_digits = StringToInteger(header_field[3]);  // set digits value (used for history file creation)
   test_context  = header_field[5];                   // set test context
   
   rcv_rate_recno  = StringToInteger(header_field[6]);
   rcv_rates_total = StringToInteger(header_field[7]);
   
   if (
         (rcv_rate_recno > rcv_rates_total) ||
         (rcv_rates_total > DFM_CLIENT_MIN_HISTORY)
      )
   {
      Print("DFM_Server_Process_Synch_Req() ERROR: wrong rcv rate item - recno=" + IntegerToString(rcv_rate_recno,0,'0') +
                                                                        "total=" + IntegerToString(rcv_rates_total,0,'0')); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_WRONG_REQ_HDR_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }
   
   if (test_context == "Y")
   
//--- test_context == "Y" ---/

   {
      for (i = 0; i < DFM_Server_Config.testing_items_no; i++)
      {
         if (
               (DFM_Server_Testing_Item[i].activity_flag == DFM_SERVER_PROC_ITEM_ACTIVE) &&
               (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].short_terminal_company == header_field[1]) &&
               (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].terminal_symbol == header_field[2]) &&
               (
                  (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].account_login == -1) ||
                  (
                     (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].account_login != -1) &&
                     (dfm_global_dictionary[DFM_Server_Testing_Item[i].gd_id].account_login == header_field[4])
                  )
               )
            )
         {
            dfm_server_proc_item_id = i;
            break;
         }
      }
   
      if (dfm_server_proc_item_id == -1)
      {
         Print("DFM_Server_Process_Synch_Req() ERROR: test item not found"); 
      
         rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_ITM_PROC_NF_TYPE,0,'0') + DFM_MSG_DELIMETER;
         return;
      }
   }
   else
   
//--- test_context != "Y" ---/

   {
      for (i = 0; i < DFM_Server_Config.processing_items_no; i++)
      {
         if (
               (DFM_Server_Processing_Item[i].activity_flag == DFM_SERVER_PROC_ITEM_ACTIVE) &&
               (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].short_terminal_company == header_field[1]) &&
               (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].terminal_symbol == header_field[2]) &&
               (
                  (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].account_login == -1) ||
                  (
                     (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].account_login != -1) &&
                     (dfm_global_dictionary[DFM_Server_Processing_Item[i].gd_id].account_login == header_field[4])
                  )
               )
            )
         {
            dfm_server_proc_item_id = i;
            break;
         }
      }
   
      if (dfm_server_proc_item_id == -1)
      {
         Print("DFM_Server_Process_Synch_Req() ERROR: proc item not found"); 
      
         rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_ITM_PROC_NF_TYPE,0,'0') + DFM_MSG_DELIMETER;
         return;
      }
   }

//------------------------- Get dfm_client_rcvd_rates ---------------------/

   if (submessage_number < 2)
   {
      Print("DFM_Server_Process_Synch_Req() ERROR: no rate"); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_NO_RATES_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

   if (
         (DFM_Set_Rate(submessage[1], dfm_client_rcvd_rates[0]) != 0)
      )
   {
      Print("DFM_Server_Process_Synch_Req() ERROR: incorrect rate"); 
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_WRONG_RATES_TYPE,0,'0') + DFM_MSG_DELIMETER;
      return;
   }

//------------------------- DFM_Server_Update_Synch_Feeding_History -------/

   if (test_context == "Y")
   {
      r_code = DFM_Server_Update_Synch_Feeding_History(
                                             DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             rcv_rate_recno,
                                             rcv_rates_total
                                                    );
      
      if (DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id].reactivation_flag == 1)
      {
         DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id].proc_state = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
      }
   }
   else
   {
      r_code = DFM_Server_Update_Synch_Feeding_History(
                                             DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             rcv_rate_recno,
                                             rcv_rates_total
                                                    );
      
      if (DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id].reactivation_flag == 1)
      {
         DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id].proc_state = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
      }
   }

//----------------- Process return code of Update Synch Feeding History ---/
   
   if (r_code != 0)
   {
      Print("DFM_Server_Update_Synch_Feeding_History() ERROR: " + IntegerToString(r_code,0,' ') + "Params: " + IntegerToString(r_code,0,' ') + " - " + test_context);
      
      rsp_message = IntegerToString(DFM_S_RESPONSE_REQ_NO_HST_UPD_TYPE,0,'0') + DFM_MSG_DELIMETER;      
      return;
   }

//---------- Generate rsp_message based on Update Synch Feeding History ---/
   
   if (test_context == "Y")
   {
      rsp_message = DFM_Server_Get_Synch_Feeding_History_Resp(
                                             DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             symbol_digits,
                                             test_context,
                                             rcv_rate_recno,
                                             rcv_rates_total
                                                           );
   }
   else
   {
      rsp_message = DFM_Server_Get_Synch_Feeding_History_Resp(
                                             DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             symbol_digits,
                                             test_context,
                                             rcv_rate_recno,
                                             rcv_rates_total
                                                           );
   }

//-------------- DFM_Server_Update_LBT_Processing_History (Not Synch)-----/

   if (test_context == "Y")
   {
      r_code = DFM_Server_Update_LBT_Processing_History(
                                             DFM_Server_Testing_Item,
                                             DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id,
                                             DFM_Server_Testing_History_Descriptor[DFM_Server_Testing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             test_context
                                                       );
   }
   else
   {
      r_code = DFM_Server_Update_LBT_Processing_History(
                                             DFM_Server_Processing_Item,
                                             DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id,
                                             DFM_Server_Processing_History_Descriptor[DFM_Server_Processing_Item[dfm_server_proc_item_id].feeding_history_descriptor_id],
                                             test_context
                                                       );
   }

//------------------------------------------------------------------------/

   return;
}

//========================== DFM_Server_Update_LBT_Feeding_History =======/

int     DFM_Server_Update_LBT_Feeding_History(DFM_Server_Processing_Item_struct    &dfm_s_proc_item, 
                                              DFM_Server_History_Descriptor_struct &feeding_history_descriptor,
                                              int                                  s_digits,
                                              string                               tester_context)
{
int      r_code;

//string   feeding_h_file_name;
//string   processing_h_file_name;

h_file_statistics_struct      h_file_statistics;
h_file_header_struct          h_file_header;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Process Feeding Descriptor -------------------/

//------------------------- DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE -----------/

   if (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE)
   {
//--- Set feeding_h_file_name ---/

      feeding_history_descriptor.h_file_name = feeding_history_descriptor.short_terminal_company + "_" +
                                               feeding_history_descriptor.terminal_symbol + 
                                               IntegerToString(feeding_history_descriptor.period,0,'0') + 
                                               ".hst";
      
      if (tester_context == "Y")
      {
         feeding_history_descriptor.h_file_name = "FT" + feeding_history_descriptor.h_file_name;
      }
      else
      {
         feeding_history_descriptor.h_file_name = "F_" + feeding_history_descriptor.h_file_name;
      }

//--- Check Reactivation Flag and Truncate feeding_h_file_name ---/
      
      if (feeding_history_descriptor.reactivation_flag == 1)
      {
         DFM_Server_Reactivate_Associate_Proc_Descr(dfm_s_proc_item,tester_context);
         
         feeding_history_descriptor.reactivation_flag = 0;
         
         Print("DFM_Server_Update_LBT_Feeding_History() Truncate/ReCreate History File: filesize=" + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));
            
//--- Close feeding_h_file_name ---/

         FileClose(feeding_history_descriptor.handle);
         
         feeding_history_descriptor.handle = -1;

//--- ReCreate feeding_h_file_name ---/

         feeding_history_descriptor.handle = FileOpenHistory(feeding_history_descriptor.h_file_name,FILE_BIN|FILE_WRITE|FILE_SHARE_WRITE|FILE_SHARE_READ|FILE_ANSI);
   
         if (feeding_history_descriptor.handle < 0)
         {
            r_code = 11;
      
            Print("FileOpenHistory() Truncate/ReCreate ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + feeding_history_descriptor.h_file_name);
            return(r_code);
         }
            
         Print("DFM_Server_Update_LBT_Feeding_History() Truncate/ReCreate History File done: filesize=" + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));
            
         FileClose(feeding_history_descriptor.handle);
         
         feeding_history_descriptor.handle = -1;
      }
   
//--- Open feeding_h_file_name ---/

      feeding_history_descriptor.handle = FileOpenHistory(feeding_history_descriptor.h_file_name,FILE_BIN|FILE_READ|FILE_WRITE|FILE_SHARE_WRITE|FILE_SHARE_READ|FILE_ANSI);
   
      if (feeding_history_descriptor.handle < 0)
      {
         r_code = 1;
      
         Print("FileOpenHistory() ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + feeding_history_descriptor.h_file_name);
         return(r_code);
      }

//--- Get History File Statistics ---/

      h_file_statistics = DFM_Get_H_File_Statistics(feeding_history_descriptor.handle);
      
      feeding_history_descriptor.headers_no = h_file_statistics.headers_no;
      feeding_history_descriptor.records_no = h_file_statistics.records_no;
      
      Print("DFM_Get_H_File_Statistics() headers_no=" + IntegerToString(h_file_statistics.headers_no,0,'0') + 
                                        ", records_no=" + IntegerToString(h_file_statistics.records_no,0,'0') + 
                                        ", filesize=" + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));

//------------------------- Create History File Header -------------------/

      if (feeding_history_descriptor.headers_no == 0)
      {
         FileSeek(feeding_history_descriptor.handle,0,SEEK_SET);
         
//--- Define History File Header ---/
         
         h_file_header.file_version = 401;
         h_file_header.c_copyright = "(C)opyright 2014, DFM Corp.";
         
         h_file_header.c_symbol = feeding_history_descriptor.short_terminal_company + "_" +
                                  feeding_history_descriptor.terminal_symbol;
      
         if (tester_context == "Y")
         {
            h_file_header.c_symbol = "FT" + h_file_header.c_symbol;
         }
         else
         {
            h_file_header.c_symbol = "F_" + h_file_header.c_symbol;
         }
         
         h_file_header.i_period = feeding_history_descriptor.period;
         h_file_header.i_digits = s_digits;
         
         ArrayInitialize(h_file_header.i_unused,0);

//--- Write History File Header ---/

         FileWriteInteger(feeding_history_descriptor.handle,h_file_header.file_version,LONG_VALUE);
         FileWriteString (feeding_history_descriptor.handle,h_file_header.c_copyright,64);
         FileWriteString (feeding_history_descriptor.handle,h_file_header.c_symbol,12);
         FileWriteInteger(feeding_history_descriptor.handle,h_file_header.i_period,LONG_VALUE);
         FileWriteInteger(feeding_history_descriptor.handle,h_file_header.i_digits,LONG_VALUE);
         FileWriteInteger(feeding_history_descriptor.handle,0,LONG_VALUE);
         FileWriteInteger(feeding_history_descriptor.handle,0,LONG_VALUE);
         FileWriteArray  (feeding_history_descriptor.handle,h_file_header.i_unused,0,13);
         
         FileFlush(feeding_history_descriptor.handle);
         
//         Print("FileOpenHistory() FileSize=" + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0') + ", fname=" + feeding_h_file_name);
//         Print("FileOpenHistory() RecSizeSize=" + IntegerToString(sizeof(MqlRates),0,'0'));
         
         feeding_history_descriptor.headers_no = 1;
      }

//------------------------- Get Two Last History Records -----------------/

      DFM_Server_Get_Last_HFile_Records(feeding_history_descriptor, feeding_history_descriptor.handle);

//------------------------- Set feeding_history_descriptor.proc_state ----/
      
      feeding_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE;
   
   }  // EOF DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE

//------------------------- DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE ------------/

   if (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE)
   {
//--- Normal Feeding Processing ---/

      if (feeding_history_descriptor.records_no >= DFM_CLIENT_MIN_HISTORY)
      {
         r_code = DFM_Server_Update_H_File_Records(feeding_history_descriptor);
         
         if (r_code == 1)                       // --- DESYNCHRONIZATION ---
         {
            feeding_history_descriptor.synch_recno = 0;
            feeding_history_descriptor.proc_state  = DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH;
            
            r_code = 0;
         }
         
         return(r_code);
      }
      
//--- Feeding History is too short ---/
      
      if (feeding_history_descriptor.records_no < DFM_CLIENT_MIN_HISTORY)
      {
         feeding_history_descriptor.synch_recno = 0;
         feeding_history_descriptor.proc_state  = DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH;
         return(r_code);
      }
   
   }  // EOF DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE
   
//------------------------- ANY OTHER Descriptor State -------------------/

   r_code = 2;
      
   Print("DFM_Server_Update_LBT_Feeding_History() ERROR: incorrect descriptor state" + IntegerToString(r_code,0,'0') + 
         ", state=" + IntegerToString(feeding_history_descriptor.proc_state,0,'0'));
         
   feeding_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE;
         
   return(r_code);

//------------------------------------------------------------------------/

   return(r_code);
}

//======================== DFM_Server_Update_Synch_Feeding_History =======/

int     DFM_Server_Update_Synch_Feeding_History(DFM_Server_History_Descriptor_struct &feeding_history_descriptor,
                                                int rate_recno,
                                                int rate_total)
{
int      r_code;
//int      truncate_code;

//int      i;
ulong    i_ulong;

MqlRates h_file_rate_record;

long     synch_start_record;
h_file_statistics_struct   h_file_stat;

long     truncate_offset;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;
   
   synch_start_record = -1;

//------------------------- DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH ----------/

   if (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH)
   {
//------------------------- Check rate_recno -----------------------------/

      if (feeding_history_descriptor.synch_recno != rate_recno)
      {
         r_code = 1;
      
         Print("DFM_Server_Update_Synch_Feeding_History() ERROR: incorrect rate_recno=" + IntegerToString(rate_recno,0,'0') + 
               ", synch_recno=" + IntegerToString(feeding_history_descriptor.synch_recno,0,'0'));
         return(r_code);
      }

//------------------------- Check/Set dfm_client_rates lock flag ---------/
/*
      if (rate_recno == 0)
      {
         if (DFM_Server_Config.dfm_client_rates_lock_flag == DFM_SERVER_CLIENT_RATES_BUFFER_NOT_LOCKED)
         {
            DFM_Server_Config.dfm_client_rates_lock_flag = DFM_SERVER_CLIENT_RATES_BUFFER_LOCKED;
         }
         else
         {
            r_code = 2;
      
            Print("DFM_Server_Update_Synch_Feeding_History() ERROR: dfm_client_rates is LOCKED");
            return(r_code);
         }
      }
      
      if (DFM_Server_Config.dfm_client_rates_lock_flag == DFM_SERVER_CLIENT_RATES_BUFFER_NOT_LOCKED)
      {
         r_code = 21;
      
         Print("DFM_Server_Update_Synch_Feeding_History() ERROR: dfm_client_rates is UNLOCKED");
         return(r_code);
      }
*/

//------------------------- Check if First (0) Rate Received -------------/

      if (feeding_history_descriptor.synch_recno == 0)
      {
      
      Print("DFM_Server_Update_Synch_Feeding_History() synch params: start rec time=" + TimeToString(dfm_client_rcvd_rates[0].time,TIME_DATE|TIME_MINUTES) + 
                                                                           ", total=" + IntegerToString(rate_total,0,'0'));
      
//--- Set history file pointer to first Synch rate record number ---/

         FileSeek(feeding_history_descriptor.handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE,SEEK_SET);
         
         for (i_ulong = 0; i_ulong < feeding_history_descriptor.records_no; i_ulong++)
         {
            FileReadStruct(feeding_history_descriptor.handle,h_file_rate_record);
            
            if (h_file_rate_record.time >= dfm_client_rcvd_rates[0].time)
            {
               synch_start_record = i_ulong;
               break;
            }
         }
         
         if (synch_start_record == (long) (-1))
         {
            synch_start_record = 0;
         }
         
         FileSeek(feeding_history_descriptor.handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + (synch_start_record * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);

//----------------------- Truncate history file ---------------------------/

         truncate_offset = DFM_SERVER_HISTORY_FILE_HEADER_SIZE + ((synch_start_record + (long) rate_total) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE);
         
         if (truncate_offset < (long) FileSize(feeding_history_descriptor.handle))
         {
            Print("DFM_Server_Update_Synch_Feeding_History() Truncation: filesize=" + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0') +
                                                                 "truncate_offset=" + IntegerToString(FileSize(truncate_offset),0,'0'));
/*
            Print("DFM_Server_Update_Synch_Feeding_History() filesize before truncation: " + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));
            
//--- Close feeding_h_file_name ---/

            FileClose(feeding_history_descriptor.handle);

//--- Create feeding_h_file_name ---/

            feeding_history_descriptor.handle = FileOpenHistory(feeding_history_descriptor.h_file_name,FILE_BIN|FILE_WRITE|FILE_SHARE_WRITE|FILE_SHARE_READ|FILE_ANSI);
   
            if (feeding_history_descriptor.handle < 0)
            {
               r_code = 4;
      
               Print("FileOpenHistory() Trucate/Create ERROR: " + IntegerToString(r_code,0,'0') + ", fname=" + feeding_history_descriptor.h_file_name);
               return(r_code);
            }
            
            Print("DFM_Server_Update_Synch_Feeding_History() filesize after truncation: " + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));
            
            FileClose(feeding_history_descriptor.handle);
            
            feeding_history_descriptor.handle = INVALID_HANDLE;

//--- Set History File activity_flag ---/
*/
            feeding_history_descriptor.reactivation_flag = 1;

            r_code = 5;
            return(r_code);
            
/*
            Print("DFM_Server_Update_Synch_Feeding_History() filesize before truncation: " + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));

            truncate_code = DFM_Truncate_File(feeding_history_descriptor.handle, truncate_offset);
                                                                              
            Print("DFM_Server_Update_Synch_Feeding_History() filesize after truncation: " + IntegerToString(FileSize(feeding_history_descriptor.handle),0,'0'));
         
            if (truncate_code == 0)
            {
               r_code = 3;
      
               Print("(Synch) DFM_Truncate_File() ERROR: truncate history file, truncate_code=", IntegerToString(truncate_code,0,'0'));
               return(r_code);
            }
*/
         }
      
      }

//------------------------- Write Next Client Rate -----------------------/
      
      FileWriteStruct(feeding_history_descriptor.handle,dfm_client_rcvd_rates[0]);
      
      feeding_history_descriptor.synch_recno = feeding_history_descriptor.synch_recno + 1;
      
//------------------------- Check if Last Rate Received ------------------/

      if (feeding_history_descriptor.synch_recno == rate_total)
      {

//--- Flush History File ---/
         
         FileFlush(feeding_history_descriptor.handle);

//--- Update history file records_no ---/
         
         h_file_stat = DFM_Get_H_File_Statistics(feeding_history_descriptor.handle);

         feeding_history_descriptor.records_no = h_file_stat.records_no;

//--- Update two last history file records ---/
         
         DFM_Server_Get_Last_HFile_Records(feeding_history_descriptor, feeding_history_descriptor.handle);
         
//------------------------- Set DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE --------/
         
//         DFM_Server_Config.dfm_client_rates_lock_flag = DFM_SERVER_CLIENT_RATES_BUFFER_NOT_LOCKED;
         
         feeding_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE;

      }
      
      return(r_code);

   }  // EOF DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH
   
//------------------------- ANY OTHER Descriptor State -------------------/

   r_code = 4;
      
   Print("DFM_Server_Update_Synch_Feeding_History() ERROR: incorrect descriptor state" + IntegerToString(r_code,0,'0') + 
         ", state=" + IntegerToString(feeding_history_descriptor.proc_state,0,'0'));
   
   feeding_history_descriptor.proc_state = DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE;
         
   return(r_code);

//------------------------------------------------------------------------/

   return(r_code);
}

//========================== DFM_Server_Get_LBT_Feeding_History_Resp =====/

string     DFM_Server_Get_LBT_Feeding_History_Resp(DFM_Server_History_Descriptor_struct &feeding_history_descriptor, int s_digits, string tester_context)
{
string      r_string;
string      message_body;
string      message_header;

   r_string = "";

//------------------------- DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE ------------/

   if (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE)
   {
//-------------------------- Get Message Body ----------------------------/

   message_body = DFM_Get_Rate_String(dfm_client_rcvd_rates[0]) + DFM_MSG_DELIMETER +
                  DFM_Get_Rate_String(dfm_client_rcvd_rates[1]) + DFM_MSG_DELIMETER
                  ;
   
//   Print("Resp message_body=" + message_body);

//-------------------------- Get Message Header --------------------------/

   message_header =  IntegerToString(DFM_C_RESPONSE_LBT_TYPE,0,'0')    + DFM_FLD_DELIMETER +
                     feeding_history_descriptor.short_terminal_company + DFM_FLD_DELIMETER +
                     feeding_history_descriptor.terminal_symbol        + DFM_FLD_DELIMETER +
                     IntegerToString(s_digits,0,'0')                   + DFM_FLD_DELIMETER +
//     IntegerToString(dfm_global_dictionary[dfm_client_config.gd_id].account_login,0,'0')   + DFM_FLD_DELIMETER +
                     tester_context                                    + DFM_MSG_DELIMETER
                     ;

//-------------------------- Get Full Message (Header;Rate0;Rate1) -------/

   r_string = message_header + message_body;
   
   return(r_string);
   
   }  // EOF DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE

//------------------------- DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH ----------/

   if (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH)
   {
      Print("DFM_Server_Get_LBT_Feeding_History_Resp() records_no=" + IntegerToString(feeding_history_descriptor.records_no,0,'0') +
                                                  ", time=" + TimeToString(feeding_history_descriptor.h_record[0].time,TIME_DATE|TIME_SECONDS));
   
      message_body = DFM_Get_Rate_String(feeding_history_descriptor.h_record[0]) + DFM_MSG_DELIMETER;
         
      message_header = IntegerToString(DFM_C_RESPONSE_LBT_TO_SYNCH_TYPE,0,'0')      + DFM_FLD_DELIMETER +
                       IntegerToString(feeding_history_descriptor.records_no,0,'0') + DFM_MSG_DELIMETER
                       ;

//-------------------------- Get Full Message ----------------------------/

   r_string = message_header + message_body;
                       
   }  // EOF DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH

//------------------------------------------------------------------------/

   return(r_string);
}

//========================= DFM_Server_Get_Synch_Feeding_History_Resp ====/

string     DFM_Server_Get_Synch_Feeding_History_Resp(DFM_Server_History_Descriptor_struct &feeding_history_descriptor, 
                                                     int s_digits, string tester_context, int rate_recno, int rates_total)
{
string      r_string;
string      message_body;
string      message_header;

   r_string = "";

//------------------------- DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH ----------/
//------------------------- DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE ------------/

   if (
         (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH) ||
         (feeding_history_descriptor.proc_state == DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE)
      )
   {
//-------------------------- Get Message Body ----------------------------/

   message_body = DFM_Get_Rate_String(dfm_client_rcvd_rates[0]) + DFM_MSG_DELIMETER;

//-------------------------- Get Message Header --------------------------/

   message_header =  IntegerToString(DFM_C_RESPONSE_SYNCH_BT_TYPE,0,'0') + DFM_FLD_DELIMETER +
                     feeding_history_descriptor.short_terminal_company   + DFM_FLD_DELIMETER +
                     feeding_history_descriptor.terminal_symbol          + DFM_FLD_DELIMETER +
                     IntegerToString(s_digits,0,'0')                     + DFM_FLD_DELIMETER +
//     IntegerToString(dfm_global_dictionary[dfm_client_config.gd_id].account_login,0,'0')   + DFM_FLD_DELIMETER +
                     tester_context                                      + DFM_FLD_DELIMETER +
                     
                     IntegerToString(rate_recno,0,'0')                   + DFM_FLD_DELIMETER +
                     IntegerToString(rates_total,0,'0')                  + DFM_MSG_DELIMETER
                     ;

//-------------------------- Get Full Message (Header;Rate0;Rate1) -------/

   r_string = message_header + message_body;
   
   return(r_string);
   
   }  // EOF DFM_SERVER_H_DESCRIPTOR_UNDER_SYNCH or DFM_SERVER_H_DESCRIPTOR_IS_ACTIVE

//------------------------------------------------------------------------/

   return(r_string);
}

//================================== DFM_Server_Update_H_File_Records ====/

int     DFM_Server_Update_H_File_Records(DFM_Server_History_Descriptor_struct &h_descriptor)
{
int      r_code;

//------------------------- Reset r_code --------------------------------/

   r_code = 0;

//------------------------- Check if Bar 0 is updated -------------------/

   if (
         (dfm_client_rcvd_rates[1].time == h_descriptor.h_record[1].time)
      )
   {
//      DFM_Copy_MqlRate(dfm_client_rcvd_rates[0], h_descriptor.h_record[0]);
      
      DFM_Server_Modify_Proc_Record(h_descriptor.h_record[0], dfm_client_rcvd_rates[0]);
      
      FileSeek(h_descriptor.handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                    ((h_descriptor.records_no - 1) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
      
      FileWriteStruct(h_descriptor.handle,h_descriptor.h_record[0]);
      
      FileFlush(h_descriptor.handle);
      
      return(r_code);
   }

//------------------------- Check if Bar 0 is added ----------------------/

   if (
         (dfm_client_rcvd_rates[1].time == h_descriptor.h_record[0].time)
      )
   {
      DFM_Copy_MqlRate(dfm_client_rcvd_rates[0], h_descriptor.h_record[0]);
      DFM_Copy_MqlRate(dfm_client_rcvd_rates[1], h_descriptor.h_record[1]);
      
      FileSeek(h_descriptor.handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                    ((h_descriptor.records_no - 1) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
      
      FileWriteStruct(h_descriptor.handle,h_descriptor.h_record[1]);
      FileWriteStruct(h_descriptor.handle,h_descriptor.h_record[0]);
      
      FileFlush(h_descriptor.handle);
      
      h_descriptor.records_no = h_descriptor.records_no + 1;
      
      return(r_code);
   }

//------------------------- Feeding is DeSynchronized --------------------/

   r_code = 1;

//------------------------------------------------------------------------/

   return(r_code);
}

//================================== DFM_Truncate_File ===================/

int     DFM_Truncate_File(int file_handle, long file_offset)
{
int      r_code;

   FileSeek(file_handle,file_offset,SEEK_SET);
   
   r_code = SetEndOfFile(file_handle);

//------------------------------------------------------------------------/

   return(r_code);
}

//========================= DFM_Server_Get_Last_HFile_Records ============/

void  DFM_Server_Get_Last_HFile_Records(DFM_Server_History_Descriptor_struct &h_descriptor, int hf_handle)
{
//--- Get Record 0 (Last One in HF) ---/
      
      if (h_descriptor.records_no >= 1)
      {
         FileSeek(hf_handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                    ((h_descriptor.records_no - 1) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
         
         FileReadStruct(hf_handle,h_descriptor.h_record[0]);
      }

//--- Get Record 1 (One before last in HF) ---/
      
      if (h_descriptor.records_no >= 2)
      {
         FileSeek(hf_handle,DFM_SERVER_HISTORY_FILE_HEADER_SIZE + 
                                                    ((h_descriptor.records_no - 2) * DFM_SERVER_HISTORY_FILE_RECORD_SIZE),SEEK_SET);
         
         FileReadStruct(hf_handle,h_descriptor.h_record[1]);
      }

//------------------------------------------------------------------------/

   return;
}

//======================== DFM_Get_History_File_Header ===================/

int     DFM_Get_History_File_Header(int fh_handle, h_file_header_struct &fh_header)
{
int      r_code;
int      dummy_int_val;
int      array_size;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Check history file size ----------------------/

   if (FileSize(fh_handle) < DFM_SERVER_HISTORY_FILE_HEADER_SIZE)
   {
      r_code = 1;
      
      Print("DFM_Get_History_File_Header ERROR: " + IntegerToString(r_code,0,'0') + ", fh_size=" + IntegerToString(FileSize(fh_handle),0,'0'));
      return(r_code);
   }

//------------------------- Read histoty file header ---------------------/

   FileSeek(fh_handle,0,SEEK_SET);
   
   fh_header.file_version = FileReadInteger(fh_handle,LONG_VALUE);
   fh_header.c_copyright  = FileReadString (fh_handle,64);
   fh_header.c_symbol     = FileReadString (fh_handle,12);
   fh_header.i_period     = FileReadInteger(fh_handle,LONG_VALUE);
   fh_header.i_digits     = FileReadInteger(fh_handle,LONG_VALUE);
   dummy_int_val          = FileReadInteger(fh_handle,LONG_VALUE);
   dummy_int_val          = FileReadInteger(fh_handle,LONG_VALUE);
   
   array_size             = FileReadArray  (fh_handle,fh_header.i_unused,0,13);

   if (array_size != 13)
   {
      r_code = 2;
      
      Print("DFM_Get_History_File_Header FileReadArray() ERROR: " + IntegerToString(r_code,0,'0') + ", array_size=" + IntegerToString(array_size,0,'0'));
      return(r_code);
   }

//------------------------------------------------------------------------/

   return(r_code);
}

//======================== DFM_Server_Get_PHF_r_signal ===================/

string     DFM_Server_Get_PHF_r_signal()
{
string   phf_r_signal;

   phf_r_signal = "";

   if (DFM_Server_Config.dfm_server_req_proc_context.test_context == "Y")
   {
      phf_r_signal = DFM_Server_Get_Descriptor_PHF_r_signal(DFM_Server_Testing_History_Descriptor);
   }
   else
   {
      phf_r_signal = DFM_Server_Get_Descriptor_PHF_r_signal(DFM_Server_Processing_History_Descriptor);
   }

//------------------------------------------------------------------------/

   return(phf_r_signal);
}

//======================== DFM_Server_Get_Descriptor_PHF_r_signal=========/

string     DFM_Server_Get_Descriptor_PHF_r_signal(DFM_Server_History_Descriptor_struct &ph_descriptor_array[])
{
int      i;
string   phf_r_signal;

//------------------------- Reset processing data ------------------------/

   phf_r_signal = "";

//------------------------- Seek for descriptor_id (THE FIRST ONE) -------/
   
   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (
            (ph_descriptor_array[i].activity_flag          == DFM_SERVER_PROC_ITEM_ACTIVE) &&
            (ph_descriptor_array[i].feeding                == False) &&
            (ph_descriptor_array[i].short_terminal_company == DFM_Server_Config.dfm_server_req_proc_context.short_terminal_company) &&
            (ph_descriptor_array[i].terminal_symbol        == DFM_Server_Config.dfm_server_req_proc_context.terminal_symbol) &&
            
            (StringLen(ph_descriptor_array[i].chart_template) > 0) &&
            (ph_descriptor_array[i].chart_template != DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE) &&
            
            (StringLen(ph_descriptor_array[i].phf_resp_signal) > 0)
         )
      {
         phf_r_signal = ph_descriptor_array[i].phf_resp_signal;
         return(phf_r_signal);
      }
   }

//------------------------------------------------------------------------/

   return(phf_r_signal);
}

//=== eof mbs_dfm_client_req_proc_server_library.mqh =====================/

