//+------------------------------------------------------------------+
//|                                                      DMF_OM2.mq4 |
//|                                  Copyright 2019 github.com/k-vka |
//+------------------------------------------------------------------+
#property copyright "github.com/k-vka"
#property link      "https://github.com/k-vka"

//----------------------- MBS Global Configuration ------------------/

#include <MBS_Include\mbs_global_config_header.mqh>

//----------------------- Message Broker Includes -------------------/

#include <MBS_Include\mbs_dfm_global_dictionary_header.mqh>
#include <MBS_Include\mbs_message_broker_header.mqh>
#include <MBS_Include\mbs_dfm_header.mqh>
#include <MBS_Include\mbs_indication_header.mqh>

//----------------------- Client Order Management Includes ----------/

#include <SBS_OM_Include\sbs_client_om_hdr.mqh>
#include <SBS_OM_Include\sbs_client_cfg_mng_hdr.mqh>
#include <SBS_OM_Include\sbs_client_indication_header.mqh>

//----------------------- Client Triangle Order Management Includes -/

#include <SBS_OM_Include\Triangle\sbs_trngl_client_om_hdr.mqh>

//+------------------------------------------------------------------+
//|                         Init
//+------------------------------------------------------------------+

int init()
{
int   r_code;

//-------------------- Init_SBS_Client_Order_Management -------------/

//   Init_SBS_Client_Order_Management();
   
   Init_SBS_Triangle_Client_Order_Management();

//-------------------- Init_DFM_Global_Dictionary -------------------/

   Init_DFM_Global_Dictionary();

//-------------------- Init_DFM_Client_Configuration ----------------/

   r_code = Init_DFM_Client_Configuration();
   
   if (r_code != 0)
   {
      Print("Init_DFM_Client_Configuration() ERROR: " + IntegerToString(r_code,0,' ')); 
      return(0);
   }

//-------------------- DFM_Client_Reset_Statistics ------------------/

   DFM_Client_Reset_Statistics();

//-------------------- Init_Common_Indication -----------------------/
   
   label_common_number = 7;         // Default is 5 (used for Server Indication)
   label_common_y_distance = common_y_distance;
   
   Init_Common_Indication();

//-------------------- DFM_Init_Control_Indication ------------------/

   label_control_y_distance = 20;
   label_GFMR_Change_y_distance = 20 + (16 * 18);
   label_GOR_Change_y_distance   = 20 + (16 * 18);
   
   DFM_Init_Control_Indication();

//-------------------- Init_DFM_Context -----------------------------/

   Init_DFM_Context();

//-------------------- Init_DFM_Message_Client ----------------------/

   r_code = Init_DFM_Message_Client();

   if (r_code != 0)
   {
      Print("Init_DFM_Message_Client() ERROR" + IntegerToString(r_code,0,' ')); 
      return(0);
   }

//-------------------- DFM_Init_Control_State -----------------------/

   DFM_Init_Control_State();

//-------------------- Indicate_DFM_Client_State --------------------/
   
   Indicate_DFM_Client_State();
   
   DFM_Indicate_Control_State();

//--- Redraw Chart Window ---/

   WindowRedraw();

//-------------------------------------------------------------------/

   return(0);
}

//+------------------------------------------------------------------+
//|                          Deinit
//+------------------------------------------------------------------+

int deinit()
{
int   r_code;

//------------------------- Deinit_DFM_Message_Client ---------------/

   Print("Deinit_DFM_Message_Client");

   r_code = Deinit_DFM_Message_Client();

   if (r_code != 0)
   {
      Print("Deinit_DFM_Message_Client() ERROR" + IntegerToString(r_code,0,' ')); 
      return(0);
   }

//------------------------- DFM_Denit_Control_Indication ------------/
   
   DFM_Denit_Control_Indication();

//-------------------------------------------------------------------/

   return(0);
}

//--------------------------- Start ---------------------------------/

int start()
{
int   r_code;

//----------------------- Set_Client_Processing_Parameters ----------/

   Set_Client_Processing_Parameters();

//----------------------- Check if DFM Client is NOT Active ---------/

   if (dfm_client_state == MSB_PROCESS_STATE_NOT_ACTIVE)
   {
      r_code = Init_DFM_Message_Client();

      if (r_code != 0)
      {
         Print("(Start) Init_DFM_Message_Client() ERROR" + IntegerToString(r_code,0,' ')); 
      }
   }

//----------------------- Process Data Feeding ----------------------/
   
   if (dfm_client_state == MSB_PROCESS_STATE_ACTIVE)
   {
      r_code = Data_Feeding_Client_Process();
      
      if (r_code != 0)
      {
         Print("Data_Feeding_Client_Process() ERROR: " + IntegerToString(r_code,0,' '));
      }
   }

//----------------------- Process Order Management ------------------/

//   SBS_Client_Get_OM_Context();
   
   SBS_Triangle_Client_Get_OM_Context();
   
//   SBS_Client_OM_Processing();
   
   SBS_Triangle_Client_OM_Processing();
   
//   SBS_Client_OM_Proc_Indication();        // indicates open order marker

//----------------------- Indicate Client State ---------------------/
   
   Indicate_DFM_Client_State();
   
   SBS_Triangle_Client_Indicate_TRG_Levels();
   
   DFM_Indicate_Control_State();

//--- Redraw Chart Window ---/

   WindowRedraw();

//----------------------- Play Sound Events -------------------------/

   SBS_Client_Play_Sound_Events();
   
//----------------------- End of Start function ---------------------/

   return(0);

}

//-------------------------------------------------------------------/

//--- Message Broker Includes ---/

#include <MBS_Include\mbs_dfm_global_dictionary_library.mqh>
#include <MBS_Include\mbs_message_broker_client_library.mqh>
#include <MBS_Include\mbs_dfm_client_library.mqh>
#include <MBS_Include\mbs_dfm_service_library.mqh>
#include <MBS_Include\mbs_indication_library.mqh>
#include <MBS_Include\mbs_indication_client_library.mqh>
#include <MBS_Include\mbs_dfm_server_resp_proc_client_library.mqh>

//--- Client Order Management Includes ---/

#include <SBS_OM_Include\sbs_client_om_lbr.mqh>
#include <SBS_OM_Include\sbs_client_cfg_mng_lbr.mqh>

#include <SBS_Include\sbs_exp_OrderReliable.mqh>

//--- Client Control Management (Buttons Processing) Includes ---/

#include <SBS_OM_Include\Ctrl_Mng\sbs_client_control_mng_lbr.mqh>
#include <SBS_OM_Include\Ctrl_Mng\sbs_client_GFMR_Change_lbr.mqh>
#include <SBS_OM_Include\Ctrl_Mng\sbs_client_GOR_Change_lbr.mqh>

//----------------------- Client Triangle Order Management Includes -/

#include <SBS_OM_Include\Triangle\sbs_trngl_client_om_lbr.mqh>

//============================= End of Program ======================/