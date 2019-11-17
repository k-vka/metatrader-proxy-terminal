//+------------------------------------------------------------------+
//|                                                DFM_Server_02.mq4 |
//|                                  Copyright 2019 github.com/k-vka |
//+------------------------------------------------------------------+
#property copyright "github.com/k-vka"
#property link      "https://github.com/k-vka"
#property description "Data Feeding Machine Server"
#property show_inputs

//-------------------------------------------------------------------/

#include <WinUser32.mqh>
#include <MBS_Include\mbs_dfm_kernel32_header.mqh>

//----------------------- MBS Global Configuration ------------------/

#include <MBS_Include\mbs_global_config_header.mqh>

//-------------------------------------------------------------------/

#include <MBS_Include\mbs_dfm_global_dictionary_header.mqh>
#include <MBS_Include\mbs_message_broker_header.mqh>
#include <MBS_Include\mbs_dfm_header.mqh>
#include <MBS_Include\mbs_dfm_server_header.mqh>
#include <MBS_Include\mbs_indication_header.mqh>

//+------------------------------------------------------------------+
//| script program start function                                    |
//+------------------------------------------------------------------+
void OnStart()
{
int   r_code;

//-------------------- Init_DFM_Global_Dictionary -------------------/

   Init_DFM_Global_Dictionary();

//-------------------- Init_DFM_Server_Configuration ----------------/

   r_code = Init_DFM_Server_Configuration();
   
   if (r_code != 0)
   {
      Print("Init_DFM_Server_Configuration() ERROR: " + IntegerToString(r_code,0,' ')); 
      return;
   }

//------------------------ Init DFM Server Comm Statistics ----------/

   DFM_Server_Reset_Comm_Stat();

//------------------------ Init DFM Server Common Indication --------/

   Init_Common_Indication();

//------------------------ Init_DFM_Server_Indication ---------------/

   Init_DFM_Server_Indication();

//------------------------ Init DFM Server --------------------------/

   r_code = Init_DFM_Message_Server();

   if (r_code != 0)
   {
      Print("Init_DFM_Message_Server() ERROR: " + IntegerToString(r_code,0,' ')); 
//      return;
   }

//------------------------ DFM Server State Indication --------------/
   
   Indicate_DFM_Server_State();

//------------------------ DFM Server Main Process Loop -------------/

   while(!IsStopped())
   {
//------------------------ DFM Client Feeding Request Processing -------/

      dfm_msg_state = Process_DFM_Client_Request();
      
      if (dfm_msg_state == 21)                      // EAGAIN
      {
         Indicate_DFM_Server_State();
         
         if (dfms_eagain_timeout != 0)
         {
            Sleep(dfms_eagain_timeout);
         }
      }
      else
      {
         DFM_Server_Comm_Stat.last_message_datetime = TimeLocal();      // Reset Idle time
         
         if (dfm_msg_state == 0)
         {
            DFM_Server_Comm_Stat.rcv_message_no = DFM_Server_Comm_Stat.rcv_message_no + 1;
         }
         else
         {
            DFM_Server_Comm_Stat.rcv_error_no = DFM_Server_Comm_Stat.rcv_error_no + 1;
         }
      }

//------------------------ DFM Server State Indication --------------/

      Indicate_DFM_Server_State();

//------------------------ EOF Main Process Loop --------------------/
   }

//------------------------ Deinitialization -------------------------/

   r_code = Deinit_DFM_Message_Server();

   if (r_code != 0)
   {
      Print("Deinit_DFM_Message_Server() ERROR: " + IntegerToString(r_code,0,' ')); 
      return;
   }

//------------------------ Exit from Script -------------------------/

   return;
}

//-------------------------------------------------------------------/

#include <MBS_Include\mbs_dfm_global_dictionary_library.mqh>
#include <MBS_Include\mbs_message_broker_server_library.mqh>
#include <MBS_Include\mbs_dfm_server_library.mqh>
#include <MBS_Include\mbs_dfm_service_library.mqh>
#include <MBS_Include\mbs_indication_library.mqh>
#include <MBS_Include\mbs_indication_server_library.mqh>
#include <MBS_Include\mbs_dfm_client_req_proc_server_library.mqh>
#include <MBS_Include\mbs_dfm_server_proc_history_library.mqh>
#include <MBS_Include\mbs_dfm_server_proc_chart_library.mqh>

//+------------------------------------------------------------------+