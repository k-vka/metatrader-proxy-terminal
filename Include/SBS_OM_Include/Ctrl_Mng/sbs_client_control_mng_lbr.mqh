//========================= sbs_client_control_mng_lbr.mqh =================/

//========================= OnChartEvent() Buttons Processing ==============/

void OnChartEvent(const int id, const long &lparam, const double &dparam, const string &sparam)
{
int      i;

string   clickedChartObject;
string   button_name;

//------------------------- Check the Event by pressing a Mouse Button -----/

   if (id == CHARTEVENT_OBJECT_CLICK)
   {
//--- Get clickedChartObject ---/

      clickedChartObject = sparam;

//------------------------- Check for Control Buttons Processing -----------/
      
      for (i = 1; i <= button_control_number; i++)
      {
//--- Check for Control Buttons IDs ---/

         if (
               (i == 2) ||
               (i == 3) ||
               (i == 4) ||
               (i == 5) ||
               (i == 6) ||
               (i == 8) ||
               (i == 9) ||
               (i == 10) ||
               (i == 11) ||         // "05:Close"
               (i == 12) ||         // "12:Close"
               (i == 13) ||         // "Close All"
               (i == 14) ||         // "Only BUY"
               (i == 15)            // "Only SELL"
            )
         {
//--- Get Button Name ---/

            button_name = button_control_prefix + IntegerToString(i,0);
            
            if (clickedChartObject == button_name)
            {
               if ((bool) ObjectGetInteger(0,button_name,OBJPROP_STATE) == true)    // if "button pressed"
               {
                  Sleep(100);
                  ObjectSetInteger(0,button_name,OBJPROP_STATE,false);
                  WindowRedraw();
                  
//--- Process Control Button ---/

                  DFM_Process_Control_Button(i);

//--- Indicate Updated Control State ---/
                  
                  DFM_Indicate_Control_State();

//--- Redraw Chart Window ---/

                  WindowRedraw();
                  
                  return;
               }
            }
         }
         else
         {
            continue;
         }
      }        // EOF Check for Control Buttons Processing
      
//------------------------- Check for GFMR_Change Buttons Processing -------/
      
      for (i = 1; i <= button_GFMR_Change_number; i++)
      {
//--- Get Button Name ---/

            button_name = button_GFMR_Change_prefix + IntegerToString(i,0);
            
            if (clickedChartObject == button_name)
            {
               if ((bool) ObjectGetInteger(0,button_name,OBJPROP_STATE) == true)    // if "button pressed"
               {
                  Sleep(100);
                  ObjectSetInteger(0,button_name,OBJPROP_STATE,false);
                  WindowRedraw();
                  
//--- Process Control Button ---/

                  DFM_Process_GFMR_Change_Button(i);

//--- Redraw Chart Window ---/

                  WindowRedraw();
                  
                  return;
               }
            }

      }        // EOF Check for GFMR_Change Buttons Processing

//------------------------- Check for GOR_Change Buttons Processing --------/
      
      for (i = 1; i <= button_GOR_Change_number; i++)
      {
//--- Get Button Name ---/

            button_name = button_GOR_Change_prefix + IntegerToString(i,0);
            
            if (clickedChartObject == button_name)
            {
               if ((bool) ObjectGetInteger(0,button_name,OBJPROP_STATE) == true)    // if "button pressed"
               {
                  Sleep(100);
                  ObjectSetInteger(0,button_name,OBJPROP_STATE,false);
                  WindowRedraw();
                  
//--- Process Control Button ---/

                  DFM_Process_GOR_Change_Button(i);

//--- Redraw Chart Window ---/

                  WindowRedraw();
                  
                  return;
               }
            }

      }        // EOF Check for GFMR_Change Buttons Processing
      
   }

//-------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_Control_Button ======================/

void     DFM_Process_Control_Button(int button_id)
{
//------------------------- Button 2 (free_margin_risk_value) --------------/

   if (button_id == 2)
   {
      DFM_Denit_Sub_Control_Indication();
      
      DFM_Process_GFMR_Change();
      
      return;
   }

//------------------------- Button 3 (order_risk_value) --------------------/
   
   if (button_id == 3)
   {
      DFM_Denit_Sub_Control_Indication();
      
      DFM_Process_GOR_Change();
      
      return;
   }

//------------------------- Button 4 (Global open_order_flag) --------------/

   if (button_id == 4)
   {
      DFM_Process_GOOF_Switch();
      return;
   }

//------------------------- Button 5 (Global close_order_flag) -------------/

   if (button_id == 5)
   {
      DFM_Process_GCOF_Switch();
      return;
   }

//------------------------- Button 6 (Global sl_trail_order_flag) ----------/

   if (button_id == 6)
   {
      DFM_Process_GSLTOF_Switch();
      return;
   }

//------------------------- Button 8 (Private open_order_flag) -------------/

   if (button_id == 8)
   {
      DFM_Process_POOF_Switch();
      return;
   }

//------------------------- Button 9 (Private close_order_flag) ------------/

   if (button_id == 9)
   {
      DFM_Process_PCOF_Switch();
      return;
   }

//------------------------- Button 10 (Private sl_trail_order_flag) --------/

   if (button_id == 10)
   {
      DFM_Process_PSLTOF_Switch();
      return;
   }

//------------------------- Button 11 ("05:Close") ------------------/

   if (button_id == 11)
   {
      DFM_Triangle_Process_Close_05_Order_Button();
      return;
   }

//------------------------- Button 12 ("12:Close") ------------------/

   if (button_id == 12)
   {
      DFM_Triangle_Process_Close_12_Order_Button();
      return;
   }

//------------------------- Button 13 ("Close All") ------------------/

   if (button_id == 13)
   {
      DFM_Triangle_Process_Close_All_Order_Button();
      return;
   }

//------------------------- Button 14 (Private obs_order_val "Only BUY") ---/

   if (button_id == 14)
   {
      if (sbs_client_order_state.sbs_private_operational_data.obs_order_val == BUY_ORDER)
      {
         sbs_client_order_state.sbs_private_operational_data.obs_order_val = SBS_CLIENT_FLAG_NOT_SET_VALUE;
      }
      else
      {
         sbs_client_order_state.sbs_private_operational_data.obs_order_val = BUY_ORDER;
      }
      
      DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.obs_order_val,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_OBS_VAL_GV_NAME);

      return;
   }

//------------------------- Button 15 (Private obs_order_val "Only SELL") --/

   if (button_id == 15)
   {
      if (sbs_client_order_state.sbs_private_operational_data.obs_order_val == SELL_ORDER)
      {
         sbs_client_order_state.sbs_private_operational_data.obs_order_val = SBS_CLIENT_FLAG_NOT_SET_VALUE;
      }
      else
      {
         sbs_client_order_state.sbs_private_operational_data.obs_order_val = SELL_ORDER;
      }
      
      DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.obs_order_val,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_OBS_VAL_GV_NAME);

      return;
   }

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GFMR_Change ========================/

void     DFM_Process_GFMR_Change()
{
   label_GFMR_new_value = sbs_client_order_state.free_margin_risk_value;
   
   DFM_Init_GFMR_Change_Indication();

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOR_Change =========================/

void     DFM_Process_GOR_Change()
{
   label_GOR_new_value = sbs_client_order_state.order_risk_value;
   
   DFM_Init_GOR_Change_Indication();
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOOF_Switch ========================/

void     DFM_Process_GOOF_Switch()
{
//--- Switch Flag ---/

   if (sbs_client_order_state.sbs_global_operational_data.open_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
   {
      sbs_client_order_state.sbs_global_operational_data.open_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
   }
   else
   {
      sbs_client_order_state.sbs_global_operational_data.open_order_flag = SBS_CLIENT_FLAG_SET_VALUE;
   }

//--- Set Terminal Global Variable ---/
   
   DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_global_operational_data.open_order_flag,SBS_CLIENT_OPEN_ORDER_FLAG_GV_NAME);
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GCOF_Switch ========================/

void     DFM_Process_GCOF_Switch()
{
//--- Switch Flag ---/

   if (sbs_client_order_state.sbs_global_operational_data.close_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
   {
      sbs_client_order_state.sbs_global_operational_data.close_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
   }
   else
   {
      sbs_client_order_state.sbs_global_operational_data.close_order_flag = SBS_CLIENT_FLAG_SET_VALUE;
   }

//--- Set Terminal Global Variable ---/
   
   DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_global_operational_data.close_order_flag,SBS_CLIENT_CLOSE_ORDER_FLAG_GV_NAME);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GSLTOF_Switch ======================/

void     DFM_Process_GSLTOF_Switch()
{
//--- Switch Flag ---/

   if (sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
   {
      sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
   }
   else
   {
      sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag = SBS_CLIENT_FLAG_SET_VALUE;
   }

//--- Set Terminal Global Variable ---/
   
   DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag,SBS_CLIENT_SL_TRAIL_ORDER_FLAG_GV_NAME);
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_POOF_Switch ========================/

void     DFM_Process_POOF_Switch()
{
//--- Switch Flag ---/

   if (sbs_client_order_state.sbs_private_operational_data.open_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
   {
      sbs_client_order_state.sbs_private_operational_data.open_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
   }
   else
   {
      sbs_client_order_state.sbs_private_operational_data.open_order_flag = SBS_CLIENT_FLAG_SET_VALUE;
   }

//--- Set Terminal Global Variable ---/
   
   DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.open_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_OPEN_ORDER_FLAG_GV_NAME);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_PCOF_Switch ========================/

void     DFM_Process_PCOF_Switch()
{
//--- Switch Flag ---/

   if (sbs_client_order_state.sbs_private_operational_data.close_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
   {
      sbs_client_order_state.sbs_private_operational_data.close_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
   }
   else
   {
      sbs_client_order_state.sbs_private_operational_data.close_order_flag = SBS_CLIENT_FLAG_SET_VALUE;
   }

//--- Set Terminal Global Variable ---/
   
   DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.close_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_CLOSE_ORDER_FLAG_GV_NAME);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_PSLTOF_Switch ======================/

void     DFM_Process_PSLTOF_Switch()
{
//--- Switch Flag ---/

   if (sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag == SBS_CLIENT_FLAG_SET_VALUE)
   {
      sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
   }
   else
   {
      sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag = SBS_CLIENT_FLAG_SET_VALUE;
   }

//--- Set Terminal Global Variable ---/
   
   DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_SL_TRAIL_ORDER_FLAG_GV_NAME);
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_Close_One_Order_Button =============/

void     DFM_Process_Close_One_Order_Button()
{
int      i;
int      order_type;
string   message_box_string;

//--- Seek for the first open order ---/

   order_type = -1;

   for (i = 0; i < SBS_CLIENT_MAX_ORDER_TYPES ; i++)
   {
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER) ||
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER)
         )
      {
         order_type = i;
         break;
      }
   }

//--- No Open Order found ---/
   
   if (order_type < 0)
   {
      MessageBox("No Open Order Found", "Close Order Notification: " + Symbol() + "_" + WindowExpertName() + "_" + Period(),MB_OK|MB_ICONEXCLAMATION);
      return;
   }

//--- Open Order found ---/
   
   if (
         (order_type >= 0) ||
         (order_type < SBS_CLIENT_MAX_ORDER_TYPES)
      )
   {
      message_box_string = "CLOSE ORDER Type " + IntegerToString(order_type,0) + "; " +
                           DFM_Order_Signal_Name(sbs_client_order_state.sbs_open_order[order_type].signal) + "; " +
                           "Ticket " + IntegerToString(sbs_client_order_state.sbs_open_order[order_type].ticket,0) + ";\n" +
                           "Open Flag will set OFF";
      
//--- Close Order NOT CONFIRMED ---/

      if (MessageBox(message_box_string, "Close Order Confirmation: " + Symbol() + " " + Period() + " " + WindowExpertName(),MB_OKCANCEL|MB_ICONQUESTION) != IDOK)
      {
         return;
      }

//--- Close Order CONFIRMED ---/

      SBS_Client_OM_Close_Order(order_type);
      
      sbs_client_order_state.sbs_private_operational_data.open_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
      
      return;
   }

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_Close_Both_Orders_Button ===========/

void     DFM_Process_Close_Both_Orders_Button()
{
int      i;
int      order_number;
string   message_box_string;

//--- Count open orders ---/

   order_number = 0;

   for (i = 0; i < SBS_CLIENT_MAX_ORDER_TYPES ; i++)
   {
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER) ||
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER)
         )
      {
         order_number = order_number + 1;
      }
   }

//--- No Open Order found ---/
   
   if (order_number == 0)
   {
      MessageBox("No Open Order Found", "Close Order Notification: " + Symbol() + "_" + WindowExpertName() + "_" + Period(),MB_OK|MB_ICONEXCLAMATION);
      return;
   }

//--- Open Orders found ---/

   message_box_string = "";

   for (i = 0; i < SBS_CLIENT_MAX_ORDER_TYPES ; i++)
   {
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER) ||
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER)
         )
      {
         message_box_string = message_box_string + "CLOSE ORDER Type " + IntegerToString(i,0) + "; " +
                           DFM_Order_Signal_Name(sbs_client_order_state.sbs_open_order[i].signal) + "; " +
                           "Ticket " + IntegerToString(sbs_client_order_state.sbs_open_order[i].ticket,0) + ";\n";
      }
   }
   
   message_box_string = message_box_string + "Open Flag will set OFF";
      
//--- Close Order NOT CONFIRMED ---/

   if (MessageBox(message_box_string, "Close Orders Confirmation: " + Symbol() + " " + Period() + " " + WindowExpertName(),MB_OKCANCEL|MB_ICONQUESTION) != IDOK)
   {
      return;
   }

//--- Close Order CONFIRMED ---/

   for (i = 0; i < SBS_CLIENT_MAX_ORDER_TYPES ; i++)
   {
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER) ||
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER)
         )
      {
         SBS_Client_OM_Close_Order(i);
      }
   }
   
   sbs_client_order_state.sbs_private_operational_data.open_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Triangle_Process_Close_05_Order_Button =====/

void     DFM_Triangle_Process_Close_05_Order_Button()
{
   DFM_Triangle_Process_Close_Descriptor_Order(0);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Triangle_Process_Close_12_Order_Button =====/

void     DFM_Triangle_Process_Close_12_Order_Button()
{
   DFM_Triangle_Process_Close_Descriptor_Order(1);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Triangle_Process_Close_All_Order_Button ====/

void     DFM_Triangle_Process_Close_All_Order_Button()
{
   DFM_Triangle_Process_Close_Descriptor_Order(0);
   DFM_Triangle_Process_Close_Descriptor_Order(1);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Triangle_Process_Close_Descriptor_Order ====/

void     DFM_Triangle_Process_Close_Descriptor_Order(int descriptor_no)
{
int      j;
int      order_number;
string   message_box_string;

int      local_open_flag;

//--- Reset local_open_flag ---/

   local_open_flag = 0;

//--- Setet local_open_flag ---/

   if (
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[0].order_online.signal == SELL_ORDER) ||
         (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[0].order_online.signal == BUY_ORDER)
      )
   {
      local_open_flag = 1;
   }

//--- Count open orders ---/

   order_number = 0;

   for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
   {
      if (
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.signal == SELL_ORDER) ||
            (sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.signal == BUY_ORDER)
         )
      {
         order_number = order_number + 1;
      }
   }

//--- No Open Order found ---/
   
   if (order_number == 0)
   {
      MessageBox("No Open Order Found", "Close Order Notification: " + Symbol() + "_" + WindowExpertName() + "_" + Period(),MB_OK|MB_ICONEXCLAMATION);
      return;
   }

//--- Open Orders found ---/

   message_box_string = "Descriptor " + IntegerToString(descriptor_no,0);

   if (descriptor_no == 0)                            // 34-5-5
   {
      message_box_string = "Close ALL Orders [34-05-05]:\n";
   }
   
   if (descriptor_no == 1)                            // 34-12-12
   {
      message_box_string = "Close ALL Orders [34-12-12]:\n";
   }

   for (j = 0; j < SBS_TRIANGLE_DESCRIPTOR_ASSOCIATE_ORDER_NUMBER; j++)
   {
         message_box_string = message_box_string + "Order #" + IntegerToString(j,0) + ": " +
                           DFM_Order_Signal_Name(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.signal) + ", " +
                           IntegerToString(sbs_triangle_client_order_data.client_order_descriptor[descriptor_no].client_order[j].order_online.ticket,0) + "\n";
   }
   
   if (local_open_flag != 0)
   {
      message_box_string = message_box_string + "Local Open Order Flag will be set [OFF]";
   }
      
//--- Close Order NOT CONFIRMED ---/

   if (MessageBox(message_box_string, "Close Orders Confirmation: " + Symbol() + " " + Period() + " " + WindowExpertName(),MB_OKCANCEL|MB_ICONQUESTION) != IDOK)
   {
      return;
   }

//--- Close Order CONFIRMED ---/

   SBS_Triangle_Client_OM_Close_Order(descriptor_no,SBS_TRIANGLE_ORDER_OPEN_STAGE_3);                    // Close all orders

//--- Check if set open_order_flag to SBS_CLIENT_FLAG_NOT_SET_VALUE ---/
   
   if (local_open_flag != 0)
   {
      sbs_client_order_state.sbs_private_operational_data.open_order_flag = SBS_CLIENT_FLAG_NOT_SET_VALUE;
      
      DFM_Set_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.open_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_OPEN_ORDER_FLAG_GV_NAME);
   }

//--------------------------------------------------------------------------/

   return;
}

//========================= eof sbs_client_control_mng_lbr.mqh =============/

