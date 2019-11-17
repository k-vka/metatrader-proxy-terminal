//======================= sbs_client_cfg_mng_lbr.mqh =====================/

//========================= DFM_Init_Control_State =======================/

void     DFM_Init_Control_State()
{
//------------------------- DFM_Get_Terminal_Global_data -----------------/

   DFM_Get_Terminal_Global_data();

//------------------------- DFM_Get_Expert_Private_data ------------------/

   DFM_Get_Expert_Private_data();

//------------------------------------------------------------------------/

   return;
}

//========================= DFM_Get_Terminal_Global_data =================/

void     DFM_Get_Terminal_Global_data()
{
//-------------------------- Global free_margin_risk_value ---------------------/

   sbs_client_order_state.free_margin_risk_value = SBS_CLIENT_DEFAULT_FREE_MRG_RISK;

   if (GlobalVariableCheck(SBS_CLIENT_FREE_MRG_RISK_GV_NAME) == true)
   {
      if (GlobalVariableGet(SBS_CLIENT_FREE_MRG_RISK_GV_NAME,sbs_client_order_state.free_margin_risk_value) == true)
      {
         if (sbs_client_order_state.free_margin_risk_value < SBS_CLIENT_MIN_FREE_MRG_RISK)
         {
            sbs_client_order_state.free_margin_risk_value = SBS_CLIENT_MIN_FREE_MRG_RISK;
         }
         
         if (sbs_client_order_state.free_margin_risk_value > SBS_CLIENT_MAX_FREE_MRG_RISK)
         {
            sbs_client_order_state.free_margin_risk_value = SBS_CLIENT_MAX_FREE_MRG_RISK;
         }
      }
      else
      {
         sbs_client_order_state.free_margin_risk_value = SBS_CLIENT_DEFAULT_FREE_MRG_RISK;
      }
   }
   else
   {
      GlobalVariableSet(SBS_CLIENT_FREE_MRG_RISK_GV_NAME,sbs_client_order_state.free_margin_risk_value);
   }
   
//-------------------------- Global order_risk_value ---------------------/

   sbs_client_order_state.order_risk_value = SBS_CLIENT_DEFAULT_ORDER_RISK;

   if (GlobalVariableCheck(SBS_CLIENT_ORDER_RISK_GV_NAME) == true)
   {
      if (GlobalVariableGet(SBS_CLIENT_ORDER_RISK_GV_NAME,sbs_client_order_state.order_risk_value) == true)
      {
         if (sbs_client_order_state.order_risk_value < SBS_CLIENT_MIN_ORDER_RISK)
         {
            sbs_client_order_state.order_risk_value = SBS_CLIENT_MIN_ORDER_RISK;
         }
         
         if (sbs_client_order_state.order_risk_value > SBS_CLIENT_MAX_ORDER_RISK)
         {
            sbs_client_order_state.order_risk_value = SBS_CLIENT_MAX_ORDER_RISK;
         }
      }
      else
      {
         sbs_client_order_state.order_risk_value = SBS_CLIENT_DEFAULT_ORDER_RISK;
      }
   }
   else
   {
      GlobalVariableSet(SBS_CLIENT_ORDER_RISK_GV_NAME,sbs_client_order_state.order_risk_value);
   }

//-------------------------- Global open_order_flag ----------------------/

   DFM_Get_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_global_operational_data.open_order_flag,SBS_CLIENT_OPEN_ORDER_FLAG_GV_NAME);

//-------------------------- Global close_order_flag ---------------------/

   DFM_Get_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_global_operational_data.close_order_flag,SBS_CLIENT_CLOSE_ORDER_FLAG_GV_NAME);

//-------------------------- Global sl_trail_order_flag ------------------/

   DFM_Get_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag,SBS_CLIENT_SL_TRAIL_ORDER_FLAG_GV_NAME);

//------------------------------------------------------------------------/

   return;
}

//========================= DFM_Get_Expert_Private_data ==================/

void     DFM_Get_Expert_Private_data()
{
//-------------------------- Private open_order_flag ---------------------/

   DFM_Get_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.open_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_OPEN_ORDER_FLAG_GV_NAME);

//-------------------------- Private close_order_flag --------------------/

   DFM_Get_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.close_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_CLOSE_ORDER_FLAG_GV_NAME);

//-------------------------- Private sl_trail_order_flag -----------------/

   DFM_Get_Terminal_Global_FLAG_data(sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_SL_TRAIL_ORDER_FLAG_GV_NAME);

//-------------------------- Private obs_order_val -------------------------/

   DFM_Get_Terminal_Global_VAL_data(sbs_client_order_state.sbs_private_operational_data.obs_order_val,WindowExpertName() + 
                                                                                                         "_" + SBS_CLIENT_OBS_VAL_GV_NAME);
//------------------------------------------------------------------------/

   return;
}

//========================= DFM_Get_Terminal_Global_FLAG_data ============/

void     DFM_Get_Terminal_Global_FLAG_data(double &flag_value, string gv_flag_name)
{
   flag_value = SBS_CLIENT_FLAG_SET_VALUE;

   if (GlobalVariableCheck(gv_flag_name) == true)
   {
      if (GlobalVariableGet(gv_flag_name,flag_value) == true)
      {
         if (flag_value != SBS_CLIENT_FLAG_NOT_SET_VALUE)
         {
            flag_value = SBS_CLIENT_FLAG_SET_VALUE;
         }
      }
      else
      {
         flag_value = SBS_CLIENT_FLAG_SET_VALUE;
      }
   }
   else
   {
      GlobalVariableSet(gv_flag_name,flag_value);
   }

//--------------------------------------------------------------------------/

   return;
}

//========================= DFM_Get_Terminal_Global_VAL_data ===============/

void     DFM_Get_Terminal_Global_VAL_data(double &data_value, string gv_val_name)
{
   data_value = SBS_CLIENT_FLAG_NOT_SET_VALUE;

   if (GlobalVariableCheck(gv_val_name) == true)
   {
      if (GlobalVariableGet(gv_val_name,data_value) == true)
      {
         if (
               (data_value != BUY_ORDER) &&
               (data_value != SELL_ORDER)
            )
         {
            data_value = SBS_CLIENT_FLAG_NOT_SET_VALUE;
         }
      }
      else
      {
         data_value = SBS_CLIENT_FLAG_NOT_SET_VALUE;
      }
   }
   else
   {
      GlobalVariableSet(gv_val_name,data_value);
   }

//------------------------------------------------------------------------/

   return;
}

//========================= DFM_Set_Terminal_Global_FLAG_data ============/

void     DFM_Set_Terminal_Global_FLAG_data(double &flag_value, string gv_flag_name)
{
   GlobalVariableSet(gv_flag_name,flag_value);

//------------------------------------------------------------------------/

   return;
}

//======================= eof sbs_client_cfg_mng_lbr.mqh =================/
