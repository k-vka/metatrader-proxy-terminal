//================= sbs_exp_order_management_lbr.mqh =====================/

//========================= Search_SBS_Open_Order ========================/

void     Search_SBS_Open_Order()
{
int      cnt;
int      i;

//-------------------- Reset order_status --------------------------------/

   order_status = NO_ORDER;

//-------------------- Process OFFLINE Context ---------------------------/
   
   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_dfm_proc_profile.order_state        == SBS_ORDER_ACTVE)
      )
   {
//--- Process SBS_GLOBAL_EXPERT_PATTERNS_PROFILE ---/

      if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_PATTERNS_PROFILE)
      {
         for (i = 0; i < SBS_MAX_PATTERNS_ORDER_TYPES; i++)       // Seek for ANY ACTIVE Order
         {
            if (
                  (sbs_patterns_order_session.sbs_patterns_order_state[i].signal == SELL_ORDER) ||
                  (sbs_patterns_order_session.sbs_patterns_order_state[i].signal == BUY_ORDER)
               )
            {
               order_status = sbs_patterns_order_session.sbs_patterns_order_state[i].signal;
               break;
            }
         }
         
         return;
      }

//--- OTHERS ---/
   
      if (
            (sbs_dfm_order_state.status == SELL_ORDER) ||
            (sbs_dfm_order_state.status == BUY_ORDER)
         )
      {
         order_status = sbs_dfm_order_state.status;
      }
   
      return;
   }

//-------------------- Process ONLINE Context ----------------------------/

   total_orders = OrdersTotal();

   if (total_orders > 0)
   {
      for (cnt = 0; cnt < total_orders ; cnt++)
      {
         if (OrderSelect(cnt, SELECT_BY_POS, MODE_TRADES) == true)
         {
            if ((OrderSymbol() == Symbol()) && (OrderMagicNumber() == MagicNumber))
            {
               order_type = OrderType();
               order_ticket = OrderTicket();
            
               if (order_type == OP_BUY)
               {
                  order_status = BUY_ORDER;
                  break;
               }
            
               if (order_type == OP_SELL)
               {            
                  order_status = SELL_ORDER;
                  break;
               }
            }
         }
         else        // OrderSelect error
         {
         }
      }
   }
   
   if (order_status != NO_ORDER)
   {
      order_open_time = OrderOpenTime();
      order_profit    = OrderProfit();
      order_openprice = OrderOpenPrice();
      order_stoploss  = OrderStopLoss();
      
      spread     = MarketInfo(Symbol(),MODE_SPREAD);
      stop_level = MarketInfo(Symbol(),MODE_STOPLEVEL);
      lot_size   = MarketInfo(Symbol(),MODE_LOTSIZE);
      min_lot    = MarketInfo(Symbol(),MODE_MINLOT);
      max_lot    = MarketInfo(Symbol(),MODE_MAXLOT);
   }

//------------------------------------------------------------------------/
   
   return;
}

//============================ SBS_Order_Processing =========================/

void  SBS_Order_Processing()
{
//---------------------------- Reset sbs_order ------------------------------/

   sbs_order.state          = NO_ORDER;
   sbs_order.case_number    = 0;
   sbs_order.subcase_number = 0;

//---------------------------- SBS ALX --------------------------------------/

   if (
         (sbs_order.state == NO_ORDER) &&
         (
            (
               (sbs_alx_signal.signal == SELL_ORDER)
            ) ||
            (
               (sbs_alx_signal.signal == BUY_ORDER)
            ) ||
            (
               (sbs_alx_signal.signal == CLOSE_SELL_ORDER)
            ) ||
            (
               (sbs_alx_signal.signal == CLOSE_BUY_ORDER)
            ) ||
            (
               (sbs_alx_signal.signal == CLOSE_ANY_ORDER)
            )
         )
      )
   {
      sbs_order.state          = sbs_alx_signal.signal;
      sbs_order.case_number    = sbs_alx_signal.case_number;
      sbs_order.subcase_number = sbs_alx_signal.case_subnumber;
   }

//---------------------------- FT ZZL ---------------------------------------/
/*
   if (
         (sbs_order.state == NO_ORDER) &&
         (
            (
               (sbs_ft_zzl_signal.signal == SELL_ORDER)
            ) ||
            (
               (sbs_ft_zzl_signal.signal == BUY_ORDER)
            )
         )
      )
   {
      sbs_order.state          = sbs_ft_zzl_signal.signal;
      sbs_order.case_number    = sbs_ft_zzl_signal.case_number;
      sbs_order.subcase_number = sbs_ft_zzl_signal.case_subnumber;
   }
*/
//---------------------------- FT Series ------------------------------------/
/*
   if (
         (sbs_order.state == NO_ORDER) &&
         (
            (
               (sbs_indi_ft_series_order_signal.signal == SELL_ORDER)
            ) ||
            (
               (sbs_indi_ft_series_order_signal.signal == BUY_ORDER)
            )
         )
      )
   {
      sbs_order.state          = sbs_indi_ft_series_order_signal.signal;
      sbs_order.case_number    = sbs_indi_ft_series_order_signal.case_number;
      sbs_order.subcase_number = sbs_indi_ft_series_order_signal.case_subnumber;
   }
*/
//---------------------------- FT + DSS -------------------------------------/
/*
   if (
         (sbs_order.state == NO_ORDER) &&
         (
            (
               (sbs_indi_dss_of_macd_01.signal == SELL_ORDER)
            ) ||
            (
               (sbs_indi_dss_of_macd_01.signal == BUY_ORDER)
            )
         )
      )
   {
      sbs_order.state          = sbs_indi_dss_of_macd_01.signal;
      sbs_order.case_number    = sbs_indi_dss_of_macd_01.case_number;
      sbs_order.subcase_number = sbs_indi_dss_of_macd_01.case_subnumber;
   }
*/
//---------------------------- Check SHV Level Signal -----------------------/
/*  
   if (
         (shv_level_case.order_req == SELL_ORDER) ||
         (shv_level_case.order_req == BUY_ORDER)
      )
   {
      sbs_order.state          = shv_level_case.order_req;
      sbs_order.case_number    = shv_level_case.number;
      sbs_order.subcase_number = shv_level_case.subnumber;
   }
*/
//---------------------------- Check SHV InterZone Signal -------------------/
/*
   if (
         (sbs_order.state == NO_ORDER) &&
         (
            (
               (shv_zone_case.order_req        == SELL_ORDER) &&
               (sbs_indi_dss_of_macd_01.signal == SELL_ORDER)
            ) ||
            (
               (shv_zone_case.order_req        == BUY_ORDER) &&
               (sbs_indi_dss_of_macd_01.signal == BUY_ORDER)
            )
         )
      )
   {
      sbs_order.state          = shv_zone_case.order_req;
      sbs_order.case_number    = shv_zone_case.number;
      sbs_order.subcase_number = shv_zone_case.subnumber;
   }
*/

//============================ Process OFFLINE Context ======================/
   
   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_dfm_proc_profile.order_state        == SBS_ORDER_ACTVE)
      )
   {
      SBS_DFM_Order_Processing();
      return;
   }

//============================ Process ONLINE Context =======================/
   
//---------------------------- NO_ORDER -------------------------------------/

   if ((order_status == NO_ORDER) && (sbs_order.state == BUY_ORDER))
   {
      SBS_Init_Order_State();
      OpenOrder(BUY_ORDER,Ask);
      Indicate_SBS_Case();
      sbs_screen_shot_cnt = 1;
      return;
   }
   
   if ((order_status == NO_ORDER) && (sbs_order.state == SELL_ORDER))
   {
      SBS_Init_Order_State();
      OpenOrder(SELL_ORDER,Bid);
      Indicate_SBS_Case();
      sbs_screen_shot_cnt = 1;
      return;
   }
   
//---------------------------- BUY_ORDER ------------------------------------/

   if ((order_status == BUY_ORDER) && (sbs_order.state == SELL_ORDER))
   {
      if (CloseOrder(order_status) == 0)
      {
         SBS_Init_Order_State();
         OpenOrder(SELL_ORDER,Bid);
         Indicate_SBS_Case();
         sbs_screen_shot_cnt = 1;
         return;
      }
   }
   
   if ((order_status == BUY_ORDER) && ((sbs_order.state == CLOSE_BUY_ORDER) ||(sbs_order.state == CLOSE_ANY_ORDER)))
   {
      if (CloseOrder(order_status) == 0)
      {
         SBS_Init_Order_State();
//         OpenOrder(SELL_ORDER,Bid);
         Indicate_SBS_Case();
         sbs_screen_shot_cnt = 1;
         return;
      }
   }
   
   if ((order_status == BUY_ORDER) && (sbs_order.state == BUY_ORDER))
   {
         return;
   }
   
   if ((order_status == BUY_ORDER) && (sbs_order.state == NO_ORDER))
   {
//      SBS_Trail_Order_State();
      return;
   }

//---------------------------- SELL_ORDER ------------------------------------/

   if ((order_status == SELL_ORDER) && (sbs_order.state == BUY_ORDER))
   {
      if (CloseOrder(order_status) == 0)
      {
         SBS_Init_Order_State();
         OpenOrder(BUY_ORDER,Ask);
         Indicate_SBS_Case();
         sbs_screen_shot_cnt = 1;
         return;
      }
   }
   
   if ((order_status == SELL_ORDER) && ((sbs_order.state == CLOSE_SELL_ORDER) || (sbs_order.state == CLOSE_ANY_ORDER)))
   {
      if (CloseOrder(order_status) == 0)
      {
         SBS_Init_Order_State();
//         OpenOrder(BUY_ORDER,Ask);
         Indicate_SBS_Case();
         sbs_screen_shot_cnt = 1;
         return;
      }
   }
   
   if ((order_status == SELL_ORDER) && (sbs_order.state == SELL_ORDER))
   {
         return;
   }
   
   if ((order_status == SELL_ORDER) && (sbs_order.state == NO_ORDER))
   {
//      SBS_Trail_Order_State();
      return;
   }

//----------------------------------------------------------------------------/
   
   return;
}

//============================ Open Order ===============================/

int OpenOrder(int type, double price)
{
int   ticket;
//int   err1;
int   cmd;

double   sl, tp;

   Print("SBS OpenOrder: Case = "+IntegerToString(sbs_order.case_number,0,' ')+
                  " , Subcase = "+IntegerToString(sbs_order.subcase_number,0,' '));

//------------------------ Set SL, TP, TT --------------------------------/

//   StopLoss            = (i_Reg1[IR_TOP][0] - i_Reg1[IR_MIDDLE][0]) / n_Point;
//   StopLoss            = sbs_trail_order.profile_sl;
   StopLoss            = 100;
   TakeProfit          = StopLoss;
   tro_trail_threshold = 2 * StopLoss;
   tro_trail_slippage  = 0.05 * tro_trail_threshold;

//------------------------ Set Order Parameters --------------------------/

   if (type == BUY_ORDER)
   {
      cmd = OP_BUY;
      tp = price + TakeProfit*n_Point;
      
//      sl = price - StopLoss*n_Point;
//      sl = alx_pivot_signal.stoploss_buy;
//      sl = price - (open_order_profile.sl_points * n_Point);      // XST cases
      
//      sl = open_order_profile.sl_value;      // XST 3Sig case

      order_status = BUY_ORDER;
   }
   
   if (type == SELL_ORDER)
   {
      cmd = OP_SELL;
      tp = price - TakeProfit*n_Point;
//      sl = price + StopLoss*n_Point;
//      sl = alx_pivot_signal.stoploss_sell;
//      sl = price + (open_order_profile.sl_points * n_Point);      // XST cases

//      sl = open_order_profile.sl_value;      // XST 3Sig case
      
      order_status = SELL_ORDER;
   }
   
   tp = 0;       // TESTING!!!!!
   
//----------------------- Open Order ------------------------------------/      

   ticket = OrderSendReliable(Symbol(),cmd,Lots,price,Slippage1,sl,tp,ExpertComment,MagicNumber,0,Green);
      
   if (ticket == -1)
   {
      order_status = NO_ORDER;
   }
   
   last_trail_order_time = TimeLocal();
   
   return(ticket);
}

//============================ Close Order ==============================/

int   CloseOrder(int type)
{
int      c;
int      err1;

double   close_price;

//   Print("CloseOrder-> i_Reg_GSignal: ",i_Reg_GSignal,", i_Reg_GCase: ",i_Reg_GCase,", order_status: ",order_status);

   if (type == BUY_ORDER)
   {
      close_price = Bid;
   }      
   else
   {
      if (type == SELL_ORDER)
      {
         close_price = Ask;
      }
      else return (-1);
   }

   for (c=0; c < NumberOfTries; c++)
   {
      if (OrderClose(order_ticket,OrderLots(),close_price,15,Violet) != true)
      {
         err1 = GetLastError();
         
         Print("CloseOrder-> Err: ", err1);
            
         if(err1==4 || err1==137 ||err1==146 || err1==136) //Busy errors
         {
            if (!IsTesting()) Sleep(5000);
            continue;
         }
      }
   }
   
   order_status = NO_ORDER;
   
   return (0);    
}

//============================== Trail Order ==============================/

void  TrailOrder (int type)
{
double   new_stoploss;
double   new_takeprofit;

double   order_highest_value;
double   order_lowest_value;

int      order_open_bar_no;
int      order_highest_bar_no;
int      order_lowest_bar_no;

   if ((TimeLocal() - last_trail_order_time) < 600)   return;     // < 10 min
   last_trail_order_time = TimeLocal();

   new_takeprofit = 0;
   
   if ((type == BUY_ORDER) || (type == SELL_ORDER))
   {

      order_open_bar_no = iBarShift(NULL,0,order_open_time,true);
   
      if (order_open_bar_no == -1)
      {
         Print("TrailOrder: Order open bar not found.");
         return;
      }
   }

   if (type == BUY_ORDER)
   {
      order_highest_bar_no = iHighest(NULL,0,MODE_LOW,order_open_bar_no,0);
      order_highest_value = High[order_highest_bar_no];
   
      if ((order_highest_value - order_stoploss) >= (tro_trail_threshold * n_Point))
      {
         new_stoploss = order_highest_value - (tro_trail_threshold * n_Point);
         
         if ((Close[0] - new_stoploss) >= (tro_trail_slippage) * n_Point)
         {
            if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
            {
               Print("TrailOrder: Order Modify not executed.");
            }
         }
      }
   }
      
   if (type == SELL_ORDER)
   {     
      order_lowest_bar_no = iLowest(NULL,0,MODE_HIGH,order_open_bar_no,0);
      order_lowest_value = Low[order_lowest_bar_no];
      
      if ((order_stoploss - order_lowest_value) >= (tro_trail_threshold * n_Point))
      {
         new_stoploss = order_lowest_value + (tro_trail_threshold * n_Point);
         
         if ((new_stoploss - Close[0]) >= (tro_trail_slippage) * n_Point)
         {
            if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
            {
               Print("TrailOrder: Order Modify not executed.");
            }
         }
      }
   }
   
   return;
}

//============================== SBS_Pivot_TrailOrder ==========================/

void  SBS_Pivot_TrailOrder (int type)
{
double   new_stoploss;
double   new_takeprofit;

double   sbs_sl_trail_threshold;    // points

   if ((TimeLocal() - last_trail_order_time) < 10)   return;     // < 10 sec
   last_trail_order_time = TimeLocal();

   new_takeprofit         = 0;
   sbs_sl_trail_threshold = 5;
   
//--------------------------- Update SL for SELL_ORDER -----------------------------/
   
   if (type == SELL_ORDER)
   {     
      if ((order_stoploss - alx_pivot_signal.stoploss_trl_sell) > (sbs_sl_trail_threshold * n_Point))
      {
         new_stoploss = alx_pivot_signal.stoploss_trl_sell;
         
         if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
         {
            Print("TrailOrder: SELL Order Modify not executed.");
         }
      }
   }
   
//--------------------------- Update SL for BUY_ORDER -----------------------------/

   if (type == BUY_ORDER)
   {
      if ((alx_pivot_signal.stoploss_trl_buy - order_stoploss) > (sbs_sl_trail_threshold * n_Point))
      {
         new_stoploss = alx_pivot_signal.stoploss_trl_buy;
         
         if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
         {
            Print("TrailOrder: BUY Order Modify not executed.");
         }
      }
   }
      
//-------------------------------------------------------------------------------/
   
   return;
}

//============================== SBS_XST_TrailOrder =============================/
/*
void  SBS_XST_TrailOrder (int type)
{
double   new_stoploss;
double   new_takeprofit;

double   sbs_sl_trail_threshold;    // points

   if ((TimeLocal() - last_trail_order_time) < 10)   return;     // < 10 sec
   last_trail_order_time = TimeLocal();

   new_takeprofit         = 0;
   sbs_sl_trail_threshold = 5;
   
//--------------------------- Update SL for SELL_ORDER -----------------------------/
   
   if (type == SELL_ORDER)
   {
//--- Check Primary Stoploss condition ---/
   
      if ((order_stoploss - Close[0]) > (open_order_profile.sl_primary_shift * n_Point))
      {
         new_stoploss = Close[0] + (open_order_profile.sl_primary_shift * n_Point);
         
         if ((open_order_profile.order_price - new_stoploss) > (open_order_profile.sl_primary_points * n_Point))
         {
            new_stoploss = open_order_profile.order_price - (open_order_profile.sl_primary_points * n_Point);
         }
         
         if ((order_stoploss - new_stoploss) > (1 * n_Point))
         {
            if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
            {
               Print("TrailOrder Primary: SELL Order Modify not executed.");
            }
         }
      }
      
//--- Check Regular Stoploss condition ---/
   
      if (
            (alx_xst_signal.trend_H4 == SBS_ALX_TREND_DOWN) &&
            ((order_stoploss - alx_xst_signal.val_H4) > (sbs_sl_trail_threshold * n_Point))
         )
      {
         new_stoploss = alx_xst_signal.val_H4;
         
         if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
         {
            Print("TrailOrder Regular: SELL Order Modify not executed.");
         }
      }
   }
   
//--------------------------- Update SL for BUY_ORDER -----------------------------/

   if (type == BUY_ORDER)
   {
//--- Check Primary Stoploss condition ---/
   
      if ((Close[0] - order_stoploss) > (open_order_profile.sl_primary_shift * n_Point))
      {
         new_stoploss = Close[0] - (open_order_profile.sl_primary_shift * n_Point);
         
         if ((new_stoploss - open_order_profile.order_price) > (open_order_profile.sl_primary_points * n_Point))
         {
            new_stoploss = open_order_profile.order_price + (open_order_profile.sl_primary_points * n_Point);
         }
         
         if ((new_stoploss - order_stoploss) > (1 * n_Point))
         {
            if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
            {
               Print("TrailOrder Primary: BUY Order Modify not executed.");
            }
         }
      }
      
//--- Check Regular Stoploss condition ---/
   
      if (
            (alx_xst_signal.trend_H4 == SBS_ALX_TREND_UP) &&
            ((alx_xst_signal.val_H4 - order_stoploss) > (sbs_sl_trail_threshold * n_Point))
         )
      {
         new_stoploss = alx_xst_signal.val_H4;
         
         if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
         {
            Print("TrailOrder Regular: BUY Order Modify not executed.");
         }
      }
   }
      
//-------------------------------------------------------------------------------/
   
   return;
}
*/
//============================== SBS_XST_3Sig_TrailOrder ========================/

void  SBS_XST_3Sig_TrailOrder (int type)
{
double   new_stoploss;
double   new_takeprofit;

double   sbs_sl_trail_threshold;    // points

//--------------------------- Check for 10 min interval ---------------------------/

   if ((TimeLocal() - last_trail_order_time) < (10 * 60))
   {
      return;
   }

//--------------------------- Set processing data ---------------------------------/
   
   last_trail_order_time = TimeLocal();

   new_takeprofit         = 0;
   sbs_sl_trail_threshold = 5;
   
//--------------------------- Update SL for SELL_ORDER -----------------------------/
   
   if (
         (type == SELL_ORDER) &&
         (alx_xst_signal.trend_H1       == SBS_ALX_TREND_DOWN) &&
         (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_DOWN)
      )
   {
//      h1_sl_level = 
      
      if (alx_xst_signal.val_H1 > alx_xst_signal.val_H1_60_34)
      {
         new_stoploss = alx_xst_signal.val_H1;
      }
      else
      {
         new_stoploss = alx_xst_signal.val_H1_60_34;
      }
   
      if ((order_stoploss - new_stoploss) > (sbs_sl_trail_threshold * n_Point))
      {

         if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
         {
            Print("TrailOrder 3Sig: SELL Order Modify not executed.");
         }
      }

   }
   
//--------------------------- Update SL for BUY_ORDER -----------------------------/

   if (
         (type == BUY_ORDER) &&
         (alx_xst_signal.trend_H1       == SBS_ALX_TREND_UP) &&
         (alx_xst_signal.trend_H1_60_34 == SBS_ALX_TREND_UP)
      )
   {
      if (alx_xst_signal.val_H1 < alx_xst_signal.val_H1_60_34)
      {
         new_stoploss = alx_xst_signal.val_H1;
      }
      else
      {
         new_stoploss = alx_xst_signal.val_H1_60_34;
      }
   
      if ((new_stoploss - order_stoploss) > (sbs_sl_trail_threshold * n_Point))
      {

         if (!OrderModifyReliable(order_ticket, order_openprice, new_stoploss, new_takeprofit, 0, Green))
         {
            Print("TrailOrder 3Sig: BUY Order Modify not executed.");
         }
      }

   }
      
//-------------------------------------------------------------------------------/
   
   return;
}

//=========================== Write_SBS_Screen_Shot =============================/

void  Write_SBS_Screen_Shot()
{
string   f_name;
string   s_year, s_mon, s_day, s_hour, s_min;

MqlDateTime    date_time_data;

//--------------------------- Check sbs_screen_shot_cnt -------------------------/

   if (sbs_screen_shot_cnt <= 0)
   {
      return;
   }
   
/*
   if (last_bar_time != Time[0])
   {
      return;
   }
*/

//--------------------------- Get DateTime Data ---------------------------------/

   TimeToStruct(Time[0],date_time_data);

   s_year = IntegerToString(date_time_data.year,4,'0');
   s_mon  = IntegerToString(date_time_data.mon, 2,'0');
   s_day  = IntegerToString(date_time_data.day, 2,'0');
   s_hour = IntegerToString(date_time_data.hour,2,'0');
   s_min  = IntegerToString(date_time_data.min, 2,'0');
   
//--- HRES ---/

   f_name = "t_shots\\" + Symbol() + "\\SBS\\HRES\\SBS-" + DoubleToStr(sbs_order.case_number,0) + "(" +
                                                           DoubleToStr(sbs_order.subcase_number,0) + ")";
            
   f_name = f_name + "-" + s_year + "-" + s_mon + "-" + s_day + "-" + s_hour + s_min;
   
   if (!WindowScreenShot(f_name + "HRES" + ".gif",1200,800,-1,5,-1))
   {
      Print("WindowScreenShot() HRES Error f_name=", f_name);
   }
   
//--- MRES ---/

   f_name = "t_shots\\" + Symbol() + "\\SBS\\MRES\\SBS-" + DoubleToStr(sbs_order.case_number,0) + "(" +
                                                           DoubleToStr(sbs_order.subcase_number,0) + ")";
            
   f_name = f_name + "-" + s_year + "-" + s_mon + "-" + s_day + "-" + s_hour + s_min;
   
   if (!WindowScreenShot(f_name + "MRES" + ".gif",1200,800,-1,3,-1))
   {
      Print("WindowScreenShot() MRES Error f_name=", f_name);
   }

//--------------------------- Write History Log -----------------------------/

   Write_History_Log(f_name);
   
//--- LRES ---/
   
   f_name = "t_shots\\" + Symbol() + "\\SBS\\LRES\\SBS-" + DoubleToStr(sbs_order.case_number,0) + "(" +
                                                           DoubleToStr(sbs_order.subcase_number,0) + ")";
            
   f_name = f_name + "-" + s_year + "-" + s_mon + "-" + s_day + "-" + s_hour + s_min;
   
   if (!WindowScreenShot(f_name + "LRES" + ".gif",1200,800,-1,0,-1))
   {
      Print("WindowScreenShot() MRES Error f_name=", f_name);
   }

//--------------------------- Decrement sbs_screen_shot_cnt -----------------/
   
   sbs_screen_shot_cnt = sbs_screen_shot_cnt - 1;
   
//---------------------------------------------------------------------------/
   
   return;
}

//=========================== Write Weekly Screen Shot on disk ==============/

void  Write_Weekly_Screen_Shot()
{
double   d_bars;
string   f_name;
string   s_day, e_day;
string   s_start_date, s_end_date;
int      curr_wk_number;
int      l_error;

//--------------------------- Check for minimal bars number -----------------/

   if (Bars < (1440 + 288))  return;
   
   if (screen_shot_wk_cnt <= 0)
   {
      d_bars = Bars;
      d_bars = (d_bars - 288) / 1440;
   
      if (MathFloor(d_bars) != MathCeil(d_bars))   return;
   
      curr_wk_number = MathFloor(d_bars);
   
      if (curr_wk_number == ss_wk_number) return;
      
      screen_shot_wk_cnt = 1;
      ss_wk_number = curr_wk_number;
   }
   
//   if (last_bar_time != Time[0])    return;
   
   s_start_date = TimeToStr(Time[1440 + 288 - 1], TIME_DATE);

   s_day  = IntegerToString(TimeDay(Time[0]),2,'0');
   
   s_end_date = TimeToStr(Time[288 - 1], TIME_DATE);
   e_day  = StringSubstr(s_end_date, 8, 2);

   
//--------------------- WHST ------------------------/
   
   f_name = "t_shots\\" + Symbol() + "\\WHST\\" +
            StringSubstr(s_start_date, 0, 4) + "-" +
            MO[StrToInteger(StringSubstr(s_start_date, 5, 2)) - 1] + "-" +
            StringSubstr(s_start_date, 8, 2) + "-" +
            MO[Month() - 1] + "-" +
//            MO[StrToInteger(StringSubstr(s_end_date, 5, 2)) - 1] + "-" +
            s_day;
   
   l_error = 0;
   
   if (!WindowScreenShot(f_name + ".gif",1800,900,(1440 + 288 - 1),2,-1))
   {
      l_error = GetLastError();
      Print(f_name+", err_code="+DoubleToStr(l_error,0));
   }

//--------------------------- Decrement screen_shot_wk_cnt -------------------/
   
   screen_shot_wk_cnt = screen_shot_wk_cnt - 1;

//---------------------------------------------------------------------------/

   return;
}

//========================= Indicate_SBS_Case ================================/

void  Indicate_SBS_Case()
{
string   t_name;
string   t_str;
string   marker_name;

//string   hi_level_marker_name;
//string   lo_level_marker_name;
//string   md_level_marker_name;

//------------------------- Indicate OFFLINE Case Markers --------------------/

   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_dfm_proc_profile.order_state        == SBS_ORDER_ACTVE)
      )
   {
//------------------------- Indicate Case Number (Create Text Object) --------/

      t_name = "SBS_DFM_CASE_"+DoubleToStr(Time[0],0) + "_" + IntegerToString(sbs_dfm_proc_profile.sequence_object_no++,0,'0');

      t_str = IntegerToString(sbs_dfm_order_state.case_number,0,'0')+"(" + IntegerToString(sbs_dfm_order_state.subcase_number,0,'0') + ")";

      ObjectDelete(t_name);
      ObjectCreate(t_name,OBJ_TEXT,0,Time[0] + 5*60,Close[0]);
      ObjectSetText(t_name,t_str,12, "Times New Roman", Aqua);

//------------------------- Indicate Case Price (Create Price Label) ---------/

      t_name = "SBS_DFM_PRICE_"+DoubleToStr(Time[0],0) + "_" + IntegerToString(sbs_dfm_proc_profile.sequence_object_no++,0,'0');

      ObjectDelete(t_name);
      ObjectCreate(t_name,OBJ_ARROW_LEFT_PRICE,0,Time[0],sbs_dfm_order_state.price);
      
      if (sbs_dfm_order_state.status == SELL_ORDER)
      {
         ObjectSet(t_name,OBJPROP_COLOR,SpringGreen);
      }
      
      if (sbs_dfm_order_state.status == BUY_ORDER)
      {
         ObjectSet(t_name,OBJPROP_COLOR,LavenderBlush);
      }
      
      ObjectSet(t_name,OBJPROP_WIDTH,2);
      ObjectSet(t_name,OBJPROP_BACK,false);

//------------------------- Indicate StopLoss (Create Price Label) -----------/

      t_name = "SBS_DFM_SL_"+DoubleToStr(Time[0],0) + "_" + IntegerToString(sbs_dfm_proc_profile.sequence_object_no++,0,'0');

      ObjectDelete(t_name);
      
      
      if (sbs_dfm_order_state.status == SELL_ORDER)
      {
         ObjectCreate(t_name,OBJ_ARROW_LEFT_PRICE,0,Time[0],(sbs_dfm_order_state.price + (sbs_dfm_order_state.stoploss * n_Point)));
      }
      
      if (sbs_dfm_order_state.status == BUY_ORDER)
      {
         ObjectCreate(t_name,OBJ_ARROW_LEFT_PRICE,0,Time[0],(sbs_dfm_order_state.price - (sbs_dfm_order_state.stoploss * n_Point)));
      }
      
      ObjectSet(t_name,OBJPROP_COLOR,LightCoral);
      ObjectSet(t_name,OBJPROP_WIDTH,2);
      ObjectSet(t_name,OBJPROP_BACK,false);

//----------------------------------------------------------------------------/

      return;
   }
   
//------------------------- Indicate ONLINE Marker ---------------------------/

   t_name = "SBSC_"+DoubleToStr(TimeCurrent(),0);
    
   t_str = DoubleToStr(sbs_order.case_number,0)+"(" + DoubleToStr(sbs_order.subcase_number,0) + ")";

   marker_name = "POS_SBSC_"+DoubleToStr(TimeCurrent(),0);
   
   ObjectDelete(t_name);
   ObjectCreate(t_name,OBJ_TEXT,0,TimeCurrent() + 50*60,Close[0]);
   ObjectSetText(t_name,t_str,12, "Times New Roman", Aqua);
   
   ObjectDelete(marker_name);
   ObjectCreate(marker_name,OBJ_ARROW,0,TimeCurrent(),Close[0]);
   ObjectSet(marker_name,OBJPROP_ARROWCODE,SBS_DASH_ARROWCODE);
   ObjectSet(marker_name,OBJPROP_COLOR,LightBlue);
   ObjectSet(marker_name,OBJPROP_WIDTH,3);

//------------------------- Indicate hi level Marker -------------------------/
/*
   hi_level_marker_name = "SBS_HLM_"+DoubleToStr(TimeCurrent(),0);
   
   ObjectDelete(hi_level_marker_name);
   ObjectCreate(hi_level_marker_name,OBJ_ARROW,0,TimeCurrent(),sbs_ft_zzl_case.hi_level);
   ObjectSet(hi_level_marker_name,OBJPROP_ARROWCODE,SBS_DASH_ARROWCODE);
   ObjectSet(hi_level_marker_name,OBJPROP_COLOR,SBS_FT3_HI_LINE_COLOR);
   ObjectSet(hi_level_marker_name,OBJPROP_WIDTH,5);

//------------------------- Indicate lo level Marker -------------------------/

   lo_level_marker_name = "SBS_LLM_"+DoubleToStr(TimeCurrent(),0);
   
   ObjectDelete(lo_level_marker_name);
   ObjectCreate(lo_level_marker_name,OBJ_ARROW,0,TimeCurrent(),sbs_ft_zzl_case.lo_level);
   ObjectSet(lo_level_marker_name,OBJPROP_ARROWCODE,SBS_DASH_ARROWCODE);
   ObjectSet(lo_level_marker_name,OBJPROP_COLOR,SBS_FT3_LO_LINE_COLOR);
   ObjectSet(lo_level_marker_name,OBJPROP_WIDTH,5);

//------------------------- Indicate md level Marker -------------------------/

   md_level_marker_name = "SBS_MLM_"+DoubleToStr(TimeCurrent(),0);
   
   ObjectDelete(md_level_marker_name);
   ObjectCreate(md_level_marker_name,OBJ_ARROW,0,TimeCurrent(),sbs_ft_zzl_case.md_level);
   ObjectSet(md_level_marker_name,OBJPROP_ARROWCODE,SBS_DASH_ARROWCODE);
   ObjectSet(md_level_marker_name,OBJPROP_COLOR,SBS_FT3_MD_LINE_COLOR);
   ObjectSet(md_level_marker_name,OBJPROP_WIDTH,5);
*/
//----------------------------------------------------------------------------/

   return;
}

//========================= Reset_SBS_Open_Order_Profile =====================/
/*
void  Reset_SBS_Open_Order_Profile()
{
//------------------------- Reset open_order_profile -------------------------/

   open_order_profile.action    = NO_ORDER;
   open_order_profile.condition = SBS_ALX_ORDER_CONDITION_NONE;

//------------------------- Check if ISLANDS Profile Activated ---------------/

//   if (sbs_global_expert_profile == SBS_GLOBAL_EXPERT_M1_ILND_PROFILE)
//   {
//      Reset_ILND_Order_Session_State();
//   }

//----------------------------------------------------------------------------/

   return;
}
*/
//========================= Reset_Open_Order_Profile =========================/
/*
void  Set_SBS_Open_Order_Condition(int new_action, int new_condition)
{
   open_order_profile.action    = new_action;
   open_order_profile.condition = new_condition;

//----------------------------------------------------------------------------/

   return;
}
*/

//========================= Indicate_SBS_Case_Type ===========================/

void  Indicate_SBS_Case_Type(int session_order_type)
{
string   t_name;
string   t_str;
string   marker_name;

//------------------------- Check session_order_type -------------------------/

   if (
         (session_order_type != 1) &&
         (session_order_type != 2)
      )
   {
      return;
   }

//------------------------- Indicate OFFLINE Case Markers --------------------/

   if (
         (sbs_dfm_proc_profile.processing_context == SBS_OFFLINE_PROCESSING_CONTEXT) &&
         (sbs_dfm_proc_profile.order_state        == SBS_ORDER_ACTVE)
      )
   {
//------------------------- Indicate Case Number (Create Text Object) --------/

      t_name = "SBS_DFM_CASE_"+DoubleToStr(Time[0],0) + "_" + IntegerToString(sbs_dfm_proc_profile.sequence_object_no++,0,'0');
      
      if (session_order_type == 1)
      {
         t_str = "1: " + IntegerToString(ilnd_order_session_state.order_type_1_state.case_number,0,'0')+
                   "(" + IntegerToString(ilnd_order_session_state.order_type_1_state.case_subnumber,0,'0') + ")";
      }
      else
      {
         t_str = "2: " + IntegerToString(ilnd_order_session_state.order_type_2_state.case_number,0,'0')+
                   "(" + IntegerToString(ilnd_order_session_state.order_type_2_state.case_subnumber,0,'0') + ")";
      }

      ObjectDelete(t_name);
      ObjectCreate(t_name,OBJ_TEXT,0,Time[0] + 5*60,Close[0]);
      ObjectSetText(t_name,t_str,12, "Times New Roman", Aqua);

//------------------------- Indicate Case Price (Create Price Label) ---------/

      t_name = "SBS_DFM_PRICE_"+DoubleToStr(Time[0],0) + "_" + IntegerToString(sbs_dfm_proc_profile.sequence_object_no++,0,'0');

      ObjectDelete(t_name);
      
      if (session_order_type == 1)
      {
         ObjectCreate(t_name,OBJ_ARROW_LEFT_PRICE,0,Time[0],ilnd_order_session_state.order_type_1_state.order_price);
      }
      else
      {
         ObjectCreate(t_name,OBJ_ARROW_LEFT_PRICE,0,Time[0],ilnd_order_session_state.order_type_2_state.order_price);
      }

      if (sbs_dfm_order_state.status == CLOSE_BUY_ORDER)
      {
         ObjectSet(t_name,OBJPROP_COLOR,SpringGreen);
      }
      
      if (sbs_dfm_order_state.status == CLOSE_SELL_ORDER)
      {
         ObjectSet(t_name,OBJPROP_COLOR,LavenderBlush);
      }
      
      ObjectSet(t_name,OBJPROP_WIDTH,2);
      ObjectSet(t_name,OBJPROP_BACK,false);

//----------------------------------------------------------------------------/

      return;
   }

//----------------------------------------------------------------------------/

   return;
}

//=== eof vka_trail_order_library.mqh ===/

