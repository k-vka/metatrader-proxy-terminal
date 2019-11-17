//========================= mbs_indication_client_library.mqh ==============/

//================================== Indicate_DFM_Client_State =============/

void     Indicate_DFM_Client_State()
{
//--- Update Common Indication ---/
      
   Update_DFM_Client_Common_Indication();
   
//-------------------------------------------------------------------------/

   return;
}

//================================== Update_DFM_Client_Common_Indication ==/

void     Update_DFM_Client_Common_Indication()
{
string   label_name;
string   label_text;

string   dfm_state;

//------------------------------ Common Label 1 (Terminal Info) -----------/

   label_name = label_common_prefix + IntegerToString(1,0,'0');
   
   label_text =   "TRM: " +
//                  "TNM=" + TerminalInfoString(TERMINAL_NAME) + "; " +
//                  "TCMP=" + TerminalInfoString(TERMINAL_COMPANY) + "; " +
                  "TCMP=" + dfm_global_dictionary[dfm_client_config.gd_id].short_terminal_company + "; " +
                  
//                  "BLD=" + IntegerToString(TerminalInfoInteger(TERMINAL_BUILD),0,' ') + "; " +
                  "LGN=" + IntegerToString(AccountInfoInteger(ACCOUNT_LOGIN),0,' ') + "; " +
                  "GDE=" + IntegerToString(dfm_client_config.gd_id,0,' ') + "; " +
                  "TCX=" + dfm_client_config.test_context + "; " +
                  "CCX=" + IntegerToString(dfm_client_context,0,' ') + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
   
//------------------------------ Common Label 2 (MBS Client Info) ---------/

   label_name = label_common_prefix + IntegerToString(2,0,'0');
   
   dfm_state = "NDF";
   
   switch(dfm_client_state)
   {
      case MSB_PROCESS_STATE_NOT_ACTIVE:  {dfm_state = "NCT"; break;}
      case MSB_PROCESS_STATE_ACTIVE:      {dfm_state = "ACT"; break;}
   }
   
   label_text =   "DFMC: " + 
                  "V=" + IntegerToString(dfm_zmq_ver_major,0,'0') + "." +
                         IntegerToString(dfm_zmq_ver_minor,0,'0') + "." +
                         IntegerToString(dfm_zmq_ver_patch,0,'0') + "; " +
   
                  "ADR=" + dfm_server_endpoint + "; " +
                  "S=" + dfm_state  + "; "
                  ;
   
   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 3 (Client Message Process Stat Info) ---/

   label_name = label_common_prefix + IntegerToString(3,0,'0');
   
   label_text =   "MSST: " +
                  "LA=" + IntegerToString(dfm_client_message_stat.lbt_attemts,0,'0') + "; " +
                  "LE=" + IntegerToString(dfm_client_message_stat.lbt_errors,0,'0') + "; " +
                  "SA=" + IntegerToString(dfm_client_message_stat.synch_bt_attemts,0,'0') + "; " +
                  "SE=" + IntegerToString(dfm_client_message_stat.synch_bt_errors,0,'0') + "; "
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 4 (Client Account Info) ----------------/

   label_name = label_common_prefix + IntegerToString(4,0,'0');
   
   label_text =   "ACC: " +
                  "LV=" + IntegerToString(sbs_client_order_state.leverage,0,'0') + "; " +
                  "BL=" + DoubleToString(AccountBalance(),2) + "; " +
                  "EQ=" + DoubleToString(AccountEquity(),2) + "; " +
                  "FM=" + DoubleToString(sbs_client_order_state.free_margin,2) + "; " +
                  "PF=" + DoubleToString(AccountProfit(),2) + "; "
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 5 (Client Order Session Info) ----------/

   label_name = label_common_prefix + IntegerToString(5,0,'0');
   
   label_text =   "OSN: " +
//                  "SID=" + IntegerToString(sbs_client_order_state.order_session_id,0,'0') + "; " +
                   "SPR=" + DoubleToString(sbs_client_order_state.spread,1) + "; " +
                  "OLTC=" + DoubleToString(sbs_client_order_state.one_lot_tick_cost,2) + "; " +
                  "LOT=(" + DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[0].order_service_data.last_calculated_lots_no,3) + "/" +
                            DoubleToString(sbs_triangle_client_order_data.client_order_descriptor[1].order_service_data.last_calculated_lots_no,3) + "); "
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 6 (Order 1 Info) ----------------------/

   label_name = label_common_prefix + IntegerToString(6,0,'0');
   
   label_text =   "D1: " +
                  "O/S/P=" + DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[0].order_online.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[1].order_online.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[2].order_online.signal) + 
                       "/" +
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[0].order_synch.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[1].order_synch.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[2].order_synch.signal) + 
                       "/" +
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[0].order_phf.signal) + 
                      "; " +
                      "T=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[0].order_online.ticket,0) + "," +
                             IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[1].order_online.ticket,0) + "," +
                             IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[0].client_order[2].order_online.ticket,0) + 
                      "; " +
                      "S=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[0].order_phf.state,0) +
                       ";"
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 7 (Order 1 Open Data Info) -------------/

   label_name = label_common_prefix + IntegerToString(7,0,'0');
   
   label_text =   "D2: " +
                  "O/S/P=" + DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[0].order_online.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[1].order_online.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[2].order_online.signal) + 
                       "/" +
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[0].order_synch.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[1].order_synch.signal) + 
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[2].order_synch.signal) + 
                       "/" +
                             DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[1].order_phf.signal) + 
                      "; " +
                      "T=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[0].order_online.ticket,0) + "," +
                             IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[1].order_online.ticket,0) + "," +
                             IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[1].client_order[2].order_online.ticket,0) + 
                      "; " +
                      "S=" + IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[1].order_phf.state,0) +
                       ";"
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 8 (Order 2 PHF Info) -------------------/
/*
   label_name = label_common_prefix + IntegerToString(8,0,'0');
   
   label_text =   "PHF2: " +
                  "SIG=" + IntegerToString(sbs_client_order_state.sbs_open_order[1].sbs_phf_order_data.signal,0,'0') + "; " +
                   "OP=" + DoubleToString(sbs_client_order_state.sbs_open_order[1].sbs_phf_order_data.order_price,Digits) + "; " +
                   "SL=" + DoubleToString(sbs_client_order_state.sbs_open_order[1].sbs_phf_order_data.stoploss,Digits) + "; " +
                   "DT=" + SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_open_order[1].sbs_phf_order_data.order_time) + "; "
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);

//------------------- Common Label 9 (Order 2 Open Data Info) -------------/

   label_name = label_common_prefix + IntegerToString(9,0,'0');
   
   label_text =   "OPN2: " +
                  "T=" + IntegerToString(sbs_client_order_state.sbs_open_order[1].ticket,0,'0') + "; " +
                  "S=" + IntegerToString(sbs_client_order_state.sbs_open_order[1].signal,0,'0') + "; " +
                 "OP=" + DoubleToString(sbs_client_order_state.sbs_open_order[1].order_price,Digits) + "; " +
                 "SL=" + DoubleToString(sbs_client_order_state.sbs_open_order[1].stoploss,Digits) + "; " +
                 "DT=" + SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_open_order[1].order_time) + "; "
                  ;

   ObjectSetText(label_name,label_text,label_common_font_size,label_common_font_name,label_common_font_color);
*/
//------------------------------ Redraw Chart Window ----------------------/

//   WindowRedraw();
        
//-------------------------------------------------------------------------/

   return;
}

//==================== SBS_Client_OM_Proc_Indication ======================/

void     SBS_Client_OM_Proc_Indication()
{
string   t_name;

//--- check length ---/

   if (StringLen(sbs_client_order_state.operation_label_data) == 0)
   {
      return;
   }

//------------------------- Indicate Case Number (Create Text Object) ------/

   t_name = "SBS_CLT_OL_"+DoubleToStr(Time[0]) + "_" + IntegerToString(sbs_client_order_state.sequence_object_no++,0);
      
   ObjectDelete(t_name);
   ObjectCreate(t_name,OBJ_TEXT,0,(Time[0] + (5*60)),Close[0]);
   ObjectSetText(t_name,sbs_client_order_state.operation_label_data,dfm_om_com_font_size, dfm_om_com_font_name, dfm_om_com_font_color);

//--------------------------------------------------------------------------/

   return;
}

//==================== DFM_Order_Signal_Name ===============================/

string   DFM_Order_Signal_Name(int order_signal)
{
string   order_signal_name;

   order_signal_name = "";

   switch(order_signal)
   {
      case NO_ORDER:          {order_signal_name = "N";     break;}
      case BUY_ORDER:         {order_signal_name = "B";     break;}
      case SELL_ORDER:        {order_signal_name = "S";     break;}
      case REJECT_ORDER:      {order_signal_name = "REJECT";      break;}
      case CLOSE_BUY_ORDER:   {order_signal_name = "CLOSE_BUY";   break;}
      case CLOSE_SELL_ORDER:  {order_signal_name = "CLOSE_SELL";  break;}
      case CLOSE_ANY_ORDER:   {order_signal_name = "CLOSE_ANY";   break;}
      case MODIFY_BUY_ORDER:  {order_signal_name = "MDFY_BUY";    break;}
      case MODIFY_SELL_ORDER: {order_signal_name = "MDFY_SELL";   break;}

      default:   {order_signal_name = "UNKNOWN(" + IntegerToString(order_signal,0) + ")";}
   }

//--------------------------------------------------------------------------/

   return(order_signal_name);

}

//========================= DFM_Init_Control_Indication ====================/

void     DFM_Init_Control_Indication()
{
int      i;
//string   label_name;

//---------------------------- Init Patters Labels -----------------------/

   for (i = 1; i <= label_control_number; i++)
   {
//--- Get Common Label Name ---/

//      label_name = label_control_prefix + IntegerToString(i,0);

//--- Delete Common Label ---/
      
//      ObjectDelete(label_name);

//--- Create Common Label ---/

//      ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set Corner ---/

//      ObjectSet(label_name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

//--- Set X Distance ---/

//      ObjectSet(label_name,OBJPROP_XDISTANCE,label_control_x_distance);

//--- Set Y distance ---/
   
//      ObjectSet(label_name,OBJPROP_YDISTANCE,label_control_y_distance);
      
//      label_control_y_distance = label_control_y_distance + label_control_y_step;

//--- Reset Label Text ---/
      
//      ObjectSetText(label_name,"",label_control_font_size,label_control_font_name,label_control_font_color);

//--- Create BUTTONS if needed ---/

      if (
            (i == 2) ||
            (i == 3) ||
            (i == 4) ||
            (i == 5) ||
            (i == 6) ||
            (i == 8) ||
            (i == 9) ||
            (i == 10) ||
            (i == 11) ||
            (i == 12) ||
            (i == 13) ||
            (i == 14) ||
            (i == 15) ||
            (i == 16) ||
            (i == 17)
         )
      {
//         DFM_Init_Control_Button(i,label_control_y_distance - label_control_y_step);
         DFM_Init_Control_Button(i);
      }

//--- Duplicate label_control_y_distance if needed ---/
/*      
      if (
            (i == 1) ||
            (i == 3) ||
            (i == 6) ||
            (i == 7)
         )
      {
         label_control_y_distance = label_control_y_distance + label_control_y_step;
      }
*/

   }

//--- Create "05:Close" BUTTON ---/

//   label_control_y_distance = label_control_y_distance + (2 * label_control_y_step);
   
//   DFM_Init_Control_Button(11,label_control_y_distance - label_control_y_step);   

//   DFM_Init_Control_Button(11,20);                             // right low corner
//   DFM_Init_Control_Button(11);                             // right low corner
   
//   label_control_y_distance = label_control_y_distance + label_control_y_step;

//--- Create "12:Close" BUTTON ---/
   
//   DFM_Init_Control_Button(12,label_control_y_distance - label_control_y_step);

//   DFM_Init_Control_Button(12,20);                             // right low corner
//   DFM_Init_Control_Button(12);                             // right low corner
   
//   label_control_y_distance = label_control_y_distance + label_control_y_step;

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Denit_Control_Indication ===================/

void     DFM_Denit_Control_Indication()
{
int      i;

   for (i = 1; i <= label_control_number; i++)
   {
//--- Delete BUTTONS if needed ---/

      if (
            (i == 2) ||
            (i == 3) ||
            (i == 4) ||
            (i == 5) ||
            (i == 6) ||
            (i == 8) ||
            (i == 9) ||
            (i == 10) ||
            (i == 11) ||
            (i == 12) ||
            (i == 13) ||
            (i == 14) ||
            (i == 15) ||
            (i == 16) ||
            (i == 17)
         )
      {
         DFM_Deinit_Control_Button(i);
      }
   }

//--- Deinit "05:Close" BUTTON ---/
/*   
   DFM_Deinit_Control_Button(11);

//--- Deinit "12:Close" BUTTON ---/
   
   DFM_Deinit_Control_Button(12);

//--- Deinit "Close All" BUTTON ---/
   
   DFM_Deinit_Control_Button(13);
*/


//--- Deinit Sub Control ---/
   
   DFM_Denit_Sub_Control_Indication();

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Denit_Sub_Control_Indication ===============/

void     DFM_Denit_Sub_Control_Indication()
{
   DFM_Deinit_GFMR_Change_Indication();
   DFM_Deinit_GOR_Change_Indication();

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Init_Control_Button ========================/

void     DFM_Init_Control_Button(int button_id)
{
string   button_name;
//int      button_x_distance;
//int      button_x_size;
string   button_text;

//========================= Set Button Parameters ==========================/

//--- Get Button Name ---/

      button_name = button_control_prefix + IntegerToString(button_id,0);

//--- Delete Button ---/
      
      ObjectDelete(button_name);

//--- Create Button ---/

      ObjectCreate(button_name,OBJ_BUTTON,0,0,0);

//--- Reset button_text ---/

      button_text = "--";
      
//------------------------- Button 2 (free_margin_risk_value) --------------/

   if (button_id == 2)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_free_margin_risk_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_free_margin_risk_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_free_margin_risk_button_y_distance);
      
      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_free_margin_risk_button_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_free_margin_risk_button_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_free_margin_risk_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_free_margin_risk_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);
      
//      button_text = "FMR:" + DoubleToString(sbs_client_order_state.free_margin_risk_value * 100,0) + "%";
      
//      ObjectSetText(button_name,button_text,dfm_free_margin_risk_button_font_size,dfm_free_margin_risk_button_font_name,dfm_free_margin_risk_button_font_color);
      return;
   }

//------------------------- Button 3 (order_risk_value) --------------------/
   
   if (button_id == 3)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_order_risk_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_order_risk_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_order_risk_button_y_distance);
      
      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_order_risk_button_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_order_risk_button_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_order_risk_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_order_risk_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);
      
//      button_text = "OOR:" + DoubleToString(sbs_client_order_state.order_risk_value * 100,1) + "%";
      
//      ObjectSetText(button_name,button_text,dfm_order_risk_button_font_size,dfm_order_risk_button_font_name,dfm_order_risk_button_font_color);
      return;
   }

//------------------------- Button 4 (Global open_order_flag) --------------/

   if (button_id == 4)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_g_open_order_flag_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_g_open_order_flag_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_g_open_order_flag_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_g_open_order_flag_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_g_open_order_flag_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_global_operational_data.open_order_flag) == "ON")
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_open_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_open_order_flag_button_bg_color_ON);
         button_text = "GO:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_open_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_open_order_flag_button_bg_color_OFF);
         button_text = "GO:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_g_open_order_flag_button_font_size,dfm_g_open_order_flag_button_font_name,dfm_g_open_order_flag_button_font_color);
*/

      return;
   }

//------------------------- Button 5 (Global close_order_flag) -------------/

   if (button_id == 5)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_g_close_order_flag_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_g_close_order_flag_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_g_close_order_flag_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_g_close_order_flag_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_g_close_order_flag_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_global_operational_data.close_order_flag) == "ON")
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_close_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_close_order_flag_button_bg_color_ON);
         button_text = "GC:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_close_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_close_order_flag_button_bg_color_OFF);
         button_text = "GC:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_g_close_order_flag_button_font_size,dfm_g_close_order_flag_button_font_name,dfm_g_close_order_flag_button_font_color);
*/

      return;
   }

//------------------------- Button 6 (Global sl_trail_order_flag) ----------/

   if (button_id == 6)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_g_sl_trail_order_flag_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_g_sl_trail_order_flag_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_g_sl_trail_order_flag_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_g_sl_trail_order_flag_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_g_sl_trail_order_flag_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag) == "ON")
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_sl_trail_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_sl_trail_order_flag_button_bg_color_ON);
         button_text = "GT:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_sl_trail_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_sl_trail_order_flag_button_bg_color_OFF);
         button_text = "GT:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_g_sl_trail_order_flag_button_font_size,dfm_g_sl_trail_order_flag_button_font_name,dfm_g_sl_trail_order_flag_button_font_color);
*/

      return;
   }

//------------------------- Button 8 (Private open_order_flag) -------------/

   if (button_id == 8)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_p_open_order_flag_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_p_open_order_flag_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_p_open_order_flag_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_p_open_order_flag_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_p_open_order_flag_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_private_operational_data.open_order_flag) == "ON")
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_open_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_open_order_flag_button_bg_color_ON);
         button_text = "PO:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_open_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_open_order_flag_button_bg_color_OFF);
         button_text = "PO:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_p_open_order_flag_button_font_size,dfm_p_open_order_flag_button_font_name,dfm_p_open_order_flag_button_font_color);
*/

      return;
   }

//------------------------- Button 9 (Private close_order_flag) ------------/

   if (button_id == 9)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_p_close_order_flag_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_p_close_order_flag_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_p_close_order_flag_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_p_close_order_flag_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_p_close_order_flag_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_private_operational_data.close_order_flag) == "ON")
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_close_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_close_order_flag_button_bg_color_ON);
         button_text = "PC:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_close_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_close_order_flag_button_bg_color_OFF);
         button_text = "PC:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_p_close_order_flag_button_font_size,dfm_p_close_order_flag_button_font_name,dfm_p_close_order_flag_button_font_color);
*/

      return;
   }

//------------------------- Button 10 (Private sl_trail_order_flag) --------/

   if (button_id == 10)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_p_sl_trail_order_flag_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_p_sl_trail_order_flag_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_p_sl_trail_order_flag_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_p_sl_trail_order_flag_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_p_sl_trail_order_flag_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag) == "ON")
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_sl_trail_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_sl_trail_order_flag_button_bg_color_ON);
         button_text = "PT:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_sl_trail_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_sl_trail_order_flag_button_bg_color_OFF);
         button_text = "PT:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_p_sl_trail_order_flag_button_font_size,dfm_p_sl_trail_order_flag_button_font_name,dfm_p_sl_trail_order_flag_button_font_color);
*/

      return;
   }

//------------------------- Button 11 ("05:Close") -------------------------/

   if (button_id == 11)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_05_close_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_05_close_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_05_close_button_y_distance);
      
      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_05_close_button_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_05_close_button_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_05_close_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_05_close_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);
      
      button_text = "05:Close";
      
      ObjectSetText(button_name,button_text,dfm_05_close_button_font_size,dfm_05_close_button_font_name,dfm_05_close_button_font_color);
      return;
   }

//------------------------- Button 12 ("12:Close") -------------------------/

   if (button_id == 12)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_12_close_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_12_close_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_12_close_button_y_distance);
      
      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_12_close_button_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_12_close_button_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_12_close_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_12_close_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);
      
      button_text = "12:Close";
      
      ObjectSetText(button_name,button_text,dfm_12_close_button_font_size,dfm_12_close_button_font_name,dfm_12_close_button_font_color);
      return;
   }

//------------------------- Button 13 ("Close All") -------------------------/

   if (button_id == 13)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_all_close_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_all_close_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_all_close_button_y_distance);
      
      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_all_close_button_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_all_close_button_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_all_close_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_all_close_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);
      
      button_text = "Close All";
      
      ObjectSetText(button_name,button_text,dfm_all_close_button_font_size,dfm_all_close_button_font_name,dfm_all_close_button_font_color);
      return;
   }

//------------------------- Button 14 (Private obs_order_val "Only BUY") ---/

   if (button_id == 14)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_p_obs_buy_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_p_obs_buy_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_p_obs_buy_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_p_obs_buy_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_p_obs_buy_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (sbs_client_order_state.sbs_private_operational_data.obs_order_val == BUY_ORDER)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_buy_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_buy_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_buy_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_buy_button_bg_color_OFF);
      }
*/
      
      button_text = "Only BUY";

      ObjectSetText(button_name,button_text,dfm_p_obs_buy_button_font_size,dfm_p_obs_buy_button_font_name,dfm_p_obs_buy_button_font_color);

      return;
   }

//------------------------- Button 15 (Private obs_order_val "Only SELL") --/

   if (button_id == 15)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_p_obs_sell_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_p_obs_sell_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_p_obs_sell_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_p_obs_sell_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_p_obs_sell_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (sbs_client_order_state.sbs_private_operational_data.obs_order_val == SELL_ORDER)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_sell_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_sell_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_sell_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_sell_button_bg_color_OFF);
      }
*/
      
      button_text = "Only SELL";

      ObjectSetText(button_name,button_text,dfm_p_obs_sell_button_font_size,dfm_p_obs_sell_button_font_name,dfm_p_obs_sell_button_font_color);

      return;
   }

//------------------------- Button 16 ("05:TRADE") -------------------------/

   if (button_id == 16)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_05_trade_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_05_trade_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_05_trade_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_05_trade_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_05_trade_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (
            (sbs_triangle_client_order_data.client_order_descriptor[0].client_order[0].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[0].client_order[1].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[0].client_order[2].order_online.signal != NO_ORDER)
         )
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_05_trade_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_05_trade_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_05_trade_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_05_trade_button_bg_color_OFF);
      }
*/
      
      button_text = "05:TRADE";

      ObjectSetText(button_name,button_text,dfm_05_trade_button_font_size,dfm_05_trade_button_font_name,dfm_05_trade_button_font_color);

      return;
   }

//------------------------- Button 17 ("12:TRADE") -------------------------/

   if (button_id == 17)
   {
      ObjectSet(button_name,OBJPROP_CORNER,dfm_12_trade_button_corner);
      ObjectSet(button_name,OBJPROP_XDISTANCE,dfm_12_trade_button_x_distance);
      ObjectSet(button_name,OBJPROP_YDISTANCE,dfm_12_trade_button_y_distance);
      
      
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,dfm_12_trade_button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,dfm_12_trade_button_y_size);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

/*
      if (
            (sbs_triangle_client_order_data.client_order_descriptor[1].client_order[0].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[1].client_order[1].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[1].client_order[2].order_online.signal != NO_ORDER)
         )
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_12_trade_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_12_trade_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_12_trade_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_12_trade_button_bg_color_OFF);
      }
*/
      
      button_text = "12:TRADE";

      ObjectSetText(button_name,button_text,dfm_12_trade_button_font_size,dfm_12_trade_button_font_name,dfm_12_trade_button_font_color);

      return;
   }
   
/*
//--- Set Corner ---/

      ObjectSet(button_name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

//--- Set X Distance ---/

      button_x_distance = button_control_x_distance;
      
      if (
            (button_id == 11)                // "05:Close"
         )
      {
         ObjectSet(button_name,OBJPROP_CORNER,CORNER_RIGHT_LOWER);
         button_x_distance = (5 + (2 * 2.5 * 24));
      }
      
      if (
            (button_id == 12)                // "12:Close"
         )
      {
         ObjectSet(button_name,OBJPROP_CORNER,CORNER_RIGHT_LOWER);
         button_x_distance = (5 + (2.5 * 24));
      }

      ObjectSet(button_name,OBJPROP_XDISTANCE,button_x_distance);

//--- Set Y distance ---/

      ObjectSet(button_name,OBJPROP_YDISTANCE,button_y_distance);

//--- Set Button parameters ---/

      button_x_size = 25;
      
      if (
            (button_id == 11) ||
            (button_id == 12)
         )
      {
         button_x_size = (2.5 * 24);
      }

      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_om_gbtn_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_om_gbtn_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,button_x_size);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,13);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);
*/
//========================= Set Button Text ================================/
/*
//------------------------- Button 2 (free_margin_risk_value) --------------/

   if (button_id == 2)
   {
      ObjectSetText(button_name,"Ch",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 3 (order_risk_value) --------------------/
   
   if (button_id == 3)
   {
      ObjectSetText(button_name,"Ch",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 4 (Global open_order_flag) --------------/

   if (button_id == 4)
   {
      ObjectSetText(button_name,"Sw",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 5 (Global close_order_flag) -------------/

   if (button_id == 5)
   {
      ObjectSetText(button_name,"Sw",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 6 (Global sl_trail_order_flag) ----------/

   if (button_id == 6)
   {
      ObjectSetText(button_name,"Sw",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 8 (Private open_order_flag) -------------/

   if (button_id == 8)
   {
      ObjectSetText(button_name,"Sw",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 9 (Private close_order_flag) ------------/

   if (button_id == 9)
   {
      ObjectSetText(button_name,"Sw",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 10 (Private sl_trail_order_flag) --------/

   if (button_id == 10)
   {
      ObjectSetText(button_name,"Sw",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 11 ("05:Close") -------------------------/

   if (button_id == 11)
   {
      ObjectSetText(button_name,"05:Close",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }

//------------------------- Button 12 ("12:Close") -------------------------/

   if (button_id == 12)
   {
      ObjectSetText(button_name,"12:Close",button_control_font_size,button_control_font_name,button_control_font_color);
      return;
   }
*/
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Deinit_Control_Button ======================/

void     DFM_Deinit_Control_Button(int button_id)
{
string   button_name;

//--- Get Button Name ---/

      button_name = button_control_prefix + IntegerToString(button_id,0);

//--- Delete Button ---/
      
      ObjectDelete(button_name);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Indicate_Control_State =====================/

void     DFM_Indicate_Control_State()
{
//string   label_name;
//string   label_text;

string   button_name;
string   button_text;

//========================= LABELS =========================================/
/*
//------------------------- Control Label 1 ("GLOBAL" Section Header) ------/

   label_name = label_control_prefix + IntegerToString(1,0);
   
   label_text =   "Global Data"
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_font_color);

//------------------------- Control Label 2 (free_margin_risk_value) -------/

   label_name = label_control_prefix + IntegerToString(2,0);
   
   label_text =   "FMrgn Risk: " + DoubleToString(sbs_client_order_state.free_margin_risk_value,2)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_font_color);

//------------------------- Control Label 3 (order_risk_value) -------------/

   label_name = label_control_prefix + IntegerToString(3,0);
   
   label_text =   "ORisk: " + DoubleToString(sbs_client_order_state.order_risk_value,3)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_font_color);

//------------------------- Control Label 4 (Global open_order_flag) -------/

   label_name = label_control_prefix + IntegerToString(4,0);
   
   label_text =   "Open: " + SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_global_operational_data.open_order_flag)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_font_color);

//------------------------- Control Label 5 (Global close_order_flag) -------/

   label_name = label_control_prefix + IntegerToString(5,0);
   
   label_text =   "Close: " + SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_global_operational_data.close_order_flag)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_font_color);

//------------------------- Control Label 6 (Global sl_trail_order_flag) ---/

   label_name = label_control_prefix + IntegerToString(6,0);
   
   label_text =   "SL Trail: " + SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_font_color);

//------------------------- Control Label 7 ("PRIVATE" Section Header) -----/

   label_name = label_control_prefix + IntegerToString(7,0);
   
   label_text =   "Private Data"
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_P_font_color);

//------------------------- Control Label 8 (Private open_order_flag) ------/

   label_name = label_control_prefix + IntegerToString(8,0);
   
   label_text =   "Open: " + SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_private_operational_data.open_order_flag)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_P_font_color);

//------------------------- Control Label 9 (Private close_order_flag) ------/

   label_name = label_control_prefix + IntegerToString(9,0);
   
   label_text =   "Close: " + SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_private_operational_data.close_order_flag)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_P_font_color);

//------------------------- Control Label 10 (Private sl_trail_order_flag) -/

   label_name = label_control_prefix + IntegerToString(10,0);
   
   label_text =   "SL Trail: " + SBS_Client_Get_Flag_Name(sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag)
                  ;
   
   ObjectSetText(label_name,label_text,label_control_font_size,label_control_font_name,label_control_P_font_color);
*/
//========================= BUTTONS ========================================/

//------------------------- Button 2 (free_margin_risk_value) --------------/

      button_name = button_control_prefix + IntegerToString(2,0);
      
      button_text = "FMR:" + DoubleToString(sbs_client_order_state.free_margin_risk_value * 100,0) + "%";
      
      ObjectSetText(button_name,button_text,dfm_free_margin_risk_button_font_size,dfm_free_margin_risk_button_font_name,dfm_free_margin_risk_button_font_color);

//------------------------- Button 3 (order_risk_value) --------------------/

      button_name = button_control_prefix + IntegerToString(3,0);
      
      button_text = "OOR:" + DoubleToString(sbs_client_order_state.order_risk_value * 100,1) + "%";
      
      ObjectSetText(button_name,button_text,dfm_order_risk_button_font_size,dfm_order_risk_button_font_name,dfm_order_risk_button_font_color);

//------------------------- Button 4 (Global open_order_flag) --------------/

      button_name = button_control_prefix + IntegerToString(4,0);

      if (sbs_client_order_state.sbs_global_operational_data.open_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_open_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_open_order_flag_button_bg_color_ON);
         button_text = "GO:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_open_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_open_order_flag_button_bg_color_OFF);
         button_text = "GO:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_g_open_order_flag_button_font_size,dfm_g_open_order_flag_button_font_name,dfm_g_open_order_flag_button_font_color);

//------------------------- Button 5 (Global close_order_flag) -------------/

      button_name = button_control_prefix + IntegerToString(5,0);

      if (sbs_client_order_state.sbs_global_operational_data.close_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_close_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_close_order_flag_button_bg_color_ON);
         button_text = "GC:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_close_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_close_order_flag_button_bg_color_OFF);
         button_text = "GC:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_g_close_order_flag_button_font_size,dfm_g_close_order_flag_button_font_name,dfm_g_close_order_flag_button_font_color);

//------------------------- Button 6 (Global sl_trail_order_flag) ----------/

      button_name = button_control_prefix + IntegerToString(6,0);

      if (sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_sl_trail_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_sl_trail_order_flag_button_bg_color_ON);
         button_text = "GT:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_g_sl_trail_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_g_sl_trail_order_flag_button_bg_color_OFF);
         button_text = "GT:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_g_sl_trail_order_flag_button_font_size,dfm_g_sl_trail_order_flag_button_font_name,dfm_g_sl_trail_order_flag_button_font_color);

//------------------------- Button 8 (Private open_order_flag) -------------/

      button_name = button_control_prefix + IntegerToString(8,0);

      if (sbs_client_order_state.sbs_private_operational_data.open_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_open_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_open_order_flag_button_bg_color_ON);
         button_text = "PO:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_open_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_open_order_flag_button_bg_color_OFF);
         button_text = "PO:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_p_open_order_flag_button_font_size,dfm_p_open_order_flag_button_font_name,dfm_p_open_order_flag_button_font_color);

//------------------------- Button 9 (Private close_order_flag) ------------/

      button_name = button_control_prefix + IntegerToString(9,0);

      if (sbs_client_order_state.sbs_private_operational_data.close_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_close_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_close_order_flag_button_bg_color_ON);
         button_text = "PC:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_close_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_close_order_flag_button_bg_color_OFF);
         button_text = "PC:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_p_close_order_flag_button_font_size,dfm_p_close_order_flag_button_font_name,dfm_p_close_order_flag_button_font_color);

//------------------------- Button 10 (Private sl_trail_order_flag) --------/

      button_name = button_control_prefix + IntegerToString(10,0);

      if (sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_sl_trail_order_flag_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_sl_trail_order_flag_button_bg_color_ON);
         button_text = "PT:ON";
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_sl_trail_order_flag_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_sl_trail_order_flag_button_bg_color_OFF);
         button_text = "PT:OFF";
      }

      ObjectSetText(button_name,button_text,dfm_p_sl_trail_order_flag_button_font_size,dfm_p_sl_trail_order_flag_button_font_name,dfm_p_sl_trail_order_flag_button_font_color);

//------------------------- Button 14 (Private obs_order_val "Only BUY") ---/

      button_name = button_control_prefix + IntegerToString(14,0);

      if (sbs_client_order_state.sbs_private_operational_data.obs_order_val == BUY_ORDER)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_buy_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_buy_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_buy_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_buy_button_bg_color_OFF);
      }

//------------------------- Button 15 (Private obs_order_val "Only SELL") --/

      button_name = button_control_prefix + IntegerToString(15,0);

      if (sbs_client_order_state.sbs_private_operational_data.obs_order_val == SELL_ORDER)
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_sell_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_sell_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_p_obs_sell_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_p_obs_sell_button_bg_color_OFF);
      }

//------------------------- Button 16 ("05:TRADE") -------------------------/

      button_name = button_control_prefix + IntegerToString(16,0);

      if (
            (sbs_triangle_client_order_data.client_order_descriptor[0].client_order[0].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[0].client_order[1].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[0].client_order[2].order_online.signal != NO_ORDER)
         )
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_05_trade_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_05_trade_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_05_trade_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_05_trade_button_bg_color_OFF);
      }

//------------------------- Button 17 ("12:TRADE") -------------------------/

      button_name = button_control_prefix + IntegerToString(17,0);

      if (
            (sbs_triangle_client_order_data.client_order_descriptor[1].client_order[0].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[1].client_order[1].order_online.signal != NO_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[1].client_order[2].order_online.signal != NO_ORDER)
         )
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_12_trade_button_color_ON);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_12_trade_button_bg_color_ON);
      }
      else
      {
         ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_12_trade_button_color_OFF);
         ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_12_trade_button_bg_color_OFF);
      }

//--------------------------------------------------------------------------/

   return;
}

//========================= SBS_Client_Get_Flag_Name =======================/

string     SBS_Client_Get_Flag_Name(double flag_value)
{
string   flag_name;

   flag_name = "NDF";
   
   if (flag_value == SBS_CLIENT_FLAG_NOT_SET_VALUE)
   {
      flag_name = "OFF";
   }
   else
   {
      flag_name = "ON ";
   }

//--------------------------------------------------------------------------/

   return(flag_name);
}

//========================= SBS_Client_Play_Sound_Events ===================/

void     SBS_Client_Play_Sound_Events()
{
//--- change_sl_order_play_flag ---/

   if (sbs_play_sound_data.change_sl_order_play_flag == SBS_PLAY_SOUND_SET_FLAG)
   {
      sbs_play_sound_data.change_sl_order_play_flag = SBS_PLAY_SOUND_NO_FLAG;
      
      PlaySound(sbs_change_sl_order_sound_file);
   }

//--- close_order_play_flag ---/

   if (sbs_play_sound_data.close_order_play_flag == SBS_PLAY_SOUND_SET_FLAG)
   {
      sbs_play_sound_data.close_order_play_flag = SBS_PLAY_SOUND_NO_FLAG;
      
      PlaySound(sbs_close_order_sound_file);
   }

//--- open_order_play_flag ---/
   
   if (sbs_play_sound_data.open_order_play_flag == SBS_PLAY_SOUND_SET_FLAG)
   {
      sbs_play_sound_data.open_order_play_flag = SBS_PLAY_SOUND_NO_FLAG;
      
      PlaySound(sbs_open_order_sound_file);
   }

//--------------------------------------------------------------------------/

   return;
}

//==================== SBS_Triangle_Client_Indicate_TRG_Levels =============/

void     SBS_Triangle_Client_Indicate_TRG_Levels()
{
int      i;

double   trg_level[SBS_TRIANGLE_DESCRIPTOR_NUMBER];

//-------------------- Reset Levels ----------------------------------------/

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
      trg_level[i] = 0.0;
   }

//-------------------- Get trg_level ---------------------------------------/

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
      if (
            (
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state == SBS_TRIANGLE_ORDER_OPEN_STAGE_1) ||
               (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.state == SBS_TRIANGLE_ORDER_OPEN_STAGE_2)
            ) &&
            
            (sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.target != 0.0)
         )
      {
         trg_level[i] = sbs_triangle_client_order_data.client_order_descriptor[i].order_phf.target;
         trg_level[i] = NormalizeDouble(trg_level[i],Digits);
      }
   }

//-------------------- Indicate trg_level[0] -------------------------------/

   if (trg_level[0] == 0.0)
   {
      ObjectDelete(SBS_PATTERNS_TARGET_LINE_NAME_0);
   }
   else
   {
      if (ObjectFind(SBS_PATTERNS_TARGET_LINE_NAME_0) < 0)
      {
         ObjectCreate(0,SBS_PATTERNS_TARGET_LINE_NAME_0,OBJ_HLINE,0,0,trg_level[0]);
      
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_0,OBJPROP_COLOR,dfm_om_target_cind_color_0);
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_0,OBJPROP_STYLE,dfm_om_target_cind_lstyle_0);
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_0,OBJPROP_WIDTH,dfm_om_target_cind_width_0);
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_0,OBJPROP_BACK,true);
      }
      
      if (ObjectGet(SBS_PATTERNS_TARGET_LINE_NAME_0,OBJPROP_PRICE1) != trg_level[0])
      {
         ObjectSet(SBS_PATTERNS_TARGET_LINE_NAME_0,OBJPROP_PRICE1,trg_level[0]);
      }
   }

//-------------------- Indicate trg_level[1] -------------------------------/

   if (trg_level[1] == 0.0)
   {
      ObjectDelete(SBS_PATTERNS_TARGET_LINE_NAME_1);
   }
   else
   {
      if (ObjectFind(SBS_PATTERNS_TARGET_LINE_NAME_1) < 0)
      {
         ObjectCreate(0,SBS_PATTERNS_TARGET_LINE_NAME_1,OBJ_HLINE,0,0,trg_level[1]);
      
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_1,OBJPROP_COLOR,dfm_om_target_cind_color_1);
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_1,OBJPROP_STYLE,dfm_om_target_cind_lstyle_1);
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_1,OBJPROP_WIDTH,dfm_om_target_cind_width_1);
         ObjectSetInteger(0,SBS_PATTERNS_TARGET_LINE_NAME_1,OBJPROP_BACK,true);
      }
      
      if (ObjectGet(SBS_PATTERNS_TARGET_LINE_NAME_1,OBJPROP_PRICE1) != trg_level[1])
      {
         ObjectSet(SBS_PATTERNS_TARGET_LINE_NAME_1,OBJPROP_PRICE1,trg_level[1]);
      }
   }

//--------------------------------------------------------------------------/

   return;
}

//=== eof mbs_indication_client_library.mqh ================================/

