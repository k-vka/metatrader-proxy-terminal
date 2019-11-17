//=== mbs_dfm_server_proc_chart_library.mqh ==============================/

//==================== DFM_Server_Proc_Chart_Refresh =====================/

void     DFM_Server_Proc_Chart_Refresh(DFM_Server_History_Descriptor_struct &ph_descriptor,string tester_context)
{
int      i;
long     current_chart_id;

string   event_chart_string;
string   phf_resp_label_store_text;          // temp storage for phf_resp_label_name LABEL
string   phf_resp_label_process_text;        // returned from EXPERT phf_resp_label_name LABEL

//-------------------- Reset current_chart_id ----------------------------/

   current_chart_id = 0;

//-------------------- chart_state is DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE -/

   if (ph_descriptor.chart_state == DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE)
   {

//-------------------- Open Chart ----------------------------------------/
/*
      if (ph_descriptor.chart_id == (long) 0)
      {
         ph_descriptor.chart_id = ChartOpen(ph_descriptor.phf_symbol,ph_descriptor.period);

         if (ph_descriptor.chart_id == (long) 0)
         {
            ph_descriptor.chart_open_err_no = ph_descriptor.chart_open_err_no + 1;
            return;
         }
      }
*/

//-------------------- Get Chart ID --------------------------------------/

   current_chart_id = ChartFirst();

   while (i < 100)
   {
      if (current_chart_id < (long) 0)
      {
         return;
      }
   
      if (
            (ChartSymbol(current_chart_id) == ph_descriptor.phf_symbol) &&
            (ChartPeriod(current_chart_id) == ph_descriptor.period)
         )
      {
         ph_descriptor.chart_id = current_chart_id;
         break;
      }
   
      current_chart_id = ChartNext(current_chart_id);
   }

//-------------------- Get Chart Window Handle ---------------------------/

      if (ph_descriptor.chart_win_handle == 0)
      {
         ph_descriptor.chart_win_handle = WindowHandle(ph_descriptor.phf_symbol,ph_descriptor.period);

         if (ph_descriptor.chart_win_handle == 0)
         {
            ph_descriptor.chart_w_handle_err_no = ph_descriptor.chart_w_handle_err_no + 1;
            return;
         }
      }

//-------------------- Chart Apply Template ------------------------------/


//-------------------- Get Chart Window Handle ---------------------------/

      ph_descriptor.chart_state = DFM_SERVER_PH_DESCRIPTOR_CHART_IS_ACTIVE;

   }  // if (ph_descriptor.chart_state == DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE)

//-------------- chart_state is DFM_SERVER_PH_DESCRIPTOR_CHART_IS_ACTIVE -/

   if (ph_descriptor.chart_state == DFM_SERVER_PH_DESCRIPTOR_CHART_IS_ACTIVE)
   {
//-------------------- Refresh Process Chart Window ----------------------/

      if (PostMessageA(ph_descriptor.chart_win_handle,WM_COMMAND,33324,0) == 0)
      {
         ph_descriptor.chart_refresh_err_no = ph_descriptor.chart_refresh_err_no + 1;
         
         Print("DFM_Server_Proc_Chart_Refresh() PostMessageA ERROR: Chart=" + ph_descriptor.phf_symbol + "(" + IntegerToString(ph_descriptor.period,0) + ")");
         
         ph_descriptor.chart_state = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
      }

//-------------------- Delay if Process Test Context ---------------------/
      
      if (tester_context == "Y")
      {
         Sleep(1);
      }

//-------------------- Generate Custom Event for Chart Window ------------/

      if (ph_descriptor.chart_template != DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE)
      {
//--- PREPARE phf_resp_label_name LABEL ---/

         phf_resp_label_store_text = ObjectGetString(0,ph_descriptor.phf_resp_label_name,OBJPROP_TEXT,0);
         
         ObjectSetText(ph_descriptor.phf_resp_label_name,SBS_PHF_RESP_LABEL_EMPTY_VAL,label_common_font_size,label_common_font_name,label_common_font_color);

//--- event_chart_string ---/

         event_chart_string = tester_context + ";" + ph_descriptor.phf_resp_label_name + ";" + IntegerToString(dfm_client_rcvd_rates[0].spread,0);
         
//         Print("event_chart_string =" + event_chart_string + ", ChartID()=" + ChartID());

//--- CALL Chart EXPERT ---/
      
         if (
               (EventChartCustom((long)   ph_descriptor.chart_id,       // calling expert Chart ID
                                 (ushort) (1),                          // event identifier    (checked by Chart Expert)
                                 (long)   ChartID(),                    // DFM Server Chart ID (used by Chart Expert)
                                 (double) 0,                            // parameter           (not used by Chart Expert yet)
                                          event_chart_string            //                     (used by Chart Expert)
                                ) == False)
            )
         {
            Print("DFM_Server_Proc_Chart_Refresh() EventChartCustom ERROR: Chart=" + ph_descriptor.phf_symbol + "(" + IntegerToString(ph_descriptor.period,0) + ")");
         
            ph_descriptor.chart_state = DFM_SERVER_H_DESCRIPTOR_NOT_ACTIVE;
            
            return;
         }

//--- Delay for Expert Process ---/

         if (dfms_event_chart_custom_timeout != 0)
         {
            Sleep(dfms_event_chart_custom_timeout);
         }
         
//--- WAITING FOR phf_resp_label_name LABEL (returned from EXPERT) ---/

         ph_descriptor.chart_phf_resp_label_counter = 0;

         for (i = 0; i < PHF_RESP_LABEL_COUNT; i++)
         {
            phf_resp_label_process_text = ObjectGetString(0,ph_descriptor.phf_resp_label_name,OBJPROP_TEXT,0);
            
//            Print("phf_resp_label_name =" + ph_descriptor.phf_resp_label_name + ", phf_resp_label_process_text=" + phf_resp_label_process_text);
            
            if (phf_resp_label_process_text == SBS_PHF_RESP_LABEL_EMPTY_VAL)
            {
               ph_descriptor.chart_phf_resp_label_counter = ph_descriptor.chart_phf_resp_label_counter + 1;
               
               if (ph_descriptor.chart_phf_resp_label_counter == (PHF_RESP_LABEL_COUNT / 2))
               {
                  ChartRedraw(0);
               }
               
               Sleep(10);
               continue;
            }
         }
         
         if (phf_resp_label_process_text == SBS_PHF_RESP_LABEL_EMPTY_VAL)        // Response has NOT BEEN RECEIVED
         {
            ChartRedraw(0);
            Sleep(1);
            phf_resp_label_process_text = ObjectGetString(0,ph_descriptor.phf_resp_label_name,OBJPROP_TEXT,0);
         }

//--- PROCESS phf_resp_label_name LABEL ---/
         
         if (phf_resp_label_process_text == SBS_PHF_RESP_LABEL_EMPTY_VAL)        // Response has NOT BEEN RECEIVED
         {
            ObjectSetText(ph_descriptor.phf_resp_label_name,phf_resp_label_store_text,label_common_font_size,label_common_font_name,label_common_font_color);
            
            Print("DFM_Server_Proc_Chart_Refresh() Get Response Label ERROR: Chart=" + ph_descriptor.phf_symbol + "(" + IntegerToString(ph_descriptor.period,0) + ")");
            
            return;
         }
         
         if (phf_resp_label_process_text == SBS_PHF_RESP_LABEL_EMPTY_SIGNAL)     // Response contains EMPTY EXPERT SIGNAL
         {
            return;
         }
         
         if (ph_descriptor.phf_resp_signal != phf_resp_label_process_text)
         {
//            Print("PHF_RSIG_CHANGE: Chart=" + ph_descriptor.phf_symbol + "(" + IntegerToString(ph_descriptor.period,0) + ")" + 
//                                   " From=" + ph_descriptor.phf_resp_signal + " To=" + phf_resp_label_process_text);
            
            ph_descriptor.phf_resp_signal = phf_resp_label_process_text;         // Set NEW EXPERT SIGNAL
         }

      }  // EOF if (ph_descriptor.chart_template != DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE)

//------/
      
      return;
   
   }  // EOF if (ph_descriptor.chart_state == DFM_SERVER_PH_DESCRIPTOR_CHART_IS_ACTIVE)


//------------------- chart_state is DFM_SERVER UNKNOWN State ------------/

   Print("(Proc Chart) DFM_Server_Proc_Chart_Refresh() ERROR: incorrect chart state=" + IntegerToString(ph_descriptor.chart_state,0,'0'));
   
   ph_descriptor.chart_state = DFM_SERVER_PH_DESCRIPTOR_CHART_IS_ACTIVE;

//------------------------------------------------------------------------/

   return;
}


//=== eof mbs_dfm_server_proc_chart_library.mqh ==========================/
