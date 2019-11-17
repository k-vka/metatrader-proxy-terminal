//=== mbs_indication_server_library.mqh ===================================/

//============================ Init_DFM_Server_Indication =================/

void     Init_DFM_Server_Indication()
{
   Init_DFMS_Proc_Items_Indication();
   Init_DFMS_Test_Items_Indication();
   
   Init_DFMS_Proc_Descriptors_Indication();
   Init_DFMS_Test_Descriptors_Indication();
   
   Init_DFMS_Items_PHF_Resp_Indication(DFM_Server_Processing_History_Descriptor, label_dfm_phf_resp_y_distance);
   Init_DFMS_Items_PHF_Resp_Indication(DFM_Server_Testing_History_Descriptor,    label_dfm_thf_resp_y_distance);

//-------------------------------------------------------------------------/

   return;
}

//============================ Init_DFMS_Proc_Items_Indication ============/

void     Init_DFMS_Proc_Items_Indication()
{
int      i;
string   label_name;

//---------------------------- Init DFMS Item Labels ----------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
   {
//--- Get Label Name ---/

      label_name = label_dfm_pi_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);

//--- Create Common Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_dfm_pi_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_dfm_pi_y_distance);
      label_dfm_pi_y_distance = label_dfm_pi_y_distance + label_dfm_pi_y_step;

//--- Reset Label Text ---/
      
      ObjectSetText(label_name,"PI" + IntegerToString(i,0,'0') + ": ",label_common_font_size,label_common_font_name,label_common_font_color);

   }

//-------------------------------------------------------------------------/

   return;
}

//============================ Init_DFMS_Test_Items_Indication ============/

void     Init_DFMS_Test_Items_Indication()
{
int      i;
string   label_name;

//---------------------------- Init DFMS Item Labels ----------------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
   {
//--- Get Label Name ---/

      label_name = label_dfm_ti_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);

//--- Create Common Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_dfm_ti_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_dfm_ti_y_distance);
      label_dfm_ti_y_distance = label_dfm_ti_y_distance + label_dfm_ti_y_step;

//--- Reset Label Text ---/
      
      ObjectSetText(label_name,"TI" + IntegerToString(i,0,'0') + ": ",label_common_font_size,label_common_font_name,label_common_font_color);

   }

//-------------------------------------------------------------------------/

   return;
}

//============================ Init_DFMS_Proc_Descriptors_Indication ======/

void     Init_DFMS_Proc_Descriptors_Indication()
{
int      i;
string   label_name;
string   label_vname;

//---------------------------- Init DFMS Descriptor Labels ----------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
//--- Get Label Name ---/

      label_name  = label_dfm_pdescr_prefix + IntegerToString(i,0,'0');
      label_vname = label_dfm_pvdescr_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);
      ObjectDelete(label_vname);

//--- Create Common Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);
      ObjectCreate(label_vname,OBJ_LABEL,0,0,0);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_dfm_pdescr_x_distance);
      ObjectSet(label_vname,OBJPROP_XDISTANCE,label_dfm_pvdescr_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_dfm_pdescr_y_distance);
      ObjectSet(label_vname,OBJPROP_YDISTANCE,label_dfm_pdescr_y_distance);
      
      label_dfm_pdescr_y_distance = label_dfm_pdescr_y_distance + label_dfm_pdescr_y_step;

//--- Reset Label Text ---/
      
      ObjectSetText(label_name,"PD" + IntegerToString(i,2,'0') + ": ",label_common_font_size,label_common_font_name,label_common_font_color);
      ObjectSetText(label_vname,"",label_common_font_size,label_common_font_name,label_common_font_color);

   }

//-------------------------------------------------------------------------/

   return;
}

//============================ Init_DFMS_Test_Descriptors_Indication ======/

void     Init_DFMS_Test_Descriptors_Indication()
{
int      i;
string   label_name;
string   label_vname;

//---------------------------- Init DFMS Descriptor Labels ----------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
//--- Get Label Name ---/

      label_name  = label_dfm_tdescr_prefix + IntegerToString(i,0,'0');
      label_vname = label_dfm_tvdescr_prefix + IntegerToString(i,0,'0');

//--- Delete Common Label ---/
      
      ObjectDelete(label_name);
      ObjectDelete(label_vname);

//--- Create Common Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);
      ObjectCreate(label_vname,OBJ_LABEL,0,0,0);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_dfm_tdescr_x_distance);
      ObjectSet(label_vname,OBJPROP_XDISTANCE,label_dfm_tvdescr_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_dfm_tdescr_y_distance);
      ObjectSet(label_vname,OBJPROP_YDISTANCE,label_dfm_tdescr_y_distance);
      
      label_dfm_tdescr_y_distance = label_dfm_tdescr_y_distance + label_dfm_tdescr_y_step;

//--- Reset Label Text ---/
      
      ObjectSetText(label_name,"TD" + IntegerToString(i,2,'0') + ": ",label_common_font_size,label_common_font_name,label_common_font_color);
      ObjectSetText(label_vname,"",label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//============================ Init_DFMS_Items_PHF_Resp_Indication ========/

void     Init_DFMS_Items_PHF_Resp_Indication(DFM_Server_History_Descriptor_struct &ph_descriptor[], int label_y_distance)
{
int      i;
string   label_name;

//---------------------------- Init DFMS Descriptor Labels ----------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (
            (StringLen(ph_descriptor[i].chart_template > 0)) &&
            (ph_descriptor[i].chart_template != DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE)
         )
      {
//--- Get Label Name ---/

         label_name = ph_descriptor[i].phf_resp_label_name;

//--- Delete Common Label ---/
      
         ObjectDelete(label_name);

//--- Create Common Label ---/

         ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set X Distance ---/

         ObjectSet(label_name,OBJPROP_XDISTANCE,label_dfm_phf_resp_x_distance);

//--- Set Y distance ---/
   
         ObjectSet(label_name,OBJPROP_YDISTANCE,label_y_distance);
      
//--- Reset Label Text ---/
      
         ObjectSetText(label_name,"",label_common_font_size,label_common_font_name,label_common_font_color);
      }
      
      label_y_distance = label_y_distance + label_dfm_phf_resp_y_step;
   }

//-------------------------------------------------------------------------/

   return;
}

//================================== Indicate_DFM_Server_State ============/

void     Indicate_DFM_Server_State()
{
//------------------------------ Update Common Indication -----------------/
      
   Update_DFM_Server_Common_Indication();
   
//------------------------------ Update One Time Indication ---------------/
   
   Update_DFMS_One_Time_Indication();

//------------------------------ Update DFMS Proc Descr Var Indication ----/
   
   Update_DFMS_Proc_Descriptors_Var_Indication();

//------------------------------ Update DFMS Test Descr Var Indication ----/
   
   Update_DFMS_Test_Descriptors_Var_Indication();

//------------------------------ Redraw Chart Window ----------------------/

   WindowRedraw();
   
//-------------------------------------------------------------------------/

   return;
}

//============================== Update_DFMS_One_Time_Indication ==========/

void     Update_DFMS_One_Time_Indication()
{
//-------------------------- Check dfm_server_one_time_indication_flag ----/

   if (dfm_server_one_time_indication_flag == 1)
   {
      dfm_server_one_time_indication_flag = 0;
   }
   else
   {
      return;
   }

//------------------------------ Update Processing Items Indication -------/
   
   Update_DFMS_Proc_Items_Indication();

//------------------------------ Update Testing Items Indication ----------/
   
   Update_DFMS_Test_Items_Indication();

//------------------------------ Update Processing Descriptors Indication -/
   
   Update_DFMS_Proc_Descriptors_Const_Indication();

//------------------------------ Update Testing Descriptors Indication ----/

   Update_DFMS_Test_Descriptors_Const_Indication();
   
//-------------------------------------------------------------------------/

   return;
}

//================================== Update_DFM_Server_Common_Indication ==/

void     Update_DFM_Server_Common_Indication()
{
string   label_name;
string   label_text;

string   dfm_state;

int      dfm_seconds;

//------------------------------ Common Label 1 (Terminal Info) -----------/

   label_name = label_common_prefix + IntegerToString(1,0,'0');
   
   label_text =   "TRM: " +
                  "TNM=" + TerminalInfoString(TERMINAL_NAME) + "; " +
                  "TCMP=" + TerminalInfoString(TERMINAL_COMPANY) + "; " +
                  
                  "BLD=" + IntegerToString(TerminalInfoInteger(TERMINAL_BUILD),0,' ') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   
//------------------------------ Common Label 2 (MBS Server Info) ---------/

   label_name = label_common_prefix + IntegerToString(2,0,'0');
   
   dfm_state = "NDF";
   
   switch(dfm_server_state)
   {
      case MSB_PROCESS_STATE_NOT_ACTIVE:  {dfm_state = "NCT"; break;}
      case MSB_PROCESS_STATE_ACTIVE:      {dfm_state = "ACT"; break;}
   }
   
   label_text =   "DFMS: " + 
                  "V=" + IntegerToString(dfm_zmq_ver_major,0,'0') + "." +
                         IntegerToString(dfm_zmq_ver_minor,0,'0') + "." +
                         IntegerToString(dfm_zmq_ver_patch,0,'0') + "; " +
   
                  "ADR=" + dfm_server_endpoint + "; " +
                  "S=" + dfm_state  + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//-------------------------- Common Label 3 (Communication Server Info) ---/

   label_name = label_common_prefix + IntegerToString(3,0,'0');
   
   dfm_seconds = TimeLocal() - DFM_Server_Comm_Stat.last_message_datetime;
   
   label_text =   "COMM: " + 
                  "RCV=" + IntegerToString(DFM_Server_Comm_Stat.rcv_message_no,0,'0') + "; " +
                  "ERR=" + IntegerToString(DFM_Server_Comm_Stat.rcv_error_no,0,'0') + "; " +
                  "RCT=" + IntegerToString(DFM_Server_Comm_Stat.reactivation_no,0,'0') + "; " +
                  "IDL=" + IntegerToString(dfm_seconds,0,'0') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//-------------------------- Common Label 4 (DFM Server Config Info) ------/

   label_name = label_common_prefix + IntegerToString(4,0,'0');
   
   label_text =   "SCFG: " + 
                  "PI="  + IntegerToString(DFM_Server_Config.processing_items_no,0,'0') + "; " +
                  "TI="  + IntegerToString(DFM_Server_Config.testing_items_no,0,'0') + "; "
//                  "SLF=" + IntegerToString(DFM_Server_Config.dfm_client_rates_lock_flag,0,'0') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
        
//-------------------------------------------------------------------------/

   return;
}

//================================== Update_DFMS_Proc_Items_Indication ====/

void     Update_DFMS_Proc_Items_Indication()
{
string   label_name;
string   label_text;

int      i;

//-------------------------- Update DFMS Processing Item Labels -----------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
   {
      label_name = label_dfm_pi_prefix + IntegerToString(i,0,'0');
      
      label_text =   "PI" + IntegerToString(i,0,'0') + ": " + 
                     "AF="  + IntegerToString(DFM_Server_Processing_Item[i].activity_flag,0,'0') + "; " +
                     "GI="  + IntegerToString(DFM_Server_Processing_Item[i].gd_id,0,'0') + "; " +
                     "FID=" + IntegerToString(DFM_Server_Processing_Item[i].feeding_history_descriptor_id,0,'0') + "; " +
                     "PID=" + IntegerToString(DFM_Server_Processing_Item[i].processing_history_descriptor_id,0,'0') + "; "
                     ;
   
      ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//================================== Update_DFMS_Test_Items_Indication ====/

void     Update_DFMS_Test_Items_Indication()
{
string   label_name;
string   label_text;

int      i;

//-------------------------- Update DFMS Testing Item Labels --------------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_ITEMS; i++)
   {
      label_name = label_dfm_ti_prefix + IntegerToString(i,0,'0');
      
      label_text =   "TI" + IntegerToString(i,0,'0') + ": " + 
                     "AF="  + IntegerToString(DFM_Server_Testing_Item[i].activity_flag,0,'0') + "; " +
                     "GI="  + IntegerToString(DFM_Server_Testing_Item[i].gd_id,0,'0') + "; " +
                     "FID=" + IntegerToString(DFM_Server_Testing_Item[i].feeding_history_descriptor_id,0,'0') + "; " +
                     "PID=" + IntegerToString(DFM_Server_Testing_Item[i].processing_history_descriptor_id,0,'0') + "; "
                     ;
   
      ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//========================== Update_DFMS_Proc_Descriptors_Const_Indication /

void     Update_DFMS_Proc_Descriptors_Const_Indication()
{
string   label_name;
string   label_text;

string   feeding_flag;

int      i;

//-------------------------- Update DFMS Processing Descriptor Labels -----/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (DFM_Server_Processing_History_Descriptor[i].feeding == True)
      {
         feeding_flag = "Y";
      }
      else
      {
         feeding_flag = "N";
      }
   
      label_name = label_dfm_pdescr_prefix + IntegerToString(i,0,'0');
      
      label_text =   "PD" + IntegerToString(i,2,'0') + ": " + 
                     "AF="  + IntegerToString(DFM_Server_Processing_History_Descriptor[i].activity_flag,0,'0') + "; " +
                     "FD="  + feeding_flag + "; " +
                     "SC=" + DFM_Server_Processing_History_Descriptor[i].short_terminal_company + "; " +
                     "SB=" + DFM_Server_Processing_History_Descriptor[i].terminal_symbol + "; " +
                     "P="  + IntegerToString(DFM_Server_Processing_History_Descriptor[i].period,0,'0') + "; "
                     ;
   
      ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//========================== Update_DFMS_Test_Descriptors_Const_Indication /

void     Update_DFMS_Test_Descriptors_Const_Indication()
{
string   label_name;
string   label_text;

string   feeding_flag;

int      i;

//-------------------------- Update DFMS Testing Descriptor Labels --------/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      if (DFM_Server_Testing_History_Descriptor[i].feeding == True)
      {
         feeding_flag = "Y";
      }
      else
      {
         feeding_flag = "N";
      }
   
      label_name = label_dfm_tdescr_prefix + IntegerToString(i,0,'0');
      
      label_text =   "TD" + IntegerToString(i,2,'0') + ": " + 
                     "AF="  + IntegerToString(DFM_Server_Testing_History_Descriptor[i].activity_flag,0,'0') + "; " +
                     "FD="  + feeding_flag + "; " +
                     "SC=" + DFM_Server_Testing_History_Descriptor[i].short_terminal_company + "; " +
                     "SB=" + DFM_Server_Testing_History_Descriptor[i].terminal_symbol + "; " +
                     "P="  + IntegerToString(DFM_Server_Testing_History_Descriptor[i].period,0,'0') + "; "
                     ;
   
      ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//========================== Update_DFMS_Proc_Descriptors_Var_Indication --/

void     Update_DFMS_Proc_Descriptors_Var_Indication()
{
string   label_name;
string   label_text;

int      i;

//-------------------------- Update DFMS Processing Descriptor Labels -----/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      label_name = label_dfm_pvdescr_prefix + IntegerToString(i,0,'0');
      
      if (DFM_Server_Processing_History_Descriptor[i].feeding == True)
      {
      
         label_text ="FH=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].handle,0,'0') + "; " +
                     "PS=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].proc_state,0,'0') + "; " +
                     "HN=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].headers_no,0,'0') + "; " +
                     "RN=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].records_no,0,'0') + "; " +
                     "SN=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].synch_recno,0,'0') + "; "
                     ;
      }
      else
      {
         label_text ="PH=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].proc_fhandle,0,'0') + "; " +
                     "PS=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].proc_state,0,'0') + "; " +
                     "FH=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].handle,0,'0') + "; " +
                     
                     "HN=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].headers_no,0,'0') + "; " +
                     "RN=" + IntegerToString(DFM_Server_Processing_History_Descriptor[i].records_no,0,'0') + "; " +
                     
                     "LFN="+ IntegerToString(DFM_Server_Processing_History_Descriptor[i].last_feeding_record_no,0,'0') + "; "
                     ;
         
         if (
               (StringLen(DFM_Server_Processing_History_Descriptor[i].chart_template) > 0) &&
               (DFM_Server_Processing_History_Descriptor[i].chart_template != DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE)
            )
         {
            label_text = label_text + IntegerToString(DFM_Server_Processing_History_Descriptor[i].chart_phf_resp_label_counter,0) + ";";
         }
      }
   
      ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//========================== Update_DFMS_Test_Descriptors_Var_Indication --/

void     Update_DFMS_Test_Descriptors_Var_Indication()
{
string   label_name;
string   label_text;

int      i;

//-------------------------- Update DFMS Processing Descriptor Labels -----/

   for (i = 0; i < DFM_SERVER_MAX_PROC_DESCRIPTORS; i++)
   {
      label_name = label_dfm_tvdescr_prefix + IntegerToString(i,0,'0');
      
      if (DFM_Server_Testing_History_Descriptor[i].feeding == True)
      {
      
         label_text ="FH=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].handle,0,'0') + "; " +
                     "PS=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].proc_state,0,'0') + "; " +
                     "HN=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].headers_no,0,'0') + "; " +
                     "RN=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].records_no,0,'0') + "; " +
                     "SN=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].synch_recno,0,'0') + "; "
                     ;
      }
      else
      {
         label_text ="PH=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].proc_fhandle,0,'0') + "; " +
                     "PS=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].proc_state,0,'0') + "; " +
                     "FH=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].handle,0,'0') + "; " +
                     
                     "HN=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].headers_no,0,'0') + "; " +
                     "RN=" + IntegerToString(DFM_Server_Testing_History_Descriptor[i].records_no,0,'0') + "; " +
                     
                     "LFN="+ IntegerToString(DFM_Server_Testing_History_Descriptor[i].last_feeding_record_no,0,'0') + "; "
                     ;
         
         if (
               (StringLen(DFM_Server_Testing_History_Descriptor[i].chart_template) > 0) &&
               (DFM_Server_Testing_History_Descriptor[i].chart_template != DFM_GLOBAL_DICTIONARY_NOP_TEMPLATE)
            )
         {
            label_text = label_text + IntegerToString(DFM_Server_Testing_History_Descriptor[i].chart_phf_resp_label_counter,0) + ";";
         }
      }
   
      ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   }

//-------------------------------------------------------------------------/

   return;
}

//=== eof mbs_indication_server_library.mqh ================================/

