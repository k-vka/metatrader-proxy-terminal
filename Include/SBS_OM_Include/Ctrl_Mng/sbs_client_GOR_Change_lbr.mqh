//========================= sbs_client_GOR_Change_lbr.mqh ==================/

//========================= DFM_Init_GOR_Change_Indication =================/

void     DFM_Init_GOR_Change_Indication()
{
int      i;
string   label_name;
int      label_y_distance;

//---------------------------- Init Patters Labels -------------------------/

   label_y_distance = label_GOR_Change_y_distance;

   for (i = 1; i <= label_GOR_Change_number; i++)
   {
//--- Get Label Name ---/

      label_name = label_GOR_Change_prefix + IntegerToString(i,0);

//--- Delete Label ---/
      
      ObjectDelete(label_name);

//--- Create Label ---/

      ObjectCreate(label_name,OBJ_LABEL,0,0,0);

//--- Set Corner ---/

      ObjectSet(label_name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

//--- Set X Distance ---/

      ObjectSet(label_name,OBJPROP_XDISTANCE,label_GOR_Change_x_distance);

//--- Set Y distance ---/
   
      ObjectSet(label_name,OBJPROP_YDISTANCE,label_y_distance);
      
      label_y_distance = label_y_distance + label_GOR_Change_y_step;

//--- Reset Label Text ---/
      
      if (i == 1)    // Header
      {
         ObjectSetText(label_name,"New Open Order Risk",label_GOR_Change_font_size,label_GOR_Change_font_name,label_GOR_Change_font_color);
      }

   }
   
   DFM_Indicate_GOR_Change_State();
      
//--- Create BUTTONS ---/

   DFM_Init_GOR_Change_Button(1,label_y_distance - label_GOR_Change_y_step);    // "-"
   DFM_Init_GOR_Change_Button(2,label_y_distance - label_GOR_Change_y_step);    // "+"
   DFM_Init_GOR_Change_Button(3,label_y_distance);    // "Save"
   DFM_Init_GOR_Change_Button(4,label_y_distance);    // "Cancel"

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Indicate_GOR_Change_State ==================/

void     DFM_Indicate_GOR_Change_State()
{
string   label_name;

   label_name = label_GOR_Change_prefix + IntegerToString(2,0);
   
   ObjectSetText(label_name,DoubleToString(label_GOR_new_value,3),label_GOR_Change_font_size,label_GOR_Change_font_name,label_GOR_Change_font_color);

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Init_GOR_Change_Button =====================/

void     DFM_Init_GOR_Change_Button(int button_id, int button_y_distance)
{
string   button_name;

//--- Get Button Name ---/

      button_name = button_GOR_Change_prefix + IntegerToString(button_id,0);

//--- Delete Button ---/
      
      ObjectDelete(button_name);

//--- Create Button ---/

      ObjectCreate(button_name,OBJ_BUTTON,0,0,0);

//--- Set Corner ---/

      ObjectSet(button_name,OBJPROP_CORNER,CORNER_RIGHT_UPPER);

//--- Set X Distance ---/

      if (button_id == 1)
      {
         ObjectSet(button_name,OBJPROP_XDISTANCE,3 * button_GOR_Change_x_distance);
      }
      
      if (button_id == 2)
      {
         ObjectSet(button_name,OBJPROP_XDISTANCE,button_GOR_Change_x_distance);
      }
      
      if (button_id == 3)
      {
         ObjectSet(button_name,OBJPROP_XDISTANCE,2 * button_GOR_Change_x_distance);
      }
      
      if (button_id == 4)
      {
         ObjectSet(button_name,OBJPROP_XDISTANCE,button_GOR_Change_x_distance);
      }

//--- Set Y distance ---/
   
      ObjectSet(button_name,OBJPROP_YDISTANCE,button_y_distance);

//--- Set Button parameters ---/

      ObjectSetInteger(0,button_name,OBJPROP_COLOR,dfm_om_gbtn_color);
      ObjectSetInteger(0,button_name,OBJPROP_BGCOLOR,dfm_om_gbtn_bg_color);
      ObjectSetInteger(0,button_name,OBJPROP_XSIZE,50);
      ObjectSetInteger(0,button_name,OBJPROP_YSIZE,13);
      ObjectSetInteger(0,button_name,OBJPROP_SELECTABLE,0);

//--- Set Button Text ---/
      
//------------------------- Button 1 ("-") ---------------------------------/

   if (button_id == 1)
   {
      ObjectSetText(button_name,"-",button_GOR_Change_font_size,button_GOR_Change_font_name,button_GOR_Change_font_color);
      return;
   }

//------------------------- Button 2 ("+") ---------------------------------/
   
   if (button_id == 2)
   {
      ObjectSetText(button_name,"+",button_GOR_Change_font_size,button_GOR_Change_font_name,button_GOR_Change_font_color);
      return;
   }

//------------------------- Button 3 ("Save") ------------------------------/

   if (button_id == 3)
   {
      ObjectSetText(button_name,"Save",button_GOR_Change_font_size,button_GOR_Change_font_name,button_GOR_Change_font_color);
      return;
   }

//------------------------- Button 4 ("Cancel") ----------------------------/

   if (button_id == 4)
   {
      ObjectSetText(button_name,"Cancel",button_GOR_Change_font_size,button_GOR_Change_font_name,button_GOR_Change_font_color);
      return;
   }

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOR_Change_Button ==================/

void     DFM_Process_GOR_Change_Button(int button_id)
{
//------------------------- Button 1 ("-") ---------------------------------/

   if (button_id == 1)
   {
      DFM_Process_GOR_Change_Minus();
      return;
   }

//------------------------- Button 2 ("+") ---------------------------------/
   
   if (button_id == 2)
   {
      DFM_Process_GOR_Change_Plus();
      return;
   }

//------------------------- Button 3 ("Save") ------------------------------/

   if (button_id == 3)
   {
      DFM_Process_GOR_Change_Save();
      return;
   }

//------------------------- Button 4 ("Cancel") ----------------------------/

   if (button_id == 4)
   {
      DFM_Process_GOR_Change_Cancel();
      return;
   }

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOR_Change_Minus ==================/

void     DFM_Process_GOR_Change_Minus()
{
   label_GOR_new_value = label_GOR_new_value - SBS_CLIENT_ORDER_RISK_STEP;
   
   if (label_GOR_new_value < SBS_CLIENT_MIN_ORDER_RISK)
   {
      label_GOR_new_value = SBS_CLIENT_MIN_ORDER_RISK;
   }

//--- Indicate Updated Control State ---/
                  
   DFM_Indicate_GOR_Change_State();
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOR_Change_Plus ===================/

void     DFM_Process_GOR_Change_Plus()
{
   label_GOR_new_value = label_GOR_new_value + SBS_CLIENT_ORDER_RISK_STEP;
   
   if (label_GOR_new_value > SBS_CLIENT_MAX_ORDER_RISK)
   {
      label_GOR_new_value = SBS_CLIENT_MAX_ORDER_RISK;
   }

//--- Indicate Updated Control State ---/
                  
   DFM_Indicate_GOR_Change_State();
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOR_Change_Save ===================/

void     DFM_Process_GOR_Change_Save()
{
   sbs_client_order_state.order_risk_value = label_GOR_new_value;

   GlobalVariableSet(SBS_CLIENT_ORDER_RISK_GV_NAME,sbs_client_order_state.order_risk_value);
   
   DFM_Deinit_GOR_Change_Indication();
   
   DFM_Indicate_Control_State();
   
   WindowRedraw();
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Process_GOR_Change_Cancel =================/

void     DFM_Process_GOR_Change_Cancel()
{
   DFM_Deinit_GOR_Change_Indication();
   
//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Deinit_GOR_Change_Indication ==============/

void     DFM_Deinit_GOR_Change_Indication()
{
int      i;
string   label_name;
string   button_name;

//---------------------------- Deinit Labels -------------------------------/

   for (i = 1; i <= label_GOR_Change_number; i++)
   {
//--- Get Label Name ---/

      label_name = label_GOR_Change_prefix + IntegerToString(i,0);

//--- Delete Label ---/
      
      ObjectDelete(label_name);
   }

//---------------------------- Deinit Buttons ------------------------------/

   for (i = 1; i <= button_GOR_Change_number; i++)
   {
//--- Get Button Name ---/

      button_name = button_GOR_Change_prefix + IntegerToString(i,0);

//--- Delete Button ---/
      
      ObjectDelete(button_name);
   }
   
//--------------------------------------------------------------------------/

   return;
}

//========================= eof sbs_client_GOR_Change_lbr.mqh ==============/