//======================= sbs_client_om_lbr.mql ==========================/

//========================= Init_SBS_Client_Order_Management =============/

void     Init_SBS_Client_Order_Management()
{
int      i;

//------------------------- Reset sbs_client_order_state -----------------/

   sbs_client_order_state.order_session_id     = -1;        // form 0 to 99 in Process
   sbs_client_order_state.operation_label_data = "";
   sbs_client_order_state.sequence_object_no   = 0;
   
   for (i = 0; i < SBS_CLIENT_MAX_ORDER_TYPES; i++)
   {
//--- sbs_phf_order ---/

      sbs_client_order_state.sbs_phf_order[i].signal      = NO_ORDER;
      sbs_client_order_state.sbs_phf_order[i].order_price = 0;
      sbs_client_order_state.sbs_phf_order[i].stoploss    = 0;
      sbs_client_order_state.sbs_phf_order[i].order_time  = 0;

//--- sbs_open_order ---/

      sbs_client_order_state.sbs_open_order[i].signal      = NO_ORDER;
      sbs_client_order_state.sbs_open_order[i].order_price = 0;
      sbs_client_order_state.sbs_open_order[i].stoploss    = 0;
      sbs_client_order_state.sbs_open_order[i].order_time  = 0;
      
      sbs_client_order_state.sbs_open_order[i].order_session_id               = -1;
      
      sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal      = NO_ORDER;
      sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.order_price = 0;
      sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.stoploss    = 0;
      sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.order_time  = 0;
   }
   
//------------------------------------------------------------------------/

   return;
}

//========================= DFM_Client_Process_PHF_Trade_Signal ==========/

int     DFM_Client_Process_PHF_Trade_Signal(string phf_r_signal)
{
int      r_code;
int      i;

ushort   field_sep;
string   message_field[];
int      field_number;

string   t_str;

//int      t_mon;
int      t_day;
int      t_hour;
int      t_min;

//datetime current_time;
//MqlDateTime current_mql_time;

MqlDateTime t_mql_time;

//sbs_client_order_state_struct    rco_state;

sbs_triangle_client_order_PHF_structure   resp_pfh_data[SBS_TRIANGLE_DESCRIPTOR_NUMBER];

string      work_str;

//------------------------- Reset r_code ---------------------------------/

   r_code = 0;

//------------------------- Process phf_r_signal -------------------------/

//--- Get phf_r_signal fields ---/

   field_sep = StringGetCharacter(DFM_FLD_DELIMETER,0);

   field_number = StringSplit(phf_r_signal,field_sep,message_field);

//--- Check field_number ---/
   
   if (field_number != 8)           // was 9
   {
      r_code = 1;
      
      Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + 
                                                 ", field_number=" + IntegerToString(field_number,0) + ", phf_r_signal=(" + phf_r_signal + ")"); 
      return(r_code);
   }

//--- order_session_id ---/
/*
   rco_state.order_session_id = StringToInteger(message_field[0]);
   
   if (
         (rco_state.order_session_id <  0) ||
         (rco_state.order_session_id > 99)
      )
   {
      r_code = 2;
      
      Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + 
                                             ", order_session_id=" + IntegerToString(rco_state.order_session_id,0) + ", message_field[0]=(" + message_field[0] + ")"); 
      return(r_code);
   }
*/
//--- Process sbs_phf_order for Each Descriptor ---/

   for (i = 0; i < SBS_TRIANGLE_DESCRIPTOR_NUMBER; i++)
   {
//--- signal ---/
/*
      rco_state.sbs_phf_order[i].signal = StringToInteger(message_field[1 + (i * 4)]);
      
      if (
            (rco_state.sbs_phf_order[i].signal != NO_ORDER) &&
            (rco_state.sbs_phf_order[i].signal != SELL_ORDER) &&
            (rco_state.sbs_phf_order[i].signal != BUY_ORDER) &&
            (rco_state.sbs_phf_order[i].signal != CLOSE_SELL_ORDER) &&
            (rco_state.sbs_phf_order[i].signal != CLOSE_BUY_ORDER) &&
            
            (rco_state.sbs_phf_order[i].signal != MODIFY_SELL_ORDER) &&
            (rco_state.sbs_phf_order[i].signal != MODIFY_BUY_ORDER)
         )
      {
         r_code = 3;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + ", i=" + IntegerToString(i,0) +
                                                          ", signal=" + IntegerToString(rco_state.sbs_phf_order[i].signal,0) + 
                                                ", message_field[1]=(" + message_field[1 + (i * 4)] + ")"); 
         return(r_code);
      }
*/
      work_str = StringSubstr(message_field[0 + (i * 4)],0,1);
      
      resp_pfh_data[i].signal = StringToInteger(work_str);
      
      if (
            (resp_pfh_data[i].signal != NO_ORDER) &&
            (resp_pfh_data[i].signal != SELL_ORDER) &&
            (resp_pfh_data[i].signal != BUY_ORDER)
         )
      {
         r_code = 3;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + ", descr_no=" + IntegerToString(i,0) +
                                                          ", signal=" + work_str); 
         return(r_code);
      }

//--- state ---/

      work_str = StringSubstr(message_field[0 + (i * 4)],1,1);
      
      resp_pfh_data[i].state = StringToInteger(work_str);
      
      if (
            (resp_pfh_data[i].state != SBS_TRIANGLE_ORDER_NO_STATE) &&
            (resp_pfh_data[i].state != SBS_TRIANGLE_ORDER_OPEN_STAGE_1) &&
            (resp_pfh_data[i].state != SBS_TRIANGLE_ORDER_OPEN_STAGE_2) &&
            (resp_pfh_data[i].state != SBS_TRIANGLE_ORDER_OPEN_STAGE_3)
         )
      {
         r_code = 4;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + ", descr_no=" + IntegerToString(i,0) +
                                                          ", state=" + work_str); 
         return(r_code);
      }

//--- order_price ---/
/*
      rco_state.sbs_phf_order[i].order_price = StringToDouble(message_field[2 + (i * 4)]);

//--- stoploss ---/

      rco_state.sbs_phf_order[i].stoploss = StringToDouble(message_field[4 + (i * 4)]);
*/
//------ order_time ------/

//      t_str = message_field[3 + (i * 4)];

//--- t_mon ---/
/*
      t_mon = StringToInteger(StringSubstr(t_str,0,2));
   
      if (
            (t_mon <  1) ||
            (t_mon > 12)
         )
      {
         r_code = 4;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + 
                                                           ", t_mon=" + IntegerToString(t_mon,0) + ", t_str=(" + t_str + ")"); 
         return(r_code);
      }
*/
//--- t_day (day_of_week) ---/

//      t_day = StringToInteger(StringSubstr(t_str,2,2));

      work_str = StringSubstr(message_field[0 + (i * 4)],2,1);
      
      t_day = StringToInteger(work_str);
   
      if (
            (t_day < 0) ||
            (t_day > 6)
         )
      {
         r_code = 5;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + 
                                                           ", t_day=" + IntegerToString(t_day,0) + ", t_str=(" + t_str + ")"); 
         return(r_code);
      }

//--- t_hour ---/

//      t_hour = StringToInteger(StringSubstr(t_str,4,2));

      work_str = StringSubstr(message_field[0 + (i * 4)],3,2);
      
      t_hour = StringToInteger(work_str);
   
      if (
            (t_hour <  0) ||
            (t_hour > 24)
         )
      {
         r_code = 6;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + 
                                                          ", t_hour=" + IntegerToString(t_hour,0) + ", t_str=(" + t_str + ")"); 
         return(r_code);
      }

//--- t_min ---/

//      t_min = StringToInteger(StringSubstr(t_str,6,2));

      work_str = StringSubstr(message_field[0 + (i * 4)],5,2);
      
      t_min = StringToInteger(work_str);
   
      if (
            (t_min <  0) ||
            (t_min > 59)
         )
      {
         r_code = 7;
      
         Print("DFM_Client_Process_PHF_Trade_Signal() ERROR: r_code=" + IntegerToString(r_code,0) + 
                                                           ", t_min=" + IntegerToString(t_min,0) + ", t_str=(" + t_str + ")"); 
         return(r_code);
      }

//--- order_time ---/

//      current_time = TimeCurrent(current_mql_time);
//      t_mql_time.year = current_mql_time.year;

      t_mql_time.year = 2000;
      
      t_mql_time.mon  = 1;
      t_mql_time.day  = t_day;
      t_mql_time.hour = t_hour;
      t_mql_time.min  = t_min;
      t_mql_time.sec  = 0;
      
//      t_mql_time.day_of_week = t_day;
//      t_mql_time.day_of_year = current_mql_time.day_of_year;

//      t_mql_time.day_of_week = 1;
//      t_mql_time.day_of_year = 1;
      
//      if (StructToTime(t_mql_time) > current_time)       // END OF YEAR SIGNAL CASE
//      {
//         t_mql_time.year = t_mql_time.year - 1;
//      }
      
//      rco_state.sbs_phf_order[i].order_time = StructToTime(t_mql_time);
      
      resp_pfh_data[i].synch_time = StructToTime(t_mql_time);

//--- order_price ---/

//      rco_state.sbs_phf_order[i].order_price = StringToDouble(message_field[2 + (i * 4)]);
      
      work_str = message_field[1 + (i * 4)];   
      
      resp_pfh_data[i].price = StringToDouble(work_str); 

//--- stoploss ---/

//      rco_state.sbs_phf_order[i].stoploss = StringToDouble(message_field[4 + (i * 4)]);

      work_str = message_field[2 + (i * 4)];   
      
      resp_pfh_data[i].stoploss = StringToDouble(work_str); 

//--- target ---/

      work_str = message_field[3 + (i * 4)];   
      
      resp_pfh_data[i].target = StringToDouble(work_str); 

   }

//------------------------- Update sbs_client_order_state ----------------/

//   DFM_Client_Update_Order_State(sbs_client_order_state, rco_state);

   DFM_Triangle_Client_Update_PHF_Order_Data(resp_pfh_data);

//------------------------------------------------------------------------/

   return(r_code);
}

//========================= DFM_Client_Update_Order_State ================/

void     DFM_Client_Update_Order_State(sbs_client_order_state_struct &co_state, sbs_client_order_state_struct &co_state_new)
{
   if (
         (co_state.order_session_id != co_state_new.order_session_id) ||
         
         (co_state.sbs_phf_order[0].signal      != co_state_new.sbs_phf_order[0].signal) ||
         (co_state.sbs_phf_order[0].order_price != co_state_new.sbs_phf_order[0].order_price) ||
         (co_state.sbs_phf_order[0].stoploss    != co_state_new.sbs_phf_order[0].stoploss) ||
         (co_state.sbs_phf_order[0].order_time  != co_state_new.sbs_phf_order[0].order_time) ||
         
         (co_state.sbs_phf_order[1].signal      != co_state_new.sbs_phf_order[1].signal) ||
         (co_state.sbs_phf_order[1].order_price != co_state_new.sbs_phf_order[1].order_price) ||
         (co_state.sbs_phf_order[1].stoploss    != co_state_new.sbs_phf_order[1].stoploss) ||
         (co_state.sbs_phf_order[1].order_time  != co_state_new.sbs_phf_order[1].order_time)
      )
   {
      if (
            (
               (co_state_new.sbs_phf_order[0].signal == BUY_ORDER) &&
               (co_state_new.sbs_phf_order[1].signal == SELL_ORDER)
            ) ||
            (
               (co_state_new.sbs_phf_order[0].signal == SELL_ORDER) &&
               (co_state_new.sbs_phf_order[1].signal == BUY_ORDER)
            )
         )
      {
         Print("DFMC_UOS: NEW SIGNALS UNSYNCH: sig0=" + IntegerToString(co_state_new.sbs_phf_order[0].signal,0) + 
                                            ", sig1=" + IntegerToString(co_state_new.sbs_phf_order[1].signal,0));
         return;
      }
   
      Print("DFMC_UOS: os_id=(" + IntegerToString(co_state.order_session_id,0) + " -> " + IntegerToString(co_state_new.order_session_id,0) + ")"
           );
      
      Print("DFMC_UOS: o_type=0" +
                      ", sig=(" + IntegerToString(co_state.sbs_phf_order[0].signal,0) + " -> " + IntegerToString(co_state_new.sbs_phf_order[0].signal,0) + ")" +
                  ", o_price=(" + DoubleToString(co_state.sbs_phf_order[0].order_price,Digits) + " -> " + DoubleToString(co_state_new.sbs_phf_order[0].order_price,Digits) + ")" +
                     ", o_sl=(" + DoubleToString(co_state.sbs_phf_order[0].stoploss,Digits) + " -> " + DoubleToString(co_state_new.sbs_phf_order[0].stoploss,Digits) + ")" +
                     ", o_tm=(" + SBS_DMF_Client_Get_Time_String(co_state.sbs_phf_order[0].order_time) + " -> " + SBS_DMF_Client_Get_Time_String(co_state_new.sbs_phf_order[0].order_time) + ")"
           );
      
      Print("DFMC_UOS: o_type=1" +
                      ", sig=(" + IntegerToString(co_state.sbs_phf_order[1].signal,0) + " -> " + IntegerToString(co_state_new.sbs_phf_order[1].signal,0) + ")" +
                  ", o_price=(" + DoubleToString(co_state.sbs_phf_order[1].order_price,Digits) + " -> " + DoubleToString(co_state_new.sbs_phf_order[1].order_price,Digits) + ")" +
                     ", o_sl=(" + DoubleToString(co_state.sbs_phf_order[1].stoploss,Digits) + " -> " + DoubleToString(co_state_new.sbs_phf_order[1].stoploss,Digits) + ")" +
                     ", o_tm=(" + SBS_DMF_Client_Get_Time_String(co_state.sbs_phf_order[1].order_time) + " -> " + SBS_DMF_Client_Get_Time_String(co_state_new.sbs_phf_order[1].order_time) + ")"
           );

      co_state.order_session_id = co_state_new.order_session_id;
         
      co_state.sbs_phf_order[0].signal      = co_state_new.sbs_phf_order[0].signal;
      co_state.sbs_phf_order[0].order_price = co_state_new.sbs_phf_order[0].order_price;
      co_state.sbs_phf_order[0].stoploss    = co_state_new.sbs_phf_order[0].stoploss;
      co_state.sbs_phf_order[0].order_time  = co_state_new.sbs_phf_order[0].order_time;
         
      co_state.sbs_phf_order[1].signal      = co_state_new.sbs_phf_order[1].signal;
      co_state.sbs_phf_order[1].order_price = co_state_new.sbs_phf_order[1].order_price;
      co_state.sbs_phf_order[1].stoploss    = co_state_new.sbs_phf_order[1].stoploss;
      co_state.sbs_phf_order[1].order_time  = co_state_new.sbs_phf_order[1].order_time;
   }

//------------------------------------------------------------------------/

   return;
}

//======================= SBS_DMF_Client_Get_Time_String =================/

string   SBS_DMF_Client_Get_Time_String(datetime dtime)
{
string         time_str;
MqlDateTime    date_time_data;

   TimeToStruct(dtime,date_time_data);
   
   time_str = IntegerToString(date_time_data.year,4,'0') + "." +
              IntegerToString(date_time_data.mon, 2,'0') + "." +
              IntegerToString(date_time_data.day, 2,'0') + " " +
              IntegerToString(date_time_data.hour,2,'0') + ":" +
              IntegerToString(date_time_data.min, 2,'0')
              ;

//----------------------------------------------------------------------/

   return(time_str);
}

//======================= SBS_Client_Get_OM_Context ====================/

void   SBS_Client_Get_OM_Context()
{
int      total_orders;
int      order_type;
int      order_magic_no;
int      i;
int      j;

//------------------------- Reset Open Orders Data ---------------------/

   for (j = 0; j < SBS_CLIENT_MAX_ORDER_TYPES ; j++)
   {
      sbs_client_order_state.sbs_open_order[j].signal = NO_ORDER;
   }
   
//------------------------- Get Open Orders Data -----------------------/

//--- Symbol & Account Data ---/

   sbs_client_order_state.free_margin       = AccountFreeMargin();
   sbs_client_order_state.leverage          = AccountLeverage();
   
   sbs_client_order_state.spread            = MarketInfo(Symbol(),MODE_SPREAD);
   sbs_client_order_state.one_lot_tick_cost = MarketInfo(Symbol(),MODE_TICKVALUE);
   sbs_client_order_state.min_lot           = MarketInfo(Symbol(),MODE_MINLOT);
   sbs_client_order_state.max_lot           = MarketInfo(Symbol(),MODE_MAXLOT);
   sbs_client_order_state.lot_step          = MarketInfo(Symbol(),MODE_LOTSTEP);

//--- total_orders ---/

   total_orders = OrdersTotal();

//--- check each open order ---/

   if (total_orders > 0)
   {
      for (i = 0; i < total_orders ; i++)
      {
         if (OrderSelect(i, SELECT_BY_POS, MODE_TRADES) == true)
         {
            if (OrderSymbol() == Symbol())
            {
               order_type     = OrderType();
               order_magic_no = OrderMagicNumber();

               for (j = 0; j < SBS_CLIENT_MAX_ORDER_TYPES ; j++)
               {
//--- check for BUY Order ---/

                  if (
                        (order_type     == OP_BUY) &&
                        (order_magic_no == SBS_CLIENT_BUY_ORDER_MAGIC_NUMBER + 1 + j)
                     )
                  {
                     sbs_client_order_state.sbs_open_order[j].ticket      = OrderTicket();
                     sbs_client_order_state.sbs_open_order[j].signal      = BUY_ORDER;
                     sbs_client_order_state.sbs_open_order[j].order_price = OrderOpenPrice();
                     sbs_client_order_state.sbs_open_order[j].stoploss    = OrderStopLoss();
                     sbs_client_order_state.sbs_open_order[j].order_time  = OrderOpenTime();
                  }

//--- check for SELL Order ---/

                  if (
                        (order_type     == OP_SELL) &&
                        (order_magic_no == SBS_CLIENT_SELL_ORDER_MAGIC_NUMBER + 1 + j)
                     )
                  {
                     sbs_client_order_state.sbs_open_order[j].ticket      = OrderTicket();
                     sbs_client_order_state.sbs_open_order[j].signal      = SELL_ORDER;
                     sbs_client_order_state.sbs_open_order[j].order_price = OrderOpenPrice();
                     sbs_client_order_state.sbs_open_order[j].stoploss    = OrderStopLoss();
                     sbs_client_order_state.sbs_open_order[j].order_time  = OrderOpenTime();
                  }
               }  // EOF for (j = 0; j < SBS_CLIENT_MAX_ORDER_TYPES ; j++)
               
            }
         }
         else        // OrderSelect error
         {
            Print("DFMC_ODATA: SBS_Client_Get_OM_Context() ERROR error=" + IntegerToString(GetLastError(),0) + ", o_no=" + IntegerToString(i,0));
         }
      }
   }

//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Processing =====================/

void   SBS_Client_OM_Processing()
{
int      i;

//--- Reset operation_label_data ---/

   sbs_client_order_state.operation_label_data = "";

//--- Process for Each Order Type ---/

   for (i = 0; i < SBS_CLIENT_MAX_ORDER_TYPES ; i++)
   {
//----------------------- SYNCH OPEN vs REFFERED PHF Order Actions -----/

//--- NO_ORDER vs (BUY_ORDER or SELL_ORDER) ---/

      if (
            (sbs_client_order_state.sbs_open_order[i].signal == NO_ORDER) &&
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER)
         )
      {
         SBS_Client_OM_Synch_Ref_PHF_Order_vs_Open(sbs_client_order_state.sbs_open_order[i],i,CLOSE_BUY_ORDER);
      }
      
      if (
            (sbs_client_order_state.sbs_open_order[i].signal == NO_ORDER) &&
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER)
         )
      {
         SBS_Client_OM_Synch_Ref_PHF_Order_vs_Open(sbs_client_order_state.sbs_open_order[i],i,CLOSE_SELL_ORDER);
      }

//--- BUY_ORDER vs (NOT BUY_ORDER) ---/

      if (
            (sbs_client_order_state.sbs_open_order[i].signal == BUY_ORDER) &&
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal != BUY_ORDER)
         )
      {
         SBS_Client_OM_Synch_Ref_PHF_Order_vs_Open(sbs_client_order_state.sbs_open_order[i],i,BUY_ORDER);
      }

//--- SELL_ORDER vs (NOT SELL_ORDER) ---/

      if (
            (sbs_client_order_state.sbs_open_order[i].signal == SELL_ORDER) &&
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal != SELL_ORDER)
         )
      {
         SBS_Client_OM_Synch_Ref_PHF_Order_vs_Open(sbs_client_order_state.sbs_open_order[i],i,SELL_ORDER);
      }

//----------------------- Check OPEN Order Data vs PHF Order Data ------/

//--- NO_ORDER vs (BUY_ORDER or SELL_ORDER) ---/

      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == NO_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == BUY_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == SELL_ORDER)
            )
         )
      {
         SBS_Client_OM_Open_Order(i);
         return;
      }

//--- BUY_ORDER vs (SELL_ORDER or CLOSE_BUY_ORDER or MODIFY_SELL_ORDER) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == SELL_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == CLOSE_BUY_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == MODIFY_SELL_ORDER)
            )
         )
      {
         SBS_Client_OM_Close_Order(i);
         
         if (
               (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal != BUY_ORDER) &&
               (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal != SELL_ORDER) &&
               
               (sbs_client_order_state.sbs_phf_order[i].signal == SELL_ORDER)
            )
         {
            SBS_Client_OM_Open_Order(i);
         }
         
         return;
      }

//--- SELL_ORDER vs (BUY_ORDER or CLOSE_SELL_ORDER) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == BUY_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == CLOSE_SELL_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == MODIFY_BUY_ORDER)
            )
         )
      {
         SBS_Client_OM_Close_Order(i);
         
         if (
               (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal != SELL_ORDER) &&
               (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal != BUY_ORDER) &&
               
               (sbs_client_order_state.sbs_phf_order[i].signal == BUY_ORDER)
            )
         {
            SBS_Client_OM_Open_Order(i);
         }
         
         return;
      }

//--- CLOSE_BUY_ORDER vs (BUY_ORDER and NEW Order Session) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == CLOSE_BUY_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == BUY_ORDER)
            ) &&
            (
               (sbs_client_order_state.sbs_open_order[i].order_session_id != sbs_client_order_state.order_session_id) ||
               (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.order_time != sbs_client_order_state.sbs_phf_order[i].order_time)
            )
         )
      {
         SBS_Client_OM_Open_Order(i);
         
         return;
      }

//--- CLOSE_SELL_ORDER vs (SELL_ORDER and NEW Order Session) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == CLOSE_SELL_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == SELL_ORDER)
            ) &&
            (
               (sbs_client_order_state.sbs_open_order[i].order_session_id != sbs_client_order_state.order_session_id) ||
               (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.order_time != sbs_client_order_state.sbs_phf_order[i].order_time)
            )
         )
      {
         SBS_Client_OM_Open_Order(i);
         
         return;
      }

//--- CLOSE_BUY_ORDER vs (SELL_ORDER) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == CLOSE_BUY_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == SELL_ORDER)
            )
         )
      {
         SBS_Client_OM_Open_Order(i);
         
         return;
      }

//--- CLOSE_SELL_ORDER vs (BUY_ORDER) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == CLOSE_SELL_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == BUY_ORDER)
            )
         )
      {
         SBS_Client_OM_Open_Order(i);
         
         return;
      }

//--- BUY_ORDER vs (BUY_ORDER or MODIFY_BUY_ORDER) ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == BUY_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == BUY_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == MODIFY_BUY_ORDER)
            ) &&
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.stoploss != sbs_client_order_state.sbs_phf_order[i].stoploss)
         )
      {
         SBS_Client_OM_Change_SL_Order(i);
         
         return;
      }

//--- SELL_ORDER vs SELL_ORDER or MODIFY_SELL_ORDER ---/
         
      if (
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.signal == SELL_ORDER) &&
            (
               (sbs_client_order_state.sbs_phf_order[i].signal == SELL_ORDER) ||
               (sbs_client_order_state.sbs_phf_order[i].signal == MODIFY_SELL_ORDER)
            ) &&
            (sbs_client_order_state.sbs_open_order[i].sbs_phf_order_data.stoploss != sbs_client_order_state.sbs_phf_order[i].stoploss)
         )
      {
         SBS_Client_OM_Change_SL_Order(i);
         
         return;
      }

   }

//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Synch_Ref_PHF_Order_vs_Open ====/

void   SBS_Client_OM_Synch_Ref_PHF_Order_vs_Open(sbs_open_order_struct &open_order, int order_type,int new_ref_pfh_signal)
{
   Print("DFMC_SYNC_RPHF: o_type=" + IntegerToString(order_type,0) +
                     ", s_id=(" + IntegerToString(open_order.order_session_id,0) + " -> -1)" +
                      ", sig=(" + IntegerToString(open_order.sbs_phf_order_data.signal,0) + " -> " + IntegerToString(new_ref_pfh_signal,0) + ")" +
                  ", o_price=(" + DoubleToString(open_order.sbs_phf_order_data.order_price,Digits) + " -> " + DoubleToString(open_order.order_price,Digits) + ")" +
                     ", o_sl=(" + DoubleToString(open_order.sbs_phf_order_data.stoploss,Digits) + " -> " + DoubleToString(open_order.stoploss,Digits) + ")" +
                     ", o_tm=(" + SBS_DMF_Client_Get_Time_String(open_order.sbs_phf_order_data.order_time) + " -> " + SBS_DMF_Client_Get_Time_String(open_order.order_time) + ")"
           );

   open_order.sbs_phf_order_data.signal      = new_ref_pfh_signal;
   open_order.sbs_phf_order_data.order_price = open_order.order_price;
   open_order.sbs_phf_order_data.stoploss    = open_order.stoploss;
   open_order.sbs_phf_order_data.order_time  = open_order.order_time;
   
   open_order.order_session_id = -1;

//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Open_Order =====================/

void   SBS_Client_OM_Open_Order(int o_type)
{
int      ticket;
int      signal_cmd;
int      slippage;
int      m_number;

double   lots;
double   price;
double   sl;
double   tp;

string   comment;

datetime expiration_dtime;

//----------------------- Check Open Order FLAGS -----------------------/

   if (
         (sbs_client_order_state.sbs_global_operational_data.open_order_flag  == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         (sbs_client_order_state.sbs_private_operational_data.open_order_flag == SBS_CLIENT_FLAG_NOT_SET_VALUE)
      )
   {
      return;
   }

//----------------------- Check PHF Signal -----------------------------/

   if (
         (sbs_client_order_state.sbs_phf_order[o_type].signal != BUY_ORDER) &&
         (sbs_client_order_state.sbs_phf_order[o_type].signal != SELL_ORDER)
      )
   {
      return;
   }

//----------------------- Set Order Parameters (PHF Data based) --------/

//--- BUY_ORDER ---/

   if (sbs_client_order_state.sbs_phf_order[o_type].signal == BUY_ORDER)
   {
      RefreshRates();
      
      signal_cmd       = OP_BUY;
      price            = Ask;
      slippage         = 5 * (sbs_client_order_state.n_Point/Point);                                           // points
      
      sl               = NormalizeDouble(SBS_Client_OM_Get_Order_SL(price, o_type),Digits);
      tp               = 0;                                                   // NO TakeProfit
      lots             = SBS_Client_OM_Get_Order_Lots(MathAbs(price - sl)/Point,1);   // after SL calculation
      
      comment          = "BUY(" + IntegerToString(sbs_client_order_state.order_session_id,0) + "-" + IntegerToString((o_type + 1),0) + ")";
      m_number         = (SBS_CLIENT_BUY_ORDER_MAGIC_NUMBER + 1 + o_type);
      expiration_dtime = 0;                                                   // not expired
   }

//--- SELL_ORDER ---/

   if (sbs_client_order_state.sbs_phf_order[o_type].signal == SELL_ORDER)
   {
      RefreshRates();
      
      signal_cmd       = OP_SELL;
      price            = Bid;
      slippage         = 5 * (sbs_client_order_state.n_Point/Point);                                                   // points
      
      sl               = NormalizeDouble(SBS_Client_OM_Get_Order_SL(price, o_type),Digits);
      tp               = 0;                                                   // NO TakeProfit
      lots             = SBS_Client_OM_Get_Order_Lots(MathAbs(price - sl)/Point,1);   // after SL calculation
      
      comment          = "SELL(" + IntegerToString(sbs_client_order_state.order_session_id,0) + "-" + IntegerToString((o_type + 1),0) + ")";
      m_number         = (SBS_CLIENT_SELL_ORDER_MAGIC_NUMBER + 1 + o_type);
      expiration_dtime = 0;                                                   // not expired
   }

//----------------------- Check Parameters Consistancy -----------------/

//--- lots ---/

   if (lots == 0)
   {
      Print ("DFMC_OM_OPEN_ERROR: NO LOTS");
            
      return;
   }

//----------------------- Open Order -----------------------------------/      

   ticket = OrderSendReliable(Symbol(),signal_cmd,lots,price,slippage,sl,tp,comment,m_number,expiration_dtime,Green);

//----------------------- Check Open Order Result ----------------------/

//--- Negative Result ---/

   if (ticket == -1)
   {
      Print ("DFMC_OM_OPEN_ERROR: o_type=" + IntegerToString(o_type,0) +
                                 ", tckt=" + IntegerToString(ticket,0) +
                                ", s_cmd=" + IntegerToString(signal_cmd,0) +
                                ", price=" + DoubleToString(price,Digits) +
                                 ", slpg=" + IntegerToString(slippage,0) +
                                   ", sl=" + DoubleToString(sl,Digits) +
                                   ", tp=" + DoubleToString(tp,Digits) +
                                 ", lots=" + DoubleToString(lots,Digits) +
                                   ", cm=" + comment +
                                   ", mn=" + IntegerToString(m_number,0)
            );
      
      Print ("DFMC_OM_OPEN_ERROR_2: free_mrg=" + DoubleToString(sbs_client_order_state.free_margin,Digits) +
                                 ", lvrg=" + IntegerToString(sbs_client_order_state.leverage,0) +
                                 ", olt_cost=" + DoubleToString(sbs_client_order_state.one_lot_tick_cost,Digits) +
                                 ", min_lot=" + DoubleToString(sbs_client_order_state.min_lot,Digits) +
                                 ", max_lot=" + DoubleToString(sbs_client_order_state.max_lot,Digits) +
                                 ", lot_stp=" + DoubleToString(sbs_client_order_state.lot_step,Digits)
            );

      return;
   }

//--- Positive Result (continue the process) ---/

   Print("DFMC_OM_OPEN: o_type=" + IntegerToString(o_type,0) +
                       ", tckt=" + IntegerToString(ticket,0) +
                      ", s_cmd=" + IntegerToString(signal_cmd,0) +
                      ", price=" + DoubleToString(price,Digits) +
                       ", slpg=" + IntegerToString(slippage,0) +
                         ", sl=" + DoubleToString(sl,Digits) +
                         ", tp=" + DoubleToString(tp,Digits) +
                       ", lots=" + DoubleToString(lots,Digits) +
                         ", cm=" + comment +
                         ", mn=" + IntegerToString(m_number,0)
        );

//--- Update Open Order Data (from PHF and "ticket" data) ---/

   SBS_Client_OM_Update_OOrder(o_type, ticket);
   
   sbs_play_sound_data.open_order_play_flag = SBS_PLAY_SOUND_SET_FLAG;
   
//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Get_Order_SL ===================/

double   SBS_Client_OM_Get_Order_SL(double o_price, int o_type)
{
double   server_stoplevel;
double   sl_recommended;

//--- server_stoplevel ---/

   server_stoplevel = MarketInfo(Symbol(),MODE_STOPLEVEL);

//--- sl_recommended ---/

   sl_recommended = sbs_client_order_state.sbs_phf_order[o_type].stoploss;

   if (sbs_client_order_state.sbs_phf_order[o_type].signal == BUY_ORDER)
   {
//      sl_recommended = sl_recommended - sbs_client_order_state.spread - (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
   
      if ((o_price - sl_recommended) < server_stoplevel)
      {
         sl_recommended = o_price - server_stoplevel - sbs_client_order_state.spread;  // - (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
      }
   }
   
   if (sbs_client_order_state.sbs_phf_order[o_type].signal == SELL_ORDER)
   {
//      sl_recommended = sl_recommended + sbs_client_order_state.spread + (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
      
      if ((sl_recommended - o_price) < server_stoplevel)
      {
         sl_recommended = o_price - server_stoplevel + sbs_client_order_state.spread;  // + (SBS_CLIENT_SL_INCREMENT * sbs_client_order_state.n_Point);
      }
   }

//----------------------------------------------------------------------/

   return(sl_recommended);
}

//======================= SBS_Client_OM_Get_Order_Lots =================/

double   SBS_Client_OM_Get_Order_Lots(double order_risk_points, int orders_number)
{
double      lots_recommended;

//----------------------- Get calculation values -----------------------/

   lots_recommended = MathFloor(
                        (sbs_client_order_state.free_margin * sbs_client_order_state.order_risk_value) / 
                           (order_risk_points * sbs_client_order_state.one_lot_tick_cost) / 
                              sbs_client_order_state.lot_step
                               ) * sbs_client_order_state.lot_step;

//--- check 0.5 min_lot ---/

   if (lots_recommended < ((sbs_client_order_state.min_lot * orders_number) * 0.5))
   {
      lots_recommended = 0;
      return(lots_recommended);
   }

//--- check min_lot ---/

   if (lots_recommended < (sbs_client_order_state.min_lot * orders_number))
   {
      lots_recommended = sbs_client_order_state.min_lot;
      return(lots_recommended);
   }

//--- check max_lot ---/
   
   if (lots_recommended > (sbs_client_order_state.max_lot * orders_number))
   {
      lots_recommended = (sbs_client_order_state.max_lot * orders_number);
      return(lots_recommended);
   }

//   lots_recommended = 0.1;      // JUST FOR TESTS !!!!!

//----------------------------------------------------------------------/

   return(lots_recommended);
}

//======================= SBS_Client_OM_Update_OOrder ==================/

void   SBS_Client_OM_Update_OOrder(int o_type, int o_ticket)
{
int      order_type;

//----------------------- Open Order Update PHF REF Data ---------------/

   Print("DFMC_OM_UPD: o_type=" + IntegerToString(o_type,0) +
                      ", s_id=(" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + " -> " + 
                                   IntegerToString(sbs_client_order_state.order_session_id,0) + ")" +
                       ", sig=(" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal,0) + " -> " + 
                                   IntegerToString(sbs_client_order_state.sbs_phf_order[o_type].signal,0) + ")" +
                   ", o_price=(" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_price,Digits) + " -> " + 
                                   DoubleToString(sbs_client_order_state.sbs_phf_order[o_type].order_price,Digits) + ")" +
                      ", o_sl=(" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.stoploss,Digits) + " -> " + 
                                   DoubleToString(sbs_client_order_state.sbs_phf_order[o_type].stoploss,Digits) + ")" +
                      ", o_tm=(" + SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_time) + " -> " + 
                                   SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_phf_order[o_type].order_time) + ")"
        );

   sbs_client_order_state.sbs_open_order[o_type].order_session_id = sbs_client_order_state.order_session_id;
   
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal      = sbs_client_order_state.sbs_phf_order[o_type].signal;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_price = sbs_client_order_state.sbs_phf_order[o_type].order_price;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.stoploss    = sbs_client_order_state.sbs_phf_order[o_type].stoploss;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_time  = sbs_client_order_state.sbs_phf_order[o_type].order_time;
   
   sbs_client_order_state.sbs_open_order[o_type].stoploss_change_time = TimeLocal();

//----------------------- Open Order Update Server Data ----------------/

   if (OrderSelect(o_ticket, SELECT_BY_TICKET, MODE_TRADES) == true)
   {
      order_type = OrderType();
      
      if (order_type == OP_BUY)
      {
         sbs_client_order_state.sbs_open_order[o_type].signal = BUY_ORDER;
      }
      
      if (order_type == OP_SELL)
      {
         sbs_client_order_state.sbs_open_order[o_type].signal = SELL_ORDER;
      }

      sbs_client_order_state.sbs_open_order[o_type].ticket      = OrderTicket();
      sbs_client_order_state.sbs_open_order[o_type].order_price = OrderOpenPrice();
      sbs_client_order_state.sbs_open_order[o_type].stoploss    = OrderStopLoss();
      sbs_client_order_state.sbs_open_order[o_type].order_time  = OrderOpenTime();
      
      OrderPrint();
   }
   else        // OrderSelect error
   {
      sbs_client_order_state.sbs_open_order[o_type].ticket = (-1);
      
      Print("DFMC_OMS_DATA: SBS_Client_OM_Update_OOrder() ERROR error=" + IntegerToString(GetLastError(),0) + 
                                                            ", o_type=" + IntegerToString(o_type,0) +
                                                          ", o_ticket=" + IntegerToString(o_ticket,0) +
                                                            ", ticket=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0));
      return;
   }
   
   Print("DFMC_OMS_DATA: o_type=" + IntegerToString(o_type,0) +
                       ", tckt=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) +
                      ", s_sig=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].signal,0) +
                      ", price=" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].order_price,Digits) +
                         ", sl=" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].stoploss,Digits) +
                         ", tm=" + SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_open_order[o_type].order_time)
        );

//--- Update operation_label_data ---/
   
   sbs_client_order_state.operation_label_data = sbs_client_order_state.operation_label_data + 
                                                 "(" + IntegerToString(o_type,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) + ")";
  
//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Close_Order ====================/

void   SBS_Client_OM_Close_Order(int o_type)
{
int      i;
int      order_type;
int      slippage;
int      close_attempts;
int      last_err;

double   close_price;
double   o_lots;

//----------------------- Check Close Order FLAGS ----------------------/

   if (
         (sbs_client_order_state.sbs_global_operational_data.close_order_flag  == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         (sbs_client_order_state.sbs_private_operational_data.close_order_flag == SBS_CLIENT_FLAG_NOT_SET_VALUE)
      )
   {
      return;
   }
   
   sbs_play_sound_data.close_order_play_flag = SBS_PLAY_SOUND_SET_FLAG;

//----------------------- Close Order Update Server Data ---------------/

   if (OrderSelect(sbs_client_order_state.sbs_open_order[o_type].ticket, SELECT_BY_TICKET, MODE_TRADES) == true)
   {
      RefreshRates();
      
      order_type     = OrderType();
      o_lots         = OrderLots();
      slippage       = 20 * (sbs_client_order_state.n_Point/Point);
      close_attempts = 3;
      
      if (order_type == OP_BUY)
      {
         close_price = Bid;
      }
      
      if (order_type == OP_SELL)
      {
         close_price = Ask;
      }
   }
   else        // OrderSelect error
   {
      Print("DFMC_OM_CLOSE: OrderSelect() ERROR error=" + IntegerToString(GetLastError(),0) + 
                                            ", o_type=" + IntegerToString(o_type,0) +
                                            ", ticket=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0));
      return;
   }

//--- OrderClose() Attempts ---/

   for (i = 0; i < close_attempts; i++)
   {
      if (OrderClose(sbs_client_order_state.sbs_open_order[o_type].ticket, o_lots, close_price, slippage, Violet) != true)
      {
         last_err = GetLastError();
         
         Print("DFMC_OM_CMDC: ERROR error=" + IntegerToString(GetLastError(),0) + 
                              ", o_type=" + IntegerToString(o_type,0) +
                              ", ticket=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) +
                             ", attempt=" + IntegerToString(i,0));
            
         if ((last_err==4) || (last_err==137) || (last_err==146) || (last_err==136))       //Busy errors
         {
            if (!IsTesting()) 
            {
               Sleep(2500);
            }
            
            continue;
         }
      }
      else  // SUCCESS CLOSE
      {
//--- Update Order State Data ---/

         SBS_Client_OM_Update_COrder(o_type,order_type);

         break;
      }
   }

//----------------------------------------------------------------------/

   return;
}

//======================= SBS_Client_OM_Update_COrder ==================/

void   SBS_Client_OM_Update_COrder(int o_type, int closed_order_type)
{
int      updated_signal;

//--- updated_signal ---/
   
   updated_signal = NO_ORDER;

   if (closed_order_type == OP_BUY)
   {
      updated_signal = CLOSE_BUY_ORDER;
   }
      
   if (closed_order_type == OP_SELL)
   {
      updated_signal = CLOSE_SELL_ORDER;
   }

//----------------------- Close Order Update PHF REF Data --------------/

   Print("DFMC_OM_CUPD: o_type=" + IntegerToString(o_type,0) +
                      ", s_id=(" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + " -> " + 
                                   IntegerToString(sbs_client_order_state.order_session_id,0) + ")" +
                                   
                       ", sig=(" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal,0) + " -> " + 
                                   IntegerToString(updated_signal,0) + ")" +
                                   
                   ", o_price=(" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_price,Digits) + " -> " + 
                                   DoubleToString(sbs_client_order_state.sbs_phf_order[o_type].order_price,Digits) + ")" +
                      ", o_sl=(" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.stoploss,Digits) + " -> " + 
                                   DoubleToString(sbs_client_order_state.sbs_phf_order[o_type].stoploss,Digits) + ")" +
                      ", o_tm=(" + SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_time) + " -> " + 
                                   SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_phf_order[o_type].order_time) + ")"
        );

   sbs_client_order_state.sbs_open_order[o_type].order_session_id = sbs_client_order_state.order_session_id;
   
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal      = updated_signal;
   
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_price = sbs_client_order_state.sbs_phf_order[o_type].order_price;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.stoploss    = sbs_client_order_state.sbs_phf_order[o_type].stoploss;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_time  = sbs_client_order_state.sbs_phf_order[o_type].order_time;

//----------------------- Close Order Update Server Data ---------------/

   sbs_client_order_state.sbs_open_order[o_type].signal = updated_signal;
   sbs_client_order_state.sbs_open_order[o_type].ticket = (-1);
   
   Print("DFMC_OMS_DATA: o_type=" + IntegerToString(o_type,0) +
                       ", tckt=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) +
                      ", s_sig=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].signal,0)
        );

//--- Update operation_label_data ---/
   
   sbs_client_order_state.operation_label_data = sbs_client_order_state.operation_label_data + 
                                                 "(" + IntegerToString(o_type,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.signal,0) + "," +
                                                 IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) + ")";
   
//----------------------------------------------------------------------/

   return;
}

//========================= SBS_Client_OM_Change_SL_Order ==================/

void   SBS_Client_OM_Change_SL_Order(int o_type)
{
double   order_open_price;
double   order_sl;
double   order_tp;

double   sl_new;

//----------------------- Check SL Trail Order FLAGS ----------------------/

   if (
         (sbs_client_order_state.sbs_global_operational_data.sl_trail_order_flag  == SBS_CLIENT_FLAG_NOT_SET_VALUE) ||
         (sbs_client_order_state.sbs_private_operational_data.sl_trail_order_flag == SBS_CLIENT_FLAG_NOT_SET_VALUE)
      )
   {
      return;
   }

//------------------------- Get Order Server Data ----------------------------/

   if (OrderSelect(sbs_client_order_state.sbs_open_order[o_type].ticket, SELECT_BY_TICKET, MODE_TRADES) == true)
   {
      order_open_price = OrderOpenPrice();
      order_sl         = OrderStopLoss();
      order_tp         = OrderTakeProfit();
      sl_new           = NormalizeDouble(SBS_Client_OM_Get_Order_SL(order_open_price,o_type),Digits);
   }
   else        // OrderSelect error
   {
/*
      Print("DFMC_OM_MODFY: OrderSelect() ERROR error=" + IntegerToString(GetLastError(),0) + 
                                            ", o_type=" + IntegerToString(o_type,0) +
                                            ", ticket=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0));
*/
      return;
   }

//------------------------- Check SL Modification Conditions ---------------/

   if (SBS_Client_OM_Check_SL_Mdf_Condition(o_type,order_sl,sl_new) == False)
   {
      return;
   }

//------------------------- Modify Server Order ----------------------------/

   if (OrderModifyReliable(sbs_client_order_state.sbs_open_order[o_type].ticket, order_open_price, sl_new, order_tp, 0, Green) != true)
   {
      Print("DFMC_OM_CMDM: ERROR o_type=" + IntegerToString(o_type,0) +
                              ", ticket=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) +
                            ", order_op=" + DoubleToString(order_open_price,Digits) +
                            ", order_sl=" + DoubleToString(order_sl,Digits) +
                              ", sl_new=" + DoubleToString(sl_new,Digits) +
                            ", order_tp=" + DoubleToString(order_tp,Digits));
      
      return;
   }

//------------------------- Update Terminal Order State Data ---------------/

   order_sl = OrderStopLoss();

   SBS_Client_OM_Update_SLOrder(o_type,order_sl);
   
   sbs_play_sound_data.change_sl_order_play_flag = SBS_PLAY_SOUND_SET_FLAG;

//--------------------------------------------------------------------------/

   return;
}

//========================= SBS_Client_OM_Check_SL_Mdf_Condition ===========/

bool   SBS_Client_OM_Check_SL_Mdf_Condition(int o_type, double sl_current, double sl_new)
{
bool     sl_modification_flag;
datetime current_local_time;

   sl_modification_flag = False;
   current_local_time   = TimeLocal();

//--- 10 points ---/

   if (
         (sl_modification_flag == False) &&
         
         (
            (
               (sbs_client_order_state.sbs_open_order[o_type].signal == SELL_ORDER) &&
               (sl_new < sl_current) &&
               (MathAbs(sl_new - sl_current) > (10 * sbs_client_order_state.n_Point))
            ) ||
            
            (
               (sbs_client_order_state.sbs_open_order[o_type].signal == BUY_ORDER) &&
               (sl_new > sl_current) &&
               (MathAbs(sl_new - sl_current) > (10 * sbs_client_order_state.n_Point))
            )
         )
      )
   {
      sl_modification_flag = True;
      return(sl_modification_flag);
   }

//--- 5 points ---/

   if (
         (sl_modification_flag == False) &&
         
         (
            (
               (sbs_client_order_state.sbs_open_order[o_type].signal == SELL_ORDER) &&
               (sl_new < sl_current) &&
               (MathAbs(sl_new - sl_current) > (5 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_client_order_state.sbs_open_order[o_type].stoploss_change_time) > (1 * 60)      // 1 min
                  ) ||
                  (IsTesting())
               )
            ) ||
            
            (
               (sbs_client_order_state.sbs_open_order[o_type].signal == BUY_ORDER) &&
               (sl_new > sl_current) &&
               (MathAbs(sl_new - sl_current) > (5 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_client_order_state.sbs_open_order[o_type].stoploss_change_time) > (1 * 60)      // 1 min
                  ) ||
                  (IsTesting())
               )
            )
         )
      )
   {
      sl_modification_flag = True;
      return(sl_modification_flag);
   }

//--- 2 points ---/

   if (
         (sl_modification_flag == False) &&
         
         (
            (
               (sbs_client_order_state.sbs_open_order[o_type].signal == SELL_ORDER) &&
               (sl_new < sl_current) &&
               (MathAbs(sl_new - sl_current) > (2 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_client_order_state.sbs_open_order[o_type].stoploss_change_time) > (5 * 60)      // 5 min
                  ) ||
                  (IsTesting())
               )
            ) ||
            
            (
               (sbs_client_order_state.sbs_open_order[o_type].signal == BUY_ORDER) &&
               (sl_new > sl_current) &&
               (MathAbs(sl_new - sl_current) > (2 * sbs_client_order_state.n_Point)) &&
               (
                  (
                     (!IsTesting()) &&
                     (TimeLocal() - sbs_client_order_state.sbs_open_order[o_type].stoploss_change_time) > (5 * 60)      // 5 min
                  ) ||
                  (IsTesting())
               )
            )
         )
      )
   {
      sl_modification_flag = True;
      return(sl_modification_flag);
   }

//--------------------------------------------------------------------------/

   return(sl_modification_flag);
}

//======================= SBS_Client_OM_Update_SLOrder =================/

void   SBS_Client_OM_Update_SLOrder(int o_type, int o_sl)
{

//----------------------- Mopdify Order Update PHF REF Data ------------/

   Print("DFMC_OM_CUPD: o_type=" + IntegerToString(o_type,0) +
                      ", s_id=(" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].order_session_id,0) + " -> " + 
                                   IntegerToString(sbs_client_order_state.order_session_id,0) + ")" +
                      ", o_sl=(" + DoubleToString(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.stoploss,Digits) + " -> " + 
                                   DoubleToString(sbs_client_order_state.sbs_phf_order[o_type].stoploss,Digits) + ")" +
                      ", o_tm=(" + SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_time) + " -> " + 
                                   SBS_DMF_Client_Get_Time_String(sbs_client_order_state.sbs_phf_order[o_type].order_time) + ")"
        );

   sbs_client_order_state.sbs_open_order[o_type].order_session_id               = sbs_client_order_state.order_session_id;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.stoploss    = sbs_client_order_state.sbs_phf_order[o_type].stoploss;
   sbs_client_order_state.sbs_open_order[o_type].sbs_phf_order_data.order_time  = sbs_client_order_state.sbs_phf_order[o_type].order_time;
   
   sbs_client_order_state.sbs_open_order[o_type].stoploss_change_time           = TimeLocal();

//----------------------- Close Order Update Server Data ---------------/

   sbs_client_order_state.sbs_open_order[o_type].stoploss = o_sl;

   Print("DFMC_OMS_DATA: o_type=" + IntegerToString(o_type,0) +
                       ", tckt=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].ticket,0) +
                       ", o_sl=" + IntegerToString(sbs_client_order_state.sbs_open_order[o_type].stoploss,0)
        );
   
//----------------------------------------------------------------------/

   return;
}

//========================== Set_Client_Processing_Parameters ==========/

void  Set_Client_Processing_Parameters()
{
int i;

//-------------------------- n_Point -----------------------------------/

   sbs_client_order_state.n_Point = Point;
   
   if (Digits > 4)
   {
      for (i = 0; i < (Digits - 4); i++)
      {
         sbs_client_order_state.n_Point = sbs_client_order_state.n_Point * 10;
      }
   }

   if (
         (Symbol() == "USDJPY") ||
         (Symbol() == "CHFJPY") ||
         (Symbol() == "EURJPY") ||
         (Symbol() == "AUDJPY")
      )
   {
      sbs_client_order_state.n_Point = Point * 10;
   }

   if (Symbol() == "#AAPL")                 //
   {
      sbs_client_order_state.n_Point = Point * 10;
   }
   
   if (Symbol() == "#IBM")                 //
   {
      sbs_client_order_state.n_Point = Point * 10;
   }

//------------------------- DFM_Get_Terminal_Global_data -----------------/

   DFM_Get_Terminal_Global_data();

//------------------------- DFM_Get_Expert_Private_data ------------------/

   DFM_Get_Expert_Private_data();

//------------------------------------------------------------------------/

   return;
}

//======================= eof sbs_client_om_lbr.mql ======================/
